<?php
use GuzzleHttp\Client;
use GuzzleHttp\Cookie\CookieJar;
use GuzzleHttp\Psr7\MultipartStream;
use phpseclib3\Crypt\PublicKeyLoader;
use phpseclib3\Crypt\AES;
use phpseclib3\Crypt\RSA;
if(!class_exists("Instagram_unofficial")){

include get_module_dir( __DIR__ , 'Libraries/vendor/autoload.php');
include get_module_dir( __DIR__ , 'Libraries/FFmpeg.php');
class Instagram_unofficial
{
    const DEVICE_STRING    = '26/8.0.0; 640dpi; 1440x2560; samsung; SM-G935F; hero2lte; samsungexynos8890';

    const RESUMABLE_UPLOAD = 1;

    const SEGMENTED_UPLOAD = 2;
    
    const MIN_ASPECT_RATIO = 0.562;
    
    const MAX_ASPECT_RATIO = 1.91;

    private $username;
    private $password;
    private $user_id           = NULL;
    private $authorization     = NULL;
    private $deviceParams      = [];
    private $settings          = [];
    private $need_to_save_data = FALSE;
    private $cache_data_id;
    private $tmpFiles          = [];
    /**
     * @var Client
     */
    private $client;
    /**
     * @var bool|CookieJar
     */
    private $cookies;
    /**
     * @var bool
     */
    private $mid = NULL;

    public function __construct ( $username, $password, $team_id, $proxy = '' )
    {
        $this->team_id = $team_id;
        $this->username = $username;
        $this->password = $password;

        $cookies = TRUE;

        $ig_account = db_get("*", TB_ACCOUNT_SESSIONS, ["social_network" => "instagram", "username" => $username, "team_id" => $team_id]);
        if ( $ig_account )
        {
            $this->cache_data_id = $ig_account->id;

            $settings = json_decode( $ig_account->settings, TRUE );
            if ( ! empty( $settings ) && is_array( $settings ) )
            {
                $this->settings = $settings;
            }


            $cookies_arr = json_decode( $ig_account->cookies, TRUE );

            if (isset($cookies_arr['username'])) {
                $this->username = $cookies_arr['username'];
            }

            if (isset($cookies_arr['instagram_id'])) {
                $this->user_id = $cookies_arr['instagram_id'];
            }

            if (isset($cookies_arr['mid'])) {
                $this->mid = $cookies_arr['mid'];
            }

            if (isset($cookies_arr['authorization'])) {
                $this->authorization = $cookies_arr['authorization'];
            }
        }

        $this->initDefaultSettings();

        if ( empty( $this->getSettings( 'advertising_id' ) ) )
        {
            $this->setSettings( 'advertising_id', $this->generateUUID() );
        }

        if ( empty( $this->getSettings( 'session_id' ) ) )
        {
            $this->setSettings( 'session_id', $this->generateUUID() );
        }

        $this->cookies = $cookies;


        $headers = [
            'User-Agent'                  => $this->buildUserAgent(),
            'Connection'                  => 'Keep-Alive',
            'Accept'                      => '*/*',
            'Accept-Encoding'             => 'gzip,deflate',
            'Accept-Language'             => 'en-US',
            'X-IG-Capabilities'           => '3brTvx0=',
            'X-IG-WWW-Claim'              => 0,
            'X-Bloks-Is-Layout-RTL'       => FALSE,
            'X-Bloks-Is-Panorama-Enabled' => TRUE,
        ];

        if($this->mid != NULL){
            $headers['X-MID'] = $this->mid;
        }

        if($this->authorization != NULL){
            $headers['Authorization'] = $this->authorization;
        }

        if($this->user_id != NULL){
            $headers['IG-INTENDED-USER-ID'] = $this->user_id;
        }

        $this->client  = new Client( [
            'proxy'       => empty( $proxy ) ? NULL : $proxy,
            'verify'      => FALSE,
            'http_errors' => FALSE,
            'headers'     => $headers,
            //'cookies'     => $cookies
        ] );
    }

    public function __destruct ()
    {
        $this->emptyTmpFile($this->tmpFiles);

        $data = [
            'username'          => $this->username,
            'instagram_id'      => $this->user_id,
            'mid'               => $this->mid,
            'authorization'     => $this->authorization,
            'phone_id'          => $this->getSettings( 'phone_id' ),
            'device_id'         => $this->getSettings( 'device_id' ),
            'android_device_id' => $this->getSettings( 'device_id' )
        ];

        if ( $this->need_to_save_data )
        {
            
            try {
                $current_user = $this->getCurrentUser();
                if (!empty($current_user) && isset($current_user['user'])) {
                    $this->settings['account_id'] = $current_user['user']['pk'];
                }
            } catch (\Exception $e) {}

            if ( ! is_null( $this->cache_data_id ) )
            {

                db_update(TB_ACCOUNT_SESSIONS, [
                    'settings' => json_encode( $this->settings ),
                    'cookies'  => json_encode( $data ),
                    'last_modified' => time()
                ],[
                    'id' => $this->cache_data_id
                ]);
            }
            else
            {
                db_insert(TB_ACCOUNT_SESSIONS, [
                    'settings' => json_encode( $this->settings ),
                    'cookies'  => json_encode( $data ),
                    'team_id' => $this->team_id,
                    'social_network' => 'instagram',
                    'username' => $this->username,
                    'last_modified' => time()
                ]);
            }
        }
    }

    public function login ()
    {
        $this->_sendPreLoginFlow();

        $sendData = [
            'country_codes'       => '[{"country_code":"1","source":["default"]}]',
            'phone_id'            => $this->getSettings( 'phone_id' ),
            '_csrftoken'          => $this->getCsrfToken(),
            'username'            => $this->username,
            'adid'                => $this->getSettings( 'advertising_id' ),
            'guid'                => $this->getSettings( 'uuid' ),
            'device_id'           => $this->getSettings( 'device_id' ),
            'enc_password'        => $this->encPass( $this->password ),
            'google_tokens'       => '[]',
            'login_attempt_count' => 0
        ];

        try
        {
            $response = $this->client->post( 'https://i.instagram.com/api/v1/accounts/login/', [
                'form_params' => $this->signData( $sendData )
            ] );

            $respArr = json_decode($response->getBody()->getContents(), true);

            if( isset($respArr['logged_in_user']['pk_id']) && !empty($response->getHeader('ig-set-authorization')[0]) )
            {
                $this->authorization = $response->getHeader('ig-set-authorization')[0];
                $this->user_id = $respArr['logged_in_user']['pk_id'];

            }

            $response = $respArr;
        }
        catch ( \Exception $e )
        {
            $response = [];
        }


        if( isset( $response[ 'two_factor_info' ] ) )
        {
            $verification_method = '1';

            if ($response['two_factor_info']['whatsapp_two_factor_on'])
            {
                $verification_method = '6';
            }

            if ($response['two_factor_info']['totp_two_factor_on'])
            {
                $verification_method = '3';
            }

            return [
                'status' => 'failed',
                'message' => 'two_factor_required',
                'two_factor_info' => [
                    'verification_method'     => $verification_method,
                    'two_factor_identifier'   => $response['two_factor_info']['two_factor_identifier'],
                    'obfuscated_phone_number' => isset( $response['two_factor_info']['obfuscated_phone_number'] ) ? $response['two_factor_info']['obfuscated_phone_number'] : ( isset($response['two_factor_info']['obfuscated_phone_number_2']) ? $response['two_factor_info']['obfuscated_phone_number_2'] : '' )
                ]
            ];
        }

        $response = $this->checkChallenge( $response );

        $this->need_to_save_data = TRUE;

        return $response;
    }

    public function startChallenge ( $challenge )
    {
        sleep( 2 );

        $baseRequest = $this->client->request('GET', "https://www.instagram.com/", [
            'headers' => [
                'user-agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36',
            ],
        ]);
        $html = (string) $baseRequest->getBody();

        preg_match('/\"csrf_token\":\"(.*?)\"/', $html, $matches);

        if (!isset($matches[1])) {
            throw new InstagramAuthException('Unable to extract JSON data');
        }

        $csrfToken = $matches[1];

        $sendData = [
            'choice'        => '1',
            //'_csrftoken'    => $csrfToken,
            'username'      => $this->username,
            'device_id'     => $this->getSettings( 'device_id' ),
            'google_tokens' => '[]',
        ];

        try
        {
            $response = (string)$this->client->post( 'https://i.instagram.com/api/v1' . $challenge['challenge']['api_path'], [
                'form_params' => $this->signData( $sendData )
            ] )->getBody();

            $response = json_decode( $response, TRUE );
        }
        catch ( \Exception $e )
        {
            $response = [];
        }

        $response["message"] = "challenge_required";
        $response["challenge"] = $challenge['challenge'];

        if(!empty($response)){
            if ( $response[ 'status' ] == 'fail' && strpos( $response[ 'message' ], 'valid choice' ) )
            {
                $sendData[ 'choice' ] = '0';

                try
                {
                    $response = (string) $this->client->post( 'https://i.instagram.com/api/v1' . $api_path, [
                        'form_params' => $this->signData( $sendData )
                    ] )->getBody();

                    $response = json_decode( $response, TRUE );
                }
                catch ( Exception $e )
                {
                    $response = [];
                }
            }
        }else{
            db_update(TB_ACCOUNT_SESSIONS, [
                'cookies'  => NULL,
                'last_modified' => time()
            ],[
                'id' => $this->cache_data_id
            ]);

            return [
                'status'    => 'error',
                'message' => __("Login failed. Please login your Instagram account at Instagram web or Instagram app official and then try to again.")
            ];
        }


        return $response;
    }

    public function finishChallenge ( $api_path, $code )
    {
        $code = preg_replace( '/\s+/', '', $code );

        $sendData = [
            'security_code' => $code,
            //'_csrftoken'    => $this->getCsrfToken(),
            'username'      => $this->username,
            'device_id'     => $this->getSettings( 'device_id' ),
        ];

        try
        {
            $response = $this->client->post( 'https://i.instagram.com/api/v1' . $api_path , [
                'form_params' => $this->signData( $sendData )
            ] );

            $respArr = json_decode($response->getBody()->getContents(), true);

            if( isset($respArr['logged_in_user']['pk_id']) && !empty($response->getHeader('ig-set-authorization')[0]) )
            {
                $this->authorization = $response->getHeader('ig-set-authorization')[0];
                $this->user_id = $respArr['logged_in_user']['pk_id'];

            }

            $response = $respArr;
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        $response = $this->checkChallenge( $response );

        $this->need_to_save_data = TRUE;

        return $response;
    }

    public function finishTwoFactorLogin ( $twoFactorIdentifier, $verificationCode, $verificationMethod = '1' )
    {
        $verificationCode = preg_replace( '/\s+/', '', $verificationCode );

        $sendData = [
            'verification_method'   => $verificationMethod,
            'verification_code'     => $verificationCode,
            'trust_this_device'     => 1,
            'two_factor_identifier' => $twoFactorIdentifier,
            '_csrftoken'            => $this->getCsrfToken(),
            'username'              => $this->username,
            'device_id'             => $this->getSettings( 'device_id' ),
            'guid'                  => $this->getSettings( 'uuid' )
        ];

        try
        {
            $response = $this->client->post( 'https://i.instagram.com/api/v1/accounts/two_factor_login/', [
                'form_params' => $this->signData( $sendData )
            ] );

            $respArr = json_decode($response->getBody()->getContents(), true);

            if( isset($respArr['logged_in_user']['pk_id']) && !empty($response->getHeader('ig-set-authorization')[0]) )
            {
                $this->authorization = $response->getHeader('ig-set-authorization')[0];
                $this->user_id = $respArr['logged_in_user']['pk_id'];

            }

            $response = $respArr;
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        $response = $this->checkChallenge( $response );

        $this->need_to_save_data = TRUE;

        return $response;
    }

    private function checkChallenge ( $response )
    {
        if ( !empty($response) && $response[ 'status' ] == 'fail' && isset( $response[ 'challenge' ] ) && is_array( $response[ 'challenge' ] ) )
        {
            return $this->startChallenge( $response );
        }

        return $response;
    }

    public function getCurrentUser(){
        try
        {
            $response = (string) $this->client->get( 'https://i.instagram.com/api/v1/accounts/current_user/', [
                'edit' => true
            ] )->getBody();
            $response = json_decode( $response, TRUE );
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        $this->need_to_save_data = TRUE;

        return $response;
    }

    public function uploadPhoto ( $account_id, $photo, $caption, $link = '', $target = 'timeline', $instagramPinThePost = 0 )
    {
        $uploadId = $this->createUploadId();

        $uploadIgPhoto = $this->uploadIgPhoto( $uploadId, $photo );

        $result = $this->configurePhoto( $photo, $caption, $uploadId, $link, $target );

        if ( isset( $result[ 'status' ] ) && $result[ 'status' ] == 'fail' )
        {
            throw new Exception( ! empty( $result[ 'message' ] ) && is_string( $result[ 'message' ] ) ? strip_tags( $result[ 'message' ] ) : 'Error!' );
        }

        if ( $result[ 'media' ][ 'pk' ] && $instagramPinThePost === 1 )
        {
            $this->pinPost( $result[ 'media' ][ 'pk' ] );
        }

        return [
            'status' => 'ok',
            'code'   => isset( $result[ 'media' ][ 'code' ] ) ? strip_tags( $result[ 'media' ][ 'code' ] ) : '?',
            'id'     => isset( $result[ 'media' ][ 'id' ] ) ? strip_tags( $result[ 'media' ][ 'id' ] ) : '?'
        ];
    }

    public function uploadCarouselItem ( $photo )
    {
        $photo_info = $this->validatePhoto($photo);

        $uploadId = $this->createUploadId();

        $params = [
            'media_type'          => '1',
            'upload_media_height' => (string) $photo_info[ 'height' ],
            'upload_media_width'  => (string) $photo_info[ 'width' ],
            'upload_id'           => $uploadId,
        ];

        try
        {
            $response = (string) $this->client->post( 'https://www.instagram.com/rupload_igphoto/fb_uploader_' . $uploadId, [
                'headers' => [
                    'X-Requested-With'           => 'XMLHttpRequest',
                    'X-CSRFToken'                => $this->getCsrfToken(),
                    'X-Instagram-Rupload-Params' => json_encode( $params ),
                    'X-Entity-Name'              => 'feed_' . $uploadId,
                    'X-Entity-Length'            => filesize( $photo ),
                    'Offset'                     => '0'
                ],
                'body'    => fopen( $photo, 'r' )
            ] )->getBody();
            $result   = json_decode( $response, TRUE );
            if ( $result[ 'status' ] == 'fail' )
            {
                return [
                    'status'    => 'error',
                    'message' => isset( $result[ 'message' ] ) ? $result[ 'message' ] : __( 'Error' )
                ];
            }

            return $result;
        }
        catch ( Exception $e )
        {
            return [
                'status'    => 'error',
                'message' => __("Unable to process the image")
            ];
        }
    }

    public function generateAlbum ( $accountID, $photos, $caption, $instagramPinThePost )
    {
        $body = [
            "caption"                       => $caption,
            "children_metadata"             => [],
            "client_sidecar_id"             => $this->createUploadId(),
            "disable_comments"              => "0",
            "like_and_view_counts_disabled" => FALSE,
            "source_type"                   => "library"
        ];

        foreach ( $photos as $photo )
        {
            $response = $this->uploadCarouselItem( $photo );
            if ( $response[ 'status' ] === "ok" )
            {
                $body[ "children_metadata" ][] = [
                    "upload_id" => $response[ 'upload_id' ]
                ];
            }
            else
            {
                return $response; // when fail
            }
        }

        if ( count( $body[ 'children_metadata' ] ) == 0 )
        {
            return [
                'status'    => 'error',
                'message' => __( 'Error' )
            ];
        }

        try
        {
            $response = (string) $this->client->post( "https://i.instagram.com/api/v1/media/configure_sidecar/", [
                'headers' => [
                    'X-Requested-With' => 'XMLHttpRequest',
                    'X-CSRFToken'      => $this->getCsrfToken(),
                    'Offset'           => '0',
                    "x-ig-app-id"      => "936619743392459",
                    "x-csrf-token"     => $this->getCsrfToken()
                ],
                "json"    => $body
            ] )->getBody();

            $result = json_decode( $response, TRUE );

            if ( isset( $result[ 'status' ] ) && $result[ 'status' ] == 'fail' )
            {
                return [
                    'status'    => 'error',
                    'message' => ! empty( $result[ 'message' ] ) && is_string( $result[ 'message' ] ) ? $result[ 'message' ] : __('Error')
                ];
            }

            if ( $result[ 'media' ][ 'pk' ] && $instagramPinThePost === 1 )
            {
                $this->pinPost( $result[ 'media' ][ 'pk' ] );
            }

            return [
                'status' => 'ok',
                'code'   => isset( $result[ 'media' ][ 'code' ] ) ? $result[ 'media' ][ 'code' ] : '?',
                'id'     => isset( $result[ 'media' ][ 'id' ] ) ? $result[ 'media' ][ 'id' ] : '?'
            ];
        }
        catch ( Exception $e )
        {
            return [
                'status'  => 'error',
                'message' => __( $e->getMessage() )
            ];
        }
    }

    public function uploadVideo ( $account_id, $video, $caption, $link, $target = 'timeline', $instagramPinThePost = 0 )
    {
        $video_info = $this->renderVideo($video, $target);

        
        $uploadId = $this->createUploadId();

        $uploadIgVideo  = $this->uploadIgVideo( $uploadId, $video_info, $target );
        $uploadThumbail = $this->uploadIgPhoto( $uploadId, $video_info[ 'thumbnail' ] );

        $result = $this->configureVideo( $video_info, $caption, $uploadId, $link, $target );

        if ( isset( $result[ 'status' ] ) && $result[ 'status' ] == 'fail' )
        {
            throw new Exception( ! empty( $result[ 'message' ] ) && is_string( $result[ 'message' ] ) ? strip_tags( $result[ 'message' ] ) : 'Error!' );
        }

        if ( $result[ 'media' ][ 'pk' ] )
        {
            $this->pinPost( $result[ 'media' ][ 'pk' ] );
        }

        return [
            'status' => 'ok',
            'code'     => isset( $result[ 'media' ][ 'code' ] ) ? strip_tags( $result[ 'media' ][ 'code' ] ) : '?',
            'id'    => isset( $result[ 'media' ][ 'id' ] ) ? strip_tags( $result[ 'media' ][ 'id' ] ) : '?'
        ];
    }

    public function updateBioLink ( $url )
    {
        try
        {
            $userBio = (string) $this->client->get( 'https://i.instagram.com/api/v1/accounts/current_user/?edit=true' )->getBody();
            $userBio = json_decode( $userBio, TRUE );
        }
        catch ( Exception $e )
        {
            $userBio = [];
        }

        if ( empty( $userBio ) || empty( $userBio[ 'user' ] ) )
        {
            return FALSE;
        }

        $userBio = $userBio[ 'user' ];

        if ( ! empty( $userBio[ 'external_url' ] ) && $url == $userBio[ 'external_url' ] )
        {
            return TRUE;
        }

        $sendData = [
            'external_url' => $url,
            'username'     => empty( $userBio[ 'username' ] ) ? '' : $userBio[ 'username' ],
            'biography'    => empty( $userBio[ 'biography' ] ) ? '' : $userBio[ 'biography' ],
            'phone_number' => empty( $userBio[ 'phone_number' ] ) ? '' : $userBio[ 'phone_number' ],
            'email'        => empty( $userBio[ 'email' ] ) ? '' : $userBio[ 'email' ],
            'first_name'   => empty( $userBio[ 'full_name' ] ) ? '' : $userBio[ 'full_name' ]
        ];

        try
        {
            $response = (string) $this->client->post( 'https://i.instagram.com/api/v1/accounts/edit_profile/', [
                'form_params' => $this->signData( $sendData )
            ] )->getBody();

            $response = json_decode( $response, TRUE );
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return ! empty( $response ) && ! empty( $response[ 'user' ] );
    }

    public function pinPost ( $postID )
    {
        $data = [
            'post_id'    => $postID,
            '_uuid'      => $this->getSettings( 'uuid' ),
            'device_id'  => $this->getSettings( 'device_id' ),
            'radio_type' => 'wifi_none'
        ];

        try
        {
            $response = (string) $this->client->post( 'https://i.instagram.com/api/v1/users/pin_timeline_media/', [
                'form_params' => $this->signData( $data )
            ] )->getBody();
        }
        catch ( Exception $e )
        {
        }
    }

    public function getMediaInfo ( $mediaId )
    {
        $url = 'https://i.instagram.com/api/v1/media/' . $mediaId . '/info/';

        $request = (string) $this->client->get( $url )->getBody();

        return json_decode( $request, TRUE );
    }

    private function emptyTmpFile(){
        $tmpFiles = $this->tmpFiles;
        if(!empty($tmpFiles)){
            foreach ($tmpFiles as $tmpFile) {
                if(file_exists($tmpFile)){
                    unlink($tmpFile);
                }
            }
        }
    }

    private function renderVideo ( $video_path, $target )
    {
        if ( @exec( 'echo EXEC' ) !== 'EXEC' )
        {
            throw new Exception( __('exec() function have to be enabled to share videos on Instagram.') );
        }
        
        $details = FFmpeg::videoDetails( $video_path );

        $width       = $details[ 'width' ];
        $height      = $details[ 'height' ];
        $duration    = (int) $details[ 'duration' ];
        $video_codec = (int) $details[ 'video_codec' ];
        $audio_codec = (int) $details[ 'audio_codec' ];

        $maxDuration = ( $target == 'story' ? 15 : 60 ) - 0.1;
        $minDuration = ( $target == 'story' ? 1 : 3 );

        if ( $duration < $minDuration )
        {
            throw new Exception( 'Video is too short!' );
        }

        $ratio1 = $width / $height;

        if ( $ratio1 > self::MAX_ASPECT_RATIO )
        {
            $newWidth  = (int) ( $height * self::MAX_ASPECT_RATIO );
            $newHeight = $height;
            $cropVideo = TRUE;
        }
        else if ( $ratio1 < self::MIN_ASPECT_RATIO )
        {
            $newWidth  = $width;
            $newHeight = (int) ( $width / self::MIN_ASPECT_RATIO );
            $cropVideo = TRUE;
        }
        else
        {
            $newWidth  = $width;
            $newHeight = $height;
            $cropVideo = FALSE;
        }

        $x = abs( $width - $newWidth ) / 2;
        $y = abs( $height - $newHeight ) / 2;

        $video_new_path = TMPPATH() . uniqid( 'sp_' ) . '.mp4';
        $this->tmpFiles[] = $video_new_path;
        $thumbnail = TMPPATH() . uniqid( 'sp_' ) . '.jpg';
        $this->tmpFiles[] = $thumbnail;

        $ffmpeg = FFmpeg::factory();

        $outputFilters = [
            '-metadata:s:v rotate=""',
            '-f mp4',
            '-c:v libx264 -preset fast -crf 24'
        ];

        if ( $audio_codec !== 'aac' )
        {
            if ( $ffmpeg->hasLibFdkAac() )
            {
                $outputFilters[] = '-c:a libfdk_aac -vbr 4';
            }
            else
            {
                $outputFilters[] = '-strict -2 -c:a aac -b:a 96k';
            }
        }
        else
        {
            $outputFilters[] = '-c:a copy';
        }

        if ( $duration > $maxDuration )
        {
            $outputFilters[] = sprintf( '-t %.2F', $maxDuration );
        }

        $command = sprintf( '-y -i %s -vf %s %s %s', FFmpeg::escape( $video_path ), FFmpeg::escape( sprintf( 'crop=w=%d:h=%d:x=%d:y=%d', $newWidth, $newHeight, $x, $y ) ), implode( ' ', $outputFilters ), FFmpeg::escape( $video_new_path ) );
        $commandForThumbnail = sprintf( '-y -i %s -f mjpeg -vframes 1 -ss 00:00:00.000 %s', FFmpeg::escape( $video_path ), FFmpeg::escape( $thumbnail ) );

        $ffmpegOutput          = $ffmpeg->run( $command );
        $ffmpegOutputThumbnail = $ffmpeg->run( $commandForThumbnail );

        return [
            'width'       => $width,
            'height'      => $height,
            'duration'    => $duration,
            'audio_codec' => $audio_codec,
            'vudie_codec' => $video_codec,
            'path'        => $video_new_path,
            'thumbnail'   => $thumbnail
        ];
    }

    private function getSettings ( $key )
    {
        return key_exists( $key, $this->settings ) ? $this->settings[ $key ] : NULL;
    }

    private function setSettings ( $key, $value )
    {
        $this->settings[ $key ] = $value;
    }

    private function setSettingsIfEmpty ( $key, $value )
    {
        if ( ! isset( $this->settings[ $key ] ) || empty( $this->settings[ $key ] ) )
        {
            $this->settings[ $key ] = $value;
        }
    }

    private function initDefaultSettings ()
    {
        $this->setSettingsIfEmpty( 'devicestring', static::DEVICE_STRING );
        $this->setSettingsIfEmpty( 'device_id', $this->generateDeviceId() );
        $this->setSettingsIfEmpty( 'phone_id', $this->generateUUID() );
        $this->setSettingsIfEmpty( 'uuid', $this->generateUUID() );
        $this->setSettingsIfEmpty( 'account_id', '' );
    }

    private function getCookies ()
    {
        /*$cookies_purified = [];
        $cookies          = $this->client->getConfig( 'cookies' )->toArray();

        foreach ( $cookies as $cookie )
        {
            if ( $cookie[ 'Name' ] == 'sessionid' && empty( trim( $cookie[ 'Value' ], '\"' ) ) )
            {
                continue;
            }

            $cookies_purified[] = $cookie;
        }*/

        return false;
    }

    private function getCookie ( $name, $default = '' )
    {
        /*$cookies = $this->getCookies();
        $value   = $default;

        foreach ( $cookies as $cookieInf )
        {
            if ( $cookieInf[ 'Name' ] == $name )
            {
                $value = $cookieInf[ 'Value' ];
            }
        }

        return $value;*/

        return false;
    }

    private function getCsrfToken ()
    {
        return $this->getCookie( 'csrftoken' );
    }

    private function _sendPreLoginFlow ()
    {
        $this->fetchZeroRatingToken();
        $this->bootstrapMsisdnHeader();
        $this->readMsisdnHeader( 'default' );
        $this->syncDeviceFeatures( TRUE );
        $this->sendLauncherSync( TRUE );
        $this->bootstrapMsisdnHeader();
        $this->logAttribution();
        $this->getPrefillCandidates();
        $this->readMsisdnHeader( 'default', TRUE );
        $this->setContactPointPrefill( 'prefill' );
        $this->sendLauncherSync( TRUE, TRUE, TRUE );
        $this->syncDeviceFeatures( TRUE, TRUE );
    }

    private function fetchZeroRatingToken ( $reason = 'token_expired' )
    {
        $url = 'https://b.i.instagram.com/api/v1/zr/token/result/?';
        $url .= 'custom_device_id=' . $this->getSettings( 'uuid' );
        $url .= '&device_id=' . $this->getSettings( 'device_id' );
        $url .= '&fetch_reason=' . $reason;
        $url .= '&token_hash=' . $this->getSettings( 'zr_token' );

        $request = $this->client->get( $url )->getBody();

    }

    private function bootstrapMsisdnHeader ( $usage = 'ig_select_app' )
    {
        $sendData = [
            'mobile_subno_usage' => $usage,
            'device_id'          => $this->getSettings( 'uuid' )
        ];

        try
        {
            $response = (string) $this->client->post( 'https://i.instagram.com/api/v1/accounts/msisdn_header_bootstrap/', [
                'form_params' => $this->signData( $sendData )
            ] )->getBody();
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    private function readMsisdnHeader ( $usage, $useCsrfToken = FALSE )
    {
        $sendData = [
            'device_id'          => $this->getSettings( 'uuid' ),
            'mobile_subno_usage' => $usage
        ];

        if ( $useCsrfToken )
        {
            $sendData[ '_csrftoken' ] = $this->getCsrfToken();
        }

        try
        {
            $response = (string) $this->client->post( 'https://i.instagram.com/api/v1/accounts/read_msisdn_header/', [
                'form_params' => $this->signData( $sendData ),
                'headers'     => [
                    'X-DEVICE-ID' => $this->getSettings( 'uuid' )
                ]
            ] )->getBody();
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    private function syncDeviceFeatures ( $prelogin = FALSE, $useCsrfToken = FALSE )
    {
        $sendData = [
            'id'          => $this->getSettings( 'uuid' ),
            'experiments' => 'ig_android_fci_onboarding_friend_search,ig_android_device_detection_info_upload,ig_android_account_linking_upsell_universe,ig_android_direct_main_tab_universe_v2,ig_android_sms_retriever_backtest_universe,ig_android_direct_add_direct_to_android_native_photo_share_sheet,ig_growth_android_profile_pic_prefill_with_fb_pic_2,ig_account_identity_logged_out_signals_global_holdout_universe,ig_android_login_identifier_fuzzy_match,ig_android_video_render_codec_low_memory_gc,ig_android_custom_transitions_universe,ig_android_push_fcm,ig_android_show_login_info_reminder_universe,ig_android_email_fuzzy_matching_universe,ig_android_one_tap_aymh_redesign_universe,ig_android_direct_send_like_from_notification,ig_android_suma_landing_page,ig_android_session_scoped_logger,ig_android_user_session_scoped_class_opt_universe,ig_android_accoun_switch_badge_fix_universe,ig_android_smartlock_hints_universe,ig_android_black_out,ig_activation_global_discretionary_sms_holdout,ig_android_account_switch_infra_universe,ig_android_video_ffmpegutil_pts_fix,ig_android_multi_tap_login_new,ig_android_caption_typeahead_fix_on_o_universe,ig_android_save_pwd_checkbox_reg_universe,ig_android_nux_add_email_device,ig_android_direct_remove_view_mode_stickiness_universe,ig_username_suggestions_on_username_taken,ig_android_ingestion_video_support_hevc_decoding,ig_android_secondary_account_creation_universe,ig_android_account_recovery_auto_login,ig_android_sim_info_upload,ig_android_mobile_http_flow_device_universe,ig_android_hide_fb_button_when_not_installed_universe,ig_android_targeted_one_tap_upsell_universe,ig_android_gmail_oauth_in_reg,ig_android_account_linking_flow_shorten_universe,ig_android_hide_typeahead_for_logged_users,ig_android_vc_interop_use_test_igid_universe,ig_android_log_suggested_users_cache_on_error,ig_android_reg_modularization_universe,ig_android_phone_edit_distance_universe,ig_android_device_verification_separate_endpoint,ig_android_universe_noticiation_channels,ig_smartlock_login,ig_android_igexecutor_sync_optimization_universe,ig_android_account_linking_skip_value_props_universe,ig_android_account_linking_universe,ig_android_hsite_prefill_new_carrier,ig_android_retry_create_account_universe,ig_android_family_apps_user_values_provider_universe,ig_android_reg_nux_headers_cleanup_universe,ig_android_device_info_foreground_reporting,ig_android_shortcuts_2019,ig_android_device_verification_fb_signup,ig_android_onetaplogin_optimization,ig_video_debug_overlay,ig_android_ask_for_permissions_on_reg,ig_assisted_login_universe,ig_android_display_full_country_name_in_reg_universe,ig_android_security_intent_switchoff,ig_android_device_info_job_based_reporting,ig_android_passwordless_auth,ig_android_direct_main_tab_account_switch,ig_android_modularized_dynamic_nux_universe,ig_android_fb_account_linking_sampling_freq_universe,ig_android_fix_sms_read_lollipop,ig_android_access_flow_prefill'
        ];

        if ( $useCsrfToken )
        {
            $sendData[ '_csrftoken' ] = $this->getCsrfToken();
        }

        if ( $prelogin )
        {
            //$request->setNeedsAuth(false);
        }
        else
        {
            $sendData[ '_uuid' ] = $this->getSettings( 'uuid' );
            $sendData[ '_uid' ]  = $this->getSettings( 'account_id' );
        }

        try
        {
            $response = (string) $this->client->post( 'https://i.instagram.com/api/v1/qe/sync/', [
                'form_params' => $this->signData( $sendData ),
                'headers'     => [
                    'X-DEVICE-ID' => $this->getSettings( 'uuid' )
                ]
            ] )->getBody();
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    private function sendLauncherSync ( $prelogin, $idIsUuid = TRUE, $useCsrfToken = FALSE, $loginConfigs = FALSE )
    {
        $sendData = [
            'configs' => $loginConfigs ? 'ig_camera_ard_use_ig_downloader,ig_android_dogfooding,ig_android_bloks_data_release,ig_donation_sticker_public_thanks,ig_business_profile_donate_cta_android,ig_launcher_ig_android_network_dispatcher_priority_decider_qe2,ig_multi_decode_config,ig_android_improve_segmentation_hint,ig_android_memory_manager_holdout,ig_android_interactions_direct_sharing_comment_launcher,ig_launcher_ig_android_analytics_request_cap_qe,ig_direct_e2e_send_waterfall_sample_rate_config,ig_android_cdn_image_sizes_config,ig_android_critical_path_manager,ig_android_mobileboost_camera,ig_android_pdp_default_sections,ig_android_video_playback,ig_launcher_explore_sfplt_secondary_response_android,ig_android_upload_heap_on_oom,ig_synchronous_account_switch,ig_android_direct_presence_digest_improvements,ig_android_request_compression_launcher,ig_android_feed_attach_report_logs,ig_android_insights_welcome_dialog_tooltip,ig_android_qp_surveys_v1,ig_direct_requests_approval_config,ig_android_react_native_ota_kill_switch,ig_android_video_profiler_loom_traces,video_call_gk,ig_launcher_ig_android_network_stack_cap_video_request_qe,ig_shopping_android_business_new_tagging_flow,ig_android_igtv_bitrate,ig_android_geo_gating,ig_android_explore_startup_prefetch,ig_android_camera_asset_blocker_config,post_user_cache_user_based,ig_android_branded_content_story_partner_promote_rollout,ig_android_quic,ig_android_videolite_uploader,ig_direct_message_type_reporting_config,ig_camera_android_whitelist_all_effects_in_pre,ig_android_shopping_influencer_creator_nux,ig_android_mobileboost_blacklist,ig_android_direct_gifs_killswitch,ig_android_global_scheduler_direct,ig_android_image_display_logging,ig_android_global_scheduler_infra,ig_igtv_branded_content_killswitch,ig_cg_donor_duplicate_sticker,ig_launcher_explore_verified_badge_on_ads,ig_android_cold_start_class_preloading,ig_camera_android_attributed_effects_endpoint_api_query_config,ig_android_highlighted_products_business_option,ig_direct_join_chat_sticker,ig_android_direct_admin_tools_requests,ig_android_rage_shake_whitelist,ig_android_shopping_ads_cta_rollout,ig_android_igtv_segmentation,ig_launcher_force_switch_on_dialog,ig_android_iab_fullscreen_experience_config,ig_android_instacrash,ig_android_specific_story_url_handling_killswitch,ig_mobile_consent_settings_killswitch,ig_android_influencer_monetization_hub_launcher,ig_and roid_scroll_perf_mobile_boost_launcher,ig_android_cx_stories_about_you,ig_android_replay_safe,ig_android_stories_scroll_perf_misc_fixes_h2_2019,ig_android_shopping_django_product_search,ig_direct_giphy_gifs_rating,ig_android_ppr_url_logging_config,ig_canvas_ad_pixel,ig_strongly_referenced_mediacache,ig_android_direct_show_threads_status_in_direct,ig_camera_ard_brotli_model_compression,ig_image_pipeline_skip_disk_config,ig_android_explore_grid_viewpoint,ig_android_iab_persistent_process,ig_android_in_process_iab,ig_android_launcher_value_consistency_checker,ig_launcher_ig_explore_peek_and_sfplt_android,ig_android_skip_photo_finish,ig_biz_android_use_professional_account_term,ig_android_settings_search,ig_android_direct_presence_media_viewer,ig_launcher_explore_navigation_redesign_android,ig_launcher_ig_android_network_stack_cap_api_request_qe,ig_qe_value_consistency_checker,ig_stories_fundraiser_view_payment_address,ig_business_create_donation_android,ig_android_qp_waterfall_logging,ig_android_bloks_demos,ig_redex_dynamic_analysis,ig_android_bug_report_screen_record,ig_shopping_android_carousel_product_ids_fix_killswitch,ig_shopping_android_creators_new_tagging_flow,ig_android_direct_threads_app_dogfooding_flags,ig_shopping_camera_android,ig_android_qp_keep_promotion_during_cooldown,ig_android_qp_slot_cooldown_enabled_universe,ig_android_request_cap_tuning_with_bandwidth,ig_android_client_config_realtime_subscription,ig_launcher_ig_android_network_request_cap_tuning_qe,ig_android_concurrent_coldstart,ig_android_gps_improvements_launcher,ig_android_notification_setting_sync,ig_android_stories_canvas_mode_colour_wheel,ig_android_iab_session_logging_config,ig_android_network_trace_migration,ig_android_extra_native_debugging_info,ig_android_insights_top_account_dialog_tooltip,ig_launcher_ig_android_dispatcher_viewpoint_onscreen_updater_qe,ig_android_disable_browser_multiple_windows,ig_contact_invites_netego_killswitch,ig_android_update_items_header_height_launcher,ig_android_bulk_tag_untag_killswitch,ig_android_employee_options,ig_launcher_ig_android_video_pending_request_store_qe,ig_story_insights_entry,ig_android_creator_multi_select,ig_android_direct_new_media_viewer,ig_android_gps_profile_launcher,ig_android_direct_real_names_launcher,ig_fev_info_launcher,ig_android_remove_request_params_in_network_trace,ig_android_rageshake_redesign,ig_launcher_ig_android_network_stack_queue_undefined_request_qe,ig_cx_promotion_tooltip,ig_text_response_bottom_sheet,ig_android_carrier_signal_timestamp_max_age,ig_android_qp_xshare_to_fb,ig_android_rollout_gating_payment_settings,ig_android_mobile_boost_kill_switch,ig_android_betamap_cold_start,ig_android_media_store,ig_android_async_view_model_launcher,ig_android_newsfeed_recyclerview,ig_android_feed_optimistic_upload,ig_android_fix_render_backtrack_reporting,ig_delink_lasso_accounts,ig_android_feed_report_ranking_issue,ig_android_shopping_insights_events_validator,ig_biz_android_new_logging_architecture,ig_launcher_ig_android_reactnative_realtime_ota,ig_android_boomerang_crash_android_go,ig_android_shopping_influencer_product_sticker_editing,ig_camera_android_max_vertex_texture_launcher,bloks_suggested_hashtag' : 'ig_android_media_codec_info_collection,stories_gif_sticker,ig_android_felix_release_players,bloks_binding,ig_android_camera_network_activity_logger,ig_android_os_version_blocking_config,ig_android_carrier_signals_killswitch,live_special_codec_size_list,fbns,ig_android_aed,ig_client_config_server_side_retrieval,ig_android_bloks_perf_logging,ig_user_session_operation,ig_user_mismatch_soft_error,ig_android_prerelease_event_counter,fizz_ig_android,ig_android_vc_clear_task_flag_killswitch,ig_android_killswitch_perm_direct_ssim,ig_android_codec_high_profile,ig_android_smart_prefill_killswitch,sonar_prober,action_bar_layout_width,ig_auth_headers_device,always_use_server_recents',
            'id'      => ( $idIsUuid ? $this->getSettings( 'uuid' ) : $this->getSettings( 'account_id' ) )
        ];

        if ( $useCsrfToken )
        {
            $sendData[ '_csrftoken' ] = $this->getCsrfToken();
        }

        if ( $prelogin )
        {
            //$request->setNeedsAuth(false);
        }
        else
        {
            $sendData[ '_uuid' ] = $this->getSettings( 'uuid' );
            $sendData[ '_uid' ]  = $this->getSettings( 'account_id' );
        }

        try
        {
            $response = (string) $this->client->post( 'https://i.instagram.com/api/v1/launcher/sync/', [
                'form_params' => $this->signData( $sendData )
            ] )->getBody();
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    private function logAttribution ()
    {
        $sendData = [
            'adid' => $this->getSettings( 'advertising_id' )
        ];

        try
        {
            $response = (string) $this->client->post( 'https://i.instagram.com/api/v1/attribution/log_attribution/', [
                'form_params' => $this->signData( $sendData )
            ] )->getBody();
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    private function getPrefillCandidates ()
    {
        $sendData = [
            'android_device_id' => $this->getSettings( 'device_id' ),
            'device_id'         => $this->getSettings( 'uuid' ),
            'usages'            => '["account_recovery_omnibox"]'
        ];

        try
        {
            $response = (string) $this->client->post( 'https://i.instagram.com/api/v1/accounts/get_prefill_candidates/', [
                'form_params' => $this->signData( $sendData )
            ] )->getBody();
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    private function setContactPointPrefill ( $usage )
    {
        $sendData = [
            'phone_id'   => $this->getSettings( 'phone_id' ),
            '_csrftoken' => $this->getCsrfToken(),
            'usages'     => $usage
        ];

        try
        {
            $response = $this->client->post( 'https://i.instagram.com/api/v1/accounts/contact_point_prefill/', [
                'form_params' => $this->signData( $sendData )
            ] );

            if( ! empty($response->getHeader('ig-set-x-mid')[0]) )
            {
                $this->mid = $response->getHeader('ig-set-x-mid')[0];
            }

            $response = (string) $response->getBody();
        }
        catch ( \Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    private function generateDeviceId ()
    {
        return 'android-' . substr( md5( number_format( microtime( TRUE ), 7, '', '' ) ), 16 );
    }

    private function generateUUID ( $keepDashes = TRUE )
    {
        $uuid = sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x', mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0x0fff ) | 0x4000, mt_rand( 0, 0x3fff ) | 0x8000, mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ) );

        return $keepDashes ? $uuid : str_replace( '-', '', $uuid );
    }

    private function getDeviceParam ( $param )
    {
        if ( ! isset( $this->deviceParams[ $param ] ) )
        {
            $this->buildUserAgent();
        }

        return isset( $this->deviceParams[ $param ] ) ? $this->deviceParams[ $param ] : '';
    }

    private function buildUserAgent ( $app_version = '238.0.0.14.112', $version_code = '363804570' )
    {
        $this->deviceParams[ 'appVersion' ]  = $app_version;  //'220.0.0.3.115' - '323002899';
        $this->deviceParams[ 'versionCode' ] = $version_code; //'323002899';
        $this->deviceParams[ 'userLocale' ]  = 'en_US';

        $deviceString = $this->getSettings( 'devicestring' );

        $parts = explode( '; ', $deviceString );

        $androidOS = explode( '/', $parts[ 0 ], 2 );

        $resolution                         = explode( 'x', $parts[ 2 ], 2 );
        $this->deviceParams[ 'pixelCount' ] = (int) $resolution[ 0 ] * (int) $resolution[ 1 ];

        $manufacturerAndBrand = explode( '/', $parts[ 3 ], 2 );

        $this->deviceParams[ 'androidVersion' ] = $androidOS[ 0 ];
        $this->deviceParams[ 'androidRelease' ] = $androidOS[ 1 ];
        $this->deviceParams[ 'dpi' ]            = $parts[ 1 ];
        $this->deviceParams[ 'resolution' ]     = $parts[ 2 ];
        $this->deviceParams[ 'manufacturer' ]   = $manufacturerAndBrand[ 0 ];
        $this->deviceParams[ 'brand' ]          = ( isset( $manufacturerAndBrand[ 1 ] ) ? $manufacturerAndBrand[ 1 ] : NULL );
        $this->deviceParams[ 'model' ]          = $parts[ 4 ];
        $this->deviceParams[ 'device' ]         = $parts[ 5 ];
        $this->deviceParams[ 'cpu' ]            = $parts[ 6 ];

        $this->deviceParams[ 'manufacturerWithBrand' ] = $this->deviceParams[ 'brand' ] !== NULL ? $this->deviceParams[ 'manufacturer' ] . '/' . $this->deviceParams[ 'brand' ] : $this->deviceParams[ 'manufacturer' ];

        return sprintf( 'Instagram %s Android (%s/%s; %s; %s; %s; %s; %s; %s; %s; %s)', $this->deviceParams[ 'appVersion' ], $this->deviceParams[ 'androidVersion' ], $this->deviceParams[ 'androidRelease' ], $this->deviceParams[ 'dpi' ], $this->deviceParams[ 'resolution' ], $this->deviceParams[ 'manufacturerWithBrand' ], $this->deviceParams[ 'model' ], $this->deviceParams[ 'device' ], $this->deviceParams[ 'cpu' ], $this->deviceParams[ 'userLocale' ], $this->deviceParams[ 'versionCode' ] );
    }

    private function signData ( $data, $exclude = [] )
    {
        $result = [];

        foreach ( $exclude as $key )
        {
            if ( isset( $data[ $key ] ) )
            {
                $result[ $key ] = $data[ $key ];
                unset( $data[ $key ] );
            }
        }

        foreach ( $data as &$value )
        {
            if ( is_scalar( $value ) )
            {
                $value = (string) $value;
            }
        }

        $data = json_encode( (object) $this->reorderByHashCode( $data ) );

        $result[ 'ig_sig_key_version' ] = 4;
        $result[ 'signed_body' ]        = $this->generateSignature( $data ) . '.' . $data;

        return $this->reorderByHashCode( $result );
    }

    private function reorderByHashCode ( $data )
    {
        $hashCodes = [];
        foreach ( $data as $key => $value )
        {
            $hashCodes[ $key ] = $this->hashCode( $key );
        }

        uksort( $data, function ( $a, $b ) use ( $hashCodes ) {
            $a = $hashCodes[ $a ];
            $b = $hashCodes[ $b ];
            if ( $a < $b )
            {
                return -1;
            }
            else if ( $a > $b )
            {
                return 1;
            }
            else
            {
                return 0;
            }
        } );

        return $data;
    }

    private function hashCode ( $string )
    {
        $result = 0;
        for ( $i = 0, $len = strlen( $string ); $i < $len; ++$i )
        {
            $result = ( -$result + ( $result << 5 ) + ord( $string[ $i ] ) ) & 0xFFFFFFFF;
        }

        if ( PHP_INT_SIZE > 4 )
        {
            if ( $result > 0x7FFFFFFF )
            {
                $result -= 0x100000000;
            }
            else if ( $result < -0x80000000 )
            {
                $result += 0x100000000;
            }
        }

        return $result;
    }

    private function generateSignature ( $data )
    {
        return hash_hmac( 'sha256', $data, 'c36436a942ea1dbb40d7f2d7d45280a620d991ce8c62fb4ce600f0a048c32c11' );
    }

    private function validatePhoto ( $photo )
    {
        if (empty($photo) || !is_file($photo)) {
            throw new \InvalidArgumentException(sprintf('The photo file "%s" does not exist on disk.', $photo));
        }

        $filesize = filesize($photo);
        if ($filesize < 1) {
            throw new \InvalidArgumentException(sprintf(
                'The photo file "%s" is empty.',
                $photo
            ));
        }

        $result = @getimagesize($photo);
        if ($result === false) {
            throw new \InvalidArgumentException(sprintf('The photo file "%s" is not a valid image.', $photo));
        }
        list($width, $height, $type) = $result;

        return [
            'width' => $width,
            'height' => $height,
            'type' => $type
        ];
    }

    private function uploadIgPhoto ( $uploadId, $photo )
    {
        $photo_info = $this->validatePhoto($photo);

        $params = [
            'media_type'          => '1',
            'upload_media_height' => (string) $photo_info[ 'height' ],
            'upload_media_width'  => (string) $photo_info[ 'width' ],
            'upload_id'           => $uploadId,
            'image_compression'   => '{"lib_name":"moz","lib_version":"3.1.m","quality":"87"}',
            'xsharing_user_ids'   => '[]',
            'retry_context'       => json_encode( [
                'num_step_auto_retry'   => 0,
                'num_reupload'          => 0,
                'num_step_manual_retry' => 0
            ] )
        ];

        $entity_name = sprintf( '%s_%d_%d', $uploadId, 0, $this->hashCode( basename( $photo ) ) );
        $endpoint    = 'https://i.instagram.com/rupload_igphoto/' . $entity_name;

        try
        {
            $response = (string) $this->client->post( $endpoint, [
                'headers' => [
                    'X_FB_PHOTO_WATERFALL_ID'    => $this->generateUUID(),
                    'X-Requested-With'           => 'XMLHttpRequest',
                    'X-CSRFToken'                => $this->getCsrfToken(),
                    'X-Instagram-Rupload-Params' => json_encode( $this->reorderByHashCode( $params ) ),
                    'X-Entity-Type'              => get_image_mime_type($photo),
                    'X-Entity-Name'              => $entity_name,
                    'X-Entity-Length'            => filesize( $photo ),
                    'Offset'                     => '0'
                ],
                'body'    => fopen( $photo, 'r' )
            ] )->getBody();

            $response = json_decode( $response, TRUE );
        }
        catch ( \Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    private function configurePhoto ( $photo, $caption, $uploadId, $link = '', $target = 'timeline' )
    {
        $photo_info = $this->validatePhoto($photo);
        $date = date( 'Y:m:d H:i:s' );

        if ( $target == 'story' )
        {
            $tap_models = '}';

            $endpoint = 'media/configure_to_story/';
            if ( ! empty( $link ) )
            {
                $link_y = 1000;

                $link_y = $link_y / $photo_info[ 'height' ];

                $this->client->post( 'https://i.instagram.com/api/v1/media/validate_reel_url/', [
                    'headers'     => [
                        'User-Agent'                  => $this->buildUserAgent( '220.0.0.3.115', '323002899' ),
                        'Accept-Encoding'             => 'gzip, deflate',
                        'Accept'                      => '*/*',
                        'Connection'                  => 'keep-alive',
                        'X-IG-App-Locale'             => 'en_US',
                        'X-IG-Device-Locale'          => 'en_US',
                        'X-IG-Mapped-Locale'          => 'en_US',
                        'X-IG-App-Startup-Country'    => 'US',
                        //'X-Bloks-Version-Id' => '5fd5e6e0f986d7e592743211c2dda24efc502cff541d7a7cfbb69da25b293bf1',
                        'X-IG-WWW-Claim'              => '0',
                        'X-Bloks-Is-Layout-RTL'       => 'false',
                        'X-Bloks-Is-Panorama-Enabled' => 'true',
                        'X-IG-Device-ID'              => $this->getSettings( 'uuid' ),
                        'X-IG-Family-Device-ID'       => $this->generateUUID(),
                        'X-IG-Android-ID'             => $this->getSettings( 'device_id' ),
                        'X-IG-Timezone-Offset'        => '-14400',
                        'X-IG-Connection-Type'        => 'WIFI',
                        'X-IG-Capabilities'           => '3brTvx0=',
                        'X-IG-App-ID'                 => '936619743392459',
                        'Priority'                    => 'u=3',
                        'Accept-Language'             => 'en-US',
                        'X-MID'                       => $this->mid,
                        'X-FB-HTTP-Engine'            => 'Liger',
                        'X-FB-Client-IP'              => 'True',
                        'X-FB-Server-Cluster'         => 'True',
                        'IG-INTENDED-USER-ID'         => $this->getSettings( 'account_id' ),
                        'X-IG-Nav-Chain'              => '9MV:self_profile:2,ProfileMediaTabFragment:self_profile:3,9Xf:self_following:4',
                        //'Authorization' => 'Bearer IGT:2:eyJkc191c2VyX2lkIjoiNDkxNTQyNjk4NDYiLCJzZXNzaW9uaWQiOiI0OTE1NDI2OTg0NiUzQTJSUE1GV2dvN3liaFQ2JTNBMjUiLCJzaG91bGRfdXNlX2hlYWRlcl9vdmVyX2Nvb2tpZXMiOnRydWV9',
                        'Content-Type'                => 'application/x-www-form-urlencoded; charset=UTF-8',
                        'IG-U-DS-USER-ID'             => $this->getSettings( 'account_id' ),
                        'X-Ads-Opt-Out'               => '0',
                        'X-DEVICE-ID'                 => $this->getSettings( 'uuid' ),
                        'X-CM-Bandwidth-KBPS'         => '-1.000',
                        'X-CM-Latency'                => '1',
                    ],
                    'form_params' => [
                        'signed_body' => 'SIGNATURE.{"url":"' . $link . '","_uid":"' . $this->getSettings( 'account_id' ) . '","_uuid":"' . $this->getSettings( 'uuid' ) . '"}'
                    ]
                ] )->getBody();
                $link_model = '{\"x\":0.5126011,\"y\":' . $link_y . ',\"z\":0,\"width\":0.80998676,\"height\":0.12075,\"rotation\":0.0,\"type\":\"story_link\",\"is_sticker\":true,\"selected_index\":0,\"tap_state\":0,\"link_type\":\"web\",\"url\":\"' . $link . '\",\"tap_state_str_id\":\"link_sticker_default\"}';
            }

            $hashtag = "";
            //instagram_story_hashtag_top
            if ( ! empty( $hashtag ) )
            {
                $hashtag_y = (float) 1000;
                $hashtag_y     = $hashtag_y / $photo_info[ 'height' ];
                $hashtag_y     = number_format( $hashtag_y, 2 );
                $hashtag_model = '{\"x\":0.51,\"y\":' . $hashtag_y . ',\"z\":0,\"width\":0.8,\"height\":0.12,\"rotation\":0.0,\"type\":\"hashtag\",\"tag_name\":\"' . $hashtag . '\",\"is_sticker\":true,\"tap_state\":0,\"tap_state_str_id\":\"hashtag_sticker_gradient\"}';
            }

            if ( ! empty( $hashtag_model ) || ! empty( $link_model ) )
            {
                $tap_models = ! empty( $hashtag_model ) && ! empty( $link_model ) ? ( $hashtag_model . ',' . $link_model ) : ( empty( $link_model ) ? $hashtag_model : $link_model );
                $tap_models = ',"tap_models":"[' . $tap_models . ']"}';
            }

            try
            {
                $response = (string) $this->client->post( 'https://i.instagram.com/api/v1/' . $endpoint, [
                    'headers'     => [
                        'User-Agent'                  => $this->buildUserAgent( '220.0.0.3.115', '323002899' ),
                        'Accept-Encoding'             => 'gzip, deflate',
                        'Accept'                      => '*/*',
                        'Connection'                  => 'keep-alive',
                        'X-IG-App-Locale'             => 'en_US',
                        'X-IG-Device-Locale'          => 'en_US',
                        'X-IG-Mapped-Locale'          => 'en_US',
                        'X-IG-App-Startup-Country'    => 'US',
                        //'X-Bloks-Version-Id' => '5fd5e6e0f986d7e592743211c2dda24efc502cff541d7a7cfbb69da25b293bf1',
                        'X-IG-WWW-Claim'              => '0',
                        'X-Bloks-Is-Layout-RTL'       => 'false',
                        'X-Bloks-Is-Panorama-Enabled' => 'true',
                        'X-IG-Device-ID'              => $this->getSettings( 'uuid' ),
                        'X-IG-Family-Device-ID'       => $this->generateUUID(),
                        'X-IG-Android-ID'             => $this->getSettings( 'device_id' ),
                        'X-IG-Timezone-Offset'        => '-14400',
                        'X-IG-Connection-Type'        => 'WIFI',
                        'X-IG-Capabilities'           => '3brTvx0=',
                        'X-IG-App-ID'                 => '567067343352427',
                        'Priority'                    => 'u=3',
                        'Accept-Language'             => 'en-US',
                        'X-MID'                       => $this->mid,
                        'X-FB-HTTP-Engine'            => 'Liger',
                        'X-FB-Client-IP'              => 'True',
                        'X-FB-Server-Cluster'         => 'True',
                        'IG-INTENDED-USER-ID'         => $this->getSettings( 'account_id' ),
                        'X-IG-Nav-Chain'              => '9MV:self_profile:2,ProfileMediaTabFragment:self_profile:3,9Xf:self_following:4',
                        //'Authorization' => 'Bearer IGT:2:eyJkc191c2VyX2lkIjoiNDcwNzQ3MDE3MDIiLCJzZXNzaW9uaWQiOiI0NzA3NDcwMTcwMiUzQUtUdFdab0NoQllYSXNpJTNBMjYiLCJzaG91bGRfdXNlX2hlYWRlcl9vdmVyX2Nvb2tpZXMiOnRydWV9',
                        'Content-Type'                => 'application/x-www-form-urlencoded; charset=UTF-8',
                        'IG-U-DS-USER-ID'             => $this->getSettings( 'account_id' ),
                        'X-Ads-Opt-Out'               => '0',
                        'X-DEVICE-ID'                 => $this->getSettings( 'uuid' ),
                        'X-CM-Bandwidth-KBPS'         => '-1.000',
                        'X-CM-Latency'                => '1',
                    ],
                    'form_params' => [
                        'signed_body' => 'SIGNATURE.{"_uuid":"' . $this->getSettings( 'uuid' ) . '","device_id":"' . $this->getSettings( 'uuid' ) . '","text_metadata":"[{\"font_size\":40.0,\"scale\":1.0,\"width\":611.0,\"height\":169.0,\"x\":0.51414347,\"y\":0.8487708,\"rotation\":0.0}]","supported_capabilities_new":"[{\"name\":+\"SUPPORTED_SDK_VERSIONS\",+\"value\":+\"108.0,109.0,110.0,111.0,112.0,113.0,114.0,115.0,116.0,117.0,118.0,119.0,120.0,121.0,122.0,123.0,124.0,125.0,126.0,127.0\"},+{\"name\":+\"FACE_TRACKER_VERSION\",+\"value\":+\"14\"},+{\"name\":+\"segmentation\",+\"value\":+\"segmentation_enabled\"},+{\"name\":+\"COMPRESSION\",+\"value\":+\"ETC2_COMPRESSION\"},+{\"name\":+\"world_tracker\",+\"value\":+\"world_tracker_enabled\"},+{\"name\":+\"gyroscope\",+\"value\":+\"gyroscope_enabled\"}]","has_original_sound":"1","camera_session_id":"45e0c374-d84f-4289-9f81-a7419752f684","scene_capture_type":"","timezone_offset":"-14400","client_shared_at":"' . ( time() - 5 ) . '","story_sticker_ids":"link_sticker_default","media_folder":"Camera","configure_mode":"1","source_type":"4","creation_surface":"camera","imported_taken_at":1643659109,"capture_type":"normal","rich_text_format_types":"[\"default\"]","upload_id":"' . $uploadId . '","client_timestamp":"' . time() . '","device":{"android_version":26,"android_release":"8.0.0","manufacturer":"Xiaomi","model":"MI+5s"},"_uid":49154269846,"composition_id":"8e56be0b-ba75-44c6-bd61-9fd77680f84a","app_attribution_android_namespace":"","media_transformation_info":"{\"width\":\"720\",\"height\":\"720\",\"x_transform\":\"0\",\"y_transform\":\"0\",\"zoom\":\"1.0\",\"rotation\":\"0.0\",\"background_coverage\":\"0.0\"}","original_media_type":"photo","camera_entry_point":"121","edits":{"crop_original_size":[720.0,720.0],"filter_type":0,"filter_strength":1.0},"extra":{"source_width":720,"source_height":720}' . $tap_models
                    ]
                ] )->getBody();

                $response = json_decode( $response, TRUE );
            }
            catch ( \Exception $e )
            {
                $response = [];
            }
        } elseif ( $target == 'reel' )
        {
            $tap_models = '}';

            $endpoint = 'media/configure_to_clips/';
            if ( ! empty( $link ) )
            {
                $link_y = 0;

                //$link_x = (float) $photo['width'];
                $link_y = $link_y / $photo_info[ 'height' ];

                $this->client->post( 'https://i.instagram.com/api/v1/media/validate_reel_url/', [
                    'headers'     => [
                        'User-Agent'                  => $this->buildUserAgent( '220.0.0.3.115', '323002899' ),
                        'Accept-Encoding'             => 'gzip, deflate',
                        'Accept'                      => '*/*',
                        'Connection'                  => 'keep-alive',
                        'X-IG-App-Locale'             => 'en_US',
                        'X-IG-Device-Locale'          => 'en_US',
                        'X-IG-Mapped-Locale'          => 'en_US',
                        'X-IG-App-Startup-Country'    => 'US',
                        //'X-Bloks-Version-Id' => '5fd5e6e0f986d7e592743211c2dda24efc502cff541d7a7cfbb69da25b293bf1',
                        'X-IG-WWW-Claim'              => '0',
                        'X-Bloks-Is-Layout-RTL'       => 'false',
                        'X-Bloks-Is-Panorama-Enabled' => 'true',
                        'X-IG-Device-ID'              => $this->getSettings( 'uuid' ),
                        'X-IG-Family-Device-ID'       => $this->generateUUID(),
                        'X-IG-Android-ID'             => $this->getSettings( 'device_id' ),
                        'X-IG-Timezone-Offset'        => '-14400',
                        'X-IG-Connection-Type'        => 'WIFI',
                        'X-IG-Capabilities'           => '3brTvx0=',
                        'X-IG-App-ID'                 => '567067343352427',
                        'Priority'                    => 'u=3',
                        'Accept-Language'             => 'en-US',
                        'X-MID'                       => $this->mid,
                        'X-FB-HTTP-Engine'            => 'Liger',
                        'X-FB-Client-IP'              => 'True',
                        'X-FB-Server-Cluster'         => 'True',
                        'IG-INTENDED-USER-ID'         => $this->getSettings( 'account_id' ),
                        'X-IG-Nav-Chain'              => '9MV:self_profile:2,ProfileMediaTabFragment:self_profile:3,9Xf:self_following:4',
                        //'Authorization' => 'Bearer IGT:2:eyJkc191c2VyX2lkIjoiNDkxNTQyNjk4NDYiLCJzZXNzaW9uaWQiOiI0OTE1NDI2OTg0NiUzQTJSUE1GV2dvN3liaFQ2JTNBMjUiLCJzaG91bGRfdXNlX2hlYWRlcl9vdmVyX2Nvb2tpZXMiOnRydWV9',
                        'Content-Type'                => 'application/x-www-form-urlencoded; charset=UTF-8',
                        'IG-U-DS-USER-ID'             => $this->getSettings( 'account_id' ),
                        'X-Ads-Opt-Out'               => '0',
                        'X-DEVICE-ID'                 => $this->getSettings( 'uuid' ),
                        'X-CM-Bandwidth-KBPS'         => '-1.000',
                        'X-CM-Latency'                => '1',
                    ],
                    'form_params' => [
                        'signed_body' => 'SIGNATURE.{"url":"' . $link . '","_uid":"' . $this->getSettings( 'account_id' ) . '","_uuid":"' . $this->getSettings( 'uuid' ) . '"}'
                    ]
                ] )->getBody();
                $link_model = '{\"x\":0.5126011,\"y\":' . $link_y . ',\"z\":0,\"width\":0.80998676,\"height\":0.12075,\"rotation\":0.0,\"type\":\"story_link\",\"is_sticker\":true,\"selected_index\":0,\"tap_state\":0,\"link_type\":\"web\",\"url\":\"' . $link . '\",\"tap_state_str_id\":\"link_sticker_default\"}';
            }

            $hashtag = "";
            if ( ! empty( $hashtag ) )
            {
                $hashtag_y = (float) 1000;
                $hashtag_y     = $hashtag_y / $photo_info[ 'height' ];
                $hashtag_y     = number_format( $hashtag_y, 2 );
                $hashtag_model = '{\"x\":0.51,\"y\":' . $hashtag_y . ',\"z\":0,\"width\":0.8,\"height\":0.12,\"rotation\":0.0,\"type\":\"hashtag\",\"tag_name\":\"' . $hashtag . '\",\"is_sticker\":true,\"tap_state\":0,\"tap_state_str_id\":\"hashtag_sticker_gradient\"}';
            }

            if ( ! empty( $hashtag_model ) || ! empty( $link_model ) )
            {
                $tap_models = ! empty( $hashtag_model ) && ! empty( $link_model ) ? ( $hashtag_model . ',' . $link_model ) : ( empty( $link_model ) ? $hashtag_model : $link_model );
                $tap_models = ',"tap_models":"[' . $tap_models . ']"}';
            }

            try
            {
                $response = (string) $this->client->post( 'https://i.instagram.com/api/v1/' . $endpoint, [
                    'headers'     => [
                        'User-Agent'                  => $this->buildUserAgent( '220.0.0.3.115', '323002899' ),
                        'Accept-Encoding'             => 'gzip, deflate',
                        'Accept'                      => '*/*',
                        'Connection'                  => 'keep-alive',
                        'X-IG-App-Locale'             => 'en_US',
                        'X-IG-Device-Locale'          => 'en_US',
                        'X-IG-Mapped-Locale'          => 'en_US',
                        'X-IG-App-Startup-Country'    => 'US',
                        //'X-Bloks-Version-Id' => '5fd5e6e0f986d7e592743211c2dda24efc502cff541d7a7cfbb69da25b293bf1',
                        'X-IG-WWW-Claim'              => '0',
                        'X-Bloks-Is-Layout-RTL'       => 'false',
                        'X-Bloks-Is-Panorama-Enabled' => 'true',
                        'X-IG-Device-ID'              => $this->getSettings( 'uuid' ),
                        'X-IG-Family-Device-ID'       => $this->generateUUID(),
                        'X-IG-Android-ID'             => $this->getSettings( 'device_id' ),
                        'X-IG-Timezone-Offset'        => '-14400',
                        'X-IG-Connection-Type'        => 'WIFI',
                        'X-IG-Capabilities'           => '3brTvx0=',
                        'X-IG-App-ID'                 => '567067343352427',
                        'Priority'                    => 'u=3',
                        'Accept-Language'             => 'en-US',
                        'X-MID'                       => $this->mid,
                        'X-FB-HTTP-Engine'            => 'Liger',
                        'X-FB-Client-IP'              => 'True',
                        'X-FB-Server-Cluster'         => 'True',
                        'IG-INTENDED-USER-ID'         => $this->getSettings( 'account_id' ),
                        'X-IG-Nav-Chain'              => '9MV:self_profile:2,ProfileMediaTabFragment:self_profile:3,9Xf:self_following:4',
                        //'Authorization' => 'Bearer IGT:2:eyJkc191c2VyX2lkIjoiNDcwNzQ3MDE3MDIiLCJzZXNzaW9uaWQiOiI0NzA3NDcwMTcwMiUzQUtUdFdab0NoQllYSXNpJTNBMjYiLCJzaG91bGRfdXNlX2hlYWRlcl9vdmVyX2Nvb2tpZXMiOnRydWV9',
                        'Content-Type'                => 'application/x-www-form-urlencoded; charset=UTF-8',
                        'IG-U-DS-USER-ID'             => $this->getSettings( 'account_id' ),
                        'X-Ads-Opt-Out'               => '0',
                        'X-DEVICE-ID'                 => $this->getSettings( 'uuid' ),
                        'X-CM-Bandwidth-KBPS'         => '-1.000',
                        'X-CM-Latency'                => '1',
                    ],
                    'form_params' => [
                        'signed_body' => 'SIGNATURE.{"_uuid":"' . $this->getSettings( 'uuid' ) . '","device_id":"' . $this->getSettings( 'uuid' ) . '","text_metadata":"[{\"font_size\":40.0,\"scale\":1.0,\"width\":611.0,\"height\":169.0,\"x\":0.51414347,\"y\":0.8487708,\"rotation\":0.0}]","supported_capabilities_new":"[{\"name\":+\"SUPPORTED_SDK_VERSIONS\",+\"value\":+\"108.0,109.0,110.0,111.0,112.0,113.0,114.0,115.0,116.0,117.0,118.0,119.0,120.0,121.0,122.0,123.0,124.0,125.0,126.0,127.0\"},+{\"name\":+\"FACE_TRACKER_VERSION\",+\"value\":+\"14\"},+{\"name\":+\"segmentation\",+\"value\":+\"segmentation_enabled\"},+{\"name\":+\"COMPRESSION\",+\"value\":+\"ETC2_COMPRESSION\"},+{\"name\":+\"world_tracker\",+\"value\":+\"world_tracker_enabled\"},+{\"name\":+\"gyroscope\",+\"value\":+\"gyroscope_enabled\"}]","has_original_sound":"1","camera_session_id":"45e0c374-d84f-4289-9f81-a7419752f684","scene_capture_type":"","timezone_offset":"-14400","client_shared_at":"' . ( time() - 5 ) . '","story_sticker_ids":"link_sticker_default","media_folder":"Camera","configure_mode":"1","source_type":"4","creation_surface":"camera","imported_taken_at":1643659109,"capture_type":"normal","rich_text_format_types":"[\"default\"]","upload_id":"' . $uploadId . '","client_timestamp":"' . time() . '","device":{"android_version":26,"android_release":"8.0.0","manufacturer":"Xiaomi","model":"MI+5s"},"_uid":49154269846,"composition_id":"8e56be0b-ba75-44c6-bd61-9fd77680f84a","app_attribution_android_namespace":"","media_transformation_info":"{\"width\":\"720\",\"height\":\"720\",\"x_transform\":\"0\",\"y_transform\":\"0\",\"zoom\":\"1.0\",\"rotation\":\"0.0\",\"background_coverage\":\"0.0\"}","original_media_type":"photo","camera_entry_point":"121","edits":{"crop_original_size":[720.0,720.0],"filter_type":0,"filter_strength":1.0},"extra":{"source_width":720,"source_height":720}' . $tap_models
                    ]
                ] )->getBody();

                $response = json_decode( $response, TRUE );
            }
            catch ( Exception $e )
            {
                $response = [];
            }
        }
        else
        {
            $endpoint = 'media/configure/?timezone_offset=' . date( 'Z' );

            $sendData = [
                '_csrftoken'            => $this->getCsrfToken(),
                '_uid'                  => $this->getSettings( 'account_id' ),
                '_uuid'                 => $this->getSettings( 'uuid' ),
                'edits'                 => [
                    'crop_original_size' => [ (float) $photo_info[ 'width' ], (float) $photo_info[ 'height' ] ],
                    'crop_zoom'          => 1.0,
                    'crop_center'        => [ 0.0, -0.0 ]
                ],
                'device'                => [
                    'manufacturer'    => $this->getDeviceParam( 'manufacturer' ),
                    'model'           => $this->getDeviceParam( 'model' ),
                    'android_version' => $this->getDeviceParam( 'androidVersion' ),
                    'android_release' => $this->getDeviceParam( 'androidRelease' ),
                ],
                'extra'                 => [
                    'source_width'  => $photo_info[ 'width' ],
                    'source_height' => $photo_info[ 'height' ],
                ],
                'upload_id'             => $uploadId,
                'date_time_original'    => $date,
                'date_time_digitalized' => $date,
                'caption'               => $caption,
                'source_type'           => 4,
                'media_folder'          => 'Camera'
            ];

            try
            {
                $response = (string) $this->client->post( 'https://i.instagram.com/api/v1/' . $endpoint, [
                    'form_params' => $this->signData( $sendData )
                ] )->getBody();

                $response = json_decode( $response, TRUE );
            }
            catch ( Exception $e )
            {
                $response = [];
            }
        }

        return $response;
    }

    private function uploadIgVideo ( $uploadId, $video, $target = 'timeline' )
    {
        $uploadMethod = static::RESUMABLE_UPLOAD;

        if ( $target == 'story' || $video[ 'duration' ] > 10 )
        {
            $uploadMethod = static::SEGMENTED_UPLOAD;
        }

        if ( $uploadMethod === static::RESUMABLE_UPLOAD )
        {
            $response = $this->uploadIgVideoResumableMethod( $uploadId, $video, $target );
        }
        else
        {
            $response = $this->uploadIgVideoResumableMethod( $uploadId, $video, $target );
        }

        return $response;
    }

    private function uploadIgVideoResumableMethod ( $uploadId, $video, $target )
    {
        $params = [
            'upload_id'                => $uploadId,
            'retry_context'            => json_encode( [
                'num_step_auto_retry'   => 0,
                'num_reupload'          => 0,
                'num_step_manual_retry' => 0
            ] ),
            'xsharing_user_ids'        => '[]',
            'upload_media_height'      => (string) $video[ 'height' ],
            'upload_media_width'       => (string) $video[ 'width' ],
            'upload_media_duration_ms' => (string) $video[ 'duration' ] * 1000,
            'media_type'               => '2',
            'potential_share_types'    => json_encode( [ 'not supported type' ] ),
        ];

        if ( $target == 'story' )
        {
            $params[ 'for_album' ] = '1';
        }

        if( $target == 'reel' )
        {
            $params[ 'is_clips_video' ] = '1';
        }

        $entity_name = sprintf( '%s_%d_%d', $uploadId, 0, $this->hashCode( basename( $video[ 'path' ] ) ) );
        $endpoint    = 'https://i.instagram.com/rupload_igvideo/' . $entity_name . '?target=PRN';

        try
        {
            $response = (string) $this->client->post( $endpoint, [
                'headers' => [
                    'X_FB_VIDEO_WATERFALL_ID'    => $this->generateUUID(),
                    'X-Instagram-Rupload-Params' => json_encode( $this->reorderByHashCode( $params ) ),
                    'X-Entity-Type'              => 'video/mp4',
                    'X-Entity-Name'              => $entity_name,
                    'X-Entity-Length'            => filesize( $video[ 'path' ] ),
                    'Offset'                     => '0'
                ],
                'body'    => fopen( $video[ 'path' ], 'r' )
            ] )->getBody();

            $response = json_decode( $response, TRUE );
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    private function uploadIgVideoSegmentedMethod ( $uploadId, $video, $target )
    {
        $videoSegments = $this->splitVideoSegments( $video, $target );

        $params = [
            'upload_id'                => $uploadId,
            'retry_context'            => json_encode( [
                'num_step_auto_retry'   => 0,
                'num_reupload'          => 0,
                'num_step_manual_retry' => 0
            ] ),
            'xsharing_user_ids'        => '[]',
            'upload_media_height'      => (string) $video[ 'height' ],
            'upload_media_width'       => (string) $video[ 'width' ],
            'upload_media_duration_ms' => (string) $video[ 'duration' ] * 1000,
            'media_type'               => '2',
            'potential_share_types'    => json_encode( [ 'not supported type' ] ),
        ];

        if ( $target == 'story' )
        {
            $params[ 'for_album' ] = '1';
        }

        try
        {
            $startRequest = $this->client->post( 'https://i.instagram.com/rupload_igvideo/' . $this->generateUUID() . '?segmented=true&phase=start', [
                'headers' => [
                    'X-Instagram-Rupload-Params' => json_encode( $this->reorderByHashCode( $params ) )
                ]
            ] )->getBody();

            $startRequest = json_decode( $startRequest, TRUE );
        }
        catch ( Exception $e )
        {
            throw $e;
        }

        $streamId = $startRequest[ 'stream_id' ];

        $offset      = 0;
        $waterfallId = $this->createUploadId();

        foreach ( $videoSegments as $segment )
        {
            $segmentSize = filesize( $segment );
            $isAudio     = preg_match( '/audio\.mp4$/', $segment );

            $headers = [
                'Segment-Start-Offset'       => $offset,
                'Segment-Type'               => $isAudio ? 1 : 2,
                'Stream-Id'                  => $streamId,
                'X_FB_VIDEO_WATERFALL_ID'    => $waterfallId,
                'X-Instagram-Rupload-Params' => json_encode( $this->reorderByHashCode( $params ) )
            ];

            $entity_name = md5( $segment ) . '-0-' . $segmentSize;

            try
            {
                $getOffset = $this->client->get( 'https://i.instagram.com/rupload_igvideo/' . $entity_name . '?segmented=true&phase=transfer', [
                    'headers' => $headers
                ] )->getBody();

                $getOffset = json_decode( $getOffset, TRUE );

                $headers[ 'X-Entity-Type' ]   = 'video/mp4';
                $headers[ 'X-Entity-Name' ]   = $entity_name;
                $headers[ 'X-Entity-Length' ] = $segmentSize;
                $headers[ 'Offset' ]          = isset( $getOffset[ 'offset' ] ) ? (int) $getOffset[ 'offset' ] : 0;

                $this->client->post( 'https://i.instagram.com/rupload_igvideo/' . $entity_name . '?segmented=true&phase=transfer', [
                    'headers' => $headers,
                    'body'    => fopen( $segment, 'r' ),
                ] )->getBody();
            }
            catch ( Exception $e )
            {
                throw $e;
            }

            $offset += $segmentSize;
        }

        try
        {
            $startRequest = $this->client->post( 'https://i.instagram.com/rupload_igvideo/' . $this->generateUUID() . '?segmented=true&phase=end', [
                'headers' => [
                    'Stream-Id'                  => $streamId,
                    'X-Instagram-Rupload-Params' => json_encode( $this->reorderByHashCode( $params ) )
                ]
            ] )->getBody();
 
            $startRequest = json_decode( $startRequest, TRUE );
        }
        catch ( Exception $e )
        {
            throw $e;
        }

        return [];
    }

    private function splitVideoSegments ( $video, $target )
    {
        $segmentTime = $target == 'story' ? 2 : 5;
        $segmentId   = md5( $video[ 'path' ] );

        $segmentsPath         = TMPPATH() . 'sp_' . $segmentId . '_%03d.mp4';
        $segmentsPathForAudio = TMPPATH() . 'sp_' . $segmentId . '_audio.mp4';
        $this->tmpFiles[] = $segmentsPath;
        $this->tmpFiles[] = $segmentsPathForAudio;

        $ffmpeg = FFmpeg::factory();

        try
        {
            $ffmpeg->run( sprintf( '-i %s -c:v copy -an -dn -sn -f segment -segment_time %d -segment_format mp4 %s', FFmpeg::escape( $video[ 'path' ] ), $segmentTime, FFmpeg::escape( $segmentsPath ) ) );

            if ( $video[ 'audio_codec' ] !== NULL )
            {
                $commandCopy = '-c:a copy';

                if ($video[ 'audio_codec' ] !== 'aac') {
                    if ($ffmpeg->hasLibFdkAac()) {
                        $commandCopy = '-c:a libfdk_aac -vbr 4';
                    } else {
                        $commandCopy = '-strict -2 -c:a aac -b:a 96k';
                    }
                }

                $ffmpeg->run( sprintf( '-i %s %s -c:v libx264 -preset fast -crf 24 -metadata:s:v rotate="" -f mp4 %s', FFmpeg::escape( $video[ 'path' ] ), $commandCopy, FFmpeg::escape( $segmentsPathForAudio ) ) );
            }
        }
        catch ( RuntimeException $e )
        {
            // Find segments for removing them after finish
            $this->findSegments( $segmentId );
            throw $e;
        }

        return $this->findSegments( $segmentId );
    }

    private function findSegments ( $segmentId )
    {
        $segmentsPath      = TMPPATH() . 'sp_' . $segmentId . '_*.mp4';
        $segmentsPathAudio = TMPPATH() . 'sp_' . $segmentId . '_audio.mp4';
        $this->tmpFiles[] = $segmentsPathAudio;

        $result = glob( $segmentsPath );

        if ( is_file( $segmentsPathAudio ) )
        {
            $result[] = $segmentsPathAudio;
        }

        foreach ( $result as $file_path )
        {
            $this->tmpFiles[] = $file_path;
        }

        return $result;
    }

    private function configureWithRetries(
        callable $configurator)
    {
        $attempt = 0;
        $lastError = null;
        while (true) {
            // Check for max retry-limit, and throw if we exceeded it.
            if (++$attempt > 3) {
                throw new \RuntimeException('All configuration retries of configureWithRetries() have failed.');
            }

            $result = null;
            sleep(5);
        }

        // We are never supposed to get here!
        throw new \LogicException('Something went wrong during configuration.');
    }

    private function configureVideo ( $video, $caption, $uploadId, $link = '', $target = 'timeline' )
    {
        $date = date( 'Y:m:d H:i:s' );

        $sendData = [
            'supported_capabilities_new' => json_encode( [
                [
                    'name'  => 'SUPPORTED_SDK_VERSIONS',
                    'value' => '119.0,120.0,121.0,122.0,123.0,124.0,125.0,126.0,127.0,128.0,129.0,130.0,131.0,132.0,133.0,134.0,135.0,136.0,137.0,138.0,139.0,140.0,141.0,142.0,143.0,144.0,145.0,146.0,147.0,148.0,149.0,150.0,151.0,152.0'
                ],
                [ 'name' => 'FACE_TRACKER_VERSION', 'value' => '14' ],
                [ 'name' => 'COMPRESSION', 'value' => 'ETC2_COMPRESSION' ],
                [ 'name' => 'gyroscope', 'value' => 'gyroscope_enabled' ]
            ] ),
            'video_result'               => '',
            'upload_id'                  => $uploadId,
            'poster_frame_index'         => 0,
            'length'                     => round( $video[ 'duration' ], 1 ),
            'audio_muted'                => FALSE,
            'filter_type'                => 0,
            'source_type'                => 4,
            'media_folder'               => 'Camera',
            'device'                     => [
                'manufacturer'    => $this->getDeviceParam( 'manufacturer' ),
                'model'           => $this->getDeviceParam( 'model' ),
                'android_version' => $this->getDeviceParam( 'androidVersion' ),
                'android_release' => $this->getDeviceParam( 'androidRelease' ),
            ],
            'extra'                      => [
                'source_width'  => $video[ 'width' ],
                'source_height' => $video[ 'height' ],
            ],
            '_csrftoken'                 => $this->getCsrfToken(),
            '_uid'                       => $this->getSettings( 'account_id' ),
            '_uuid'                      => $this->getSettings( 'uuid' ),
            'caption'                    => $caption
        ];


        switch ( $target )
        {
            case 'story':
                $endpoint = 'media/configure_to_story/';

                $sendData[ 'configure_mode' ]            = 1;
                $sendData[ 'story_media_creation_date' ] = time() - mt_rand( 10, 20 );
                $sendData[ 'client_shared_at' ]          = time() - mt_rand( 3, 10 );
                $sendData[ 'client_timestamp' ]          = time();

                if ( ! empty( $link ) )
                {
                    $sendData[ 'story_cta' ] = '[{"links":[{"linkType": 1, "webUri":' . json_encode( $link ) . ', "androidClass": "", "package": "", "deeplinkUri": "", "callToActionTitle": "", "redirectUri": null, "leadGenFormId": "", "igUserId": "", "appInstallObjectiveInvalidationBehavior": null}]}]';
                }
                break;
            default:
                $endpoint = 'media/configure/';
                $sendData[ 'caption' ] = $caption;
        }

        try
        {
            $response = (string) $this->client->post( 'https://i.instagram.com/api/v1/' . $endpoint . '?video=1', [
                'form_params' => $this->signData( $sendData )
            ] )->getBody();

            $response = json_decode( $response, TRUE );
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    private function createUploadId ()
    {
        return number_format( round( microtime( TRUE ) * 1000 ), 0, '', '' );
    }

    public function writeComment ( $comment, $mediaId )
    {
        $data = [
            "_uuid"             => $this->getSettings( 'uuid' ),
            "device_id"         => $this->getSettings( 'device_id' ),
            "delivery_class"    => "organic",
            "feed_position"     => "0",
            "container_module"  => "self_comments_v2_feed_contextual_self_profile", // "comments_v2",
            "comment_text"      => $comment,
            'idempotence_token' => $this->generateUUID()
        ];

        $endpoint = sprintf( "https://i.instagram.com/api/v1/media/%s/comment/", $mediaId );

        try
        {
            $response = (string) $this->client->post( $endpoint, [
                "form_params" => $this->signData( $data )
            ] )->getBody();

            $response = json_decode( $response, TRUE );
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        if ( isset( $response[ 'status' ] ) )
        {
            if ( $response[ 'status' ] != 'ok' && isset( $response[ 'message' ] ) )
            {
                return [
                    'error' => $response[ 'message' ]
                ];
            }
            else if ( $response[ 'status' ] == 'ok' )
            {
                if ( isset( $response[ 'comment' ] ) && isset( $response[ 'comment' ][ 'pk' ] ) )
                {
                    return [
                        'id' => $response[ 'comment' ][ 'pk' ]
                    ];
                }
            }
        }

        return [
            'error' => __( 'Unknown error' )
        ];
    }

    public function createLive(
        $message = "Hey!",
        $previewWidth = 1080,
        $previewHeight = 2076)
    {

        $data = [
            "_uuid"             => $this->getSettings( 'uuid' ),
            "preview_height"    => $previewHeight,
            "preview_width"     => $previewWidth,
            "broadcast_message" => $message,
            "broadcast_type"    => 'RTMP_SWAP_ENABLED',
        ];

        $endpoint = sprintf( "https://i.instagram.com/api/v1/live/create/" );

        try
        {
            $response = (string) $this->client->post( $endpoint, [
                "form_params" => $this->signData( $data )
            ] )->getBody();

            $response = json_decode( $response, TRUE );
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    public function startLive(
        $broadcastId,
        $latitude = null,
        $longitude = null)
    {

        $data = [
            "_uuid"             => $this->getSettings( 'uuid' ),
        ];

        $endpoint = sprintf( "https://i.instagram.com/api/v1/live/{$broadcastId}/start/" );

        if ($latitude !== null && $longitude !== null) {
            $data['latitude'] = $latitude;
            $data['longitude'] = $longitude;
        }

        try
        {
            $response = (string) $this->client->post( $endpoint, [
                "form_params" => $this->signData( $data )
            ] )->getBody();

            $response = json_decode( $response, TRUE );
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    public function generateUserBreadcrumb(
        $size)
    {
        $key = 'iN4$aGr0m';
        $date = (int) (microtime(true) * 1000);

        // typing time
        $term = rand(2, 3) * 1000 + $size * rand(15, 20) * 100;

        // android EditText change event occur count
        $text_change_event_count = round($size / rand(2, 3));
        if ($text_change_event_count == 0) {
            $text_change_event_count = 1;
        }

        // generate typing data
        $data = $size.' '.$term.' '.$text_change_event_count.' '.$date;

        return base64_encode(hash_hmac('sha256', $data, $key, true))."\n".base64_encode($data)."\n";
    }

    public function commentLive(
        $broadcastId,
        $commentText)
    {
        $data = [
            "user_breadcrumb" => $this->generateUserBreadcrumb(mb_strlen($commentText)),
            "live_or_vod" => 1,
            "idempotence_token" => $this->generateUUID(),
            "_uid" => $this->getSettings( 'account_id' ),
            "_uuid" => $this->getSettings( 'uuid' ),
            "force_create" => FALSE,
            "comment_text" => $commentText,
            "offset_to_video_start" => 0
        ];

        $endpoint = sprintf( "https://i.instagram.com/api/v1/live/{$broadcastId}/comment/" );

        try
        {
            $response = (string) $this->client->post( $endpoint, [
                "form_params" => $this->signData( $data )
            ] )->getBody();

            $response = json_decode( $response, TRUE );
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    public function pinComment(
        $broadcastId,
        $commentId)
    {
        $data = [
            "offset_to_video_start" => 0,
            "comment_id"            => $commentId,
            "_uuid"                 => $this->getSettings( 'uuid' ),
            "_uid"                  => $this->getSettings( 'account_id' ),
        ];

        $endpoint = sprintf( "https://i.instagram.com/api/v1/live/{$broadcastId}/pin_comment/" );

        try
        {
            $response = (string) $this->client->post( $endpoint, [
                "form_params" => $this->signData( $data )
            ] )->getBody();

            $response = json_decode( $response, TRUE );
        }
        catch ( Exception $e )
        {
            $response = [];
        }

        return $response;
    }

    private function getPublicKeys ()
    {
        $client = new Client();

        $response = '';

        try
        {
            $response = $client->get( "https://i.instagram.com/api/v1/qe/sync/" );
        }
        catch ( Exception $e )
        {
            if ( method_exists( $e, 'getResponse' ) )
            {
                $response = $e->getResponse();

                if ( is_null( $response ) )
                {
                    return false;
                }
            }
        }

        if ( ! method_exists( $response, 'getHeader' ) )
        {
            return false;
        }

        if ( empty( $response->getHeader( "ig-set-password-encryption-key-id" )[ 0 ] ) || empty( $response->getHeader( "ig-set-password-encryption-pub-key" )[ 0 ] ) )
        {
            return false;
        }

        $pubKeyID  = $response->getHeader( "ig-set-password-encryption-key-id" )[ 0 ];
        $pubKeyStr = $response->getHeader( "ig-set-password-encryption-pub-key" )[ 0 ];

        return [
            $pubKeyID,
            $pubKeyStr,
        ];
    }

    private function encPass ( $password )
    {
        list( $publicKeyId, $publicKey ) = $this->getPublicKeys();
        $key  = substr( md5( uniqid( mt_rand() ) ), 0, 32 );
        $iv   = substr( md5( uniqid( mt_rand() ) ), 0, 12 );
        $time = time();

        $rsa          = PublicKeyLoader::loadPublicKey( base64_decode( $publicKey ) );
        $rsa          = $rsa->withPadding( RSA::ENCRYPTION_PKCS1 );
        $encryptedRSA = $rsa->encrypt( $key );

        $aes = new AES( 'gcm' );
        $aes->setNonce( $iv );
        $aes->setKey( $key );
        $aes->setAAD( strval( $time ) );
        $encrypted = $aes->encrypt( $password );

        $payload = base64_encode( "\x01" | pack( 'n', intval( $publicKeyId ) ) . $iv . pack( 's', strlen( $encryptedRSA ) ) . $encryptedRSA . $aes->getTag() . $encrypted );

        return sprintf( '#PWD_INSTAGRAM:4:%s:%s', $time, $payload );
    }
}

}