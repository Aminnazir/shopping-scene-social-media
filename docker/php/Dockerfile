# Use an official PHP 8.1 image with Apache
FROM php:8.1-apache

# Install necessary PHP extensions and tools
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libmariadb-dev \
    unzip zip \
    zlib1g-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libonig-dev \
    libzip-dev \
    libxml2-dev \
    ffmpeg \
    libavcodec-extra \
    git \
    && docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        gettext \
        pdo \
        intl \
        pdo_mysql \
        mysqli \
        gd \
        exif \
        pcntl \
        bcmath \
        xml \
        zip \
        mbstring

# Enable Apache mod_rewrite for pretty URLs
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

RUN echo "upload_max_filesize=100M" >> /usr/local/etc/php/php.ini \
    && echo "post_max_size=100M" >> /usr/local/etc/php/php.ini

RUN echo "upload_max_filesize = 100M" >> /usr/local/etc/php/conf.d/uploads.ini
RUN echo "post_max_size = 100M" >> /usr/local/etc/php/conf.d/uploads.ini

RUN echo "allow_url_fopen = On" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "allow_url_fopen = On" >> /usr/local/etc/php/php.ini

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
