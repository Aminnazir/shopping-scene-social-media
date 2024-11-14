-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: shopping-scene-social-media-db
-- Generation Time: Nov 14, 2024 at 12:32 PM
-- Server version: 9.1.0
-- PHP Version: 8.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social-media-manage`
--

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `id` int NOT NULL,
  `filename` varchar(255) NOT NULL,
  `executed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_accounts`
--

CREATE TABLE `sp_accounts` (
  `id` int UNSIGNED NOT NULL,
  `ids` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `social_network` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `login_type` int DEFAULT NULL,
  `can_post` int DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `token` text,
  `avatar` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `tmp` text,
  `data` mediumtext,
  `proxy` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sp_accounts`
--

INSERT INTO `sp_accounts` (`id`, `ids`, `module`, `social_network`, `category`, `team_id`, `login_type`, `can_post`, `pid`, `name`, `username`, `token`, `avatar`, `url`, `tmp`, `data`, `proxy`, `status`, `changed`, `created`) VALUES
(29, '67349f08f207c', 'facebook_profiles', 'facebook', 'profile', 1, 1, 0, '8444849845605960', 'Amin Nazir', 'Amin Nazir', 'EAASQHPhZCIe0BOyDvfYFmaCNmtn9KWF2S1BGuF73hdzXI6KmPCFpgeZCuM3y9006zvMBaWMpzZAiOXij9g01riCAjVUfuuyGpgPliXREn60DGjGmhNNO0wXPGZCbu3u7zwZAzpcGehiqIXZBrDlHHFDSS6hbzdkZBCZCRW4FcHtDLVpRIIAMeBoC0FH9IXhpe18iyPukns1TOl03fkZCMYgeA7tYdn9316Vt2cTDRp6UfwpP7JDGItuws', 'avatar/67349f08b75b8.jpg', 'https://fb.com/8444849845605960', NULL, NULL, NULL, 1, 1731501832, 1731501832),
(30, '67349f17cc71c', 'facebook_pages', 'facebook', 'page', 1, 1, 1, '111809794326679', 'Shopping Scene', 'Shopping Scene', 'EAASQHPhZCIe0BO2ZA3RmAeZCjz9m7Jc2ZCpFbOEPqFs5oe0R33k9FFWAipkiZCvvOGz6qD3IZAMvyqpUwFYZCrHb8QgGvvKQIufYMZCwo5r34tkZC1sqdXQdcFLPLX2yfANcFHUrdLUUQlcG8itpfkKwRNg5IY2hiLwocZCTB71vmH8CLZCgBjtlt9U5CsXgJYYRXoZD', 'avatar/67349f17c8ba8.jpg', 'https://www.facebook.com/111809794326679', NULL, NULL, NULL, 1, 1731501847, 1731501847),
(31, '67349f260f419', 'instagram_profiles', 'instagram', 'profile', 1, 1, 1, '17841447198580633', 'Shopping Scene', 'shoppingscene.pk', 'EAASQHPhZCIe0BO4JoMM7NoPi2akvT7woMdZBxEaQ4EIX50UsII4jAJBkvJFgGahqhGsDQ3bUVkmGgWMNl4NUe2XOo1LefSri62aZBzO6LAyu5YZAbMaCHXM0PXE8dRI8b5rp3y5USdXQ4m8O7ZC7z5A12KZBrY41MwjhyK5gL3egQG1eUcdx69PcgLjySlzDeOSXl3A9cBS2ZCnStx04ITgv7F4YYZACZCCoIpz45yaIE6HIHtOF5o9ZBw', 'avatar/67349f260b053.jpg', 'https://www.instagram.com/shoppingscene.pk', NULL, NULL, NULL, 1, 1731501862, 1731501862);

-- --------------------------------------------------------

--
-- Table structure for table `sp_account_sessions`
--

CREATE TABLE `sp_account_sessions` (
  `id` int UNSIGNED NOT NULL,
  `team_id` int DEFAULT NULL,
  `social_network` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `settings` longtext,
  `cookies` longtext,
  `last_modified` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_ai_prompt_categories`
--

CREATE TABLE `sp_ai_prompt_categories` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sp_ai_prompt_categories`
--

INSERT INTO `sp_ai_prompt_categories` (`id`, `ids`, `name`, `desc`, `icon`, `color`, `status`, `changed`, `created`) VALUES
(1, '65b1e6772ee83', 'Suggested', '', 'fas fa-stars', '#D28E8E', 1, 1706157687, 1706157687),
(2, '65b1e6772f72e', 'Facebook', '', 'fab fa-facebook', '#D2B08E', 1, 1706157687, 1706157687),
(3, '65b1e6772fcdc', 'Instagram', '', 'fab fa-instagram', '#D2D28E', 1, 1706157687, 1706157687),
(4, '65b1e67730525', 'Twitter', '', 'fab fa-twitter-square', '#B0D28E', 1, 1706157687, 1706157687),
(5, '65b1e67730d8c', 'LinkedIn', '', 'fab fa-linkedin', '#8ED28E', 1, 1706157687, 1706157687),
(6, '65b1e6773131a', 'Pinterest', '', 'fab fa-pinterest-p', '#8ED2B0', 1, 1706157687, 1706157687),
(7, '65b1e677317fa', 'Google Business Profile', '', 'fab fa-google', '#D0D28E', 1, 1706157687, 1706157687),
(8, '65b1e67731d22', 'TikTok', '', 'fab fa-tiktok', '#AED28E', 1, 1706157687, 1706157687),
(9, '65b1e67732275', 'Youtube', '', 'fab fa-youtube', '#8ED290', 1, 1706157687, 1706157687),
(10, '65b1e677327e5', 'Rewrite', '', 'fad fa-file-signature', '#8ED2B2', 1, 1706157687, 1706157687),
(11, '65b1e67732d76', 'Edit', '', 'fad fa-pencil-alt', '#8ED0D2', 1, 1706157687, 1706157687),
(12, '65b1e677332e3', 'Explain & Expand', '', 'fad fa-expand', '#8EAED2', 1, 1706157687, 1706157687),
(13, '65b1e6773377c', 'Summarize', '', 'fad fa-filter', '#9BD28E', 1, 1706157687, 1706157687),
(14, '65b1e67733b65', 'Psychological Frameworks', '', 'fad fa-head-side-brain', '#8ED2A3', 1, 1706157687, 1706157687),
(15, '65b1e67733f54', 'Content Creation Frameworks', '', 'fad fa-lightbulb-on', '#8ED2C5', 1, 1706157687, 1706157687),
(16, '65b1e67734356', 'Promotional', '', 'fad fa-bullhorn', '#8EBDD2', 1, 1706157687, 1706157687),
(17, '65b1e67734767', 'Ads', '', 'fad fa-ad', '#8E9BD2', 1, 1706157687, 1706157687),
(18, '65b1e67734b9a', 'Company-Related', '', 'fad fa-building', '#A38ED2', 1, 1706157687, 1706157687),
(19, '65b1e67734f7a', 'CTA Prompts', '', 'fad fa-mouse-pointer', '#8ED2A7', 1, 1706157687, 1706157687),
(20, '65b1e67735358', 'Educational', '', 'fad fa-graduation-cap', '#8ED2C9', 1, 1706157687, 1706157687),
(21, '65b1e67735785', 'Fun Prompts', '', 'fad fa-smile-beam', '#8EB9D2', 1, 1706157687, 1706157687),
(22, '65b1e67735c40', 'Interactive', '', 'fad fa-retweet', '#8E97D2', 1, 1706157687, 1706157687),
(23, '65b1e6773609a', 'Inspirational', '', 'fad fa-house-leave', '#A78ED2', 1, 1706157687, 1706157687),
(24, '65b1e67736493', 'Holiday', '', 'fad fa-umbrella-beach', '#C98ED2', 1, 1706157687, 1706157687),
(25, '65b1e6773688c', 'Small Businesses', '', 'fad fa-suitcase', '#8EAAD2', 1, 1706157687, 1706157687),
(26, '65b1e67736d60', 'Business Coaches', '', 'fad fa-user-chart', '#948ED2', 1, 1706157687, 1706157687),
(27, '65b1e67737202', 'Lifestyle Coaches', '', 'fad fa-chalkboard-teacher', '#B68ED2', 1, 1706157687, 1706157687),
(28, '65b1e677377a0', 'Realtors', '', 'fad fa-house-day', '#D28ECC', 1, 1706157687, 1706157687),
(29, '65b1e67737d8b', 'NGOs', '', 'fad fa-home-heart', '#D2948E', 1, 1706157687, 1706157687),
(30, '65b1e67738170', 'Entreprenuers', '', 'fad fa-user-tie', '#D28EAA', 1, 1706157687, 1706157687),
(31, '65b1e6773856b', 'Marketing Agencies', '', 'fad fa-bullseye-arrow', '#D28EAE', 1, 1706157687, 1706157687),
(32, '65b1e6773898a', 'Authors', '', 'fad fa-book-reader', '#D2908E', 1, 1706157687, 1706157687),
(33, '65b1e67738e09', 'Accountants', '', 'fad fa-hand-holding-usd', '#8ED290', 1, 1706157687, 1706157687),
(34, '65b1e6773929a', 'Restaurants', '', 'fad fa-utensils', '#D0D28E', 1, 1706157687, 1706157687),
(35, '65b1e67739673', 'Fitness Trainers', '', 'fad fa-dumbbell', '#C88ED2', 1, 1706157687, 1706157687),
(36, '65b1e67739b26', 'Photographers', '', 'fad fa-camera-retro', '#D28EBA', 1, 1706157687, 1706157687);

-- --------------------------------------------------------

--
-- Table structure for table `sp_ai_prompt_templates`
--

CREATE TABLE `sp_ai_prompt_templates` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `content` text,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sp_ai_prompt_templates`
--

INSERT INTO `sp_ai_prompt_templates` (`id`, `ids`, `pid`, `content`, `status`, `changed`, `created`) VALUES
(1, '65b1e79adcf30', 1, 'Summarize the following:', 1, 1706157978, 1706157978),
(2, '65b1e79add610', 1, 'Create a promotional ad for:', 1, 1706157978, 1706157978),
(3, '65b1e79addaa3', 1, 'Create a social media post for:', 1, 1706157978, 1706157978),
(4, '65b1e79ade55e', 1, 'Write a witty Instagram caption about:', 1, 1706157978, 1706157978),
(5, '65b1e79ade9e9', 1, 'Rewrite and improve the following content:', 1, 1706157978, 1706157978),
(6, '65b1e79adee79', 2, 'Write an engaging Facebook post about the company described below:', 1, 1706157978, 1706157978),
(7, '65b1e79adf2dc', 2, 'Produce a Facebook status about the benefits of {{ topic }}.', 1, 1706157978, 1706157978),
(8, '65b1e79adf76f', 2, 'Write a Facebook post about {{ topic }}.', 1, 1706157978, 1706157978),
(9, '65b1e79adfbea', 2, 'Give me an interesting question to post on my Facebook Group about {{ topic }}.', 1, 1706157978, 1706157978),
(10, '65b1e79ae002f', 2, 'Rephrase the following content as a catchy Facebook post.', 1, 1706157978, 1706157978),
(11, '65b1e79ae0460', 2, 'Generate question ideas for a Facebook poll about {{ topic }}.', 1, 1706157978, 1706157978),
(12, '65b1e79ae095e', 2, 'Craft a compelling story on how you can change your life for the better by using {{ product/service }}.', 1, 1706157978, 1706157978),
(13, '65b1e79ae0df4', 2, 'Share a behind-the-scenes look at {{ company/project }} and the hard work that goes into it.', 1, 1706157978, 1706157978),
(14, '65b1e79ae1294', 2, 'Create a Facebook post that highlights the unique features of {{ product/service }}.', 1, 1706157978, 1706157978),
(15, '65b1e79ae1763', 2, 'Write a Facebook status that educates your audience on the importance of {{ topic }}.', 1, 1706157978, 1706157978),
(16, '65b1e79ae1c9a', 2, 'Come up with a Facebook post that inspires your followers to take action regarding {{ issue }}.', 1, 1706157978, 1706157978),
(17, '65b1e79ae21d6', 2, 'Develop a thought-provoking Facebook post that sparks a conversation about {{ topic }}.', 1, 1706157978, 1706157978),
(18, '65b1e79ae2686', 2, 'Design a Facebook quiz that challenges your followers\' knowledge on {{ topic }}.', 1, 1706157978, 1706157978),
(19, '65b1e79ae2bdf', 2, 'Share a personal experience that impacted your life about {{ topic }}.', 1, 1706157978, 1706157978),
(20, '65b1e79ae319b', 2, 'Write a Facebook post that encourages your followers to share their opinions on {{ topic }}.', 1, 1706157978, 1706157978),
(21, '65b1e79ae36d2', 2, 'Create a Facebook status that showcases how today\'s society is impacted by {{ product/service }}.', 1, 1706157978, 1706157978),
(22, '65b1e79ae3c05', 2, 'Develop a Facebook post that asks for improvement feedback on {{ company/project }}.', 1, 1706157978, 1706157978),
(23, '65b1e79ae4145', 2, 'Share a funny or relatable meme about {{ topic }}.', 1, 1706157978, 1706157978),
(24, '65b1e79ae469a', 2, 'Write a Facebook post that highlights the success stories of those who have used {{ product/service }}.', 1, 1706157978, 1706157978),
(25, '65b1e79ae4c2a', 2, 'Create a Facebook poll/quiz that challenges your followers to think critically about {{ topic }}.', 1, 1706157978, 1706157978),
(26, '65b1e79ae508c', 3, 'Encourage my {{ ideal customer persona }} to share positive experiences with my {{ product/service }} by showcasing them in a unique and engaging way with an Instagram post.', 1, 1706157978, 1706157978),
(27, '65b1e79ae547c', 3, 'Establish trust and credibility with my {{ ideal customer persona }} through an Instagram post that highlights the expertise and professionalism of my {{ company/brand }}.', 1, 1706157978, 1706157978),
(28, '65b1e79ae58d9', 3, 'Persuade my {{ ideal customer persona }} to take {{ desired action }} with a unique and compelling offer in an Instagram post that creates a sense of urgency and exclusivity.', 1, 1706157978, 1706157978),
(29, '65b1e79ae5cb9', 3, 'Show how my {{ product/service }} can meet the specific needs and pain points of my {{ ideal customer persona }} in an engaging and relatable way with an Instagram post.', 1, 1706157978, 1706157978),
(30, '65b1e79ae6085', 3, 'Persuade my {{ ideal customer persona }} to choose my {{ product/service }} over similar options in the market by showcasing clear and compelling evidence in an Instagram post.', 1, 1706157978, 1706157978),
(31, '65b1e79ae64fd', 3, 'Provide step-by-step guidance on how to use my {{ product/service }} and encourage my {{ ideal customer persona }} to make a purchase with an Instagram post that has clear and compelling instructions.', 1, 1706157978, 1706157978),
(32, '65b1e79ae68f9', 3, 'Engage my {{ ideal customer persona }} with a relatable and authentic message in an Instagram post that leads to {{ desired action }} with a strong call-to-action and compelling visuals.', 1, 1706157978, 1706157978),
(33, '65b1e79ae6cef', 3, 'Provide valuable and relevant information about {{ subject }} to my {{ ideal customer persona }} and persuade them to take {{ desired action }} with an Instagram post that has a clear and compelling message.', 1, 1706157978, 1706157978),
(34, '65b1e79ae70f1', 3, 'Engage my {{ ideal customer persona }} with a creative and engaging Instagram post that showcases the unique features and benefits of my {{ product/service }}.', 1, 1706157978, 1706157978),
(35, '65b1e79ae753f', 3, 'Write a witty Instagram caption about {{ topic }}.', 1, 1706157978, 1706157978),
(36, '65b1e79ae7988', 3, 'Give me Instagram photo captions for a picture of {{ photo description }}.', 1, 1706157978, 1706157978),
(37, '65b1e79ae7e17', 3, 'Generate 10 viral Instagram Reel ideas about {{ topic }}.', 1, 1706157978, 1706157978),
(38, '65b1e79ae834d', 3, 'Write a story or personal experience related to {{ topic }}.', 1, 1706157978, 1706157978),
(39, '65b1e79ae8818', 3, 'Ask your followers to share their own experiences or opinions in the comments about {{ topic }}.', 1, 1706157978, 1706157978),
(40, '65b1e79ae8ca7', 3, 'Create an Instagram poll or quiz related to {{ topic }}.', 1, 1706157978, 1706157978),
(41, '65b1e79ae90c8', 3, 'Share a quote or inspiring message related to {{ topic }} on Instagram.', 1, 1706157978, 1706157978),
(42, '65b1e79ae958e', 3, 'Share tips, tricks, or advice related to {{ topic }} on Instagram.', 1, 1706157978, 1706157978),
(43, '65b1e79ae9a54', 3, 'Share a list of your favorite accounts, books, podcasts, or resources related to {{ topic }}.', 1, 1706157978, 1706157978),
(44, '65b1e79ae9edb', 3, 'Create a themed Instagram challenge or contest related to {{ topic }}.', 1, 1706157978, 1706157978),
(45, '65b1e79aea38d', 4, 'Write a Twitter thread about {{ topic }}.', 1, 1706157978, 1706157978),
(46, '65b1e79aea7e4', 4, 'Generate a funny tweet.', 1, 1706157978, 1706157978),
(47, '65b1e79aeac35', 4, 'Generate 10 tweet ideas to post about {{ topic }}.', 1, 1706157978, 1706157978),
(48, '65b1e79aeb056', 4, 'Produce 10 tweets based on the following information:', 1, 1706157978, 1706157978),
(49, '65b1e79aeb48b', 4, 'Rewrite the following content as a tweet:', 1, 1706157978, 1706157978),
(50, '65b1e79aeb8ab', 4, 'Write a tweet about {{ topic }} in a {{ adjective }} tone of voice.', 1, 1706157978, 1706157978),
(51, '65b1e79aebd1d', 4, 'Create a Twitter thread idea that presents a behind-the-scenes look at your {{ company/brand }}, persuading your {{ ideal customer persona }} to take {{ desired action }} with authenticity and reliability.', 1, 1706157978, 1706157978),
(52, '65b1e79aec1af', 4, 'Develop a Twitter thread idea that offers a step-by-step guide on how to use your {{ product/service }}, attracting high-quality leads with clear and compelling instructions.', 1, 1706157978, 1706157978),
(53, '65b1e79aec5f7', 4, 'Design a Twitter thread idea that demonstrates how your {{ product/service }} solves the specific pain points and needs of your {{ ideal customer persona }} in a relatable and engaging way.', 1, 1706157978, 1706157978),
(54, '65b1e79aeca6c', 4, 'Develop a Twitter thread idea that showcases the unique selling points of your {{ product/service }}, attracting high-quality leads with a sense of urgency and exclusive offers.', 1, 1706157978, 1706157978),
(55, '65b1e79aecef3', 4, 'Create a Twitter thread idea that compares your {{ product/service }} to similar options in the market, persuading your {{ ideal customer persona }} to choose you with clear and compelling evidence.', 1, 1706157978, 1706157978),
(56, '65b1e79aed3ce', 4, 'Develop a Twitter thread idea that draws in your {{ ideal customer persona }} with a relatable and authentic message, then persuades them to take {{ desired action }} with a strong call-to-action and compelling visuals.', 1, 1706157978, 1706157978),
(57, '65b1e79aed7cf', 4, 'Create a Twitter thread idea that establishes trust and credibility with your {{ ideal customer persona }} by showcasing the success stories of previous customers who have used your {{ product/service }}.', 1, 1706157978, 1706157978),
(58, '65b1e79aedc21', 4, 'Develop a Twitter thread idea that engages your {{ ideal customer persona }} with a unique and compelling perspective on {{ subject }}, persuading them to take {{ desired action }} on your {{ website/product }}.', 1, 1706157978, 1706157978),
(59, '65b1e79aee023', 4, 'Create a Twitter thread idea that provides valuable and relevant information to your {{ ideal customer persona }} about {{ subject }}, attracting high-quality leads with a strong call-to-action.', 1, 1706157978, 1706157978),
(60, '65b1e79aee42f', 4, 'Develop a Twitter thread idea that overcomes objections and concerns your {{ ideal customer persona }} may have about your {{ product/service }}, convincing them to take {{ desired action }} with a sense of urgency.', 1, 1706157978, 1706157978),
(61, '65b1e79aee8bf', 4, 'Create a Twitter thread idea that showcases the value and benefits of your {{ product/service }} to your {{ ideal customer persona }}, persuading them to take {{ desired action }} with a clear and compelling message.', 1, 1706157978, 1706157978),
(62, '65b1e79aeed82', 4, 'Develop a Twitter thread idea that showcases the unique features and benefits of your {{ product/service }} in a fun and creative way, attracting high-quality leads with a strong offer.', 1, 1706157978, 1706157978),
(63, '65b1e79aef1dc', 4, 'Create a Twitter thread idea that tells a unique and relatable story about your {{ product/service }} and how it has helped {{ ideal customer persona }} achieve their {{ goal }}.', 1, 1706157978, 1706157978),
(64, '65b1e79aef5ee', 4, 'Develop a Twitter thread idea that goes viral and attracts high-quality leads for your {{ product/service }} with a strong call-to-action and compelling visuals.', 1, 1706157978, 1706157978),
(65, '65b1e79aefa21', 4, 'Create a Twitter thread idea that goes viral and showcases your {{ product/service }} to your {{ ideal customer persona }} in a creative and engaging way.', 1, 1706157978, 1706157978),
(66, '65b1e79aefe3e', 4, 'Share a personal story or experience related to {{ topic }}.', 1, 1706157978, 1706157978),
(67, '65b1e79af023b', 4, 'Encourage your followers to share their thoughts by asking a question related to {{ topic }}.', 1, 1706157978, 1706157978),
(68, '65b1e79af12c5', 4, 'Use a relevant hashtag to join a larger conversation about {{ topic }}.', 1, 1706157978, 1706157978),
(69, '65b1e79af1e38', 4, 'Share a quote related to {{ topic }} and explain why it resonates with you.', 1, 1706157978, 1706157978),
(70, '65b1e79af2681', 4, 'Share a helpful tip or piece of advice related to {{ topic }}.', 1, 1706157978, 1706157978),
(71, '65b1e79af3779', 4, 'Create a list of resources related to {{ topic }} and share it with your followers.', 1, 1706157978, 1706157978),
(72, '65b1e79af4071', 4, 'Pose a hypothetical scenario related to {{ topic }} and ask your followers to weigh in on what they would do in that situation.', 1, 1706157978, 1706157978),
(73, '65b1e79b00261', 4, 'Share a personal goal or challenge related to {{ topic }} and encourage your followers to do the same.', 1, 1706157979, 1706157979),
(74, '65b1e79b006c6', 4, 'Share a historical event or figure related to {{ topic }} and explain its significance.', 1, 1706157979, 1706157979),
(75, '65b1e79b00b41', 4, 'Share a story or anecdote related to {{ topic }} and ask your followers to share their own in response.', 1, 1706157979, 1706157979),
(76, '65b1e79b00fcb', 4, 'Share a piece of advice or wisdom related to {{ topic }} that you wish you had known earlier in life.', 1, 1706157979, 1706157979),
(77, '65b1e79b01435', 4, 'Share a lesson you\'ve learned from a mistake or failure related to {{ topic }}.', 1, 1706157979, 1706157979),
(78, '65b1e79b0188c', 4, 'Share a personal opinion on a popular trend or debate related to {{ topic }}.', 1, 1706157979, 1706157979),
(79, '65b1e79b01d31', 4, 'Use humor or satire to make a point related to {{ topic }}.', 1, 1706157979, 1706157979),
(80, '65b1e79b021a7', 4, 'Share a personal story of growth or transformation related to {{ topic }} and encourage your followers to share their own stories of personal growth.', 1, 1706157979, 1706157979),
(81, '65b1e79b025ed', 4, 'Share a piece of trivia related to {{ topic }} that most people might not know.', 1, 1706157979, 1706157979),
(82, '65b1e79b02a06', 5, 'Write a LinkedIn post about the importance of networking and building professional relationships.', 1, 1706157979, 1706157979),
(83, '65b1e79b02e79', 5, 'Generate a LinkedIn post about the benefits of continuous learning and professional development.', 1, 1706157979, 1706157979),
(84, '65b1e79b032e1', 5, 'Create a LinkedIn post about the importance of building a strong personal brand.', 1, 1706157979, 1706157979),
(85, '65b1e79b037fc', 5, 'Generate a LinkedIn post about the importance of staying up-to-date with industry trends and news.', 1, 1706157979, 1706157979),
(86, '65b1e79b03d12', 5, 'Create a LinkedIn post about the importance of setting career goals and creating a plan to achieve them.', 1, 1706157979, 1706157979),
(87, '65b1e79b0421d', 5, 'Create a LinkedIn post about the importance of building a strong personal brand.', 1, 1706157979, 1706157979),
(88, '65b1e79b04747', 5, 'Generate a LinkedIn post about the importance of staying up-to-date with industry trends and news.', 1, 1706157979, 1706157979),
(89, '65b1e79b04c76', 5, 'Create a LinkedIn post about the importance of setting career goals and creating a plan to achieve them.', 1, 1706157979, 1706157979),
(90, '65b1e79b050da', 5, 'Write a LinkedIn post about the benefits of taking calculated risks in your career.', 1, 1706157979, 1706157979),
(91, '65b1e79b05508', 5, 'Generate a LinkedIn post about the importance of being authentic and transparent in your professional interactions.', 1, 1706157979, 1706157979),
(92, '65b1e79b05a0a', 5, 'Create a LinkedIn post promoting a blog post about {{ topic }}.', 1, 1706157979, 1706157979),
(93, '65b1e79b05ee8', 5, 'Create a promotional LinkedIn post about the benefits of using a {{ product/service }} that gets people to {{ action }}.', 1, 1706157979, 1706157979),
(94, '65b1e79b06349', 5, 'Generate question ideas for a LinkedIn quiz about {{ topic }}.', 1, 1706157979, 1706157979),
(95, '65b1e79b0678c', 5, 'Write a LinkedIn post about the power of mentorship and finding a professional mentor.', 1, 1706157979, 1706157979),
(96, '65b1e79b06bb9', 5, 'Create a LinkedIn post about the benefits of volunteering and giving back to your community.', 1, 1706157979, 1706157979),
(97, '65b1e79b073a1', 5, 'Generate a LinkedIn post about the importance of building a diverse professional network.', 1, 1706157979, 1706157979),
(98, '65b1e79b077da', 5, 'Write a LinkedIn post about the benefits of developing strong communication skills in the workplace.', 1, 1706157979, 1706157979),
(99, '65b1e79b07bc7', 5, 'Create a LinkedIn post about the importance of work-life balance and self-care.', 1, 1706157979, 1706157979),
(100, '65b1e79b0806e', 5, 'Generate a LinkedIn post about the benefits of attending conferences and industry events.', 1, 1706157979, 1706157979),
(101, '65b1e79b08498', 5, 'Write a LinkedIn post about the importance of cultivating a growth mindset.', 1, 1706157979, 1706157979),
(102, '65b1e79b088f5', 5, 'Create a LinkedIn post promoting a podcast episode or interview about {{ topic }}.', 1, 1706157979, 1706157979),
(103, '65b1e79b08d36', 5, 'Generate a LinkedIn post about the benefits of outsourcing certain tasks to increase productivity.', 1, 1706157979, 1706157979),
(104, '65b1e79b0918d', 5, 'Create question ideas for a LinkedIn poll/quiz about common challenges in {{ industry/profession }}.', 1, 1706157979, 1706157979),
(105, '65b1e79b09573', 5, 'Write a LinkedIn post about the importance of developing strong leadership skills.', 1, 1706157979, 1706157979),
(106, '65b1e79b099d1', 5, 'Create a LinkedIn post about the benefits of building cross-functional relationships within your organization.', 1, 1706157979, 1706157979),
(107, '65b1e79b09e29', 5, 'Generate a LinkedIn post about the importance of maintaining a positive attitude and mindset at work.', 1, 1706157979, 1706157979),
(108, '65b1e79b0a29a', 5, 'Write a LinkedIn post about the benefits of finding a work-life fit that aligns with your values and priorities.', 1, 1706157979, 1706157979),
(109, '65b1e79b0a6b6', 5, 'Create a LinkedIn post about the importance of creating a personal mission statement and aligning your career goals with it.', 1, 1706157979, 1706157979),
(110, '65b1e79b0ab19', 5, 'Create a LinkedIn post about the importance of creating a personal mission statement and aligning your career goals with it.', 1, 1706157979, 1706157979),
(111, '65b1e79b0af3c', 5, 'Write a LinkedIn post about the importance of building resilience and adaptability in your career.', 1, 1706157979, 1706157979),
(112, '65b1e79b0b406', 5, 'Create a LinkedIn post promoting a webinar or virtual event about {{ topic }}.', 1, 1706157979, 1706157979),
(113, '65b1e79b0b830', 5, 'Generate a LinkedIn post about the benefits of networking outside of your industry or profession.', 1, 1706157979, 1706157979),
(114, '65b1e79b0bd12', 5, 'Write a LinkedIn post about the importance of giving and receiving feedback effectively in the workplace.', 1, 1706157979, 1706157979),
(115, '65b1e79b0c14a', 6, 'Write a Pinterest description for an image about {{ topic }}.', 1, 1706157979, 1706157979),
(116, '65b1e79b0c57a', 6, 'Create a Pinterest description for a {{ product/service }} that leads people to {{ website }}.', 1, 1706157979, 1706157979),
(117, '65b1e79b0c9a4', 6, 'Generate 10 pin titles ideas for a post about {{ topic/product/service }}.', 1, 1706157979, 1706157979),
(118, '65b1e79b0cd9b', 6, 'Write a promotional Pinterest post for a {{ product/service }} that gets people to {{ action }}.', 1, 1706157979, 1706157979),
(119, '65b1e79b0d1b4', 6, 'Write an inspirational Pinterest post about {{ topic }}.', 1, 1706157979, 1706157979),
(120, '65b1e79b0d610', 6, 'Create a Pinterest post talking about {{ topic }} tips and tricks.', 1, 1706157979, 1706157979),
(121, '65b1e79b0da30', 6, 'Write a step-by-step guide on how to use {{ product/service }}.', 1, 1706157979, 1706157979),
(122, '65b1e79b0de42', 6, 'Share a personal story or experience related to {{ topic/product/service }}.', 1, 1706157979, 1706157979),
(123, '65b1e79b0e27d', 6, 'Compile a list of the top 10 {{ topic }} resources and share it on Pinterest.', 1, 1706157979, 1706157979),
(124, '65b1e79b0e6ab', 6, 'Write a how-to guide for a DIY project related to {{ topic/product/service }}.', 1, 1706157979, 1706157979),
(125, '65b1e79b0eaab', 6, 'Share a behind-the-scenes look at the creation of {{ product/service }}.', 1, 1706157979, 1706157979),
(126, '65b1e79b0ef72', 6, 'Write a Pinterest post sharing the benefits of {{ topic/product/service }}.', 1, 1706157979, 1706157979),
(127, '65b1e79b0f38f', 6, 'Create a Pinterest post debunking a myth about {{ topic/product/service }}.', 1, 1706157979, 1706157979),
(128, '65b1e79b0f78b', 6, 'Write a Pinterest post sharing the history and evolution of {{ product/service }}.', 1, 1706157979, 1706157979),
(129, '65b1e79b0fbd9', 6, 'Share a collection of inspiring quotes related to {{ topic }}.', 1, 1706157979, 1706157979),
(130, '65b1e79b0ffbe', 6, 'Write a Pinterest post featuring a list of fun and creative ways to use {{ product/service }}.', 1, 1706157979, 1706157979),
(131, '65b1e79b103a6', 6, 'Create a Pinterest post featuring a list of the top 10 trends related to {{ topic/product/service }} and how to incorporate them into daily life.', 1, 1706157979, 1706157979),
(132, '65b1e79b10829', 6, 'Write a Pinterest post featuring a list of surprising facts about {{ product/service }}.', 1, 1706157979, 1706157979),
(133, '65b1e79b10c3e', 6, 'Share a Pinterest post featuring a list of the top 10 influencers and thought leaders in {{ topic/product/service }} and why they\'re worth following.', 1, 1706157979, 1706157979),
(134, '65b1e79b11074', 6, 'Write a Pinterest post featuring a list of the top 10 mistakes to avoid when using {{ product/service }}.', 1, 1706157979, 1706157979),
(135, '65b1e79b1146e', 7, 'Write a post about {{ product or service }} to persuade {{ target audience }} to {{ action }}.', 1, 1706157979, 1706157979),
(136, '65b1e79b118da', 7, 'Generate an intriguing post about {{ topic/event/product/service }} that generates traffic for {{ website }}.', 1, 1706157979, 1706157979),
(137, '65b1e79b11ca9', 7, 'Create a celebratory post about {{ achievement }}.', 1, 1706157979, 1706157979),
(138, '65b1e79b12135', 7, 'Write a post about the benefits of supporting local businesses.', 1, 1706157979, 1706157979),
(139, '65b1e79b12550', 7, 'Share a customer success story or testimonial to highlight the value of {{ product/service }}.', 1, 1706157979, 1706157979),
(140, '65b1e79b12935', 7, 'Highlight a unique feature or aspect of {{ product/service }} and how it sets it apart from competitors.', 1, 1706157979, 1706157979),
(141, '65b1e79b12d77', 7, 'Write a post that provides helpful tips or advice related to {{ industry/niche }}.', 1, 1706157979, 1706157979),
(142, '65b1e79b131b2', 7, 'Create a caption for a video that offers a behind-the-scenes look at the process behind creating {{ product or service }}.', 1, 1706157979, 1706157979),
(143, '65b1e79b135b2', 7, 'Write a post that announces {{ event/product launch/company news }}.', 1, 1706157979, 1706157979),
(144, '65b1e79b13cf3', 7, 'Share a post that promotes {{ partnership/collaboration }}.', 1, 1706157979, 1706157979),
(145, '65b1e79b140db', 7, 'Create a social media post celebrating {{ award/recognition }}.', 1, 1706157979, 1706157979),
(146, '65b1e79b14589', 7, 'Share a post that discloses {{ discount/offer }}.', 1, 1706157979, 1706157979),
(147, '65b1e79b149ff', 7, 'Write a post that answers {{ common concern }} about {{ product or service }}.', 1, 1706157979, 1706157979),
(148, '65b1e79b14ee9', 8, 'Generate 10 TikTok post ideas about {{ topic }}.', 1, 1706157979, 1706157979),
(149, '65b1e79b15422', 8, 'Generate 10 TikTok post ideas for a {{ business type }}.', 1, 1706157979, 1706157979),
(150, '65b1e79b158a6', 8, 'Write a TikTok caption for a video about {{ topic }}.', 1, 1706157979, 1706157979),
(151, '65b1e79b15d3a', 8, 'Write a TikTok video script about {{ topic }}.', 1, 1706157979, 1706157979),
(152, '65b1e79b16185', 8, 'Give me 10 TikTok challenge ideas.', 1, 1706157979, 1706157979),
(153, '65b1e79b165b4', 8, 'Write a video description for a TikTok about {{ topic }}.', 1, 1706157979, 1706157979),
(154, '65b1e79b1697b', 8, 'Generate a list of hashtag ideas for a TikTok video about {{ topic }}.', 1, 1706157979, 1706157979),
(155, '65b1e79b16d67', 8, 'Write a funny joke for a TikTok video about {{ topic }}.', 1, 1706157979, 1706157979),
(156, '65b1e79b1714d', 8, 'Generate a captivating intro for a TikTok video about {{ topic }}.', 1, 1706157979, 1706157979),
(157, '65b1e79b17613', 9, 'Write some YouTube titles about {{ topic }}.', 1, 1706157979, 1706157979),
(158, '65b1e79b17a79', 9, 'Brainstorm unique YouTube video titles about {{ topic }}.', 1, 1706157979, 1706157979),
(159, '65b1e79b17f55', 9, 'Make a list of YouTube video ideas about {{ topic }} for {{ target audience }}.', 1, 1706157979, 1706157979),
(160, '65b1e79b1842e', 9, 'Write a video script outline for a video titled {{ video title }}.', 1, 1706157979, 1706157979),
(161, '65b1e79b18870', 9, 'Outline the structure of a YouTube video about {{ topic }}.', 1, 1706157979, 1706157979),
(162, '65b1e79b18cf3', 9, 'Generate a YouTube video script about {{ topic }} in {{ tone of voice }} for {{ target audience }}.', 1, 1706157979, 1706157979),
(163, '65b1e79b19193', 9, 'Write a video script intro for a video titled {{ video title }}.', 1, 1706157979, 1706157979),
(164, '65b1e79b19637', 9, 'Write a video script hook for a video titled {{ video title }}.', 1, 1706157979, 1706157979),
(165, '65b1e79b19af6', 9, 'Write a video description for the following video script:', 1, 1706157979, 1706157979),
(166, '65b1e79b1a048', 9, 'Write a conclusion for a YouTube video about {{ topic }}.', 1, 1706157979, 1706157979),
(167, '65b1e79b1a506', 9, 'Write a sponsored promo for a YouTube video about {{ product }}.', 1, 1706157979, 1706157979),
(168, '65b1e79b1a9a5', 9, 'Write a CTA for a YouTube video that gets the audience to subscribe to the channel.', 1, 1706157979, 1706157979),
(169, '65b1e79b1adb5', 9, 'Generate a YouTube video idea that showcases a behind-the-scenes look at my {{ company/brand }} and convinces my {{ ideal customer persona }} to take {{ desired action }} with authenticity and relatability.', 1, 1706157979, 1706157979),
(170, '65b1e79b1b1c5', 9, 'Create a YouTube video that presents a step-by-step guide on how to use my {{ product/service }} and convinces my {{ ideal customer persona }} to make a purchase with clear and compelling instructions.', 1, 1706157979, 1706157979),
(171, '65b1e79b1b5fe', 9, 'Develop a YouTube video idea that illustrates how my {{ product/service }} can solve the specific pain points and needs of my {{ ideal customer persona }} in a relatable and engaging manner.', 1, 1706157979, 1706157979),
(172, '65b1e79b1bb4b', 9, 'Produce a YouTube video that highlights the unique selling points of my {{ product/service }} and convinces my {{ ideal customer persona }} to make a purchase with a sense of urgency and exclusive offers.', 1, 1706157979, 1706157979),
(173, '65b1e79b1c081', 9, 'Produce a YouTube video that compares my {{ product/service }} to similar options on the market and convinces my {{ ideal customer persona }} to choose us with clear and compelling evidence.', 1, 1706157979, 1706157979),
(174, '65b1e79b1c518', 9, 'Create a YouTube video that draws in my {{ ideal customer persona }} with a relatable and authentic message, and persuades them to take {{ desired action }} with a strong call-to-action and compelling visuals.', 1, 1706157979, 1706157979),
(175, '65b1e79b1c9cd', 9, 'Develop a YouTube video idea that showcases the success stories of previous customers who have used my {{ product/service }} and convinces my {{ ideal customer persona }} to make a purchase.', 1, 1706157979, 1706157979),
(176, '65b1e79b1cf0f', 9, 'Generate a YouTube video idea that engages my {{ ideal customer persona }} with a unique and compelling perspective on {{ subject }} and persuades them to take {{ desired action }} on my {{ website/product }}.', 1, 1706157979, 1706157979),
(177, '65b1e79b1d3e0', 9, 'Create a YouTube video idea that provides valuable and relevant information to my {{ ideal customer persona }} about {{ subject }} and convinces them to take {{ desired action }} on my {{ website/product }}.', 1, 1706157979, 1706157979),
(178, '65b1e79b1d8ff', 9, 'Develop a YouTube video idea that overcomes objections and concerns my {{ ideal customer persona }} may have about my {{ product/service }} and convinces them to take {{ desired action }} with a sense of urgency.', 1, 1706157979, 1706157979),
(179, '65b1e79b1ddcf', 9, 'Create a YouTube video idea that showcases the value and benefits of your {{ product/service }} to persuade your {{ ideal customer persona }} to take {{ desired action }} with a strong offer and clear call-to-action.', 1, 1706157979, 1706157979),
(180, '65b1e79b1e2cd', 9, 'Come up with a fun and creative YouTube video idea that highlights the unique features and benefits of your {{ product/service }} to persuade your {{ ideal customer persona }} to make a purchase.', 1, 1706157979, 1706157979),
(181, '65b1e79b1e6ed', 9, 'Tell a unique and relatable story about your {{ product/service }} in a YouTube video to show how it has helped your {{ ideal customer persona }} achieve their {{ goal }}.', 1, 1706157979, 1706157979),
(182, '65b1e79b1eb14', 9, 'Develop a YouTube video idea that goes viral and persuades your {{ ideal customer persona }} to take {{ desired action }} on your {{ website/product }} with a strong call-to-action and compelling visuals.', 1, 1706157979, 1706157979),
(183, '65b1e79b1ef09', 9, 'Brainstorm a YouTube video idea that entertains and showcases your {{ product/service }} to your {{ ideal customer persona }} in a creative and engaging way.', 1, 1706157979, 1706157979),
(184, '65b1e79b1f376', 9, 'Craft a YouTube ad script that showcases the unique selling points of your {{ product/service }} and persuades your {{ ideal customer persona }} to make a purchase with a sense of urgency and exclusive offers.', 1, 1706157979, 1706157979),
(185, '65b1e79b1f724', 9, 'Write a YouTube ad script that draws in your {{ ideal customer persona }} with a relatable and authentic message, and then persuades them to take {{ desired action }} with a strong call-to-action and compelling visuals.', 1, 1706157979, 1706157979),
(186, '65b1e79b1fb30', 9, 'Develop a YouTube ad script that establishes trust and credibility with your {{ ideal customer persona }} by highlighting the successes and testimonials of previous customers who have used your {{ product/service }}.', 1, 1706157979, 1706157979),
(187, '65b1e79b1ff29', 9, 'Write a YouTube ad script that educates your {{ ideal customer persona }} on a specific {{ topic }} and persuades them to take {{ desired action }} on your {{ website/product }}.', 1, 1706157979, 1706157979),
(188, '65b1e79b20324', 9, 'Create a YouTube ad script that speaks directly to the needs and pain points of your {{ ideal customer persona }} and persuades them to take {{ desired action }} with a sense of urgency and a strong offer.', 1, 1706157979, 1706157979),
(189, '65b1e79b20734', 9, 'Write a YouTube ad script that delivers valuable and relevant information to your {{ ideal customer persona }}, and persuades them to take {{ desired action }} on your {{ website/product }}.', 1, 1706157979, 1706157979),
(190, '65b1e79b20bf6', 9, 'Craft a YouTube ad script that engages your {{ ideal customer persona }} with a unique and compelling perspective on {{ subject }}, and convinces them to take {{ desired action }} on your {{ website/product }}.', 1, 1706157979, 1706157979),
(191, '65b1e79b210c2', 9, 'Develop a YouTube ad script that addresses the pain points and needs of your {{ ideal customer persona }}, and demonstrates how your {{ product/service }} can solve their problems.', 1, 1706157979, 1706157979),
(192, '65b1e79b214d8', 9, 'Create a YouTube ad script that clearly explains the features and benefits of your {{ product/service }} to your {{ ideal customer persona }}, and convinces them to make a purchase with a sense of urgency.', 1, 1706157979, 1706157979),
(193, '65b1e79b218db', 9, 'Write a YouTube ad script that tells a relatable and engaging story about how your {{ product/service }} helped someone like your {{ ideal customer persona }} achieve their {{ goal }}.', 1, 1706157979, 1706157979),
(194, '65b1e79b21d8f', 9, 'Craft a YouTube ad script that showcases the value and benefits of your {{ product/service }} to your {{ ideal customer persona }}, and persuades them to take {{ desired action }} with a strong offer and clear call-to-action.', 1, 1706157979, 1706157979),
(195, '65b1e79b2225c', 9, 'Develop a YouTube ad script that overcomes objections and concerns your {{ ideal customer persona }} may have about your {{ product/service }}, and convinces them to take {{ desired action }} with a sense of urgency.', 1, 1706157979, 1706157979),
(196, '65b1e79b22674', 9, 'Create a YouTube ad script that captures the attention of your {{ ideal customer persona }} with a strong headline and hook, and then persuades them to take {{ desired action }} with persuasive language and compelling evidence.', 1, 1706157979, 1706157979),
(197, '65b1e79b22add', 9, 'Write a YouTube ad script that showcases the unique features and benefits of your {{ product/service }} to your {{ ideal customer persona }}, and persuades them to make a purchase with social proof and credibility-building elements.', 1, 1706157979, 1706157979),
(198, '65b1e79b22f8e', 9, 'Craft a YouTube ad script that introduces your {{ product/service }} to your {{ ideal customer persona }} and persuades them to take {{ desired action }} with a strong call-to-action and compelling visuals.', 1, 1706157979, 1706157979),
(199, '65b1e79b233fa', 10, 'Rewrite an improve the following content:', 1, 1706157979, 1706157979),
(200, '65b1e79b238c7', 10, 'Rewrite the following content from the point of view of a {{ individual/profession }}:', 1, 1706157979, 1706157979),
(201, '65b1e79b23d8c', 10, 'Rephrase the following content in a {{ adjective }} tone:', 1, 1706157979, 1706157979),
(202, '65b1e79b24239', 10, 'Rewrite the following content to explain it to a 5th grader:', 1, 1706157979, 1706157979),
(203, '65b1e79b24726', 10, 'Rephrase the following paragraph to make it more readable:', 1, 1706157979, 1706157979),
(204, '65b1e79b24c70', 10, 'Rewrite the following paragraph using sophisticated vocabulary:', 1, 1706157979, 1706157979),
(205, '65b1e79b250fa', 10, 'Rewrite the following list as a paragraph:', 1, 1706157979, 1706157979),
(206, '65b1e79b255c1', 10, 'Rewrite the following paragraph as a list:', 1, 1706157979, 1706157979),
(207, '65b1e79b25b27', 10, 'Create a social media post expanding on and explain {{ topic }} in more depth including the following keywords:', 1, 1706157979, 1706157979),
(208, '65b1e79b25faa', 10, 'Rewrite the following sentence using a different grammatical structure:', 1, 1706157979, 1706157979),
(209, '65b1e79b26396', 10, 'Rewrite the following paragraph in {{ genre }}: (e.g., poetic, journalistic, academic):', 1, 1706157979, 1706157979),
(210, '65b1e79b2680f', 10, 'Rewrite the following paragraph using active voice:', 1, 1706157979, 1706157979),
(211, '65b1e79b26d53', 10, 'Rewrite the following paragraph to include more sensory details:', 1, 1706157979, 1706157979),
(212, '65b1e79b271e9', 10, 'Rewrite the following sentence to eliminate redundancy:', 1, 1706157979, 1706157979),
(213, '65b1e79b276b6', 10, 'Rewrite the following paragraph using shorter sentences:', 1, 1706157979, 1706157979),
(214, '65b1e79b27b6b', 10, 'Rewrite the following paragraph to emphasize a different point:', 1, 1706157979, 1706157979),
(215, '65b1e79b27f49', 10, 'Rewrite the following paragraph using metaphorical language:', 1, 1706157979, 1706157979),
(216, '65b1e79b283fc', 10, 'Rewrite the following paragraph to address {{ audience }}:', 1, 1706157979, 1706157979),
(217, '65b1e79b2892b', 10, 'Rewrite the following paragraph using more precise language:', 1, 1706157979, 1706157979),
(218, '65b1e79b28e40', 10, 'Rewrite the following paragraph to highlight a different perspective:', 1, 1706157979, 1706157979),
(219, '65b1e79b292dd', 11, 'Improve the following social media post by making it more {{ adjective }}:', 1, 1706157979, 1706157979),
(220, '65b1e79b296d6', 11, 'Edit the following social media post and focus on {{ angle }}:', 1, 1706157979, 1706157979),
(221, '65b1e79b29ae8', 11, 'Edit the following social media post and make it look fresh:', 1, 1706157979, 1706157979),
(222, '65b1e79b29ec9', 11, 'Edit the following social media post to have a {{ adjective }} tone of voice:', 1, 1706157979, 1706157979),
(223, '65b1e79b2a27b', 11, 'Shorten the following social media post without losing its meaning:', 1, 1706157979, 1706157979),
(224, '65b1e79b2a684', 11, 'Add a call to action to the following social media post:', 1, 1706157979, 1706157979),
(225, '65b1e79b2aa6e', 11, 'Make the following social media post more engaging by adding a question or poll:', 1, 1706157979, 1706157979),
(226, '65b1e79b2ae54', 11, 'Adjust the following social media post\'s formatting to make it easier to read:', 1, 1706157979, 1706157979),
(227, '65b1e79b2b288', 11, 'Edit the following social media post to better target {{ specific audience }}:', 1, 1706157979, 1706157979),
(228, '65b1e79b2b698', 11, 'Add relevant hashtags to the following social media post to increase its visibility:', 1, 1706157979, 1706157979),
(229, '65b1e79b2ba81', 11, 'Remove any unnecessary information from the following social media post:', 1, 1706157979, 1706157979),
(230, '65b1e79b2be6c', 11, 'Incorporate a trending topic or current event into the following social media post:', 1, 1706157979, 1706157979),
(231, '65b1e79b2c292', 11, 'Add a personal touch to the following social media post to make it more relatable:', 1, 1706157979, 1706157979),
(232, '65b1e79b2c6e6', 11, 'Edit the following social media post to better align with {{ values }}:', 1, 1706157979, 1706157979),
(233, '65b1e79b2cac7', 11, 'Adjust the following social media post\'s length to fit {{ character limit }}:', 1, 1706157979, 1706157979),
(234, '65b1e79b2ce76', 11, 'Add emojis to the following social media post:', 1, 1706157979, 1706157979),
(235, '65b1e79b2d25f', 11, 'Make the following social media post more attention-grabbing by using a bold statement:', 1, 1706157979, 1706157979),
(236, '65b1e79b2d96b', 11, 'Turn the following social media post into a story:', 1, 1706157979, 1706157979),
(237, '65b1e79b2dd69', 12, 'Write the next sentence:', 1, 1706157979, 1706157979),
(238, '65b1e79b2e168', 12, 'Create a social media post expanding on the following idea:', 1, 1706157979, 1706157979),
(239, '65b1e79b2e56f', 12, 'Complete the following sentence:', 1, 1706157979, 1706157979),
(240, '65b1e79b2e96a', 12, 'Give a detailed breakdown of {{ topic }}.', 1, 1706157979, 1706157979),
(241, '65b1e79b2ed87', 12, 'Tell me more about {{ topic }} with a focus on {{ angle/subtopic }}.', 1, 1706157979, 1706157979),
(242, '65b1e79b2f183', 12, 'Tell me about the history of {{ topic }}.', 1, 1706157979, 1706157979),
(243, '65b1e79b2f5e6', 12, 'Write a social media post about the following facts:', 1, 1706157979, 1706157979),
(244, '65b1e79b2fa30', 12, 'Finish this paragraph: I’m excited to offer you my new {{ product name }} that can help you {{ benefit }}.', 1, 1706157979, 1706157979),
(245, '65b1e79b2fe4d', 12, 'Explain in a social media post the following idea and give specific examples to illustrate it:', 1, 1706157979, 1706157979),
(246, '65b1e79b3026d', 12, 'Create a social media post expanding on the implications of the following statement:', 1, 1706157979, 1706157979),
(247, '65b1e79b306af', 12, 'Create a social media post expanding on the following argument and provide counter-arguments to it:', 1, 1706157979, 1706157979),
(248, '65b1e79b30aaf', 12, 'Provide your thoughts on {{ topic }} and how it relates to {{ related topic }} in a social media post.', 1, 1706157979, 1706157979),
(249, '65b1e79b30ea2', 12, 'Create a social media post expanding on the importance of {{ concept/idea }}.', 1, 1706157979, 1706157979),
(250, '65b1e79b3128c', 12, 'Create a social media post expanding on the different approaches to solving {{ problem }}.', 1, 1706157979, 1706157979),
(251, '65b1e79b3167c', 12, 'Explain in a social media post the possible outcomes of {{ event/situation }}.', 1, 1706157979, 1706157979),
(252, '65b1e79b31a80', 12, 'Create a social media post expanding on the following quote and how it relates to {{ topic }}:', 1, 1706157979, 1706157979),
(253, '65b1e79b31e73', 12, 'Create a social media post expanding on the following statement and provide evidence to support it:', 1, 1706157979, 1706157979),
(254, '65b1e79b32252', 12, 'Explain in a social media post the relevance of {{ topic }} in today\'s society.', 1, 1706157979, 1706157979),
(255, '65b1e79b32648', 12, 'Explain in a social media post the different theories related to {{ concept/idea }}.', 1, 1706157979, 1706157979),
(256, '65b1e79b32a28', 12, 'Create a social media post expanding on the following analogy and how it applies to {{ topic }}:', 1, 1706157979, 1706157979),
(257, '65b1e79b32e0b', 12, 'Create a social media post expanding on the impact of {{ event/development }} on {{ field/industry }}.', 1, 1706157979, 1706157979),
(258, '65b1e79b3322c', 12, 'Create a social media post expanding on the following statistic and what it tells us about {{ topic }}:', 1, 1706157979, 1706157979),
(259, '65b1e79b33674', 12, 'Create a social media post expanding on the {{ trend }} and how it may evolve in the future.', 1, 1706157979, 1706157979),
(260, '65b1e79b33aa0', 12, 'Create a social media post expanding on the factors that contribute to {{ problem/success }}.', 1, 1706157979, 1706157979),
(261, '65b1e79b33e99', 12, 'Create a social media post expanding on the following misconception and provide clarifications:', 1, 1706157979, 1706157979),
(262, '65b1e79b3428c', 12, 'Create a social media post expanding on the ethical implications of {{ action/decision }}.', 1, 1706157979, 1706157979),
(263, '65b1e79b34676', 12, 'Create a social media post expanding on the importance of considering {{ factor }} when {{ task/action }}.', 1, 1706157979, 1706157979),
(264, '65b1e79b34a6b', 12, 'Create a social media post expanding on the different uses of {{ tool/application }}.', 1, 1706157979, 1706157979),
(265, '65b1e79b34e72', 12, 'Create a social media post expanding on the following claim and provide counterarguments:', 1, 1706157979, 1706157979),
(266, '65b1e79b35281', 12, 'Create a social media post expanding on the different factors that influence {{ consumer/employee behavior }}.', 1, 1706157979, 1706157979),
(267, '65b1e79b3568b', 12, 'Create a social media post expanding on the impact of {{ profession/industry }} in our society.', 1, 1706157979, 1706157979),
(268, '65b1e79b35a68', 12, 'Create a social media post expanding on the different perspectives on {{ philosophical concept/idea }}.', 1, 1706157979, 1706157979),
(269, '65b1e79b35e91', 12, 'Create a social media post expanding on the {{ trend }} and how it relates to {{ certain cultural/social/political values }}.', 1, 1706157979, 1706157979),
(270, '65b1e79b362d1', 12, 'Create a social media post expanding on the different aspects of {{ topic }} that are often overlooked.', 1, 1706157979, 1706157979),
(271, '65b1e79b366d7', 12, 'Create a social media post expanding on the following recommendation and its implementation challenges:', 1, 1706157979, 1706157979),
(272, '65b1e79b36aba', 13, 'Summarize the following content and turn it into a social media post:', 1, 1706157979, 1706157979),
(273, '65b1e79b36eaa', 13, 'Simplify the following paragraph:', 1, 1706157979, 1706157979),
(274, '65b1e79b372c3', 13, 'Summarize the following paragraph in one sentence:', 1, 1706157979, 1706157979),
(275, '65b1e79b376c7', 13, 'Summarize the main points of the following content:', 1, 1706157979, 1706157979),
(276, '65b1e79b37aaa', 13, 'Create a social media post that captures the essence of the following message:', 1, 1706157979, 1706157979),
(277, '65b1e79b37e9f', 13, 'Condense the following text into a shorter version while retaining the main points:', 1, 1706157979, 1706157979),
(278, '65b1e79b38275', 13, 'Write a brief summary of the following text:', 1, 1706157979, 1706157979),
(279, '65b1e79b38733', 13, 'Use an analogy or metaphor to explain the following concept in simpler terms:', 1, 1706157979, 1706157979),
(280, '65b1e79b38bd5', 13, 'Rewrite the following sentence using simpler language:', 1, 1706157979, 1706157979),
(281, '65b1e79b39069', 13, 'Break down the steps or components of the following process:', 1, 1706157979, 1706157979),
(282, '65b1e79b39507', 13, 'Summarize the following research study in three key takeaways:', 1, 1706157979, 1706157979),
(283, '65b1e79b3991d', 13, 'Simplify the following jargon-heavy text for a {{ target audience }}:', 1, 1706157979, 1706157979),
(284, '65b1e79b39dc9', 13, 'Simplify the following technical process into step-by-step instructions:', 1, 1706157979, 1706157979),
(285, '65b1e79b3a300', 13, 'Simplify the following marketing pitch for {{ audience }}:', 1, 1706157979, 1706157979),
(286, '65b1e79b3a7b6', 13, 'Simplify the following text into practical tips:', 1, 1706157979, 1706157979),
(287, '65b1e79b3abc4', 13, 'Simplify the following text into a catchy slogan:', 1, 1706157979, 1706157979),
(288, '65b1e79b3b08e', 14, 'Encourage {{ ideal customer persona }} to try {{ product/service }} using the \"Reciprocity Bias\" framework. However, avoid explicitly mentioning the \"Reciprocity Bias\" framework in the content itself. Offer an appealing reward or prize for a favor or action to create a sense of obligation.', 1, 1706157979, 1706157979),
(289, '65b1e79b3b4b4', 14, 'Use the \"Confirmation Bias\" framework to appeal to {{ ideal customer persona }}\'s preexisting beliefs about {{ subject }}. However, avoid explicitly mentioning the \"Confirmation Bias\" framework in the content itself. Present information that aligns with their values and supports their views, and encourage them to take action and try our {{ product/service }}.', 1, 1706157979, 1706157979),
(290, '65b1e79b3b8d3', 14, 'Highlight the successes achievable with our {{ product/service }} and downplay potential negative misconceptions using the \"Positive Framing\" framework. However, avoid explicitly mentioning the \"Positive Framing\" framework in the content itself. Explain how our product can help {{ ideal customer persona }} reach their goal of {{ desired outcome }}.', 1, 1706157979, 1706157979),
(291, '65b1e79b3bce5', 14, 'Use the \"Social Comparison\" theory to showcase the successes of others who have used our {{ product/service }}. However, avoid explicitly mentioning the \"Social Comparison\" theory in the content itself. Highlight how it can help {{ ideal customer persona }} achieve similar results.', 1, 1706157979, 1706157979),
(292, '65b1e79b3c1b1', 14, 'Showcase the successes and benefits of our {{ product/service }} for {{ ideal customer persona }} using the \"Social Learning\" theory and motivate potential customers to learn from our customers\' positive experiences. However, avoid explicitly mentioning the \"Social Learning\" theory framework in the content itself. Describe positive outcomes others have experienced and offer incentives for new prospects to try it themselves. The goal of this post is to motivate.', 1, 1706157979, 1706157979),
(293, '65b1e79b3c720', 14, 'Using the \"Self-Efficacy\" theory, please write a social media post that builds confidence in {{ ideal customer persona }} and helps them feel capable of achieving their goals with our {{ product/service }}. However, avoid explicitly mentioning the \"Self-Efficacy\" theory in the content itself. Highlight the successes of others using our product and provide resources and support to help them feel equipped to take action.', 1, 1706157979, 1706157979),
(294, '65b1e79b3cbb8', 14, 'Write a social media post using the \"Emotional Appeals\" advertising strategy to make {{ ideal customer persona }} associate {{ product/service }} with positive experiences and emotions. However, avoid explicitly mentioning the \"Emotional Appeals\" advertising strategy in the content itself. Just use the framework to make the {{ product/service }} more emotionally appealing.', 1, 1706157979, 1706157979),
(295, '65b1e79b3d039', 14, 'Write a social media post that highlights the benefits and value of using {{ product/service }} for {{ ideal customer persona }}. Use the \"That\'s-Not-All\" effect to start with a benefit and follow up with a larger benefit without explicitly mentioning the effect itself. Make sure to emphasize how these tools can help {{ ideal customer persona }} achieve their goals. End the post by encouraging {{ ideal customer persona }} to try out {{ product/service }}.', 1, 1706157979, 1706157979),
(296, '65b1e79b3d442', 14, 'Write a social media post using the \"Sunk Cost Fallacy\" framework to persuade {{ ideal customer persona }} to continue using {{ product/service }}. However, avoid explicitly mentioning the \"Sunk Cost Fallacy\" framework in the content itself. Highlight how the resources invested will increase their ROI. Emphasize the potential losses and regrets of not using {{ product/service }}.', 1, 1706157979, 1706157979),
(297, '65b1e79b3d856', 14, 'Create a social media post using the \"Scarcity Principle\" to create a sense of urgency and desire for our {{ product/service }} among {{ ideal customer persona }}. However, avoid explicitly mentioning the \"Scarcity Principle\" in the content itself. Highlight the limited availability or exclusive nature of the product, and provide a clear call to action for customers to take advantage of the opportunity before it\'s too late.', 1, 1706157979, 1706157979),
(298, '65b1e79b3dc6b', 14, 'Write a social media post using the \"Loss Aversion\" framework to motivate {{ ideal customer persona }} to start using a {{ product/service }} out of fear of missing out on the benefits it can offer. However, avoid explicitly mentioning the \"Loss Aversion\" framework in the content itself.', 1, 1706157979, 1706157979),
(299, '65b1e79b3e0cd', 14, 'Create a social media post using the \"FOMO\" framework and an appealing limited promotion to create a sense of urgency for {{ ideal customer persona }} to purchase {{ product/service }}. However, avoid explicitly mentioning the \"FOMO\" framework in the content itself.', 1, 1706157979, 1706157979);
INSERT INTO `sp_ai_prompt_templates` (`id`, `ids`, `pid`, `content`, `status`, `changed`, `created`) VALUES
(300, '65b1e79b3e49a', 14, 'Write a social media post using the \"Framing Effect\" framework to present information about our {{ product/service }} in a way that influences the perception and decision-making of {{ ideal customer persona }}. However, avoid explicitly mentioning the \"Framing Effect\" framework in the content itself. Consider the different frames that could be used (e.g. gain vs loss, positive vs negative) and choose the most favorable frame for our product.', 1, 1706157979, 1706157979),
(301, '65b1e79b3e8a0', 14, 'Create a social media post using the \"Classical Conditioning\" framework to associate our {{ product/service }} with positive outcomes. However, avoid explicitly mentioning the \"Classical Conditioning\" framework in the content itself.', 1, 1706157979, 1706157979),
(302, '65b1e79b3ed61', 14, 'Write a social media post using the \"Halo Effect\" framework to attribute positive qualities to {{ product/service }} based on {{ positive trait or characteristic }}. However, avoid explicitly mentioning the \"Halo Effect\" framework in the content itself.', 1, 1706157979, 1706157979),
(303, '65b1e79b3f25c', 14, 'Create a social media post for {{ customer segment }} that addresses three potential concerns they may have about using {{ product/service }} using the \"Cognitive Dissonance Theory\" framework. However, avoid explicitly mentioning the \"Cognitive Dissonance Theory\" in the content itself. Instead, incorporate the theory\'s principles naturally into the content by providing logical arguments that alleviate their conflicting beliefs. The aim of the post is to alleviate their doubts and encourage them to try {{ product/service }} from {{ company name }}. The post should highlight how {{ product/service }} can help {{ customer segment }} overcome their challenges, and include testimonials and success stories of other satisfied users of the product.', 1, 1706157979, 1706157979),
(304, '65b1e79b3f65c', 14, 'Appeal to the identity of {{ ideal customer persona }} using the \"Social Identity\" theory. However, avoid explicitly mentioning the \"Social Identity\" theory in the content itself. Highlight how our {{ product/service }} aligns with their social identity and values, and include testimonials and examples of others in their social group using the product successfully to create a sense of belonging and positivity.', 1, 1706157979, 1706157979),
(305, '65b1e79b3fa71', 14, 'Using Maslow\'s Hierarchy of Needs, speak to the current need of {{ ideal customer persona }} in a social media post. However, avoid explicitly mentioning Maslow\'s Hierarchy of Needs in the content itself. Highlight how our {{ product/service }} can help them meet this need. Use language that resonates with their current challenges and goals.', 1, 1706157979, 1706157979),
(306, '65b1e79b3fe6d', 14, 'Create a social media post encouraging {{ ideal customer persona }} to try {{ product/service }} using the \"Anchoring Bias\" framework. However, avoid explicitly mentioning the \"Anchoring Bias\" framework in the content itself. Highlight a high-value feature or benefit of your product and anchor it to a lower price point or other perceived value. Offer a limited-time discount or bonus to create a sense of urgency and encourage purchase.', 1, 1706157979, 1706157979),
(307, '65b1e79b405bd', 14, 'Create a social media post encouraging {{ ideal customer persona }} to try {{ product/service }} using the \"Foot-in-the-Door\" technique. However, avoid explicitly mentioning the \"Foot-in-the-Door\" technique in the content itself. Start with a small request, such as signing up for a free trial or providing an email address, and follow up with a larger request, such as upgrading to a paid plan or making a purchase. The initial small action creates a sense of commitment and increases the likelihood of follow-up action.', 1, 1706157979, 1706157979),
(308, '65b1e79b409df', 14, 'Create a social media post highlighting the scarcity of {{ product/service }} using the \"Limited Quantity\" framework. However, avoid explicitly mentioning the \"Limited Quantity\" framework in the content itself. Create a social media post that emphasizes the limited quantity or availability of {{ product/service }}. Use phrases like \"limited time offer\" or \"while supplies last\" to create a sense of urgency and encourage purchase.', 1, 1706157979, 1706157979),
(309, '65b1e79b40e40', 14, 'Create a social media post encouraging {{ ideal customer persona }} to try {{ product/service }} using the \"Authority Bias\" framework. However, avoid explicitly mentioning the \"Authority Bias\" framework in the content itself. Feature an expert or authority figure in your industry endorsing your product or service. Use phrases like \"recommended by\" or \"approved by\" to create trust and credibility.', 1, 1706157979, 1706157979),
(310, '65b1e79b412e6', 14, 'Create a social media post using the \"Primacy Effect\" to promote {{ product/service }} and make a strong first impression on {{ ideal customer persona }}. However, avoid explicitly mentioning the \"Primacy Effect\" in the content itself. Feature the most compelling or attention-grabbing message first.', 1, 1706157979, 1706157979),
(311, '65b1e79b416d0', 14, 'Create a social media post using the \"Humor Effect\" to make {{ ideal customer persona }} more receptive to promotional messaging about {{ product/service }}. However, avoid explicitly mentioning the \"Humor Effect\" in the content itself. Feature humorous or entertaining content related to {{ product/service }} to make the content more memorable.', 1, 1706157979, 1706157979),
(312, '65b1e79b41b93', 14, 'Create a social media post encouraging {{ ideal customer persona }} to try {{ product/service }} using the \"Von Restorff Effect\". However, avoid explicitly mentioning the \"Von Restorff Effect\" in the content itself. Feature a unique or unusual aspect of {{ product/service }} to make it stand out from competitors and make it more memorable to potential customers.', 1, 1706157979, 1706157979),
(313, '65b1e79b420c9', 14, 'Create a social media post using the \"Information Gap\" theory to pique the interest of {{ ideal customer persona }}. However, avoid explicitly mentioning the \"Information Gap\" theory in the content itself. Hint at something interesting related to {{ product/service }}, but with the full information or details only revealed after taking an action, such as signing up for a newsletter.', 1, 1706157979, 1706157979),
(314, '65b1e79b42640', 14, 'Create a social media post using the \"Decoy Effect\" framework to influence {{ideal customer persona}}\'s decision-making in purchasing a {{ product/service }}. However, avoid explicitly mentioning the \"Decoy Effect\" framework in the content itself. Offer different options of our {{ product/service/subscriptions }} and highlight {{ specific product/service/subscriptions }} as the most desirable one.', 1, 1706157979, 1706157979),
(315, '65b1e79b42b38', 14, 'Create a social media post using the \"Curse of Knowledge\" framework to explain our {{ product/service }} in a way that\'s easy for {{ ideal customer persona }} to understand. However, avoid explicitly mentioning the \"Curse of Knowledge\" framework in the content itself. Avoid using industry jargon or technical terms, and instead, use simple language to highlight the benefits.', 1, 1706157979, 1706157979),
(316, '65b1e79b4305d', 14, 'Write a social media post using the \"Curiosity Gap\" framework to make {{ ideal customer persona }} intrigued and interested in our {{ product/service }}. However, avoid explicitly mentioning the \"Curiosity Gap\" framework in the content itself. Pose a question or a mystery that our {{ product/service }} can solve, creating a desire for them to learn more.', 1, 1706157979, 1706157979),
(317, '65b1e79b43582', 15, 'Write an AIDA for the following content: (Attention, Interest, Desire, Action)', 1, 1706157979, 1706157979),
(318, '65b1e79b43967', 15, 'Write a BAB about the following content: (Before, After, Bridge)', 1, 1706157979, 1706157979),
(319, '65b1e79b43d9d', 15, 'Write a PAS for the following content: (Problem, Agitate, Solve) Write an AIDA for the following content. (Attention, Interest, Desire, Action)', 1, 1706157979, 1706157979),
(320, '65b1e79b44287', 15, 'Write a PASTOR for the following content: (Problem, Amplify, Story, Transformation, Offer)', 1, 1706157979, 1706157979),
(321, '65b1e79b447fb', 15, 'Write an APP for the following content: (Agree, Promise, Preview) Write a FAB for the following content. (Features, Advantages, Benefits)', 1, 1706157979, 1706157979),
(322, '65b1e79b44cd5', 15, 'Write a FEBA for the following content: (Features, Evidence, Benefits, Action)', 1, 1706157979, 1706157979),
(323, '65b1e79b45219', 15, 'Write a PPPP for the following content: (Picture, Promise, Prove, Push)', 1, 1706157979, 1706157979),
(324, '65b1e79b4574b', 15, 'Write a SLAP for the following content: (Stop, Look, Act, Proceed)', 1, 1706157979, 1706157979),
(325, '65b1e79b45be8', 15, 'Write a SCQA for the following content: (Situation, Complication, Question, Answer)', 1, 1706157979, 1706157979),
(326, '65b1e79b46118', 15, 'Write a CLAP for the following content: (Credibility, Logic, Appeal, Push)', 1, 1706157979, 1706157979),
(327, '65b1e79b46553', 15, 'Using the \'Situation-Complication-Resolution\' framework, write a social media prompt that presents a {{ situation }} faced by {{ ideal customer persona }}. Discuss the {{ complication }} that arises from the situation and ask the reader to share how our {{ product/service }} could be the {{ resolution }} to the problem. Finally, end with a call to action that encourages the reader to learn more about our solution.', 1, 1706157979, 1706157979),
(328, '65b1e79b469e8', 15, 'Using the \'Emotional Value Proposition\' framework, write a social media prompt that speaks to the {{ emotional needs }} of {{ ideal customer persona }}. Ask the reader to share their personal experiences with those emotions, identify the {{ desired emotion }}, create a {{ story }} that evokes that emotion, and ask the reader to share how our {{ product/service }} helped fulfill those emotional needs.', 1, 1706157979, 1706157979),
(329, '65b1e79b46f0b', 15, 'Write a social media prompt using the \'Customer Journey Map\' framework that visualizes the journey from {{ awareness }} to {{ conversion }} for {{ ideal customer persona }}. Ask the reader to share their pain points at each stage, highlight how our {{ product/service }} can be a solution to those issues, and ask the reader to share how they would use our product to {{ improve their situation }}.', 1, 1706157979, 1706157979),
(330, '65b1e79b473e5', 15, 'Using the \'Marketing Funnel\' framework, write a social media prompt that targets {{ awareness/consideration/conversion }} stage of the customer journey and aligns with the goals of each stage. Highlight the {{ features }} of our {{ product/service }} and ask the reader to share how it can {{ solve a problem }} or {{ achieve a goal }} for {{ ideal customer persona }}.', 1, 1706157979, 1706157979),
(331, '65b1e79b477e9', 15, 'Write a social media prompt using the \'Empathy Map\' framework to understand the thoughts, feelings, and needs of {{ ideal customer persona }}. Ask the reader to share their pain points and how our {{ product/service }} could address their {{ thoughts/feelings/needs }}. Highlight how our product can help improve their situation and ask the reader to share how they would use it in their daily lives.', 1, 1706157979, 1706157979),
(332, '65b1e79b47cc0', 15, 'Using the \'Product-Market Fit\' framework, explain how our {{ product/service }} perfectly fits the needs and pain points of {{ ideal customer persona }}. Identify the specific problems faced by the target market and create social media prompts that explain how our product addresses these issues. Use evidence or testimonials to back up our claims and emphasize the benefits of using our product.', 1, 1706157979, 1706157979),
(333, '65b1e79b481e3', 15, 'Using the \'Myth-Busting\' framework, identify and debunk common misconceptions or myths about our {{ product/service }}. Provide {{ facts }} and {{ evidence }} to support your claims and help educate {{ ideal customer persona }} about the true benefits of our product/service.', 1, 1706157979, 1706157979),
(334, '65b1e79b4870b', 15, 'Write a social media prompt using the \'Storytelling\' framework to create a short narrative around our {{ product/service }}. Use characters, plot, and setting to engage {{ ideal customer persona }} and build emotional connections. Ask the reader to share their own experience with our product/service and how it fits into their own story.', 1, 1706157979, 1706157979),
(335, '65b1e79b48b3c', 15, 'Write a social media prompt using the \'Question-Answer\' framework to start with a {{ question }} relevant to {{ ideal customer persona }}. Provide a brief and informative answer and ask the reader to share their own thoughts on the topic and how our product/service could help them address the question.', 1, 1706157979, 1706157979),
(336, '65b1e79b48ff0', 15, 'Using the \'Compare-Contrast\' framework, write a social media prompt that compares and contrasts two or more options or ideas to help {{ ideal customer persona }} make an informed decision. Ask the reader to share their own opinions on the options presented and how our product/service could help them make a decision.Using the \'Compare-Contrast\' framework, write a social media prompt that compares and contrasts two or more options or ideas to help {{ ideal customer persona }} make an informed decision. Ask the reader to share their own opinions on the options presented and how our product/service could help them make a decision.', 1, 1706157979, 1706157979),
(337, '65b1e79b494aa', 15, 'Use the \'How-To\' framework to provide step-by-step instructions for completing {{ task }} or achieving {{ goal }} for {{ ideal customer persona }}. Encourage readers to share their experiences of completing the task or achieving the goal, and how our product/service has helped them along the way.', 1, 1706157979, 1706157979),
(338, '65b1e79b499ae', 15, 'Identify a problem that {{ ideal customer persona }} faces and offer a solution through our {{ product/service }} using the \'Problem-Solution\' framework. Clearly explain how our product can solve their problem and improve their situation.', 1, 1706157979, 1706157979),
(339, '65b1e79b49eb9', 15, 'Make your social media post more effective and memorable by using the \'Rule of One\' framework to focus on {{ message }}.', 1, 1706157979, 1706157979),
(340, '65b1e79b4a337', 15, 'Use the Inverted Pyramid framework to create a social media post that begins with {{ information }} and then moves on to {{ secondary information }}, allowing readers to quickly grasp the main points.', 1, 1706157979, 1706157979),
(341, '65b1e79b4a7d2', 16, 'Make promotional social media post for a {{ product/service }}.', 1, 1706157979, 1706157979),
(342, '65b1e79b4ad18', 16, 'Write a social media announcement about {{ product/change/launch }}.', 1, 1706157979, 1706157979),
(343, '65b1e79b4b24b', 16, 'Write a social media post that generates leads for {{ product/service }}.', 1, 1706157979, 1706157979),
(344, '65b1e79b4b751', 16, 'Write a social media post that drives traffic to {{ website }}.', 1, 1706157979, 1706157979),
(345, '65b1e79b4bca4', 16, 'Write a social media post promoting {{ discount/voucher/promotion }}.', 1, 1706157979, 1706157979),
(346, '65b1e79b4c0d7', 16, 'Create a promotional social media post for an article about {{ topic }}.', 1, 1706157979, 1706157979),
(347, '65b1e79b4c4a0', 16, 'Write a social media post promoting a {{ type of event + date }}.', 1, 1706157979, 1706157979),
(348, '65b1e79b4c8ab', 16, 'Write a social media post about {{ product/service }} and include {{ client pain points }}.', 1, 1706157979, 1706157979),
(349, '65b1e79b4ccce', 16, 'Describe the impact of using {{ product/feature }} as a {{ profession/business }}.', 1, 1706157979, 1706157979),
(350, '65b1e79b4d0ee', 16, 'Write 10 engaging hooks ideas for a social media post about {{ topic }}.', 1, 1706157979, 1706157979),
(351, '65b1e79b4d4c3', 16, 'Craft a social media post for {{ product/service }} that addresses positive customer emotions.', 1, 1706157979, 1706157979),
(352, '65b1e79b4d8a4', 16, 'Finish this paragraph: We are launching {{ product name }} to help you {{ benefit }}.', 1, 1706157979, 1706157979),
(353, '65b1e79b4dcea', 16, 'Finish this paragraph: We are launching {{ product name }} to help you {{ benefit }}.', 1, 1706157979, 1706157979),
(354, '65b1e79b4e0b1', 16, 'Create a post highlighting the unique features of {{ product }}.', 1, 1706157979, 1706157979),
(355, '65b1e79b4e49c', 16, 'Make a post showcasing the benefits of using {{ product name }} for {{ problem }}.', 1, 1706157979, 1706157979),
(356, '65b1e79b4e8c5', 16, 'Develop a post promoting a limited-time sale or discount for {{ product name }}.', 1, 1706157979, 1706157979),
(357, '65b1e79b4ed71', 16, 'Create a post to encourage customers to leave a review for {{ product name }}.', 1, 1706157979, 1706157979),
(358, '65b1e79b4f145', 16, 'Generate a post to create a sense of urgency for buying {{ product name }}.', 1, 1706157979, 1706157979),
(359, '65b1e79b4f5c9', 16, 'Create a social media post that compares {{ product name }} with a similar product on the market.', 1, 1706157979, 1706157979),
(360, '65b1e79b4f9ed', 16, 'Develop a social media post that features customer testimonials for {{ product name }}.', 1, 1706157979, 1706157979),
(361, '65b1e79b4fdfc', 16, 'Make a social media post that demonstrates how {{ product name }} can be used in real-life situations.', 1, 1706157979, 1706157979),
(362, '65b1e79b5021c', 16, 'Create a social media post that targets {{ specific audience }} and explains how {{ product name }} can help them.', 1, 1706157979, 1706157979),
(363, '65b1e79b50627', 16, 'Paint a picture of the customer’s life after using {{ product/feature }}.', 1, 1706157979, 1706157979),
(364, '65b1e79b50aeb', 16, 'List customer objections to buying {{ product/service }}.', 1, 1706157979, 1706157979),
(365, '65b1e79b50fad', 16, 'Make a list of benefits for {{ product/service }}.', 1, 1706157979, 1706157979),
(366, '65b1e79b514f7', 16, 'Write a review of {{ product }} using the following information:', 1, 1706157979, 1706157979),
(367, '65b1e79b51eed', 16, 'Write a paragraph about the features of {{ product/service }}.', 1, 1706157979, 1706157979),
(368, '65b1e79b5242f', 16, 'Write a paragraph describing {{ product name }} using the following ideas:', 1, 1706157979, 1706157979),
(369, '65b1e79b52950', 16, 'Make a social media post listing the benefits of {{ product/service }} for {{ customer type }}.', 1, 1706157979, 1706157979),
(370, '65b1e79b52e4e', 16, 'Create a how-to post that explains the steps for using {{ product/service }} to achieve {{ specific goal or outcome }}.', 1, 1706157979, 1706157979),
(371, '65b1e79b53247', 16, 'Generate a social media post that breaks down {{ topic }} into easy-to-understand steps.', 1, 1706157979, 1706157979),
(372, '65b1e79b536ec', 16, 'Generate a social media post that provides guidance and support for users facing {{ issue }} with {{ product }}.', 1, 1706157979, 1706157979),
(373, '65b1e79b53af5', 16, 'Create a how-to post that explains the benefits and advantages of using {{ product/service }} over alternative solutions.', 1, 1706157979, 1706157979),
(374, '65b1e79b54f99', 16, 'Write a how-to post that provides a step-by-step guide for troubleshooting {{ error }} related to {{ product/service }}.', 1, 1706157979, 1706157979),
(375, '65b1e79b55522', 16, 'Create a how-to post that showcases the versatility and adaptability of {{ product/service }} for different use cases and scenarios.', 1, 1706157979, 1706157979),
(376, '65b1e79b559e9', 16, 'Generate a how-to post that offers advice and guidance on using {{ product/service }} to improve productivity or efficiency.', 1, 1706157979, 1706157979),
(377, '65b1e79b55e57', 16, 'Create a how-to post that explains the differences and nuances between different versions or editions of {{ product/service }}.', 1, 1706157979, 1706157979),
(378, '65b1e79b5636b', 16, 'Generate a post that showcases the customization and personalization options available for {{ product }}.', 1, 1706157979, 1706157979),
(379, '65b1e79b568db', 16, 'Create a how-to post that provides a step-by-step guide for setting up or installing {{ product/service }}.', 1, 1706157979, 1706157979),
(380, '65b1e79b56e10', 16, 'Write a how-to post that showcases the affordability and value of using {{ product/service }} compared to other solutions.', 1, 1706157979, 1706157979),
(381, '65b1e79b572c1', 16, 'Target {{ ideal customer persona }} with valuable {{ specific type of content }} who can encourage them to {{ desired action }}.', 1, 1706157979, 1706157979),
(382, '65b1e79b57822', 16, 'Use the social proof and credibility of {{ influencer type }} to persuade {{ ideal customer persona }} to try {{ product/service }} and share their positive experience with their followers.', 1, 1706157979, 1706157979),
(383, '65b1e79b57c40', 16, 'Showcase the unique features and benefits of {{ product/service }} in a fun and creative way with {{ specific type of content }} from {{ influencer type }}.', 1, 1706157979, 1706157979),
(384, '65b1e79b580e6', 16, 'Engage {{ ideal customer persona }} with relatable {{ influencer type }} and persuade them to take {{ desired action }} on your {{ product/service }}.', 1, 1706157979, 1706157979),
(385, '65b1e79b58588', 16, 'Create a sense of urgency and FOMO for {{ ideal customer persona }} with {{ influencer type }} sharing exclusive deals and promotions for {{ product/service }}.', 1, 1706157979, 1706157979),
(386, '65b1e79b589d8', 16, 'Create a how-to post that explains the process for upgrading or downgrading {{ product/service }} subscription or plan.', 1, 1706157979, 1706157979),
(387, '65b1e79b58db6', 17, 'Generate a social media ad copy that highlights {{ discount/promotion }}. Use phrases that create a sense of urgency to encourage customers to shop now.', 1, 1706157979, 1706157979),
(388, '65b1e79b5920d', 17, 'Write a social media ad that introduces {{ new product/service }} to customers. Use language that emphasizes the product\'s unique features and benefits and create excitement around the launch.', 1, 1706157979, 1706157979),
(389, '65b1e79b596c1', 17, 'Create a social media ad that generates leads for {{ product/service }}. Use language that targets {{ ideal customer }}, and highlight the benefits that {{ product/service }} offers.', 1, 1706157979, 1706157979),
(390, '65b1e79b59bb4', 17, 'Write a social media ad that drives traffic to {{ website }}. Use language that creates curiosity and encourages customers to click through to learn more.', 1, 1706157979, 1706157979),
(391, '65b1e79b5a0fa', 17, 'Write a social media ad that addresses {{ customer pain point}} and promotes a solution in the form {{ product/service }}. Use language that empathizes with your customer\'s needs and positions your product or service as the solution they\'ve been looking for.', 1, 1706157979, 1706157979),
(392, '65b1e79b5a648', 17, 'Create a social media ad that highlights the impact of using {{ product/service }} in {{ profession }}. Use language that emphasizes the benefits and how the product or feature can help.', 1, 1706157979, 1706157979),
(393, '65b1e79b5ab7f', 17, 'Create a social media ad from the following product/service description:', 1, 1706157979, 1706157979),
(394, '65b1e79b5b0ca', 17, 'Generate a social media ad copy that promotes {{ limited-time offer }}. Use language that creates a sense of urgency and encourages customers to act fast.', 1, 1706157979, 1706157979),
(395, '65b1e79b5b52a', 17, 'Write an ad copy that will attract my {{ ideal customer persona }} and encourage them to purchase my {{ product/service }}, thereby boosting traffic and sales.', 1, 1706157979, 1706157979),
(396, '65b1e79b5b926', 17, 'Create an ad copy that generates a sense of urgency and FOMO among my {{ ideal customer persona }} by highlighting exclusive deals and promotions for my {{ product/service }}.', 1, 1706157979, 1706157979),
(397, '65b1e79b5bd19', 17, 'Generate an ad copy that leverages the authenticity and relatability of my {{ brand/company }} to connect with my {{ ideal customer persona }} and persuade them to take {{ desired action }} on my {{ product/service }}.', 1, 1706157979, 1706157979),
(398, '65b1e79b5c11b', 17, 'Create an ad copy that capitalizes on the social proof and credibility of my {{ brand/company }} to convince my {{ ideal customer persona }} to try my {{ product/service }} and share their positive experience with their followers.', 1, 1706157979, 1706157979),
(399, '65b1e79b5c4ff', 17, 'Write an ad copy that highlights the authority and expertise of my {{ brand/company }} to educate my {{ ideal customer persona }} on the benefits of my {{ product/service }} and persuade them to make a purchase.', 1, 1706157979, 1706157979),
(400, '65b1e79b5c928', 17, 'Generate an ad copy that offers a sneak peek of upcoming products or services to generate a sense of anticipation and excitement among my {{ ideal customer persona }}. The ad copy should also feature a clear and compelling call-to-action.', 1, 1706157979, 1706157979),
(401, '65b1e79b5cd42', 17, 'Create an ad copy that showcases the unique and personal experiences of my {{ ideal customer persona }} with my {{ product/service }} and encourages them to share their positive review with their followers.', 1, 1706157979, 1706157979),
(402, '65b1e79b5d12e', 17, 'Create a social media ad that features a customer testimonial. Use language that emphasizes the customer\'s positive experience and encourages others to try your product or service.', 1, 1706157979, 1706157979),
(403, '65b1e79b5d59c', 17, 'Write a social media ad that promotes {{ upcoming event }}. Use language that creates excitement and encourages customers to register or attend.', 1, 1706157979, 1706157979),
(404, '65b1e79b5da74', 17, 'Generate a social media ad that promotes {{ free trial }} for {{ product or service }}. Use language that emphasizes the benefits and encourages customers to try it out.', 1, 1706157979, 1706157979),
(405, '65b1e79b5df0b', 17, 'Write a social media ad that promotes {{ seasonal promotion }}. Use language that ties the promotion to the season and creates excitement.', 1, 1706157979, 1706157979),
(406, '65b1e79b5e307', 17, 'Create a social media ad that promotes a referral program. Use language that emphasizes the benefits and encourages customers to refer their friends.', 1, 1706157979, 1706157979),
(407, '65b1e79b5e6d9', 17, 'Write a social media ad that promotes {{ upgrade }}. Use language that highlights the value of the upgrade and encourages customers to update their plan.', 1, 1706157979, 1706157979),
(408, '65b1e79b5eab0', 17, 'Create a social media ad that promotes pre-ordering {{ product/service }}. Use language that creates excitement and encourages customers to be the first to get it.', 1, 1706157979, 1706157979),
(409, '65b1e79b5ee8c', 18, 'Create a happy birthday social media post for an employee.', 1, 1706157979, 1706157979),
(410, '65b1e79b5f27a', 18, 'Create a social media post reinforcing the following {{ mission/values }}.', 1, 1706157979, 1706157979),
(411, '65b1e79b5f658', 18, 'Write a social media post introducing a new team member.', 1, 1706157979, 1706157979),
(412, '65b1e79b5fa3b', 18, 'Create a thank-you social media post for a loyal customer.', 1, 1706157979, 1706157979),
(413, '65b1e79b5fdda', 18, 'Write a social media post to celebrate {{ milestone }} related to {{ company name }}.', 1, 1706157979, 1706157979),
(414, '65b1e79b6023c', 18, 'Generate a social media post to promote a sponsored event for {{ type of activity }}.', 1, 1706157979, 1706157979),
(415, '65b1e79b60662', 18, 'Write a social media post to share a fun fact or trivia related to {{ industry }}.', 1, 1706157979, 1706157979),
(416, '65b1e79b60b8a', 18, 'Create a social media post to recognize and celebrate {{ achievements }} of {{ employee role and name }}.', 1, 1706157979, 1706157979),
(417, '65b1e79b61037', 18, 'Write a social media post to encourage followers to share their experiences with {{ your company name }} products or services.', 1, 1706157979, 1706157979),
(418, '65b1e79b623ed', 18, 'Create a social media post to recognize and thank partners or suppliers who have helped you achieve your goals.', 1, 1706157979, 1706157979),
(419, '65b1e79b6295a', 18, 'Write a social media post to showcase the creativity and innovation of the employees at {{ company name }} through {{ project }}.', 1, 1706157979, 1706157979),
(420, '65b1e79b62ddd', 18, 'Create a social media post to showcase a positive review or feedback received from a customer about {{ product/service/event }}.', 1, 1706157979, 1706157979),
(421, '65b1e79b63235', 18, 'Write a social media post to recognize and appreciate the hard work and dedication of the employees at {{ company name }}.', 1, 1706157979, 1706157979),
(422, '65b1e79b6369e', 18, 'Write a social media post that talk about {{ team member }} and highlights their contributions to the company regarding {{ department }}.', 1, 1706157979, 1706157979),
(423, '65b1e79b63acb', 18, 'Create a cation for a social media video that takes the followers behind the scenes of creating {{ event/product }}.', 1, 1706157979, 1706157979),
(424, '65b1e79b63f2f', 18, 'Write a social media post that announces a Q&A session with a team member that specializes in {{ role }}, where followers can ask questions about their role.', 1, 1706157979, 1706157979),
(425, '65b1e79b6445b', 18, 'Create a social media post that features a day-in-the-life of a {{ profession }}, showcasing their daily routine and responsibilities.', 1, 1706157979, 1706157979),
(426, '65b1e79b64953', 18, 'Create a social media post that shows the company\'s commitment to sustainability and eco-friendliness in its operations and products.', 1, 1706157979, 1706157979),
(427, '65b1e79b64e18', 18, 'Write a social media post that showcases the company\'s commitment to employee development and training.', 1, 1706157979, 1706157979),
(428, '65b1e79b652d4', 19, 'Write a call to action for a {{ product }} that gets the reader to {{ action }}.', 1, 1706157979, 1706157979),
(429, '65b1e79b6581b', 19, 'Write a CTA for a {{ product/service }}.', 1, 1706157979, 1706157979),
(430, '65b1e79b65cc1', 19, 'Write a CTA for the following content:', 1, 1706157979, 1706157979),
(431, '65b1e79b6615a', 19, 'Write a CTA promoting a {{ product/service }} for {{ customer type }}.', 1, 1706157979, 1706157979),
(432, '65b1e79b6669d', 19, 'Create a CTA for a {{ product/service }} and include the following phrase:', 1, 1706157979, 1706157979),
(433, '65b1e79b66b5f', 19, 'Provide 10 powerful calls to action about {{ product/service }}.', 1, 1706157979, 1706157979),
(434, '65b1e79b66fe8', 20, 'Write a social media post based on a statistic about coffee {{ topic }}.', 1, 1706157979, 1706157979),
(435, '65b1e79b673e7', 20, 'Write a social media post discussing a myth about {{ topic }}.', 1, 1706157979, 1706157979),
(436, '65b1e79b677d6', 20, 'Create a social media post that discusses the don\'ts of {{ topic }}.', 1, 1706157979, 1706157979),
(437, '65b1e79b67bf6', 20, 'Make a social media post about {{ topic }} tips/benefits.', 1, 1706157979, 1706157979),
(438, '65b1e79b67ffa', 20, 'Write a social media review about {{ product }}.', 1, 1706157979, 1706157979),
(439, '65b1e79b684d7', 20, 'Create a social media post about the history of {{ topic }}.', 1, 1706157979, 1706157979),
(440, '65b1e79b689da', 20, 'List challenges that come with {{ profession }} to post on {{ social media platform }} for {{ audience }}.', 1, 1706157979, 1706157979),
(441, '65b1e79b68e93', 20, 'Write a social media post comparing {{ topic }} and {{ topic }}.', 1, 1706157979, 1706157979),
(442, '65b1e79b69296', 20, 'Create a list of pros and cons for {{ topic }}.', 1, 1706157979, 1706157979),
(443, '65b1e79b69669', 20, 'Ask your audience to share their thoughts or experiences related to {{ topic }}, and encourage discussion in the comments.', 1, 1706157979, 1706157979),
(444, '65b1e79b69a23', 20, 'Share a surprising or unexpected fact about {{ topic }}.', 1, 1706157979, 1706157979),
(445, '65b1e79b69e29', 20, 'Explain why {{ product }} is becoming increasingly important in {{ field }}, and how it can help improve {{ outcome }}.', 1, 1706157979, 1706157979),
(446, '65b1e79b6a263', 20, 'Discuss the potential benefits and drawbacks of {{ practice/tool }}, and weigh the pros and cons.', 1, 1706157979, 1706157979),
(447, '65b1e79b6a64a', 20, 'Provide real-world examples or case studies of how {{ practice/tool }} is being used in {{ industry }} and its impact on {{ demographic }}.', 1, 1706157979, 1706157979),
(448, '65b1e79b6a9fb', 20, 'Provide a clear and concise explanation of how a particular {{ product }} works, using simple language and examples.', 1, 1706157979, 1706157979),
(449, '65b1e79b6ae99', 20, 'Address common misconceptions or questions related to {{ topic }}, and provide clarification.', 1, 1706157979, 1706157979),
(450, '65b1e79b6b226', 20, 'Use a \"FAQ\" format to answer a common question related to {{ topic }}, and provide a brief explanation or summary.', 1, 1706157979, 1706157979),
(451, '65b1e79b6b6c4', 20, 'Pose a thought-provoking or challenging question related to {{ topic }}, and encourage your audience to share their thoughts or opinions.', 1, 1706157979, 1706157979),
(452, '65b1e79b6bb22', 20, 'Provide advice or guidance on how to {{ action }}, and address common challenges or concerns.', 1, 1706157979, 1706157979),
(453, '65b1e79b6bfb4', 20, 'Address a common myth or misconception related to {{ topic }}, and provide evidence or examples to debunk it.', 1, 1706157979, 1706157979),
(454, '65b1e79b6c7a0', 20, 'Explain why {{ myth }} is harmful or misleading, and how it can impact perceptions or decisions related to {{ action }}.', 1, 1706157979, 1706157979),
(455, '65b1e79b6cc77', 20, 'Create a social media post presenting a counterargument for the following statement:', 1, 1706157979, 1706157979),
(456, '65b1e79b6d1ed', 20, 'Write a social media post comparing {{ topic }} and {{ topic }}.', 1, 1706157979, 1706157979),
(457, '65b1e79b6d76a', 20, 'Compare and contrast {{ topic }} and {{ topic }}.', 1, 1706157979, 1706157979),
(458, '65b1e79b6dc3a', 20, 'Compare the pros and cons of {{ product/service/practice }}.', 1, 1706157979, 1706157979),
(459, '65b1e79b6e038', 20, 'Create a social media post presenting three supporting points for the following statement:', 1, 1706157979, 1706157979),
(460, '65b1e79b6e4e3', 20, 'Create a social media post presenting a counterargument for an article about {{ topic }}.', 1, 1706157979, 1706157979),
(461, '65b1e79b6e987', 20, 'Critically analyze {{ topic }}.', 1, 1706157979, 1706157979),
(462, '65b1e79b6ee31', 20, 'Create a social media post that acts as a good response to {{ customer objection }}.', 1, 1706157979, 1706157979),
(463, '65b1e79b6f2bb', 21, 'Write a funny joke about {{ topic }}.', 1, 1706157979, 1706157979),
(464, '65b1e79b6f797', 21, 'Mention a fun fact about {{ topic }} and create a social media post about it.', 1, 1706157979, 1706157979),
(465, '65b1e79b6fd4e', 21, 'Write an analogy to explain {{ topic }}.', 1, 1706157979, 1706157979),
(466, '65b1e79b70190', 21, 'Write a funny social media post about {{ topic }}.', 1, 1706157979, 1706157979),
(467, '65b1e79b705c1', 21, 'Write a riddle about {{ topic }}.', 1, 1706157979, 1706157979),
(468, '65b1e79b709e0', 21, 'Create a social media challenge to encourage people to {{ activity }}.', 1, 1706157979, 1706157979),
(469, '65b1e79b70e14', 21, 'Come up with witty puns about {{ topic }}.', 1, 1706157979, 1706157979),
(470, '65b1e79b712d8', 21, 'Create a social media post recommending {{ books/movies/podcasts/products/services }} for {{ need }}.', 1, 1706157979, 1706157979),
(471, '65b1e79b71812', 21, 'Write a funny social media post that pokes fun at a {{ misconception }}.', 1, 1706157979, 1706157979),
(472, '65b1e79b71cef', 21, 'Generate a social media post that features a funny anecdote or story related to {{industry }}.', 1, 1706157979, 1706157979),
(473, '65b1e79b7217a', 21, 'Create a social media post that highlights a funny pun or play on words related to {{ product/service/industry }}.', 1, 1706157979, 1706157979),
(474, '65b1e79b725ec', 21, 'Generate a series of social media posts that feature funny jokes or memes related to the challenges or quirks of working remotely.', 1, 1706157979, 1706157979),
(475, '65b1e79b72a8f', 21, 'Write a social media post asking for advice or opinions about {{ topic }}.', 1, 1706157979, 1706157979),
(476, '65b1e79b72f40', 21, 'Create a social media post asking your followers to share their favorite meme.', 1, 1706157979, 1706157979),
(477, '65b1e79b73521', 21, 'Write a social media post asking your followers to share their favorite joke or meme related to {{ topic }}.', 1, 1706157979, 1706157979),
(478, '65b1e79b73ab4', 21, 'Create a social media post asking your followers to share their favorite quote about {{ topic }}.', 1, 1706157979, 1706157979),
(479, '65b1e79b741a7', 21, 'Create a social media post asking your followers to share their opinion on {{ topic }}.', 1, 1706157979, 1706157979),
(480, '65b1e79b745fc', 22, 'Start a social media debate about {{ topic }}.', 1, 1706157979, 1706157979),
(481, '65b1e79b74a11', 22, 'Write a social media post asking a question about {{ topic }}', 1, 1706157979, 1706157979),
(482, '65b1e79b74efb', 22, 'Create a social media post asking for {{ movies/books/podcasts }} recommendations.', 1, 1706157979, 1706157979),
(483, '65b1e79b75520', 22, 'List 10 social media contest ideas.', 1, 1706157979, 1706157979),
(484, '65b1e79b7595f', 22, 'Create a social media giveaway post for {{ product/service }}.', 1, 1706157979, 1706157979),
(485, '65b1e79b75eef', 22, 'Create a social media poll/quiz about {{ topic }}.', 1, 1706157979, 1706157979),
(486, '65b1e79b76487', 22, 'Create a social media post announcing a live Q&A session about {{ topic }}.', 1, 1706157979, 1706157979),
(487, '65b1e79b769c1', 22, 'Create 10 poll options for a quiz about {{ topic }}.', 1, 1706157979, 1706157979),
(488, '65b1e79b76dec', 22, 'Create a product match quiz that helps customers find the perfect {{ product }} for {{ their needs }}. Use questions that narrow down the options and highlight the benefits of each product.', 1, 1706157979, 1706157979),
(489, '65b1e79b7723b', 22, 'Generate a knowledge quiz related to {{ topic }}. Use questions that challenge customers to think and learn more about the topic.', 1, 1706157979, 1706157979),
(490, '65b1e79b77670', 22, 'Generate a trivia quiz related to {{ industry }}. Use questions that test customers\' knowledge and create a fun and interactive experience.', 1, 1706157979, 1706157979),
(491, '65b1e79b77a86', 22, 'Create a career path quiz that helps customers identify their ideal career path. Use questions that highlight different job roles and industries and provide helpful resources for further exploration.', 1, 1706157979, 1706157979),
(492, '65b1e79b77e99', 22, 'Generate a travel quiz that helps customers find their ideal travel destination. Use questions that highlight different travel preferences and provide helpful tips and resources.', 1, 1706157979, 1706157979),
(493, '65b1e79b78295', 22, 'Create a food and drink quiz that helps customers identify their taste preferences and discover new recipes and ingredients. Use questions that highlight different cuisines and flavors.', 1, 1706157979, 1706157979),
(494, '65b1e79b786b8', 22, 'Create a fashion quiz that helps customers identify their personal style and find the perfect outfit. Use questions that highlight different fashion styles and provide helpful resources and advice.', 1, 1706157979, 1706157979),
(495, '65b1e79b78afb', 22, 'Generate an education quiz that helps people identify their learning style and find helpful resources and study tips. Use questions that highlight different learning techniques and provide actionable tips and resources.', 1, 1706157979, 1706157979),
(496, '65b1e79b79083', 22, 'Create a music quiz that helps customers identify their favorite genres and artists. Use questions that highlight different music styles and provide helpful resources and trivia.', 1, 1706157979, 1706157979),
(497, '65b1e79b7954f', 22, 'Generate a movie and TV quiz that helps customers identify their favorite movies and TV shows. Use questions that highlight different genres and provide helpful resources and trivia.', 1, 1706157979, 1706157979),
(498, '65b1e79b79999', 22, 'Create a photo contest that encourages customers to share photos of themselves using {{ product }}. Use a unique hashtag to track entries and offer a prize for the best photo.', 1, 1706157979, 1706157979),
(499, '65b1e79b79dc5', 22, 'Generate a caption contest that encourages customers to write funny or creative captions for a specific photo or image related to {{ topic }}. Offer a prize for the best caption.', 1, 1706157979, 1706157979),
(500, '65b1e79b7a22d', 22, 'Create a sweepstake that encourages customers to enter for a chance to win {{ prize }}.', 1, 1706157979, 1706157979),
(501, '65b1e79b7a73f', 22, 'Create a trivia contest related to {{ topic }}. Use a series of questions that challenge customers\' knowledge and offer a prize for the highest score.', 1, 1706157979, 1706157979),
(502, '65b1e79b7ac46', 22, 'Create a user-generated content contest that encourages customers to create and share their own content related to {{ topic }}. Use a unique hashtag to track entries and offer a prize for the best content.', 1, 1706157979, 1706157979),
(503, '65b1e79b7b154', 22, 'Generate a creative writing contest that encourages customers to write short stories, poems, or other creative writing pieces related to {{ topic }}. Use a unique hashtag to track entries and offer a prize for the best writing.', 1, 1706157979, 1706157979),
(504, '65b1e79b7b787', 22, 'Generate an emoji interpretation contest that encourages customers to interpret a series of emojis related to {{ topic }}. Use a unique hashtag to track entries and offer a prize for the most creative interpretation.', 1, 1706157979, 1706157979),
(505, '65b1e79b7bd2f', 22, 'Create a logo redesign contest that encourages customers to redesign a brand logo. Use a unique hashtag to track entries and offer a prize for the best redesign.', 1, 1706157979, 1706157979),
(506, '65b1e79b7c35c', 22, 'Generate a \"name this product\" contest that encourages customers to come up with a creative name for {{ product/service }}.', 1, 1706157979, 1706157979),
(507, '65b1e79b7c783', 23, 'Write an inspirational social media message for {{ target audience }}.', 1, 1706157979, 1706157979),
(508, '65b1e79b7cca1', 23, 'Create a social media post sharing a motivational quote about {{ topic }}.', 1, 1706157979, 1706157979),
(509, '65b1e79b7d19c', 23, 'Make a post sharing an inspiring success story about {{ topic }}.', 1, 1706157979, 1706157979),
(510, '65b1e79b7d72d', 23, 'Write an inspiring social media post about how to overcome {{ challenge }}.', 1, 1706157979, 1706157979),
(511, '65b1e79b7dc09', 23, 'Create a social media post to share a motivational message for followers who are also entrepreneurs or business owners.', 1, 1706157979, 1706157979),
(512, '65b1e79b7e23d', 23, 'Share a story of a person who overcame adversity and became successful in their field.', 1, 1706157979, 1706157979),
(513, '65b1e79b7e66e', 23, 'Write an inspirational post about taking risks and stepping out of your comfort zone.', 1, 1706157979, 1706157979),
(514, '65b1e79b7ec05', 23, 'Create a social media post encouraging your followers to never give up on their dreams.', 1, 1706157979, 1706157979),
(515, '65b1e79b7f182', 23, 'Make a post sharing tips for staying motivated and focused during difficult times.', 1, 1706157979, 1706157979),
(516, '65b1e79b7f60e', 23, 'Write an inspiring message about the power of perseverance and determination in achieving goals.', 1, 1706157979, 1706157979),
(517, '65b1e79b7fb73', 23, 'Share a personal story about overcoming obstacles and how it has made you stronger.', 1, 1706157979, 1706157979),
(518, '65b1e79b800e8', 23, 'Create a post about the importance of self-care and taking care of yourself while pursuing your goals.', 1, 1706157979, 1706157979),
(519, '65b1e79b80659', 23, 'Make a social media post about the benefits of positive thinking and having a growth mindset.', 1, 1706157979, 1706157979),
(520, '65b1e79b80a51', 23, 'Write an inspirational message about the power of community and the support it can provide.', 1, 1706157979, 1706157979),
(521, '65b1e79b80e78', 23, 'Share a story about a person who made a positive impact on the world and inspired others to do the same.', 1, 1706157979, 1706157979),
(522, '65b1e79b8140b', 23, 'Create a social media post about the value of hard work and persistence in achieving success.', 1, 1706157979, 1706157979),
(523, '65b1e79b8198c', 23, 'Write an inspiring message about the importance of setting goals and working towards them.', 1, 1706157979, 1706157979),
(524, '65b1e79b81d88', 23, 'Make a post sharing tips for staying focused and productive while working from home.', 1, 1706157979, 1706157979),
(525, '65b1e79b821a0', 23, 'Share a motivational story about a person who pursued their passion and found success.', 1, 1706157979, 1706157979),
(526, '65b1e79b82760', 23, 'Create a social media post about the benefits of taking on new challenges and learning new skills.', 1, 1706157979, 1706157979),
(527, '65b1e79b82d2e', 23, 'Write an inspirational message about the power of gratitude and appreciating the small things in life.', 1, 1706157979, 1706157979),
(528, '65b1e79b831cc', 23, 'Make a post sharing a personal experience of overcoming a difficult situation and what you learned from it.', 1, 1706157979, 1706157979),
(529, '65b1e79b836fe', 23, 'Share a story of a person who turned a setback into an opportunity for growth and success.', 1, 1706157979, 1706157979),
(530, '65b1e79b83b11', 23, 'Create a social media post about the importance of self-reflection and self-improvement.', 1, 1706157979, 1706157979),
(531, '65b1e79b83f14', 23, 'Write an inspiring message about the power of positive affirmations and self-talk.', 1, 1706157979, 1706157979),
(532, '65b1e79b8432a', 23, 'Make a post about the importance of taking action and making progress towards your goals every day.', 1, 1706157979, 1706157979),
(533, '65b1e79b84726', 23, 'Share a motivational story about a person who refused to give up and eventually achieved their dreams.', 1, 1706157979, 1706157979),
(534, '65b1e79b84b10', 23, 'Create a social media post about the importance of finding balance in life and pursuing your passions.', 1, 1706157979, 1706157979),
(535, '65b1e79b84f26', 23, 'Write an inspirational message about the benefits of learning from failure and using it as a stepping stone to success.', 1, 1706157979, 1706157979),
(536, '65b1e79b853ae', 23, 'Make a post sharing tips for maintaining a positive mindset and overcoming negative self-talk.', 1, 1706157979, 1706157979),
(537, '65b1e79b85945', 23, 'Share a story of a person who made a difference in the world by helping others and inspiring change.', 1, 1706157979, 1706157979),
(538, '65b1e79b85dc2', 23, 'Create a social media post about the power of visualization and manifesting your dreams into reality.', 1, 1706157979, 1706157979),
(539, '65b1e79b861c8', 23, 'Write an inspiring message about the importance of surrounding yourself with positive influences and supportive people.', 1, 1706157979, 1706157979),
(540, '65b1e79b865aa', 23, 'Make a post about the benefits of taking breaks and practising self-care to avoid burnout.', 1, 1706157979, 1706157979),
(541, '65b1e79b869b1', 23, 'Share a motivational story about a person who challenged societal norms and made a significant impact on their community.', 1, 1706157979, 1706157979),
(542, '65b1e79b86da6', 24, 'Create a fun social media post celebrating {{ holiday }}.', 1, 1706157979, 1706157979),
(543, '65b1e79b871aa', 24, 'Write a social media post talking about famous {{ holiday }} traditions.', 1, 1706157979, 1706157979),
(544, '65b1e79b87598', 24, 'Craft a social media post talking about how {{ holiday }} was created.', 1, 1706157979, 1706157979),
(545, '65b1e79b8799e', 24, 'Share a list of {{ holiday }} movies.', 1, 1706157979, 1706157979),
(546, '65b1e79b87d6a', 24, 'Create a social media post describing a {{ holiday }} classic movie without sharing the name and ask the audience to guess.', 1, 1706157979, 1706157979),
(547, '65b1e79b8820f', 24, 'Write a social media post about {{ holiday }} must-haves.', 1, 1706157979, 1706157979),
(548, '65b1e79b8869e', 24, 'Write a social media caption for a photo of {{ holiday }} office decorations.', 1, 1706157979, 1706157979),
(549, '65b1e79b88aa3', 24, 'Write a heartwarming story for the {{ holiday }} season.', 1, 1706157979, 1706157979),
(550, '65b1e79b88e81', 24, 'Create a social media promoting a {{ holiday }} promotion.', 1, 1706157979, 1706157979),
(551, '65b1e79b89277', 24, 'Write a post about {{ holiday }} recipes.', 1, 1706157979, 1706157979),
(552, '65b1e79b89688', 24, 'Create a social media post about unknown {{ holiday }} facts.', 1, 1706157979, 1706157979),
(553, '65b1e79b89e33', 24, 'Generate social media post ideas about {{ holiday }}.', 1, 1706157979, 1706157979),
(554, '65b1e79b8a372', 24, 'Generate {{ holiday }}-themed social media contest.', 1, 1706157979, 1706157979),
(555, '65b1e79b8a8c9', 24, 'Create a social media post that highlights the history and cultural significance of {{ holiday }}.', 1, 1706157979, 1706157979),
(556, '65b1e79b8adc5', 24, 'Generate a series of social media posts that showcase different traditions and customs associated with {{ holiday }} around the world.', 1, 1706157979, 1706157979),
(557, '65b1e79b8b2ad', 24, 'Write a social media post that features a unique recipe or food item traditionally served during {{ holiday }}.', 1, 1706157979, 1706157979);
INSERT INTO `sp_ai_prompt_templates` (`id`, `ids`, `pid`, `content`, `status`, `changed`, `created`) VALUES
(558, '65b1e79b8b7b1', 24, 'Create a social media post that encourages followers to share how they celebrate {{ holiday }} and tag us for a chance to be featured.', 1, 1706157979, 1706157979),
(559, '65b1e79b8bcd2', 24, 'Generate a social media post that features crafts and DIY projects related to {{ holiday }}.', 1, 1706157979, 1706157979),
(560, '65b1e79b8c1de', 24, 'Write a social media post that highlights how our brand is celebrating {{ holiday }} and offering a special discount code.', 1, 1706157979, 1706157979),
(561, '65b1e79b8c70c', 24, 'Create a social media post that features songs to listen to during {{ holiday }}.', 1, 1706157979, 1706157979),
(562, '65b1e79b8cb79', 24, 'Generate a series of social media posts that highlight different travel destinations related for {{ holiday }}.', 1, 1706157979, 1706157979),
(563, '65b1e79b8d042', 24, 'Create a social media post that encourages followers to share their favourite {{ holiday }} memories or photos using a branded hashtag.', 1, 1706157979, 1706157979),
(564, '65b1e79b8d5a0', 24, 'Generate a social media post that features movies related to {{ holiday }}.', 1, 1706157979, 1706157979),
(565, '65b1e79b8dd3f', 24, 'Write a social media post that offers tips and suggestions for hosting a {{ holiday }} party or gathering.', 1, 1706157979, 1706157979),
(566, '65b1e79b8e2c9', 24, 'Create a social media post that features a {{ holiday }}-themed charitable initiative or volunteer opportunity.', 1, 1706157979, 1706157979),
(567, '65b1e79b8e86c', 24, 'Generate a series of social media posts that highlight different books or literature related to {{ holiday }}.', 1, 1706157979, 1706157979),
(568, '65b1e79b8edef', 24, 'Write a social media post that showcases how different countries or cultures celebrate {{ holiday }}.', 1, 1706157979, 1706157979),
(569, '65b1e79b8f396', 24, 'Create a social media post that encourages followers to decorate their homes or workspaces for {{ holiday }} and share photos using a branded hashtag.', 1, 1706157979, 1706157979),
(570, '65b1e79b8f7be', 24, 'Create a social media post that features a {{ holiday }}-themed drink recipe for followers to try.', 1, 1706157979, 1706157979),
(571, '65b1e79b8fc39', 24, 'Write a social media post that showcases creative ways to celebrate {{ holiday }}.', 1, 1706157979, 1706157979),
(572, '65b1e79b900c0', 24, 'Create a social media post that encourages followers to share their favourite {{holiday}}-themed books.', 1, 1706157979, 1706157979),
(573, '65b1e79b905dd', 24, 'Generate a series of social media posts that feature different games or activities related to {{ holiday }}.', 1, 1706157979, 1706157979),
(574, '65b1e79b90b4b', 24, 'Write a social media post that highlights different ways to give back or make a positive impact during {{ holiday }}.', 1, 1706157979, 1706157979),
(575, '65b1e79b90fac', 24, 'Generate a social media post that features a {{ holiday }}-themed joke.', 1, 1706157979, 1706157979),
(576, '65b1e79b91317', 24, 'Write a social media post that encourages followers to share their favourite {{ holiday }} memory.', 1, 1706157979, 1706157979),
(577, '65b1e79b916df', 25, 'Create a post that highlights the following company mission:', 1, 1706157979, 1706157979),
(578, '65b1e79b91b85', 25, 'Write a post that showcases {{ product or service }}.', 1, 1706157979, 1706157979),
(579, '65b1e79b920ae', 25, 'Write a post that offers tips or advice related to {{ topic }}.', 1, 1706157979, 1706157979),
(580, '65b1e79b925b6', 25, 'Create a post thanking your customers for supporting your business.', 1, 1706157979, 1706157979),
(581, '65b1e79b92aa5', 25, 'Write a post that announces a special promotion or sale.', 1, 1706157979, 1706157979),
(582, '65b1e79b92f5c', 25, 'Create a post that celebrates {{ milestone/anniversary }}.', 1, 1706157979, 1706157979),
(583, '65b1e79b933e3', 25, 'Create a caption for a photo that features a photo from the office.', 1, 1706157979, 1706157979),
(584, '65b1e79b938ed', 25, 'Create a post that welcomes a new member named {{ name }} in the {{ department }}.', 1, 1706157979, 1706157979),
(585, '65b1e79b93e0e', 25, 'Write a post that asks your audience for feedback or opinions on {{ topic }}.', 1, 1706157979, 1706157979),
(586, '65b1e79b94327', 25, 'Create a caption for an image that features a customer review or testimonial.', 1, 1706157979, 1706157979),
(587, '65b1e79b94825', 25, 'Write a post that highlights {{ industry award/recognition }}.', 1, 1706157979, 1706157979),
(588, '65b1e79b94d4a', 25, 'Create a post that shares a fun fact or trivia related to your {{ industry }}.', 1, 1706157979, 1706157979),
(589, '65b1e79b951fb', 25, 'Write a caption for a photo that offers a sneak peek for the following product description:', 1, 1706157979, 1706157979),
(590, '65b1e79b95628', 25, 'Create a post that expresses your company\'s commitment to sustainability or eco-friendliness.', 1, 1706157979, 1706157979),
(591, '65b1e79b959e5', 25, 'Write a post that showcases {{ company name }} workplace culture. Use the following description to create the post:', 1, 1706157979, 1706157979),
(592, '65b1e79b95e05', 25, 'Create a post that shares the following company goals:', 1, 1706157979, 1706157979),
(593, '65b1e79b96219', 25, 'Write a post that highlights why {{ product/service }} is an important part of your business.', 1, 1706157979, 1706157979),
(594, '65b1e79b9663f', 25, 'Create a post that features the following fun facts about {{ company name }}:', 1, 1706157979, 1706157979),
(595, '65b1e79b96a57', 25, 'Write a post that announces a new blog post on your website about {{ topic }}.', 1, 1706157979, 1706157979),
(596, '65b1e79b96e75', 25, 'Create a post that shares a quote or inspirational message related to {{ topic }}.', 1, 1706157979, 1706157979),
(597, '65b1e79b9728e', 25, 'Write a post that compares {{ product }} to {{ competitor product }}.', 1, 1706157979, 1706157979),
(598, '65b1e79b977f6', 25, 'Write a post that promotes an upcoming webinar about {{ topic }}.', 1, 1706157979, 1706157979),
(599, '65b1e79b97c39', 25, 'Create a post that shares a funny potential name for {{ product }}.', 1, 1706157979, 1706157979),
(600, '65b1e79b98074', 25, 'Create a post asking your audience for recommendations on how to improve {{ product }}.', 1, 1706157979, 1706157979),
(601, '65b1e79b98472', 25, 'Write a post that offers a discount or coupon code for {{ product }}.', 1, 1706157979, 1706157979),
(602, '65b1e79b98884', 25, 'Write a post that promotes your company\'s referral program based on the following info:', 1, 1706157979, 1706157979),
(603, '65b1e79b98e20', 25, 'Create a caption for a customer-generated photo or video. Use the following photo description while creating the post:', 1, 1706157979, 1706157979),
(604, '65b1e79b9923a', 25, 'Create a social media quiz or trivia related to {{ industry }}.', 1, 1706157979, 1706157979),
(605, '65b1e79b9975d', 25, 'Write a post that shares a team member\'s favorite inspirational quote. Here is the quote:', 1, 1706157979, 1706157979),
(606, '65b1e79b99be6', 25, 'Write a post that promotes a limited-time sale.', 1, 1706157979, 1706157979),
(607, '65b1e79b9a079', 25, 'Write a post that shares a customer poll about what your business should post next. List 3 post ideas related to {{ industry }} your followers can choose from.', 1, 1706157979, 1706157979),
(608, '65b1e79b9a52a', 25, 'Create a post that highlights your company\'s commitment to customer service or support.', 1, 1706157979, 1706157979),
(609, '65b1e79b9aa86', 26, 'Create a post offering a free consultation for entrepreneurs looking to scale their businesses.', 1, 1706157979, 1706157979),
(610, '65b1e79b9afac', 26, 'Write a post highlighting the top 5 productivity tools for small business owners.', 1, 1706157979, 1706157979),
(611, '65b1e79b9b4cd', 26, 'Write a post providing tips for setting achievable business goals.', 1, 1706157979, 1706157979),
(612, '65b1e79b9b95b', 26, 'Create a post announcing a new group coaching program for small business owners.', 1, 1706157979, 1706157979),
(613, '65b1e79b9bde1', 26, 'Write a post offering advice for balancing work and personal life as a business owner.', 1, 1706157979, 1706157979),
(614, '65b1e79b9c16e', 26, 'Create a post sharing a personal story of overcoming challenges as an entrepreneur.', 1, 1706157979, 1706157979),
(615, '65b1e79b9c69c', 26, 'Write a post outlining the key qualities of successful business owners.', 1, 1706157979, 1706157979),
(616, '65b1e79b9cabf', 26, 'Create a post announcing a special offer on your coaching services.', 1, 1706157979, 1706157979),
(617, '65b1e79b9ceb8', 26, 'Write a post providing tips for effective time management as a business owner.', 1, 1706157979, 1706157979),
(618, '65b1e79b9d2ce', 26, 'Create a post sharing your favorite motivational quote for entrepreneurs.', 1, 1706157979, 1706157979),
(619, '65b1e79b9d860', 26, 'Write a post offering advice for managing cash flow in a small business.', 1, 1706157979, 1706157979),
(620, '65b1e79b9ddf4', 26, 'Create a post announcing a webinar on how to build a successful business from scratch.', 1, 1706157979, 1706157979),
(621, '65b1e79b9e242', 26, 'Write a post offering tips for building a strong online presence as a business owner.', 1, 1706157979, 1706157979),
(622, '65b1e79b9e6e7', 26, 'Create a post sharing a personal story of how you built your own successful business.', 1, 1706157979, 1706157979),
(623, '65b1e79b9ed48', 26, 'Write a post outlining the key benefits of working with a business coach.', 1, 1706157979, 1706157979),
(624, '65b1e79b9f2ba', 26, 'Write a post offering advice for building a strong team as a business owner.', 1, 1706157979, 1706157979),
(625, '65b1e79b9f82f', 26, 'Write a post providing tips for creating a successful marketing plan.', 1, 1706157979, 1706157979),
(626, '65b1e79b9fdbb', 26, 'Create a post announcing a special discount on your coaching services.', 1, 1706157979, 1706157979),
(627, '65b1e79ba03d8', 26, 'Write a post offering advice for overcoming imposter syndrome as an entrepreneur.', 1, 1706157979, 1706157979),
(628, '65b1e79ba0a08', 26, 'Create a post sharing a motivational story of a successful business owner.', 1, 1706157979, 1706157979),
(629, '65b1e79ba0e8d', 26, 'Write a post outlining the key steps for creating a successful business plan.', 1, 1706157979, 1706157979),
(630, '65b1e79ba1258', 26, 'Create a post announcing a new podcast series on entrepreneurship.', 1, 1706157979, 1706157979),
(631, '65b1e79ba1672', 26, 'Write a post offering tips for effective goal-setting as a business owner.', 1, 1706157979, 1706157979),
(632, '65b1e79ba1b11', 26, 'Create a post sharing a personal story of how you overcame failure in your business.', 1, 1706157979, 1706157979),
(633, '65b1e79ba202c', 26, 'Write a post outlining the key qualities of a successful business coach.', 1, 1706157979, 1706157979),
(634, '65b1e79ba2545', 26, 'Create a post announcing a new online course on business strategy.', 1, 1706157979, 1706157979),
(635, '65b1e79ba2a4a', 26, 'Write a post offering advice for building resilience as an entrepreneur.', 1, 1706157979, 1706157979),
(636, '65b1e79ba2e3e', 26, 'Write a post providing tips for effective communication in a small business.', 1, 1706157979, 1706157979),
(637, '65b1e79ba32ae', 26, 'Create a post announcing a new mastermind group for entrepreneurs.', 1, 1706157979, 1706157979),
(638, '65b1e79ba376f', 26, 'Write a post offering advice for managing stress as a business owner.', 1, 1706157979, 1706157979),
(639, '65b1e79ba3b5c', 26, 'Write a post outlining the key steps for building a successful brand.', 1, 1706157979, 1706157979),
(640, '65b1e79ba40d8', 26, 'Create a post announcing a new workshop on leadership for small business owners.', 1, 1706157979, 1706157979),
(641, '65b1e79ba4524', 26, 'Write a post offering tips for overcoming procrastination as an entrepreneur.', 1, 1706157979, 1706157979),
(642, '65b1e79ba491e', 26, 'Write a post providing advice for staying organized as a business owner.', 1, 1706157979, 1706157979),
(643, '65b1e79ba4d20', 26, 'Create a post announcing a new coaching program for women entrepreneurs.', 1, 1706157979, 1706157979),
(644, '65b1e79ba50df', 26, 'Write a post offering advice for building a successful sales strategy.', 1, 1706157979, 1706157979),
(645, '65b1e79ba550e', 26, 'Create a post sharing a personal story of how you overcame a business setback.', 1, 1706157979, 1706157979),
(646, '65b1e79ba5937', 26, 'Write a post outlining the key benefits of having a business coach.', 1, 1706157979, 1706157979),
(647, '65b1e79ba5d76', 26, 'Create a post announcing a new book on business success.', 1, 1706157979, 1706157979),
(648, '65b1e79ba61ec', 26, 'Write a post offering tips for effective networking as a business owner.', 1, 1706157979, 1706157979),
(649, '65b1e79ba65d8', 26, 'Write a post offering tips for building a successful customer service strategy.', 1, 1706157979, 1706157979),
(650, '65b1e79ba6b6a', 26, 'Create a post announcing a new workshop on time management for entrepreneurs.', 1, 1706157979, 1706157979),
(651, '65b1e79ba6fc0', 26, 'Write a post providing advice for building a successful sales team.', 1, 1706157979, 1706157979),
(652, '65b1e79ba73ea', 26, 'Create a post sharing how to overcome a difficult client situation.', 1, 1706157979, 1706157979),
(653, '65b1e79ba77e5', 26, 'Write a post outlining the key steps for creating a successful marketing campaign.', 1, 1706157979, 1706157979),
(654, '65b1e79ba7c10', 26, 'Write a post offering tips for building a strong company culture.', 1, 1706157979, 1706157979),
(655, '65b1e79ba8033', 26, 'Create a post sharing a motivational story of a successful entrepreneur.', 1, 1706157979, 1706157979),
(656, '65b1e79ba842e', 26, 'Write a post providing advice for building a successful e-commerce business.', 1, 1706157979, 1706157979),
(657, '65b1e79ba884d', 26, 'Create a post announcing a new masterclass on business development.', 1, 1706157979, 1706157979),
(658, '65b1e79ba99a0', 26, 'Write a post offering tips for building a successful online community.', 1, 1706157979, 1706157979),
(659, '65b1e79ba9e25', 26, 'Create a post sharing a personal story of how you navigated a challenging business partnership.', 1, 1706157979, 1706157979),
(660, '65b1e79baa306', 26, 'Write a post outlining the key benefits of investing in personal development as a business owner.', 1, 1706157979, 1706157979),
(661, '65b1e79baa707', 26, 'Write a post providing advice for building a successful social media strategy.', 1, 1706157979, 1706157979),
(662, '65b1e79baab22', 26, 'Write a post offering tips for building a successful email marketing campaign.', 1, 1706157979, 1706157979),
(663, '65b1e79baaf3c', 26, 'Create a post announcing a new retreat for business owners.', 1, 1706157979, 1706157979),
(664, '65b1e79bab372', 26, 'Write a post providing advice for building a successful customer retention strategy.', 1, 1706157979, 1706157979),
(665, '65b1e79babb69', 27, 'Create a post that shares your top tips for achieving work-life balance.', 1, 1706157979, 1706157979),
(666, '65b1e79babf91', 27, 'Write about the benefits of mindfulness and how it can improve your daily life.', 1, 1706157979, 1706157979),
(667, '65b1e79bac499', 27, 'Create a post that features a healthy recipe and explains why it\'s good for you.', 1, 1706157979, 1706157979),
(668, '65b1e79bac9ae', 27, 'Write about how to incorporate self-care into your daily routine.', 1, 1706157979, 1706157979),
(669, '65b1e79bacea4', 27, 'Create a post that shares the best ways to stay active during the winter months.', 1, 1706157979, 1706157979),
(670, '65b1e79bad3a2', 27, 'Write about the importance of setting and achieving goals.', 1, 1706157979, 1706157979),
(671, '65b1e79bad85b', 27, 'Write about the benefits of a morning routine and how to create one that works for you.', 1, 1706157979, 1706157979),
(672, '65b1e79badd8f', 27, 'Create a post that shares your top tips for staying motivated and achieving your goals.', 1, 1706157979, 1706157979),
(673, '65b1e79bae293', 27, 'Write about the benefits of meditation and how to get started.', 1, 1706157979, 1706157979),
(674, '65b1e79bae665', 27, 'Create a post that shares your favorite healthy snack ideas.', 1, 1706157979, 1706157979),
(675, '65b1e79baea81', 27, 'Write about the importance of self-love and how to practice it.', 1, 1706157979, 1706157979),
(676, '65b1e79baee62', 27, 'Create a post that showcases a quick and easy workout routine for busy people.', 1, 1706157979, 1706157979),
(677, '65b1e79baf233', 27, 'Write about the benefits of gratitude and how to incorporate it into your daily life.', 1, 1706157979, 1706157979),
(678, '65b1e79baf626', 27, 'Create a post that shares your favorite tips for staying focused and productive.', 1, 1706157979, 1706157979),
(679, '65b1e79bafadb', 27, 'Write about the importance of sleep and how to improve your sleep habits.', 1, 1706157979, 1706157979),
(680, '65b1e79baffac', 27, 'Create a post that shares your favorite ways to stay active while traveling.', 1, 1706157979, 1706157979),
(681, '65b1e79bb044e', 27, 'Write about the benefits of journaling and how to get started.', 1, 1706157979, 1706157979),
(682, '65b1e79bb0a7e', 27, 'Create a post that showcases your favorite healthy meal prep ideas.', 1, 1706157979, 1706157979),
(683, '65b1e79bb0efe', 27, 'Write about the benefits of a digital detox and how to do one.', 1, 1706157979, 1706157979),
(684, '65b1e79bb146e', 27, 'Create a post that shares your favorite ways to stay active in the summer.', 1, 1706157979, 1706157979),
(685, '65b1e79bb1865', 27, 'Write about the importance of self-reflection and how to practice it.', 1, 1706157979, 1706157979),
(686, '65b1e79bb1d0d', 27, 'Create a post that showcases your favorite stretch routine for relaxation.', 1, 1706157979, 1706157979),
(687, '65b1e79bb21a0', 27, 'Write about the benefits of positive thinking and how to cultivate it.', 1, 1706157979, 1706157979),
(688, '65b1e79bb2568', 27, 'Create a post that shares your favorite ways to stay active while working from home.', 1, 1706157979, 1706157979),
(689, '65b1e79bb2a22', 27, 'Write about the importance of setting boundaries and how to do it.', 1, 1706157979, 1706157979),
(690, '65b1e79bb2fd9', 27, 'Create a post that features your favorite healthy smoothie recipe.', 1, 1706157979, 1706157979),
(691, '65b1e79bb349c', 27, 'Write about the benefits of a gratitude practice and how to start one.', 1, 1706157979, 1706157979),
(692, '65b1e79bb389f', 27, 'Create a post that shares your top tips for maintaining a healthy work-life balance.', 1, 1706157979, 1706157979),
(693, '65b1e79bb3c55', 27, 'Write about the importance of self-awareness and how to cultivate it.', 1, 1706157979, 1706157979),
(694, '65b1e79bb400d', 27, 'Write about the benefits of nature and how to incorporate it into your daily life.', 1, 1706157979, 1706157979),
(695, '65b1e79bb43e3', 27, 'Create a post that shares healthy dessert recipes.', 1, 1706157979, 1706157979),
(696, '65b1e79bb4818', 27, 'Write about the importance of self-acceptance and how to practice it.', 1, 1706157979, 1706157979),
(697, '65b1e79bb4bb5', 27, 'Create a post that features a quick and easy workout routine for beginners.', 1, 1706157979, 1706157979),
(698, '65b1e79bb4f9e', 27, 'Write about the benefits of mindfulness in the workplace.', 1, 1706157979, 1706157979),
(699, '65b1e79bb53b1', 27, 'Create a post that shares your favorite ways to stay active during the fall.', 1, 1706157979, 1706157979),
(700, '65b1e79bb57ab', 27, 'Write about the importance of self-care for mental health.', 1, 1706157979, 1706157979),
(701, '65b1e79bb5c09', 27, 'Create a post that showcases your favorite breathing exercises for relaxation.', 1, 1706157979, 1706157979),
(702, '65b1e79bb60c0', 27, 'Write about the benefits of self-reflection in personal growth.', 1, 1706157979, 1706157979),
(703, '65b1e79bb65d2', 27, 'Create a post that shares your top tips for staying organized and productive.', 1, 1706157979, 1706157979),
(704, '65b1e79bb6a21', 27, 'Write about the importance of healthy relationships and how to cultivate them.', 1, 1706157979, 1706157979),
(705, '65b1e79bb6ec9', 27, 'Create a post that features a healthy snack recipe for on-the-go.', 1, 1706157979, 1706157979),
(706, '65b1e79bb7392', 27, 'Write about the benefits of positive self-talk and how to do it.', 1, 1706157979, 1706157979),
(707, '65b1e79bb7835', 27, 'Create a post that shares your favorite ways to stay active during the spring.', 1, 1706157979, 1706157979),
(708, '65b1e79bb7cde', 27, 'Write about the importance of self-compassion and how to practice it.', 1, 1706157979, 1706157979),
(709, '65b1e79bb8226', 27, 'Create a post that shares your favorite ways to de-stress after a long day.', 1, 1706157979, 1706157979),
(710, '65b1e79bb8905', 27, 'Write about the importance of a positive mindset and how to cultivate one.', 1, 1706157979, 1706157979),
(711, '65b1e79bb8f3f', 27, 'Create a post that features a healthy breakfast recipe and explains why it\'s important.', 1, 1706157979, 1706157979),
(712, '65b1e79bb93c7', 27, 'Write about the benefits of a regular exercise routine and how to get started.', 1, 1706157979, 1706157979),
(713, '65b1e79bb9851', 27, 'Create a post that shares your top tips for practicing self-care during busy times.', 1, 1706157979, 1706157979),
(714, '65b1e79bb9c71', 27, 'Write about the importance of time management and how to improve your skills.', 1, 1706157979, 1706157979),
(715, '65b1e79bba246', 27, 'Write about the benefits of a daily gratitude practice and how to make it a habit.', 1, 1706157979, 1706157979),
(716, '65b1e79bba7f2', 27, 'Create a post that shares your favorite healthy snack ideas for kids.', 1, 1706157979, 1706157979),
(717, '65b1e79bbabdd', 27, 'Write about the importance of self-discipline and how to develop it.', 1, 1706157979, 1706157979),
(718, '65b1e79bbb04e', 27, 'Write about the benefits of a healthy diet and how to make sustainable changes.', 1, 1706157979, 1706157979),
(719, '65b1e79bbb511', 27, 'Create a post that shares your top tips for staying motivated during a workout.', 1, 1706157979, 1706157979),
(720, '65b1e79bbba54', 27, 'Write about the importance of positive affirmations and how to use them.', 1, 1706157979, 1706157979),
(721, '65b1e79bbbf4f', 27, 'Create a post that showcases your favorite breathing exercises for stress relief.', 1, 1706157979, 1706157979),
(722, '65b1e79bbc39c', 27, 'Write about the benefits of spending time in nature for mental health.', 1, 1706157979, 1706157979),
(723, '65b1e79bbc874', 27, 'Create a post that shares your favorite ways to stay active during the holiday season.', 1, 1706157979, 1706157979),
(724, '65b1e79bbcd88', 27, 'Write about the importance of self-care for overall health and well-being.', 1, 1706157979, 1706157979),
(725, '65b1e79bbd290', 27, 'Create a post that features a healthy dinner recipe that\'s perfect for meal prep.', 1, 1706157979, 1706157979),
(726, '65b1e79bbd6f7', 27, 'Write about the benefits of a consistent self-care routine and how to create one.', 1, 1706157979, 1706157979),
(727, '65b1e79bbdb9c', 28, 'Create a post showcasing {{ listing }}. Make sure to highlight {{ unique features }}.', 1, 1706157979, 1706157979),
(728, '65b1e79bbdf9b', 28, 'Write a post highlighting the benefits of living in {{ neighborhood }}.', 1, 1706157979, 1706157979),
(729, '65b1e79bbe366', 28, 'Create a post with tips for first-time homebuyers.', 1, 1706157979, 1706157979),
(730, '65b1e79bbe739', 28, 'Write a post about the latest real estate trends in {{ local market }}.', 1, 1706157979, 1706157979),
(731, '65b1e79bbeb45', 28, 'Create a caption for a video featuring a virtual tour of a {{ type of listing }}.', 1, 1706157979, 1706157979),
(732, '65b1e79bbef4e', 28, 'Write a post about the importance of staging a home for sale.', 1, 1706157979, 1706157979),
(733, '65b1e79bbf37a', 28, 'Write a post about the benefits of using a real estate agent for buying or selling a home.', 1, 1706157979, 1706157979),
(734, '65b1e79bbf77f', 28, 'Create a post about {{ recent successful sale }}.', 1, 1706157979, 1706157979),
(735, '65b1e79bbfb90', 28, 'Write a post with tips for home sellers on how to prepare their homes for sale.', 1, 1706157979, 1706157979),
(736, '65b1e79bbff5d', 28, 'Write a post with tips for home sellers on how to prepare their homes for sale.', 1, 1706157979, 1706157979),
(737, '65b1e79bc0372', 28, 'Create a post featuring the best places to live in {{ area }}.', 1, 1706157979, 1706157979),
(738, '65b1e79bc077c', 28, 'Write a post about the importance of curb appeal for selling a home.', 1, 1706157979, 1706157979),
(739, '65b1e79bc0baf', 28, 'Create a caption for a post featuring the following testimonial from a satisfied client:', 1, 1706157979, 1706157979),
(740, '65b1e79bc0fe0', 28, 'Write a post about the latest mortgage rates in {{ area }} and how they can affect homebuyers.', 1, 1706157979, 1706157979),
(741, '65b1e79bc13fd', 28, 'Create a post showcasing the amenities of a luxury home or apartment complex.', 1, 1706157979, 1706157979),
(742, '65b1e79bc17fd', 28, 'Write a post about the differences between buying a new construction home versus a pre-owned one.', 1, 1706157979, 1706157979),
(743, '65b1e79bc1bec', 28, 'Create a post featuring the best schools in {{ area }}.', 1, 1706157979, 1706157979),
(744, '65b1e79bc2075', 28, 'Write a post about how to negotiate a real estate deal.', 1, 1706157979, 1706157979),
(745, '65b1e79bc252a', 28, 'Create a post showcasing {{ unique property or architectural style }}.', 1, 1706157979, 1706157979),
(746, '65b1e79bc2989', 28, 'Write a post about the home buying or selling process in {{ local market }}.', 1, 1706157979, 1706157979),
(747, '65b1e79bc2dcd', 28, 'Write a post about how to choose the right real estate agent for your needs.', 1, 1706157979, 1706157979),
(748, '65b1e79bc31af', 28, 'Create a post featuring the top home renovation trends for increasing property value.', 1, 1706157979, 1706157979),
(749, '65b1e79bc3584', 28, 'Write a post about the pros and cons of renting versus buying a home.', 1, 1706157979, 1706157979),
(750, '65b1e79bc3953', 28, 'Write a post about the top mistakes to avoid when buying or selling a home.', 1, 1706157979, 1706157979),
(751, '65b1e79bc3d25', 28, 'Create a post showcasing a home with the following backstory:', 1, 1706157979, 1706157979),
(752, '65b1e79bc40ef', 28, 'Create a post featuring a comparison between properties in the city versus the suburbs.', 1, 1706157979, 1706157979),
(753, '65b1e79bc44bb', 28, 'Write a post about the importance of home inspections for homebuyers.', 1, 1706157979, 1706157979),
(754, '65b1e79bc486d', 28, 'Create a post featuring the best outdoor spaces in {{ area }} for homebuyers who love to entertain.', 1, 1706157979, 1706157979),
(755, '65b1e79bc4c34', 28, 'Write a post about how to effectively market a luxury property.', 1, 1706157979, 1706157979),
(756, '65b1e79bc5005', 28, 'Create a post featuring the best eco-friendly homes in {{ area }}.', 1, 1706157979, 1706157979),
(757, '65b1e79bc53c5', 28, 'Write a post about the importance of location when buying or selling a home.', 1, 1706157979, 1706157979),
(758, '65b1e79bc5770', 28, 'Create a caption for a post showcasing a home renovation before and after transformation.', 1, 1706157979, 1706157979),
(759, '65b1e79bc5b57', 28, 'Write a post about the benefits of using a real estate agent who specializes in {{ particular niche market }}.', 1, 1706157979, 1706157979),
(760, '65b1e79bc5f36', 28, 'Create a post featuring the best pet-friendly homes in {{ area }}.', 1, 1706157979, 1706157979),
(761, '65b1e79bc6318', 28, 'Write a post about how to successfully negotiate multiple offers on a home.', 1, 1706157979, 1706157979),
(762, '65b1e79bc6706', 28, 'Write a post about the benefits of pre-approval for a mortgage.', 1, 1706157979, 1706157979),
(763, '65b1e79bc6ae7', 28, 'Create a post featuring the best neighbourhoods for young families in {{ area }}.', 1, 1706157979, 1706157979),
(764, '65b1e79bc6eb9', 28, 'Write a post about how to handle a bidding war when buying a home.', 1, 1706157979, 1706157979),
(765, '65b1e79bc727b', 28, 'Create a caption for a post showcasing a property with a stunning view.', 1, 1706157979, 1706157979),
(766, '65b1e79bc763b', 28, 'Write a post about the benefits of staging a home with virtual staging.', 1, 1706157979, 1706157979),
(767, '65b1e79bc7a03', 28, 'Share a post about the hottest real estate trends in {{ area }}.', 1, 1706157979, 1706157979),
(768, '65b1e79bc7dc7', 28, 'Write a post about why investing in real estate is a smart financial decision.', 1, 1706157979, 1706157979),
(769, '65b1e79bc817f', 28, 'Create a social media post that highlights the benefits of living in {{ area }}.', 1, 1706157979, 1706157979),
(770, '65b1e79bc8541', 28, 'Create a social media post about the most important factors to consider when selling a property.', 1, 1706157979, 1706157979),
(771, '65b1e79bc8909', 28, 'Create a social media post about the most important factors to consider when investing in real estate.', 1, 1706157979, 1706157979),
(772, '65b1e79bc8cf5', 28, 'Create a social media post about the top real estate trends to watch in the coming year.', 1, 1706157979, 1706157979),
(773, '65b1e79bc90b2', 28, 'Create a social media post about the benefits of using social media to market your property.', 1, 1706157979, 1706157979),
(774, '65b1e79bc9472', 28, 'Create a social media post about how to stage a property for virtual tours.', 1, 1706157979, 1706157979),
(775, '65b1e79bc9829', 28, 'Create a social media post about the most common real estate myths and misconceptions.', 1, 1706157979, 1706157979),
(776, '65b1e79bc9c25', 28, 'Create a social media post about the most important factors to consider when choosing a mortgage.', 1, 1706157979, 1706157979),
(777, '65b1e79bca024', 28, 'Create a social media post about the top home design trends for the year.', 1, 1706157979, 1706157979),
(778, '65b1e79bca448', 29, 'Write a social media post thanking a volunteer who has made a difference for your non-profit organization.', 1, 1706157979, 1706157979),
(779, '65b1e79bca82b', 29, 'Write a caption for a social media post that features the following quote from someone who has been positively impacted by your non-profit organization\'s work:', 1, 1706157979, 1706157979),
(780, '65b1e79bcac20', 29, 'Create a post that promotes an upcoming fundraising event for {{ cause }}.', 1, 1706157979, 1706157979),
(781, '65b1e79bcbfef', 29, 'Write a post that shares tips on how people can get involved and support non-profits.', 1, 1706157979, 1706157979),
(782, '65b1e79bcc3fb', 29, 'Create a post that showcases {{ achievement }}.', 1, 1706157979, 1706157979),
(783, '65b1e79bcc7ef', 29, 'Write a post that highlights the importance of {{ program }}.', 1, 1706157979, 1706157979),
(784, '65b1e79bccbef', 29, 'Create a caption for a photo that showcases the team behind your non-profit and their passion for the cause.', 1, 1706157979, 1706157979),
(785, '65b1e79bcd023', 29, 'Create a post that asks for donations or support for {{ specific campaign }}.', 1, 1706157979, 1706157979),
(786, '65b1e79bcd40e', 29, 'Create a post that showcases the impact volunteers have on the success of non-profit organizations.', 1, 1706157979, 1706157979),
(787, '65b1e79bcd808', 29, 'Write a caption for a video montage of your non-profit\'s work in action.', 1, 1706157979, 1706157979),
(788, '65b1e79bcdbbe', 29, 'Create a post that highlights the importance of community involvement and support for your non-profit.', 1, 1706157979, 1706157979),
(789, '65b1e79bce041', 29, 'Write a post that showcases the impact of corporate sponsors or partners in supporting nonprofits.', 1, 1706157979, 1706157979),
(790, '65b1e79bce467', 29, 'Create a post that promotes an upcoming volunteer opportunity for {{ cause }}.', 1, 1706157979, 1706157979),
(791, '65b1e79bce89b', 29, 'Create a post that celebrates the work of your non-profit\'s staff and volunteers.', 1, 1706157979, 1706157979),
(792, '65b1e79bcec94', 29, 'Write a post that shares tips on how people can make a difference in their own communities.', 1, 1706157979, 1706157979),
(793, '65b1e79bcf08f', 29, 'Create a post that highlights the role of advocacy in your non-profit\'s mission.', 1, 1706157979, 1706157979),
(794, '65b1e79bcf4b2', 29, 'Write a post that showcases the impact of volunteering on {{ demographic }}.', 1, 1706157979, 1706157979),
(795, '65b1e79bcf870', 29, 'Create a post that provides answers to a list of 3 frequently asked questions about NGOs.', 1, 1706157979, 1706157979),
(796, '65b1e79bcfc69', 29, 'Create a post that promotes a new fundraising campaign for {{ cause }}.', 1, 1706157979, 1706157979),
(797, '65b1e79bd0082', 29, 'Create a post that highlights the importance of helping your community.', 1, 1706157979, 1706157979),
(798, '65b1e79bd049b', 29, 'Write a post that highlights the impact volunteers have on your organization\'s mission.', 1, 1706157979, 1706157979),
(799, '65b1e79bd08b2', 29, 'Write a post that highlights the importance of transparency and accountability in managing an NGO.', 1, 1706157979, 1706157979),
(800, '65b1e79bd0cc6', 29, 'Create a content idea for a social media post that raises awareness about {{ cause }}.', 1, 1706157979, 1706157979),
(801, '65b1e79bd10db', 29, 'Create a post that features a message of gratitude to donors, volunteers, and supporters of your non-profit organization.', 1, 1706157979, 1706157979),
(802, '65b1e79bd20d9', 29, 'Write a post that shares tips on how people can support your non-profit without making a financial donation.', 1, 1706157979, 1706157979),
(803, '65b1e79bd312c', 29, 'Create a post that promotes a collaborative partnership or initiative with {{ partner name }}.', 1, 1706157979, 1706157979),
(804, '65b1e79bd4159', 29, 'Write a post that highlights the importance of empathy and compassion.', 1, 1706157979, 1706157979),
(805, '65b1e79bd457d', 29, 'Create a caption for a post that features a \"throwback\" to an earlier time in your organization\'s history and how far you\'ve come.', 1, 1706157979, 1706157979),
(806, '65b1e79bd499c', 29, 'Create a post that shares a message of hope and inspiration to your followers, and encourages them to get involved with your non-profit\'s mission.', 1, 1706157979, 1706157979),
(807, '65b1e79bd4dc7', 30, 'Create a post showcasing {{ product/service }}.', 1, 1706157979, 1706157979),
(808, '65b1e79bd51ed', 30, 'Write a post that celebrates your business journey and expresses gratitude to your team.', 1, 1706157979, 1706157979),
(809, '65b1e79bd5604', 30, 'Create a post that celebrates {{ team member }} and their expertise in {{ role }}.', 1, 1706157979, 1706157979),
(810, '65b1e79bd5a2d', 30, 'Write a caption for a video that provides a behind-the-scenes look at your business.', 1, 1706157979, 1706157979),
(811, '65b1e79bd5e57', 30, 'Create a post that celebrates {{ accomplishment/milestone }}.', 1, 1706157979, 1706157979),
(812, '65b1e79bd629f', 30, 'Write a post that offers tips or advice related to {{ topic }}.', 1, 1706157979, 1706157979),
(813, '65b1e79bd66c0', 30, 'Create a caption for an image that features the following customer testimonial:', 1, 1706157979, 1706157979),
(814, '65b1e79bd6aea', 30, 'Create a post that showcases the following business values:', 1, 1706157979, 1706157979),
(815, '65b1e79bd6f0c', 30, 'Write a post that promotes {{ upcoming event }}.', 1, 1706157979, 1706157979),
(816, '65b1e79bd735f', 30, 'Write a caption for an image that offers a sneak peek of a {{ product }}.', 1, 1706157979, 1706157979),
(817, '65b1e79bd7788', 30, 'Create a caption for a post that shares a relevant news article or blog post about {{ topic }}.', 1, 1706157979, 1706157979),
(818, '65b1e79bd7b9c', 30, 'Write a post that asks your audience for feedback or suggestions for {{ product/service }}.', 1, 1706157979, 1706157979),
(819, '65b1e79bd7fa9', 30, 'Create a post about the struggles of being an entrepreneur.', 1, 1706157979, 1706157979),
(820, '65b1e79bd83c7', 30, 'Write a social media post around the following business quote:', 1, 1706157979, 1706157979),
(821, '65b1e79bd87c3', 30, 'Create a post that shares the following unique selling proposition:', 1, 1706157979, 1706157979),
(822, '65b1e79bd8cb8', 30, 'Write a post that offers a special promotion that consists of {{ discount }}.', 1, 1706157979, 1706157979),
(823, '65b1e79bd90c7', 30, 'Write a caption for a video that features a day in the life of a {{ profession }}.', 1, 1706157979, 1706157979),
(824, '65b1e79bd94ed', 30, 'Write a social media post that addresses potential obstacles or doubts {{ ideal customer persona }} may have about using {{ product/service }}.', 1, 1706157979, 1706157979),
(825, '65b1e79bd9947', 30, 'Create a post that shares an inspirational message about {{ topic }}.', 1, 1706157979, 1706157979),
(826, '65b1e79bd9d54', 30, 'Write a post that promotes a new blog post about {{ topic }}.', 1, 1706157979, 1706157979),
(827, '65b1e79bda0d7', 30, 'Create a post that showcases your company\'s commitment to {{ values }}.', 1, 1706157979, 1706157979),
(828, '65b1e79bda4d6', 30, 'Create a post that shares a relevant book recommendation for {{ goal }}.', 1, 1706157979, 1706157979),
(829, '65b1e79bda8a9', 30, 'Write a post that asks your audience to share their own success stories.', 1, 1706157979, 1706157979),
(830, '65b1e79bdac63', 30, 'Write a post that shares a relevant trend from {{ industry }}.', 1, 1706157979, 1706157979),
(831, '65b1e79bdb021', 30, 'Write a post that shares how to overcome professional challenges in {{ field }}.', 1, 1706157979, 1706157979),
(832, '65b1e79bdb3de', 30, 'Create a post that shares a lesson you\'ve learned as an entrepreneur.', 1, 1706157979, 1706157979),
(833, '65b1e79bdb7ac', 31, 'Create a post that highlights 3 marketing mistakes small businesses make.', 1, 1706157979, 1706157979),
(834, '65b1e79bdbb80', 31, 'Write a caption for a photo that showcases your team at the office.', 1, 1706157979, 1706157979),
(835, '65b1e79bdbf7d', 31, 'Create a post that announces {{ new service }} your agency is offering for {{ need }}.', 1, 1706157979, 1706157979),
(836, '65b1e79bdc3b0', 31, 'Write a post that highlights the importance of customer feedback in shaping effective marketing strategies.', 1, 1706157979, 1706157979),
(837, '65b1e79bdc7b6', 31, 'Share a post that talks about the role of storytelling in effective marketing.', 1, 1706157979, 1706157979),
(838, '65b1e79bdcbb2', 31, 'Write a post that shares the benefits of using social media analytics to inform marketing strategies.', 1, 1706157979, 1706157979),
(839, '65b1e79bdcfb7', 31, 'Share a post that highlights the importance of mobile optimization in website design.', 1, 1706157979, 1706157979),
(840, '65b1e79bdd3b8', 31, 'Create a post that showcases your agency\'s {{ service }}.', 1, 1706157979, 1706157979),
(841, '65b1e79bdd7bc', 31, 'Write a post that shares tips for creating effective video marketing content.', 1, 1706157979, 1706157979),
(842, '65b1e79bddbf1', 31, 'Write a post that promotes {{ upcoming event }}.', 1, 1706157979, 1706157979),
(843, '65b1e79bddfe3', 31, 'Create a post that shares 10 tips for success in marketing.', 1, 1706157979, 1706157979),
(844, '65b1e79bde40a', 31, 'Create a post that promotes your agency\'s referral program.', 1, 1706157979, 1706157979),
(845, '65b1e79bde807', 31, 'Create a post that showcases the impact of influencer marketing on business growth.', 1, 1706157979, 1706157979),
(846, '65b1e79bdebdf', 31, 'Write a caption for a post that announces a live Q&A session with one of your agency\'s team members about {{ topic }}.', 1, 1706157979, 1706157979),
(847, '65b1e79bdefb3', 31, 'Create a post that showcases the benefits of email segmentation in successful email marketing.', 1, 1706157979, 1706157979),
(848, '65b1e79bdf375', 31, 'Create a post that shares a fun fact about {{ topic }}.', 1, 1706157979, 1706157979),
(849, '65b1e79bdf741', 31, 'Create a post that shows appreciation for your customers.', 1, 1706157979, 1706157979),
(850, '65b1e79bdfb04', 31, 'Write a post that shares tips for managing your social media accounts as a {{ profession }}.', 1, 1706157979, 1706157979),
(851, '65b1e79bdfecf', 31, 'Create a post that shares tips for effective email marketing.', 1, 1706157979, 1706157979),
(852, '65b1e79be028f', 31, 'Create a post that shares tips for successful social media advertising.', 1, 1706157979, 1706157979),
(853, '65b1e79be0658', 31, 'Create a post that talks about marketing do\'s and don\'ts.', 1, 1706157979, 1706157979),
(854, '65b1e79be0a16', 31, 'Write a social media post about marketing myths.', 1, 1706157979, 1706157979),
(855, '65b1e79be0de1', 31, 'Write a post that shares tips for successful SEO.', 1, 1706157979, 1706157979),
(856, '65b1e79be11a4', 31, 'Write a post that shares marketing tools for {{ goal }}.', 1, 1706157979, 1706157979),
(857, '65b1e79be1575', 31, 'Create a post that shares tips for successful influencer marketing.', 1, 1706157979, 1706157979),
(858, '65b1e79be1931', 31, 'Write a post that shares tips for creating effective landing pages for lead generation.', 1, 1706157979, 1706157979),
(859, '65b1e79be1d14', 31, 'Write a post that shares tips for successful content creation.', 1, 1706157979, 1706157979),
(860, '65b1e79be2108', 31, 'Write a post that shares tips for successful customer engagement.', 1, 1706157979, 1706157979),
(861, '65b1e79be252c', 31, 'Create a post about marketing trends for {{ year }}.', 1, 1706157979, 1706157979),
(862, '65b1e79be2923', 31, 'Write a post that shares tips for successful customer retention.', 1, 1706157979, 1706157979),
(863, '65b1e79be2cf0', 31, 'Create a post that talks about how to overcome marketing challenges.', 1, 1706157979, 1706157979),
(864, '65b1e79be30b8', 31, 'Write a post that shares tips for successful mobile marketing.', 1, 1706157979, 1706157979),
(865, '65b1e79be345a', 31, 'Write a post that shares tips for successful PPC advertising.', 1, 1706157979, 1706157979),
(866, '65b1e79be388c', 31, 'Create a pun about marketing.', 1, 1706157979, 1706157979),
(867, '65b1e79be3e2d', 31, 'Write a post that shares tips for successful lead generation.', 1, 1706157979, 1706157979),
(868, '65b1e79be4356', 31, 'Create a post that promotes a recent industry article your agency published.', 1, 1706157979, 1706157979),
(869, '65b1e79be4738', 32, 'Create a post that promotes your latest book release and includes a CTA to purchase.', 1, 1706157979, 1706157979),
(870, '65b1e79be4b0b', 32, 'Create a post that shares writing tips for aspiring authors.', 1, 1706157979, 1706157979),
(871, '65b1e79be4f05', 32, 'Write a post that asks your audience for book recommendations.', 1, 1706157979, 1706157979),
(872, '65b1e79be5346', 32, 'Create a caption for a post that features a quote from your latest book and encourages followers to share their favorite quote from the book. Here is the quote:', 1, 1706157979, 1706157979),
(873, '65b1e79be573b', 32, 'Write a caption for a photo that offers a sneak peek of your upcoming book cover.', 1, 1706157979, 1706157979),
(874, '65b1e79be5b55', 32, 'Write a post that encourages your audience to share their writing goals for the year.', 1, 1706157979, 1706157979),
(875, '65b1e79be5f85', 32, 'Write a post that encourages your audience to share their favorite book covers and why they love them.', 1, 1706157979, 1706157979),
(876, '65b1e79be6407', 32, 'Create a post that shares writing resources or tools.', 1, 1706157979, 1706157979),
(877, '65b1e79be6845', 32, 'Write a post that encourages your followers to share their favorite writing blogs or podcasts.', 1, 1706157979, 1706157979),
(878, '65b1e79be6ceb', 32, 'Create a caption for an image that features a book excerpt or teaser.', 1, 1706157979, 1706157979),
(879, '65b1e79be718c', 32, 'Write a post that shares fun bookish quotes.', 1, 1706157979, 1706157979),
(880, '65b1e79be75d0', 32, 'Create a post that asks your audience for their favorite book genres.', 1, 1706157979, 1706157979),
(881, '65b1e79be79cf', 32, 'Write a post that shares writing quotes or mantras.', 1, 1706157979, 1706157979),
(882, '65b1e79be7d99', 32, 'Create a post that features a book giveaway or contest.', 1, 1706157979, 1706157979),
(883, '65b1e79be8176', 32, 'Write a post that shares writing prompts or exercises.', 1, 1706157979, 1706157979),
(884, '65b1e79be859d', 32, 'Create a post that showcases the importance of beta readers and how to find them.', 1, 1706157979, 1706157979),
(885, '65b1e79be8984', 32, 'Write a post that shares your favorite literary characters or books.', 1, 1706157979, 1706157979),
(886, '65b1e79be8d7c', 32, 'Create a post that offers writing advice for new authors.', 1, 1706157979, 1706157979),
(887, '65b1e79be91df', 32, 'Create a post that anounces an upcoming book signing in {{ date and location }}.', 1, 1706157979, 1706157979),
(888, '65b1e79be95dd', 32, 'Write a post that encourages your audience to share their favorite bookstores.', 1, 1706157979, 1706157979),
(889, '65b1e79be99a6', 32, 'Create a post that shares your writing challenges and how you overcome them.', 1, 1706157979, 1706157979),
(890, '65b1e79be9d75', 32, 'Create a post that shares your favorite writing prompts for overcoming writer\'s block.', 1, 1706157979, 1706157979),
(891, '65b1e79bea1af', 32, 'Write a post that encourages your audience to share their favorite writing apps or software.', 1, 1706157979, 1706157979),
(892, '65b1e79bea5b6', 32, 'Create a post that features a review of a writing-related book or resource.', 1, 1706157979, 1706157979),
(893, '65b1e79bea9c2', 32, 'Write a post that shares writing exercises for developing characters.', 1, 1706157979, 1706157979),
(894, '65b1e79beadb3', 32, 'Write a post that encourages your audience to share their favorite writing snacks or drinks.', 1, 1706157979, 1706157979),
(895, '65b1e79beb1a0', 32, 'Create a post that shares your favorite writing-related podcasts or YouTube channels.', 1, 1706157979, 1706157979),
(896, '65b1e79beb578', 32, 'Create a post that shares writing prompts for developing plot lines.', 1, 1706157979, 1706157979),
(897, '65b1e79bebcc7', 32, 'Create a post that highlights the importance of editing and proofreading.', 1, 1706157979, 1706157979),
(898, '65b1e79bec0d0', 32, 'Write a post that shares your favorite writing prompts for generating ideas.', 1, 1706157979, 1706157979),
(899, '65b1e79bec4e0', 32, 'Create a post that features a writing-related pun/funny quote.', 1, 1706157979, 1706157979),
(900, '65b1e79bec8cc', 32, 'Create a post that highlights {{ accomplishment }}.', 1, 1706157979, 1706157979),
(901, '65b1e79becccb', 32, 'Write a post that features a writing-related game or challenge for your followers.', 1, 1706157979, 1706157979),
(902, '65b1e79bed0e6', 32, 'Create a post that shares your favorite writing prompts for developing conflict.', 1, 1706157979, 1706157979),
(903, '65b1e79bed4ef', 32, 'Write a post that encourages your audience to share their favorite writing-related blogs or websites.', 1, 1706157979, 1706157979),
(904, '65b1e79bed94a', 32, 'Write a post that shares your favorite writing prompts for developing dialogue.', 1, 1706157979, 1706157979),
(905, '65b1e79bedd3c', 33, 'Write a post about the benefits of using an accounting firm to manage your finances.', 1, 1706157979, 1706157979),
(906, '65b1e79bee122', 33, 'Write a post explaining tax changes for the current year.', 1, 1706157979, 1706157979),
(907, '65b1e79bee523', 33, 'Create a series of posts on tax planning for small businesses.', 1, 1706157979, 1706157979),
(908, '65b1e79bee8bf', 33, 'Write a post about the importance of keeping financial records.', 1, 1706157979, 1706157979),
(909, '65b1e79beecc2', 33, 'Write a post about the role of technology in accounting.', 1, 1706157979, 1706157979),
(910, '65b1e79bef0c1', 33, 'Create a caption for a video tutorial on using accounting software.', 1, 1706157979, 1706157979),
(911, '65b1e79bef494', 33, 'Write a post about how to prepare for an IRS audit.', 1, 1706157979, 1706157979),
(912, '65b1e79bef8a9', 33, 'Create a quiz on accounting basics for small business owners.', 1, 1706157979, 1706157979),
(913, '65b1e79befc91', 33, 'Write a post about how to minimize tax liability for small businesses.', 1, 1706157979, 1706157979),
(914, '65b1e79bf0098', 33, 'Create a series of posts on bookkeeping best practices.', 1, 1706157979, 1706157979),
(915, '65b1e79bf0493', 33, 'Write a post about the differences between cash and accrual accounting.', 1, 1706157979, 1706157979),
(916, '65b1e79bf089c', 33, 'Write a post about the importance of budgeting.', 1, 1706157979, 1706157979),
(917, '65b1e79bf0c8b', 33, 'Create a social media post on how to create a business budget.', 1, 1706157979, 1706157979),
(918, '65b1e79bf1088', 33, 'Write a post about the benefits of hiring an outsourced accounting team.', 1, 1706157979, 1706157979),
(919, '65b1e79bf13f5', 33, 'Create a series of posts on how to manage cash flow for small businesses.', 1, 1706157979, 1706157979),
(920, '65b1e79bf1806', 33, 'Write a post about the top tax deductions for small businesses.', 1, 1706157979, 1706157979),
(921, '65b1e79bf1bd0', 33, 'Create a video on how to prepare for tax season.', 1, 1706157979, 1706157979),
(922, '65b1e79bf1f92', 33, 'Write a post about the role of the accounting department in a company.', 1, 1706157979, 1706157979),
(923, '65b1e79bf235c', 33, 'Write a post about the tax implications of starting a new business.', 1, 1706157979, 1706157979),
(924, '65b1e79bf2754', 33, 'Create a video on how to reconcile bank statements.', 1, 1706157979, 1706157979),
(925, '65b1e79bf2b86', 33, 'Write a post about the benefits of cloud-based accounting software.', 1, 1706157979, 1706157979),
(926, '65b1e79bf2fe0', 33, 'Create a series of posts on tax compliance for small businesses.', 1, 1706157979, 1706157979),
(927, '65b1e79bf33dc', 33, 'Write a post about how to create a financial plan for retirement.', 1, 1706157979, 1706157979),
(928, '65b1e79bf37c7', 33, 'Write a post about how to avoid common accounting mistakes.', 1, 1706157979, 1706157979),
(929, '65b1e79bf3bec', 33, 'Create a video on how to manage accounts payable and receivable.', 1, 1706157979, 1706157979),
(930, '65b1e79bf4037', 33, 'Write a post about the importance of accurate financial reporting.', 1, 1706157979, 1706157979);
INSERT INTO `sp_ai_prompt_templates` (`id`, `ids`, `pid`, `content`, `status`, `changed`, `created`) VALUES
(931, '65b1e79c00ff6', 33, 'Write a post about the benefits of having a dedicated accounting team.', 1, 1706157980, 1706157980),
(932, '65b1e79c01d9b', 33, 'Create an infographic on tax deductions for home-based businesses.', 1, 1706157980, 1706157980),
(933, '65b1e79c02917', 33, 'Write a post about how to choose the right accounting software for your business.', 1, 1706157980, 1706157980),
(934, '65b1e79c0307a', 33, 'Create a series of posts on tax planning for individuals.', 1, 1706157980, 1706157980),
(935, '65b1e79c034da', 33, 'Write a post about the differences between a CPA and an accountant.', 1, 1706157980, 1706157980),
(936, '65b1e79c03992', 33, 'Write a post about the benefits of using automation in accounting.', 1, 1706157980, 1706157980),
(937, '65b1e79c03e28', 33, 'Write a post about the importance of keeping track of inventory.', 1, 1706157980, 1706157980),
(938, '65b1e79c04258', 33, 'Create a series of posts on how to read financial statements.', 1, 1706157980, 1706157980),
(939, '65b1e79c0465a', 33, 'Write a post about how to create a chart of accounts.', 1, 1706157980, 1706157980),
(940, '65b1e79c04acf', 33, 'Create an infographic on tax credits for small businesses.', 1, 1706157980, 1706157980),
(941, '65b1e79c04ef8', 33, 'Create a series of posts on accounting for nonprofits.', 1, 1706157980, 1706157980),
(942, '65b1e79c0536d', 33, 'Create a series of posts on how to read and interpret financial ratios.', 1, 1706157980, 1706157980),
(943, '65b1e79c057e5', 33, 'Write a post about how to choose the right accounting method for your business.', 1, 1706157980, 1706157980),
(944, '65b1e79c05c56', 33, 'Create an interactive tool for calculating tax liability for different income levels.', 1, 1706157980, 1706157980),
(945, '65b1e79c060e0', 33, 'Write a post about the importance of financial literacy for entrepreneurs.', 1, 1706157980, 1706157980),
(946, '65b1e79c0654a', 33, 'Write a post about how to create a financial plan for a new business.', 1, 1706157980, 1706157980),
(947, '65b1e79c069c9', 33, 'Write a post about the benefits of having a virtual accounting team.', 1, 1706157980, 1706157980),
(948, '65b1e79c06e4c', 33, 'Write a post about how to minimize tax liability for freelancers and self-employed individuals.', 1, 1706157980, 1706157980),
(949, '65b1e79c07299', 33, 'Write a post about the importance of accurate record-keeping for small businesses.', 1, 1706157980, 1706157980),
(950, '65b1e79c0770b', 33, 'Create a series of posts on how to create and manage a budget for a nonprofit organization.', 1, 1706157980, 1706157980),
(951, '65b1e79c07b81', 33, 'Write a post about the benefits of outsourcing bookkeeping and accounting tasks.', 1, 1706157980, 1706157980),
(952, '65b1e79c07ff3', 33, 'Write a post about the differences between single-entry and double-entry bookkeeping.', 1, 1706157980, 1706157980),
(953, '65b1e79c08463', 33, 'Write a post about the tax implications of hiring independent contractors.', 1, 1706157980, 1706157980),
(954, '65b1e79c088bd', 33, 'Create a series of posts on how to calculate and track depreciation for fixed assets.', 1, 1706157980, 1706157980),
(955, '65b1e79c08d61', 33, 'Write a post about how to prepare for a tax audit.', 1, 1706157980, 1706157980),
(956, '65b1e79c09178', 33, 'Write a post about the role of accounting in business valuation.', 1, 1706157980, 1706157980),
(957, '65b1e79c09540', 33, 'Create a video on how to calculate break-even point for a small business.', 1, 1706157980, 1706157980),
(958, '65b1e79c09908', 33, 'Write a post about the benefits of having a financial advisor for retirement planning.', 1, 1706157980, 1706157980),
(959, '65b1e79c09cca', 33, 'Create a series of posts on how to manage accounts payable and receivable for a small business.', 1, 1706157980, 1706157980),
(960, '65b1e79c0a093', 33, 'Write a post about the tax implications of selling a business.', 1, 1706157980, 1706157980),
(961, '65b1e79c0a462', 33, 'Write a post about the differences between tax preparation and tax planning.', 1, 1706157980, 1706157980),
(962, '65b1e79c0a860', 34, 'Write a post inviting your followers to try your new seasonal menu items.', 1, 1706157980, 1706157980),
(963, '65b1e79c0ac5f', 34, 'Create a caption for a photo showcasing your restaurant\'s outdoor dining area.', 1, 1706157980, 1706157980),
(964, '65b1e79c0b043', 34, 'Create a caption for an image featuring a customer review and thanking them for their kind words.', 1, 1706157980, 1706157980),
(965, '65b1e79c0b440', 34, 'Write a post encouraging followers to visit your restaurant for a {{ event }}.', 1, 1706157980, 1706157980),
(966, '65b1e79c0b822', 34, 'Write a post asking followers for their favorite dishes at your restaurant and why.', 1, 1706157980, 1706157980),
(967, '65b1e79c0c851', 34, 'Create a post celebrating the anniversary of a team member.', 1, 1706157980, 1706157980),
(968, '65b1e79c0d83b', 34, 'Create a post highlighting your restaurant\'s efforts to use eco-friendly practices, such as composting or reducing waste.', 1, 1706157980, 1706157980),
(969, '65b1e79c0dc49', 34, 'Write a post showcasing your restaurant\'s private dining options for events and celebrations.', 1, 1706157980, 1706157980),
(970, '65b1e79c0e033', 34, 'Create a post featuring {{ recipe from your menu }} that followers can make at home.', 1, 1706157980, 1706157980),
(971, '65b1e79c0e440', 34, 'Write a post inviting followers to participate in a poll to determine the next featured dish on your menu.', 1, 1706157980, 1706157980),
(972, '65b1e79c0e801', 34, 'Create a post showcasing {{ your restaurant\'s happy hour specials }}.', 1, 1706157980, 1706157980),
(973, '65b1e79c0ec2a', 34, 'Write a post highlighting the history and significance of {{ dish from your menu }}.', 1, 1706157980, 1706157980),
(974, '65b1e79c0f0a0', 34, 'Write a post promoting a charity event or fundraiser hosted by your restaurant.', 1, 1706157980, 1706157980),
(975, '65b1e79c0f4b2', 34, 'Create a post featuring a special menu item created in honor of a holiday or special occasion.', 1, 1706157980, 1706157980),
(976, '65b1e79c0f8c9', 34, 'Write a post encouraging followers to share photos of their favorite dishes at your restaurant using a specific hashtag.', 1, 1706157980, 1706157980),
(977, '65b1e79c0fccc', 34, 'Create a post showcasing your restaurant\'s family-style or shared plates menu options.', 1, 1706157980, 1706157980),
(978, '65b1e79c100c8', 34, 'Write a post featuring a customer who has been a loyal patron of your restaurant for years.', 1, 1706157980, 1706157980),
(979, '65b1e79c10500', 34, 'Create a post promoting your restaurant\'s catering services for events.', 1, 1706157980, 1706157980),
(980, '65b1e79c114d2', 34, 'Write a post showcasing your restaurant\'s cocktail making or cooking classes.', 1, 1706157980, 1706157980),
(981, '65b1e79c118de', 34, 'Write a post highlighting your restaurant\'s vegetarian or vegan menu options.', 1, 1706157980, 1706157980),
(982, '65b1e79c11cd1', 34, 'Write a post promoting a discount or promotion for followers who share a post or tag a friend.', 1, 1706157980, 1706157980),
(983, '65b1e79c12188', 34, 'Create a post promoting your restaurant\'s brunch menu and mimosas.', 1, 1706157980, 1706157980),
(984, '65b1e79c125af', 34, 'Write a post featuring a recipe for a popular cocktail or drink at your restaurant.', 1, 1706157980, 1706157980),
(985, '65b1e79c129e5', 34, 'Create a caption for an image showcasing your restaurant\'s seasonal decor or ambiance.', 1, 1706157980, 1706157980),
(986, '65b1e79c12e05', 34, 'Write a post promoting your restaurant\'s food delivery or pickup options.', 1, 1706157980, 1706157980),
(987, '65b1e79c13243', 34, 'Write a post showcasing your restaurant\'s happy hour drink specials.', 1, 1706157980, 1706157980),
(988, '65b1e79c1367a', 34, 'Create a post promoting a giveaway or contest for followers who engage with your social media account.Write a post featuring cooking/dining tips.', 1, 1706157980, 1706157980),
(989, '65b1e79c13aa3', 34, 'Create a post showcasing your restaurant\'s efforts to reduce food waste or donate food to local charities.', 1, 1706157980, 1706157980),
(990, '65b1e79c13eba', 34, 'Create a post featuring a dish that is gluten-free, dairy-free, or otherwise allergy-friendly.', 1, 1706157980, 1706157980),
(991, '65b1e79c142b7', 34, 'Write a post featuring a dish that is perfect for a romantic date night.', 1, 1706157980, 1706157980),
(992, '65b1e79c1527b', 34, 'Write a post inviting followers to participate in a poll to determine the next cocktail special at your bar.', 1, 1706157980, 1706157980),
(993, '65b1e79c15671', 34, 'Write a post featuring a dish that is perfect for a family dinner or gathering.', 1, 1706157980, 1706157980),
(994, '65b1e79c15a6a', 35, 'Create a post featuring a healthy meal prep recipe that\'s easy to make at home.', 1, 1706157980, 1706157980),
(995, '65b1e79c15eb0', 35, 'Write a motivational message for people who are struggling to get started with their fitness journey.', 1, 1706157980, 1706157980),
(996, '65b1e79c16302', 35, 'Create a post showcasing your favorite workout equipment and why you love it.', 1, 1706157980, 1706157980),
(997, '65b1e79c1676e', 35, 'Write a post about the benefits of stretching before and after a workout.', 1, 1706157980, 1706157980),
(998, '65b1e79c16c00', 35, 'Create a post featuring your favorite exercise for building strength in the legs.', 1, 1706157980, 1706157980),
(999, '65b1e79c17056', 35, 'Write a post about how to stay active when traveling.', 1, 1706157980, 1706157980),
(1000, '65b1e79c17461', 35, 'Create a post featuring your favorite healthy snack for when you\'re on-the-go.', 1, 1706157980, 1706157980),
(1001, '65b1e79c178bd', 35, 'Write a post about how to build muscle mass for beginners.', 1, 1706157980, 1706157980),
(1002, '65b1e79c17cb6', 35, 'Create a post showcasing your favorite healthy smoothie recipe.', 1, 1706157980, 1706157980),
(1003, '65b1e79c180ae', 35, 'Write a motivational message about the importance of self-care.', 1, 1706157980, 1706157980),
(1004, '65b1e79c18488', 35, 'Create a post featuring your favorite fitness-related quote or mantra.', 1, 1706157980, 1706157980),
(1005, '65b1e79c1887d', 35, 'Write a post about how to stay motivated during a long-term fitness journey.', 1, 1706157980, 1706157980),
(1006, '65b1e79c18c88', 35, 'Create a post showcasing your favorite full-body workout routine.', 1, 1706157980, 1706157980),
(1007, '65b1e79c190ce', 35, 'Write a post about the benefits of working out in a group or with a partner.', 1, 1706157980, 1706157980),
(1008, '65b1e79c19488', 35, 'Create a post featuring your favorite yoga pose and its benefits.', 1, 1706157980, 1706157980),
(1009, '65b1e79c19872', 35, 'Write a post about the benefits of meditation for a healthy mind and body.', 1, 1706157980, 1706157980),
(1010, '65b1e79c19cd2', 35, 'Create a post showcasing your favorite exercise for building strength in the arms.', 1, 1706157980, 1706157980),
(1011, '65b1e79c1a0bd', 35, 'Write a post about the benefits of taking rest days during a fitness routine.', 1, 1706157980, 1706157980),
(1012, '65b1e79c1a4da', 35, 'Create a post featuring your favorite healthy breakfast recipe.', 1, 1706157980, 1706157980),
(1013, '65b1e79c1a8e4', 35, 'Write a motivational message about the importance of setting and achieving fitness goals.', 1, 1706157980, 1706157980),
(1014, '65b1e79c1b1df', 35, 'Create a post showcasing your favorite exercise for building core strength.', 1, 1706157980, 1706157980),
(1015, '65b1e79c1b60f', 35, 'Write a post about the benefits of outdoor workouts for mental health.', 1, 1706157980, 1706157980),
(1016, '65b1e79c1ba32', 35, 'Create a post featuring your favorite healthy dessert recipe.', 1, 1706157980, 1706157980),
(1017, '65b1e79c1be0b', 35, 'Write a post about the benefits of using a personal trainer to achieve fitness goals.', 1, 1706157980, 1706157980),
(1018, '65b1e79c1c1de', 35, 'Create a post showcasing your favorite exercise for building strength in the back.', 1, 1706157980, 1706157980),
(1019, '65b1e79c1c5c0', 35, 'Write a post about how to overcome common barriers to starting a fitness routine.', 1, 1706157980, 1706157980),
(1020, '65b1e79c1ca31', 35, 'Create a post featuring your favorite healthy snack recipe for post-workout recovery.', 1, 1706157980, 1706157980),
(1021, '65b1e79c1ce50', 35, 'Write a post about the benefits of incorporating resistance training into a fitness routine.', 1, 1706157980, 1706157980),
(1022, '65b1e79c1d21e', 35, 'Create a post showcasing your favorite exercise for building endurance.', 1, 1706157980, 1706157980),
(1023, '65b1e79c1d662', 35, 'Write a motivational message about the importance of self-discipline in achieving fitness goals.', 1, 1706157980, 1706157980),
(1024, '65b1e79c1daae', 35, 'Create a post featuring your favorite healthy lunch recipe.', 1, 1706157980, 1706157980),
(1025, '65b1e79c1de90', 35, 'Write a post about the benefits of using wearable fitness technology.', 1, 1706157980, 1706157980),
(1026, '65b1e79c1e2f1', 35, 'Create a post showcasing your favorite exercise for building balance and stability.', 1, 1706157980, 1706157980),
(1027, '65b1e79c1e72e', 35, 'Write a post about the importance of hydration for fitness and overall health.', 1, 1706157980, 1706157980),
(1028, '65b1e79c1eb37', 35, 'Create a post featuring your favorite healthy dinner recipe.', 1, 1706157980, 1706157980),
(1029, '65b1e79c1efb5', 35, 'Write a post about the benefits of high-intensity interval training (HIIT) for fat loss.', 1, 1706157980, 1706157980),
(1030, '65b1e79c1f429', 35, 'Create a post showcasing your favorite exercise for building flexibility.', 1, 1706157980, 1706157980),
(1031, '65b1e79c1f886', 35, 'Write a motivational message about the importance of consistency in achieving fitness goals.', 1, 1706157980, 1706157980),
(1032, '65b1e79c1fc89', 35, 'Create a post about how to stay active when working a sedentary job.', 1, 1706157980, 1706157980),
(1033, '65b1e79c200d3', 35, 'Write a post about the benefits of using social media to track and share fitness progress.', 1, 1706157980, 1706157980),
(1034, '65b1e79c2050a', 35, 'Create a post featuring your favorite healthy snack recipe for pre-workout energy.', 1, 1706157980, 1706157980),
(1035, '65b1e79c2091a', 35, 'Write a post about the benefits of incorporating plyometric exercises into a fitness routine.', 1, 1706157980, 1706157980),
(1036, '65b1e79c20d01', 35, 'Create a post showcasing your favorite exercise for building explosiveness.', 1, 1706157980, 1706157980),
(1037, '65b1e79c2110e', 35, 'Write a post about the benefits of a balanced diet for overall health and fitness.', 1, 1706157980, 1706157980),
(1038, '65b1e79c21527', 35, 'Create a post featuring your favorite healthy smoothie bowl recipe.', 1, 1706157980, 1706157980),
(1039, '65b1e79c218f2', 35, 'Write a motivational message about the importance of a positive mindset in achieving fitness goals.', 1, 1706157980, 1706157980),
(1040, '65b1e79c21cf8', 35, 'Create a post showcasing your favorite exercise for building endurance in the legs.', 1, 1706157980, 1706157980),
(1041, '65b1e79c220e0', 35, 'Create a post showcasing your favorite exercise for building upper body strength.', 1, 1706157980, 1706157980),
(1042, '65b1e79c22483', 35, 'Write a post about the benefits of foam rolling for recovery and injury prevention.', 1, 1706157980, 1706157980),
(1043, '65b1e79c22885', 35, 'Create a post featuring your favorite healthy snack recipe for before a workout.', 1, 1706157980, 1706157980),
(1044, '65b1e79c22c73', 35, 'Write a post about the benefits of incorporating balance exercises into a fitness routine.', 1, 1706157980, 1706157980),
(1045, '65b1e79c2308d', 35, 'Create a post showcasing your favorite exercise for building explosive power.', 1, 1706157980, 1706157980),
(1046, '65b1e79c234bc', 35, 'Write a motivational message about the importance of patience and persistence in achieving fitness goals.', 1, 1706157980, 1706157980),
(1047, '65b1e79c238d4', 35, 'Create a post featuring your favorite healthy smoothie recipe for post-workout recovery.', 1, 1706157980, 1706157980),
(1048, '65b1e79c23cba', 35, 'Write a post about the benefits of circuit training for overall fitness.', 1, 1706157980, 1706157980),
(1049, '65b1e79c240bc', 35, 'Create a post showcasing your favorite exercise for building core stability.', 1, 1706157980, 1706157980),
(1050, '65b1e79c244e4', 35, 'Write a post about the importance of setting realistic and achievable fitness goals.', 1, 1706157980, 1706157980),
(1051, '65b1e79c248be', 35, 'Create a post featuring your favorite healthy meal prep recipe for a busy week.', 1, 1706157980, 1706157980),
(1052, '65b1e79c24cbb', 35, 'Write a post about the benefits of using a foam roller for myofascial release.', 1, 1706157980, 1706157980),
(1053, '65b1e79c25100', 35, 'Create a post showcasing your favorite exercise for building strength in the chest.', 1, 1706157980, 1706157980),
(1054, '65b1e79c254e4', 35, 'Write a motivational message about the importance of self-belief in achieving fitness goals.', 1, 1706157980, 1706157980),
(1055, '65b1e79c258dc', 35, 'Create a post featuring your favorite healthy snack recipe for mid-day energy.', 1, 1706157980, 1706157980),
(1056, '65b1e79c25cb7', 35, 'Write a post about the benefits of incorporating resistance bands into a fitness routine.', 1, 1706157980, 1706157980),
(1057, '65b1e79c26086', 35, 'Create a post showcasing your favorite exercise for building lower body strength.', 1, 1706157980, 1706157980),
(1058, '65b1e79c26458', 35, 'Write a post about the importance of proper form and technique in avoiding injury during exercise.', 1, 1706157980, 1706157980),
(1059, '65b1e79c2686c', 35, 'Create a post featuring your favorite healthy smoothie recipe for a pre-workout boost.', 1, 1706157980, 1706157980),
(1060, '65b1e79c26c5a', 35, 'Write a post about the benefits of incorporating yoga into a fitness routine.', 1, 1706157980, 1706157980),
(1061, '65b1e79c27023', 36, 'Write a post about your favorite photography technique.', 1, 1706157980, 1706157980),
(1062, '65b1e79c27428', 36, 'Create a caption for a photo showcasing your latest portrait session.', 1, 1706157980, 1706157980),
(1063, '65b1e79c27878', 36, 'Write a post about creative photography inspiration sources.', 1, 1706157980, 1706157980),
(1064, '65b1e79c27c4c', 36, 'Create a post about the best process for selecting the perfect location for a photoshoot.', 1, 1706157980, 1706157980),
(1065, '65b1e79c28046', 36, 'Create a social media post announcing a photography contest. Offer a free photoshoot as the prize.', 1, 1706157980, 1706157980),
(1066, '65b1e79c28431', 36, 'Create a post about why a piece of equipment is essential for good photography.', 1, 1706157980, 1706157980),
(1067, '65b1e79c287e6', 36, 'Create a caption for a photo that features a before-and-after comparison of a photograph you\'ve edited.', 1, 1706157980, 1706157980),
(1068, '65b1e79c28bec', 36, 'Write a post about the importance of lighting in photography.', 1, 1706157980, 1706157980),
(1069, '65b1e79c29012', 36, 'Create a post about the different types of lenses and when to use them.', 1, 1706157980, 1706157980),
(1070, '65b1e79c293e3', 36, 'Create a post about the challenges and rewards of photographing pets.', 1, 1706157980, 1706157980),
(1071, '65b1e79c297da', 36, 'Write a post about the impact of social media on the photography industry.', 1, 1706157980, 1706157980),
(1072, '65b1e79c29bd0', 36, 'Write a post about your favorite editing software and why you prefer it.', 1, 1706157980, 1706157980),
(1073, '65b1e79c29fa8', 36, 'Create a post about the importance of communication between the photographer and the subject.', 1, 1706157980, 1706157980),
(1074, '65b1e79c2a378', 36, 'Write a post about the benefits of shooting in manual mode.', 1, 1706157980, 1706157980),
(1075, '65b1e79c2a76d', 36, 'Write a post recommending a series of photography books.', 1, 1706157980, 1706157980),
(1076, '65b1e79c2ab66', 36, 'Create a post sharing unique photography location ideas.', 1, 1706157980, 1706157980),
(1077, '65b1e79c2af6d', 36, 'Write a post about the role of photography in storytelling.', 1, 1706157980, 1706157980),
(1078, '65b1e79c2b3c8', 36, 'Create a post about the use of color in photography.', 1, 1706157980, 1706157980),
(1079, '65b1e79c2b7ca', 36, 'Write a post about the art of composition in photography.', 1, 1706157980, 1706157980),
(1080, '65b1e79c2bbcc', 36, 'Write a post about the importance of mentorship in photography.', 1, 1706157980, 1706157980),
(1081, '65b1e79c2c01c', 36, 'Create a post about the benefits of shooting with a prime lens.', 1, 1706157980, 1706157980),
(1082, '65b1e79c2c405', 36, 'Write a post featuring a series of macro photographs.', 1, 1706157980, 1706157980),
(1083, '65b1e79c2c80b', 36, 'Write a post about the importance of experimentation in photography.', 1, 1706157980, 1706157980),
(1084, '65b1e79c2cc05', 36, 'Write a post about the challenges of shooting in low light.', 1, 1706157980, 1706157980),
(1085, '65b1e79c2cff6', 36, 'Create a post about the use of negative space in photography.', 1, 1706157980, 1706157980),
(1086, '65b1e79c2d40c', 36, 'Write a post about the impact of technology on photography.', 1, 1706157980, 1706157980),
(1087, '65b1e79c2d834', 36, 'Create a post about the importance of good composition in photography.', 1, 1706157980, 1706157980),
(1088, '65b1e79c2dc4f', 36, 'Write a post about the use of leading lines in photography.', 1, 1706157980, 1706157980),
(1089, '65b1e79c2e057', 36, 'Write a post about the importance of patience in photography.', 1, 1706157980, 1706157980),
(1090, '65b1e79c2e446', 36, 'Create a post about the benefits of shooting with natural light.', 1, 1706157980, 1706157980),
(1091, '65b1e79c2e855', 36, 'Create a post about the role of photography in capturing memories.', 1, 1706157980, 1706157980),
(1092, '65b1e79c2ec6f', 36, 'Write a post about the challenges of shooting portraits.', 1, 1706157980, 1706157980),
(1093, '65b1e79c2f0a6', 36, 'Write a post about the importance of building relationships with clients.', 1, 1706157980, 1706157980),
(1094, '65b1e79c2f57e', 36, 'Write a post recommending photography podcasts or YouTube channels.', 1, 1706157980, 1706157980),
(1095, '65b1e79c2fa5f', 36, 'Write a post about your favorite photography quote and how it inspires you.', 1, 1706157980, 1706157980),
(1096, '65b1e79c2ff3b', 36, 'Write a post about the importance of understanding color theory in photography.', 1, 1706157980, 1706157980),
(1097, '65b1e79c3033b', 36, 'Write a post about the benefits of shooting in raw format.', 1, 1706157980, 1706157980),
(1098, '65b1e79c30732', 36, 'Write a post about the importance of storytelling in documentary photography.', 1, 1706157980, 1706157980),
(1099, '65b1e79c30b52', 36, 'Write a post about the importance of setting goals as a photographer.', 1, 1706157980, 1706157980),
(1100, '65b1e79c30f42', 36, 'Write a post about the role of photography in social justice and activism.', 1, 1706157980, 1706157980),
(1101, '65b1e79c31332', 36, 'Write a post about the challenges of photographing architecture and buildings.', 1, 1706157980, 1706157980),
(1102, '65b1e79c31714', 36, 'Write a post about the importance of diversity and representation in photography.', 1, 1706157980, 1706157980),
(1103, '65b1e79c31af1', 36, 'Write a post about the impact of film photography on modern photography.', 1, 1706157980, 1706157980),
(1104, '65b1e79c31ed4', 36, 'Write a post about the importance of maintaining a portfolio as a photographer.', 1, 1706157980, 1706157980),
(1105, '65b1e79c322bd', 36, 'Write a post about the benefits of working with a stylist or makeup artist for photoshoots.', 1, 1706157980, 1706157980);

-- --------------------------------------------------------

--
-- Table structure for table `sp_blogs`
--

CREATE TABLE `sp_blogs` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `content` longtext,
  `tags` text,
  `img` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '1',
  `created` int DEFAULT NULL,
  `changed` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_captions`
--

CREATE TABLE `sp_captions` (
  `id` int NOT NULL,
  `ids` varchar(255) NOT NULL,
  `team_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `changed` int NOT NULL,
  `created` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_coinpayments_history`
--

CREATE TABLE `sp_coinpayments_history` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `user` int DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `plan_by` int DEFAULT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `coin_amount` float DEFAULT NULL,
  `amount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_faqs`
--

CREATE TABLE `sp_faqs` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext,
  `status` int DEFAULT '1',
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_files`
--

CREATE TABLE `sp_files` (
  `id` int UNSIGNED NOT NULL,
  `ids` mediumtext,
  `is_folder` int NOT NULL DEFAULT '0',
  `pid` int DEFAULT '0',
  `team_id` int DEFAULT NULL,
  `name` mediumtext,
  `file` mediumtext,
  `type` mediumtext,
  `extension` mediumtext,
  `detect` text,
  `size` float DEFAULT NULL,
  `is_image` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `note` mediumtext,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sp_files`
--

INSERT INTO `sp_files` (`id`, `ids`, `is_folder`, `pid`, `team_id`, `name`, `file`, `type`, `extension`, `detect`, `size`, `is_image`, `width`, `height`, `note`, `created`) VALUES
(35, '67349f832e6d1', 0, 0, 1, '1.mp4', 'uploads/1731501955_a7559b270626c2dc8448.mp4', 'video/mp4', 'mp4', 'video', 4023880, 0, 0, 0, NULL, 1731501955),
(36, '6734aed8da4b3', 0, 0, 1, 'vecteezy_covid-19-illustration-in-3d-animation_3321288.mp4', 'uploads/1731505880_33003934891d3074fb3a.mp4', 'video/mp4', 'mp4', 'video', 14744000, 0, 0, 0, NULL, 1731505880);

-- --------------------------------------------------------

--
-- Table structure for table `sp_groups`
--

CREATE TABLE `sp_groups` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` longtext,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_language`
--

CREATE TABLE `sp_language` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `slug` varchar(32) DEFAULT NULL,
  `text` text,
  `custom` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_language_category`
--

CREATE TABLE `sp_language_category` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `dir` varchar(3) NOT NULL,
  `is_default` int DEFAULT NULL,
  `auto_translate` varchar(32) DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_options`
--

CREATE TABLE `sp_options` (
  `id` int NOT NULL,
  `name` longtext NOT NULL,
  `value` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sp_options`
--

INSERT INTO `sp_options` (`id`, `name`, `value`) VALUES
(157, 'base_url', 'http://localhost:9030'),
(158, 'sidebar_icon_color', '0'),
(159, 'site_icon_color', '#006dff'),
(160, 'facebook_client_id', '1284354009407981'),
(161, 'facebook_client_secret', 'e9fe6fe1397a1281040633e666de8660'),
(162, 'facebook_app_version', 'v18.0'),
(163, 'instagram_client_id', '1284354009407981'),
(164, 'instagram_client_secret', 'e9fe6fe1397a1281040633e666de8660'),
(165, 'instagram_app_version', 'v18.0'),
(166, 'instagram_official_status', '1'),
(167, 'twitter_client_id', ''),
(168, 'twitter_client_secret', ''),
(169, 'twitter_consumer_key', ''),
(170, 'twitter_consumer_secret', ''),
(171, 'twitter_bearer_token', ''),
(172, 'beamer_status', '0'),
(173, 'frontend_template', 'Stackblue'),
(174, 'google_recaptcha_status', '0'),
(175, 'google_login_status', '0'),
(176, 'facebook_login_status', '0'),
(177, 'twitter_login_status', '0'),
(178, 'signup_status', '1'),
(179, 'website_keyword', 'social network, marketing, brands, businesses, agencies, individuals'),
(180, 'website_description', 'Let start to manage your social media so that you have more time for your business.'),
(181, 'website_title', '#1 Exceptional Social Media Management &amp; Analysis Platform'),
(182, 'website_favicon', 'http://localhost:9030/assets/img/favicon.svg'),
(183, 'website_logo_color', 'http://localhost:9030/assets/img/logo-color.svg'),
(184, 'gdpr_status', '1'),
(185, 'landing_page_status', '1'),
(186, 'facebook_profile_cookie_status', '1'),
(187, 'social_page_facebook', ''),
(188, 'social_page_twitter', ''),
(189, 'social_page_pinterest', ''),
(190, 'social_page_youtube', ''),
(191, 'social_page_tiktok', ''),
(192, 'social_page_instagram', ''),
(193, 'shortlink_bitly_status', ''),
(194, 'format_date', 'd/m/Y'),
(195, 'theme_color', 'light'),
(196, 'format_datetime', 'd/m/Y g:i A'),
(197, 'sidebar_type', 'sidebar-small'),
(198, 'website_logo_mark', 'http://localhost:9030/assets/img/logo.svg'),
(199, 'poupup_nofification_backend_status', '0'),
(200, 'embed_code_status', '1'),
(201, 'embed_code', ''),
(202, 'fm_allow_extensions', 'jpeg,gif,png,jpg,mp4,csv,pdf,mp3,webp'),
(203, 'fm_storage_server', 'direct'),
(204, 'fm_aws_region', ''),
(205, 'fm_aws_access_key', ''),
(206, 'fm_aws_bucket_name', ''),
(207, 'fm_aws_secret_access_key', ''),
(208, 'fm_contabo_region', ''),
(209, 'fm_contabo_access_key', ''),
(210, 'fm_contabo_bucket_name', ''),
(211, 'fm_contabo_secret_access_key', ''),
(212, 'fm_contabo_public_url', ''),
(213, 'fm_google_dropbox_status', '0'),
(214, 'fm_google_drive_status', '0'),
(215, 'fm_google_onedrive_status', '0'),
(216, 'fm_adobe_status', '0'),
(217, 'openai_status', '0'),
(218, 'activation_email_status', '0'),
(219, 'welcome_email_status', '0'),
(220, 'accept_change_email', '1'),
(221, 'accept_change_username', '1'),
(222, 'signup_phone_number', '0'),
(223, 'google_recaptcha_site_key', ''),
(224, 'google_recaptcha_secret_key', ''),
(225, 'facebook_login_app_id', ''),
(226, 'facebook_login_app_secret', ''),
(227, 'facebook_login_app_version', 'v18.0'),
(228, 'google_login_client_id', ''),
(229, 'google_login_client_secret', ''),
(230, 'twitter_login_client_id', ''),
(231, 'twitter_login_client_secret', ''),
(232, 'fm_medias_per_page', '36'),
(233, 'fm_allow_upload_via_url', '1'),
(234, 'fm_adobe_client_id', ''),
(235, 'fm_unsplash_status', '0'),
(236, 'fm_unsplash_app_id', ''),
(237, 'fm_unsplash_access_key', ''),
(238, 'fm_unsplash_secret_key', ''),
(239, 'fm_pexels_status', '0'),
(240, 'fm_pexels_api_key', ''),
(241, 'fm_pixabay_status', '0'),
(242, 'fm_pixabay_api_key', ''),
(243, 'fm_google_api_key', ''),
(244, 'fm_google_client_id', ''),
(245, 'fm_dropbox_api_key', ''),
(246, 'fm_onedrive_api_key', ''),
(247, 'beamer_product_id', ''),
(248, 'poupup_nofification_id_backend', '6701654d7154d'),
(249, 'poupup_nofification_repeat_backend', '60'),
(250, 'poupup_nofification_backend', ''),
(251, 'poupup_nofification_frontend_status', '0'),
(252, 'poupup_nofification_id_frontend', '6701654d748ed'),
(253, 'poupup_nofification_repeat_frontend', '60'),
(254, 'poupup_nofification_frontend', ''),
(255, 'openai_api_key', ''),
(256, 'openai_default_model', 'gpt-3.5-turbo'),
(257, 'openai_default_dalle_model', 'dall-e-3'),
(258, 'openai_default_language', 'en-US'),
(259, 'openai_default_tone_of_voice', 'Polite'),
(260, 'openai_default_creativity', '0.75'),
(261, 'openai_default_max_input_lenght', '1000'),
(262, 'openai_default_max_output_lenght', '50'),
(263, 'http_to_https_status', '0'),
(264, 'terms_of_use', ''),
(265, 'privacy_policy', ''),
(266, 'website_logo_light', 'http://localhost:9030/assets/img/logo-light.svg'),
(267, 'website_logo_black', 'http://localhost:9030/assets/img/logo-black.svg'),
(268, 'shortlink_bitly_client_id', ''),
(269, 'shortlink_bitly_client_secret', ''),
(270, 'coinpayments_status', '0'),
(271, 'coinpayments_public_coin', 'BTC'),
(272, 'coinpayments_public_key', ''),
(273, 'coinpayments_private_key', ''),
(274, 'coinpayments_merchant_id', ''),
(275, 'coinpayments_ipn_secrect', ''),
(276, 'payment_environment', '0'),
(277, 'email_payment_success', '0'),
(278, 'email_payment_renewal_reminders', '0'),
(279, 'payment_currency', 'USD'),
(280, 'payment_symbol', '$'),
(281, 'paypal_one_time_status', '1'),
(282, 'paypal_recurring_status', '0'),
(283, 'paypal_client_id', ''),
(284, 'paypal_client_secret_key', ''),
(285, 'paypal_webhook_id', ''),
(286, 'stripe_one_time_status', '0'),
(287, 'stripe_recurring_status', '0'),
(288, 'stripe_publishable_key', ''),
(289, 'stripe_secret_key', ''),
(290, 'stripe_webhook_id', ''),
(291, 'gmb_client_id', ''),
(292, 'gmb_api_secret', ''),
(293, 'gmb_api_key', ''),
(294, 'linkedin_api_key', '77za63cygqir99'),
(295, 'linkedin_api_secret', 'WPL_AP1.wWLLiNc288kiAMJl.JrDKtQ=='),
(296, 'pinterest_app_id', ''),
(297, 'pinterest_app_secret', ''),
(298, 'vk_app_id', ''),
(299, 'vk_secure_secret', ''),
(300, 'facebook_profile_official_status', '1'),
(301, 'facebook_page_official_status', '1'),
(302, 'instagram_unofficial_status', '1'),
(303, 'facebook_page_cookie_status', '1'),
(304, 'facebook_page_permissions', 'pages_read_engagement,pages_manage_posts,pages_show_list,business_management'),
(305, 'facebook_profile_permissions', ''),
(306, 'instagram_permissions', 'instagram_basic,instagram_content_publish,pages_read_engagement,business_management'),
(307, 'twitter_official_status', '1'),
(308, 'twitter_cookie_status', '1'),
(309, 'tiktok_server_url', 'http://shopping-scene-social-media-tiktok:8008/'),
(310, 'youtube_client_id', '7277960223-a8sc2pj1u4ml1dfbd2ujj2jn9qj9pffl.apps.googleusercontent.com'),
(311, 'youtube_api_secret', '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'),
(312, 'youtube_api_key', 'AIzaSyA1xZytSTKpq92S2RGL-V15ISTqyORApUM'),
(313, 'whatsapp_server_url', ''),
(314, 'facebook_group_official_status', '1'),
(315, 'facebook_group_cookie_status', '1'),
(316, 'facebook_group_permissions', 'publish_to_groups'),
(317, 'linkedin_page_status', '1'),
(318, 'pinterest_official', '1'),
(319, 'pinterest_unofficial', '1'),
(320, 'pinterest_environment', '0');

-- --------------------------------------------------------

--
-- Table structure for table `sp_payment_history`
--

CREATE TABLE `sp_payment_history` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `plan` int DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `by` int DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_payment_subscriptions`
--

CREATE TABLE `sp_payment_subscriptions` (
  `id` int NOT NULL,
  `ids` text,
  `uid` int DEFAULT NULL,
  `plan` int DEFAULT NULL,
  `by` int DEFAULT NULL,
  `type` text,
  `subscription_id` text,
  `customer_id` text,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_plans`
--

CREATE TABLE `sp_plans` (
  `id` int UNSIGNED NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `type` int DEFAULT NULL,
  `price_monthly` float DEFAULT NULL,
  `price_annually` float DEFAULT NULL,
  `plan_type` int DEFAULT NULL,
  `number_accounts` int DEFAULT NULL,
  `trial_day` float DEFAULT NULL,
  `featured` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `permissions` mediumtext,
  `data` mediumtext,
  `status` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sp_plans`
--

INSERT INTO `sp_plans` (`id`, `ids`, `name`, `description`, `type`, `price_monthly`, `price_annually`, `plan_type`, `number_accounts`, `trial_day`, `featured`, `position`, `permissions`, `data`, `status`) VALUES
(1, 'de39a2bd850', 'Free & Trial', 'Try us out today', 1, 0, 0, 1, 100, -1, 0, 0, '{\"dashboard\":\"1\",\"post\":\"1\",\"facebook_post\":\"1\",\"google_business_profile_post\":\"1\",\"instagram_post\":\"1\",\"linkedin_post\":\"1\",\"pinterest_post\":\"1\",\"telegram_post\":\"1\",\"twitter_post\":\"1\",\"vk_post\":\"1\",\"youtube_post\":\"1\",\"bulk_post\":\"1\",\"drafts\":\"1\",\"schedules\":\"1\",\"account_manager\":\"1\",\"whatsapp_profiles\":\"1\",\"facebook_profiles\":\"1\",\"facebook_groups\":\"1\",\"facebook_pages\":\"1\",\"instagram_profiles\":\"1\",\"twitter_profiles\":\"1\",\"youtube_profiles\":\"1\",\"google_business_profiles\":\"1\",\"linkedin_profiles\":\"1\",\"linkedin_pages\":\"1\",\"pinterest_boards\":\"1\",\"telegram_channels\":\"1\",\"telegram_groups\":\"1\",\"vk_profiles\":\"1\",\"vk_pages\":\"1\",\"vk_groups\":\"1\",\"file_manager\":\"1\",\"file_manager_google_drive\":\"1\",\"file_manager_dropbox\":\"1\",\"file_manager_onedrive\":\"1\",\"file_manager_photo\":\"1\",\"file_manager_video\":\"1\",\"file_manager_other_type\":\"1\",\"file_manager_image_editor\":\"1\",\"max_storage_size\":\"10000\",\"max_file_size\":\"100\",\"tools\":\"1\",\"watermark\":\"1\",\"group_manager\":\"1\",\"caption\":\"1\",\"teams\":\"1\",\"proxies\":\"1\",\"shortlink\":\"1\",\"openai\":\"1\",\"openai_content\":\"1\",\"openai_image\":\"1\",\"openai_limit_tokens\":\"1000000\",\"plan_type\":1,\"number_accounts\":\"100\"}', NULL, 1),
(2, 'de39a2bd851', 'Standard', 'Affordable and accessible', 2, 29, 19, 2, 3, 0, 0, 5, '{\"dashboard\":\"1\",\"post\":\"1\",\"facebook_post\":\"1\",\"instagram_post\":\"1\",\"linkedin_post\":\"1\",\"ok_post\":\"1\",\"pinterest_post\":\"1\",\"reddit_post\":\"1\",\"telegram_post\":\"1\",\"tumblr_post\":\"1\",\"twitter_post\":\"1\",\"vk_post\":\"1\",\"youtube_post\":\"1\",\"bulk_post\":\"1\",\"rss_post\":\"1\",\"analytics\":\"1\",\"facebook_analytics\":\"1\",\"instagram_analytics\":\"1\",\"twitter_analytics\":\"1\",\"whatsapp\":\"1\",\"whatsapp_profile\":\"1\",\"whatsapp_bulk\":\"1\",\"whatsapp_autoresponder\":\"1\",\"whatsapp_chatbot\":\"1\",\"whatsapp_export_participants\":\"1\",\"whatsapp_contact\":\"1\",\"whatsapp_api\":\"1\",\"whatsapp_button_template\":\"1\",\"whatsapp_list_message_template\":\"1\",\"whatsapp_send_media\":\"1\",\"whatsapp_autoresponser_delay\":\"1\",\"whatsapp_chatbot_item_limit\":\"50\",\"whatsapp_bulk_schedule_by_times\":\"1\",\"whatsapp_bulk_max_run\":\"10\",\"whatsapp_bulk_max_contact_group\":\"50\",\"whatsapp_bulk_max_phone_numbers\":\"5000\",\"whatsapp_message_per_month\":\"50000\",\"drafts\":\"1\",\"schedules\":\"1\",\"account_manager\":\"1\",\"whatsapp_profiles\":\"1\",\"facebook_profiles\":\"1\",\"facebook_groups\":\"1\",\"facebook_pages\":\"1\",\"instagram_profiles\":\"1\",\"twitter_profiles\":\"1\",\"youtube_profiles\":\"1\",\"google_business_profiles\":\"1\",\"linkedin_profiles\":\"1\",\"linkedin_pages\":\"1\",\"pinterest_boards\":\"1\",\"pinterest_profiles\":\"1\",\"reddit_profiles\":\"1\",\"tumblr_blogs\":\"1\",\"telegram_channels\":\"1\",\"telegram_groups\":\"1\",\"ok_groups\":\"1\",\"vk_profiles\":\"1\",\"vk_pages\":\"1\",\"vk_groups\":\"1\",\"file_manager\":\"1\",\"file_manager_google_drive\":\"1\",\"file_manager_dropbox\":\"1\",\"file_manager_onedrive\":\"1\",\"file_manager_photo\":\"1\",\"file_manager_video\":\"1\",\"file_manager_other_type\":\"1\",\"file_manager_image_editor\":\"1\",\"max_storage_size\":\"100\",\"max_file_size\":\"2\",\"tools\":\"1\",\"watermark\":\"1\",\"group_manager\":\"1\",\"caption\":\"1\",\"teams\":\"1\",\"proxies\":\"1\",\"shortlink\":\"1\",\"openai\":\"1\",\"openai_content\":\"1\",\"openai_image\":\"1\",\"openai_limit_tokens\":\"1000\",\"plan_type\":2,\"number_accounts\":\"3\"}', NULL, 1),
(3, 'de39a2bd852', 'Premium', 'Elevate your experience', 2, 39, 29, 1, 6, 0, 1, 10, '{\"dashboard\":\"1\",\"post\":\"1\",\"facebook_post\":\"1\",\"google_business_profile_post\":\"1\",\"instagram_post\":\"1\",\"linkedin_post\":\"1\",\"ok_post\":\"1\",\"pinterest_post\":\"1\",\"reddit_post\":\"1\",\"telegram_post\":\"1\",\"tumblr_post\":\"1\",\"twitter_post\":\"1\",\"vk_post\":\"1\",\"youtube_post\":\"1\",\"bulk_post\":\"1\",\"rss_post\":\"1\",\"analytics\":\"1\",\"facebook_analytics\":\"1\",\"instagram_analytics\":\"1\",\"twitter_analytics\":\"1\",\"whatsapp\":\"1\",\"whatsapp_profile\":\"1\",\"whatsapp_bulk\":\"1\",\"whatsapp_autoresponder\":\"1\",\"whatsapp_chatbot\":\"1\",\"whatsapp_export_participants\":\"1\",\"whatsapp_contact\":\"1\",\"whatsapp_api\":\"1\",\"whatsapp_button_template\":\"1\",\"whatsapp_list_message_template\":\"1\",\"whatsapp_send_media\":\"1\",\"whatsapp_autoresponser_delay\":\"1\",\"whatsapp_chatbot_item_limit\":\"20\",\"whatsapp_bulk_schedule_by_times\":\"1\",\"whatsapp_bulk_max_run\":\"5\",\"whatsapp_bulk_max_contact_group\":\"5\",\"whatsapp_bulk_max_phone_numbers\":\"5000\",\"whatsapp_message_per_month\":\"10000\",\"drafts\":\"1\",\"schedules\":\"1\",\"account_manager\":\"1\",\"whatsapp_profiles\":\"1\",\"facebook_profiles\":\"1\",\"facebook_groups\":\"1\",\"facebook_pages\":\"1\",\"instagram_profiles\":\"1\",\"twitter_profiles\":\"1\",\"youtube_profiles\":\"1\",\"google_business_profiles\":\"1\",\"linkedin_profiles\":\"1\",\"linkedin_pages\":\"1\",\"pinterest_boards\":\"1\",\"pinterest_profiles\":\"1\",\"reddit_profiles\":\"1\",\"tumblr_blogs\":\"1\",\"telegram_channels\":\"1\",\"telegram_groups\":\"1\",\"ok_groups\":\"1\",\"vk_profiles\":\"1\",\"vk_pages\":\"1\",\"vk_groups\":\"1\",\"file_manager\":\"1\",\"file_manager_google_drive\":\"1\",\"file_manager_dropbox\":\"1\",\"file_manager_onedrive\":\"1\",\"file_manager_photo\":\"1\",\"file_manager_video\":\"1\",\"file_manager_other_type\":\"1\",\"file_manager_image_editor\":\"1\",\"max_storage_size\":\"500\",\"max_file_size\":\"5\",\"tools\":\"1\",\"watermark\":\"1\",\"group_manager\":\"1\",\"caption\":\"1\",\"teams\":\"1\",\"proxies\":\"1\",\"shortlink\":\"1\",\"openai\":\"1\",\"openai_content\":\"1\",\"openai_image\":\"1\",\"openai_limit_tokens\":\"10000\",\"plan_type\":1,\"number_accounts\":\"6\"}', NULL, 1),
(4, 'de39a2bd853', 'Entrepreneur', 'Your path to success', 2, 69, 59, 1, 10, 0, 0, 15, '{\"dashboard\":\"1\",\"post\":\"1\",\"facebook_post\":\"1\",\"google_business_profile_post\":\"1\",\"instagram_post\":\"1\",\"linkedin_post\":\"1\",\"ok_post\":\"1\",\"pinterest_post\":\"1\",\"reddit_post\":\"1\",\"telegram_post\":\"1\",\"tumblr_post\":\"1\",\"twitter_post\":\"1\",\"vk_post\":\"1\",\"youtube_post\":\"1\",\"bulk_post\":\"1\",\"rss_post\":\"1\",\"analytics\":\"1\",\"facebook_analytics\":\"1\",\"instagram_analytics\":\"1\",\"twitter_analytics\":\"1\",\"whatsapp\":\"1\",\"whatsapp_profile\":\"1\",\"whatsapp_bulk\":\"1\",\"whatsapp_autoresponder\":\"1\",\"whatsapp_chatbot\":\"1\",\"whatsapp_export_participants\":\"1\",\"whatsapp_contact\":\"1\",\"whatsapp_api\":\"1\",\"whatsapp_button_template\":\"1\",\"whatsapp_list_message_template\":\"1\",\"whatsapp_send_media\":\"1\",\"whatsapp_autoresponser_delay\":\"1\",\"whatsapp_chatbot_item_limit\":\"50\",\"whatsapp_bulk_schedule_by_times\":\"1\",\"whatsapp_bulk_max_run\":\"100\",\"whatsapp_bulk_max_contact_group\":\"100\",\"whatsapp_bulk_max_phone_numbers\":\"50000\",\"whatsapp_message_per_month\":\"100000\",\"drafts\":\"1\",\"schedules\":\"1\",\"account_manager\":\"1\",\"whatsapp_profiles\":\"1\",\"facebook_profiles\":\"1\",\"facebook_groups\":\"1\",\"facebook_pages\":\"1\",\"instagram_profiles\":\"1\",\"twitter_profiles\":\"1\",\"youtube_profiles\":\"1\",\"google_business_profiles\":\"1\",\"linkedin_profiles\":\"1\",\"linkedin_pages\":\"1\",\"pinterest_boards\":\"1\",\"pinterest_profiles\":\"1\",\"reddit_profiles\":\"1\",\"tumblr_blogs\":\"1\",\"telegram_channels\":\"1\",\"telegram_groups\":\"1\",\"ok_groups\":\"1\",\"vk_profiles\":\"1\",\"vk_pages\":\"1\",\"vk_groups\":\"1\",\"file_manager\":\"1\",\"file_manager_google_drive\":\"1\",\"file_manager_dropbox\":\"1\",\"file_manager_onedrive\":\"1\",\"file_manager_photo\":\"1\",\"file_manager_video\":\"1\",\"file_manager_other_type\":\"1\",\"file_manager_image_editor\":\"1\",\"max_storage_size\":\"1000\",\"max_file_size\":\"10\",\"tools\":\"1\",\"watermark\":\"1\",\"group_manager\":\"1\",\"caption\":\"1\",\"teams\":\"1\",\"proxies\":\"1\",\"shortlink\":\"1\",\"openai\":\"1\",\"openai_content\":\"1\",\"openai_image\":\"1\",\"openai_limit_tokens\":\"50000\",\"plan_type\":1,\"number_accounts\":\"10\"}', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sp_platform`
--

CREATE TABLE `sp_platform` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `platform_id` int DEFAULT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `color` varchar(250) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `default_page` varchar(255) NOT NULL,
  `is_default` int DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sp_platform`
--

INSERT INTO `sp_platform` (`id`, `ids`, `platform_id`, `icon`, `color`, `name`, `default_page`, `is_default`, `status`) VALUES
(1, '67016190ae081', 1, 'fad fa-paper-plane', '#ff0e0e', 'Social Media Management', 'dashboard', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sp_posts`
--

CREATE TABLE `sp_posts` (
  `id` int UNSIGNED NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `social_network` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `function` varchar(50) NOT NULL,
  `api_type` int DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `method` varchar(15) DEFAULT NULL,
  `query_id` int DEFAULT NULL,
  `data` longtext,
  `time_post` int DEFAULT NULL,
  `delay` int DEFAULT NULL,
  `repost_frequency` int DEFAULT NULL,
  `repost_until` int DEFAULT NULL,
  `result` text,
  `tmp` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sp_posts`
--

INSERT INTO `sp_posts` (`id`, `ids`, `team_id`, `account_id`, `social_network`, `category`, `function`, `api_type`, `type`, `method`, `query_id`, `data`, `time_post`, `delay`, `repost_frequency`, `repost_until`, `result`, `tmp`, `status`, `changed`, `created`) VALUES
(54, '6734aab180c9c', 1, 30, 'facebook', 'page', 'post', 1, 'media', NULL, NULL, '{\"caption\":\"Hello\",\"link\":\"\",\"medias\":[\"uploads\\/1731501955_a7559b270626c2dc8448.mp4\"],\"advance_options\":{\"fb_post_type\":\"default\",\"fb_story_link\":\"\",\"ig_post_type\":\"media\",\"ig_first_comment\":\"\",\"youtube_title\":\"\",\"youtube_category\":\"0\",\"youtube_tags\":\"\",\"gmb_call\":\"LEARN_MORE\",\"gmb_link\":\"\",\"pinterest_title\":\"\",\"pinterest_link\":\"\"}}', 1731504817, 5, 0, NULL, '{\"message\":\"Undefined variable $params\"}', NULL, 4, 1731504817, 1731504817),
(55, '6734abac10221', 1, 30, 'facebook', 'page', 'post', 1, 'media', NULL, NULL, '{\"caption\":\"Hello\",\"link\":\"\",\"medias\":[\"uploads\\/1731501955_a7559b270626c2dc8448.mp4\"],\"advance_options\":{\"fb_post_type\":\"default\",\"fb_story_link\":\"\",\"ig_post_type\":\"media\",\"ig_first_comment\":\"\",\"youtube_title\":\"\",\"youtube_category\":\"0\",\"youtube_tags\":\"\",\"gmb_call\":\"LEARN_MORE\",\"gmb_link\":\"\",\"pinterest_title\":\"\",\"pinterest_link\":\"\"}}', 1731505068, 5, 0, NULL, '{\"message\":\"Undefined variable $params\"}', NULL, 4, 1731505068, 1731505068);

-- --------------------------------------------------------

--
-- Table structure for table `sp_proxies`
--

CREATE TABLE `sp_proxies` (
  `id` int UNSIGNED NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `team_id` int DEFAULT '0',
  `is_system` int DEFAULT NULL,
  `proxy` varchar(255) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `limit` float DEFAULT NULL,
  `plans` varchar(255) DEFAULT NULL,
  `active` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_purchases`
--

CREATE TABLE `sp_purchases` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `item_id` varchar(32) DEFAULT NULL,
  `is_main` int DEFAULT NULL,
  `purchase_code` varchar(64) DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sp_purchases`
--

INSERT INTO `sp_purchases` (`id`, `ids`, `item_id`, `is_main`, `purchase_code`, `version`) VALUES
(3, '6701617e2d353', '21747459', 1, 'DoniaWeB', '8.2.0');

-- --------------------------------------------------------

--
-- Table structure for table `sp_smtp`
--

CREATE TABLE `sp_smtp` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `encryption` varchar(32) DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_team`
--

CREATE TABLE `sp_team` (
  `id` int NOT NULL,
  `ids` mediumtext,
  `owner` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `permissions` longtext,
  `data` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sp_team`
--

INSERT INTO `sp_team` (`id`, `ids`, `owner`, `pid`, `permissions`, `data`) VALUES
(1, '67016179dec69', 1, 1, '{\"dashboard\":\"1\",\"post\":\"1\",\"facebook_post\":\"1\",\"google_business_profile_post\":\"1\",\"instagram_post\":\"1\",\"linkedin_post\":\"1\",\"ok_post\":\"1\",\"pinterest_post\":\"1\",\"reddit_post\":\"1\",\"telegram_post\":\"1\",\"tumblr_post\":\"1\",\"twitter_post\":\"1\",\"vk_post\":\"1\",\"youtube_post\":\"1\",\"bulk_post\":\"1\",\"rss_post\":\"1\",\"analytics\":\"1\",\"facebook_analytics\":\"1\",\"instagram_analytics\":\"1\",\"twitter_analytics\":\"1\",\"whatsapp\":\"1\",\"whatsapp_profile\":\"1\",\"whatsapp_bulk\":\"1\",\"whatsapp_autoresponder\":\"1\",\"whatsapp_chatbot\":\"1\",\"whatsapp_export_participants\":\"1\",\"whatsapp_contact\":\"1\",\"whatsapp_api\":\"1\",\"whatsapp_button_template\":\"1\",\"whatsapp_list_message_template\":\"1\",\"whatsapp_send_media\":\"1\",\"whatsapp_autoresponser_delay\":\"1\",\"whatsapp_chatbot_item_limit\":\"200\",\"whatsapp_bulk_schedule_by_times\":\"1\",\"whatsapp_bulk_max_run\":\"1000\",\"whatsapp_bulk_max_contact_group\":\"1000\",\"whatsapp_bulk_max_phone_numbers\":\"600000\",\"whatsapp_message_per_month\":\"1000000\",\"drafts\":\"1\",\"schedules\":\"1\",\"account_manager\":\"1\",\"whatsapp_profiles\":\"1\",\"facebook_profiles\":\"1\",\"facebook_groups\":\"1\",\"facebook_pages\":\"1\",\"instagram_profiles\":\"1\",\"twitter_profiles\":\"1\",\"youtube_profiles\":\"1\",\"google_business_profiles\":\"1\",\"linkedin_profiles\":\"1\",\"linkedin_pages\":\"1\",\"pinterest_profiles\":\"1\",\"pinterest_boards\":\"1\",\"reddit_profiles\":\"1\",\"tumblr_blogs\":\"1\",\"telegram_channels\":\"1\",\"telegram_groups\":\"1\",\"ok_groups\":\"1\",\"vk_profiles\":\"1\",\"vk_pages\":\"1\",\"vk_groups\":\"1\",\"file_manager\":\"1\",\"file_manager_google_drive\":\"1\",\"file_manager_dropbox\":\"1\",\"file_manager_onedrive\":\"1\",\"file_manager_photo\":\"1\",\"file_manager_video\":\"1\",\"file_manager_other_type\":\"1\",\"file_manager_image_editor\":\"1\",\"max_storage_size\":\"10000\",\"max_file_size\":\"100\",\"tools\":\"1\",\"watermark\":\"1\",\"group_manager\":\"1\",\"caption\":\"1\",\"teams\":\"1\",\"proxies\":\"1\",\"shortlink\":\"1\",\"openai\":\"1\",\"openai_content\":\"1\",\"openai_image\":\"1\",\"openai_limit_tokens\":\"1000000\",\"number_accounts\":\"100\"}', '{\"facebook_post_success_count\":0,\"facebook_post_error_count\":1,\"facebook_post_media_count\":0,\"facebook_post_link_count\":0,\"facebook_post_text_count\":0,\"instagram_post_success_count\":0,\"instagram_post_error_count\":0,\"instagram_post_media_count\":0,\"instagram_post_link_count\":0,\"instagram_post_text_count\":0,\"twitter_post_success_count\":0,\"twitter_post_error_count\":0,\"twitter_post_media_count\":0,\"twitter_post_link_count\":0,\"twitter_post_text_count\":0,\"youtube_post_success_count\":0,\"youtube_post_error_count\":0,\"youtube_post_media_count\":0,\"youtube_post_link_count\":0,\"youtube_post_text_count\":0,\"google_business_profile_post_success_count\":0,\"google_business_profile_post_error_count\":0,\"google_business_profile_post_media_count\":0,\"google_business_profile_post_link_count\":0,\"google_business_profile_post_text_count\":0,\"linkedin_post_success_count\":0,\"linkedin_post_error_count\":0,\"linkedin_post_media_count\":0,\"linkedin_post_link_count\":0,\"linkedin_post_text_count\":0,\"pinterest_post_success_count\":0,\"pinterest_post_error_count\":0,\"pinterest_post_media_count\":0,\"pinterest_post_link_count\":0,\"pinterest_post_text_count\":0,\"reddit_post_success_count\":0,\"reddit_post_error_count\":0,\"reddit_post_media_count\":0,\"reddit_post_link_count\":0,\"reddit_post_text_count\":0,\"tumblr_post_success_count\":0,\"tumblr_post_error_count\":0,\"tumblr_post_media_count\":0,\"tumblr_post_link_count\":0,\"tumblr_post_text_count\":0,\"telegram_post_success_count\":0,\"telegram_post_error_count\":0,\"telegram_post_media_count\":0,\"telegram_post_link_count\":0,\"telegram_post_text_count\":0,\"vk_post_success_count\":0,\"vk_post_error_count\":0,\"vk_post_media_count\":0,\"vk_post_link_count\":0,\"vk_post_text_count\":0,\"ok_post_success_count\":0,\"ok_post_error_count\":0,\"ok_post_media_count\":0,\"ok_post_link_count\":0,\"ok_post_text_count\":0,\"shortlink_status\":0,\"bulk_delay\":60,\"bitly_access_token\":\"\",\"openai_usage_tokens\":258,\"watermark_mask\":\"\",\"watermark_size\":30,\"watermark_opacity\":70,\"watermark_position\":\"lb\",\"telegram_post_count\":0,\"watermark_status\":1,\"twitter_status\":0,\"twitter_bearer_token\":\"\",\"twitter_consumer_secret\":\"\",\"twitter_consumer_key\":\"\",\"twitter_client_secret\":\"\",\"twitter_client_id\":\"\",\"fb_story_title_text_direction\":1,\"fb_story_title_font_size\":30,\"fb_story_title_font_family\":\"notosans\",\"fb_story_title_width\":660,\"fb_story_title_left\":30,\"fb_story_title_top\":125,\"fb_story_title_color\":\"#FFFFFF\",\"fb_story_bg_opacity\":30,\"fb_story_title_bg\":\"#000000\",\"fb_story_bg\":\"#636e72\",\"tiktok_post_text_count\":0,\"tiktok_post_link_count\":0,\"tiktok_post_media_count\":0,\"tiktok_post_error_count\":0,\"tiktok_post_success_count\":0,\"facebook_post_count\":2}');

-- --------------------------------------------------------

--
-- Table structure for table `sp_team_member`
--

CREATE TABLE `sp_team_member` (
  `id` int NOT NULL,
  `ids` mediumtext,
  `uid` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `permissions` longtext,
  `pending` text,
  `status` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_tiktok_sessions`
--

CREATE TABLE `sp_tiktok_sessions` (
  `id` int NOT NULL,
  `ids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `team_id` int DEFAULT NULL,
  `instance_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `proxy` int DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sp_tiktok_sessions`
--

INSERT INTO `sp_tiktok_sessions` (`id`, `ids`, `team_id`, `instance_id`, `data`, `proxy`, `status`) VALUES
(10, '6734998376f16', 1, '6734998372040', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sp_users`
--

CREATE TABLE `sp_users` (
  `id` int NOT NULL,
  `ids` mediumtext,
  `pid` text,
  `is_admin` int DEFAULT NULL,
  `role` int DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `plan` int DEFAULT NULL,
  `expiration_date` int DEFAULT NULL,
  `timezone` mediumtext,
  `language` varchar(30) DEFAULT NULL,
  `login_type` mediumtext,
  `avatar` varchar(255) DEFAULT NULL,
  `data` mediumtext,
  `status` int DEFAULT NULL,
  `last_login` int DEFAULT NULL,
  `recovery_key` varchar(32) DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sp_users`
--

INSERT INTO `sp_users` (`id`, `ids`, `pid`, `is_admin`, `role`, `fullname`, `username`, `email`, `password`, `plan`, `expiration_date`, `timezone`, `language`, `login_type`, `avatar`, `data`, `status`, `last_login`, `recovery_key`, `changed`, `created`) VALUES
(1, '67016179deb90', NULL, 1, 0, 'Admin', 'admin-ss-sm', 'admin@ss-sm.pk', '2af3879b8dc2bc826437274d5e72ffb4', 1, 2145916800, 'Africa/Cairo', 'en', 'direct', 'https://ui-avatars.com/api/?name=Hi&background=0674ec&color=fff', NULL, 2, 1731491466, NULL, 1681286037, 1681286037);

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_roles`
--

CREATE TABLE `sp_user_roles` (
  `id` int NOT NULL,
  `ids` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `permissions` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_whatsapp_autoresponder`
--

CREATE TABLE `sp_whatsapp_autoresponder` (
  `id` int NOT NULL,
  `ids` text,
  `team_id` int DEFAULT NULL,
  `instance_id` text,
  `type` int DEFAULT NULL,
  `template` int DEFAULT NULL,
  `caption` text,
  `media` longtext,
  `except` longtext,
  `path` text,
  `delay` int DEFAULT NULL,
  `result` text,
  `sent` int DEFAULT NULL,
  `failed` int DEFAULT NULL,
  `send_to` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_whatsapp_chatbot`
--

CREATE TABLE `sp_whatsapp_chatbot` (
  `id` int UNSIGNED NOT NULL,
  `ids` text,
  `name` text,
  `keywords` text,
  `instance_id` text,
  `team_id` int DEFAULT NULL,
  `type_search` int DEFAULT '1',
  `template` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `caption` text,
  `media` text,
  `run` int DEFAULT '1',
  `sent` int DEFAULT NULL,
  `failed` int DEFAULT NULL,
  `send_to` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_whatsapp_contacts`
--

CREATE TABLE `sp_whatsapp_contacts` (
  `id` int UNSIGNED NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_whatsapp_phone_numbers`
--

CREATE TABLE `sp_whatsapp_phone_numbers` (
  `id` int NOT NULL,
  `ids` varchar(15) DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `params` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_whatsapp_schedules`
--

CREATE TABLE `sp_whatsapp_schedules` (
  `id` int UNSIGNED NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `accounts` text,
  `next_account` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `type` int DEFAULT '1',
  `template` int DEFAULT NULL,
  `time_post` int DEFAULT NULL,
  `min_delay` int DEFAULT NULL,
  `schedule_time` varchar(255) DEFAULT NULL,
  `timezone` varchar(100) DEFAULT NULL,
  `max_delay` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `caption` text,
  `media` text,
  `sent` int DEFAULT '0',
  `failed` int DEFAULT '0',
  `result` text,
  `run` int DEFAULT '0',
  `status` int DEFAULT NULL,
  `changed` int DEFAULT NULL,
  `created` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_whatsapp_sessions`
--

CREATE TABLE `sp_whatsapp_sessions` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `instance_id` varchar(255) DEFAULT NULL,
  `data` longtext,
  `status` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_whatsapp_stats`
--

CREATE TABLE `sp_whatsapp_stats` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `wa_total_sent_by_month` int DEFAULT NULL,
  `wa_total_sent` int DEFAULT NULL,
  `wa_chatbot_count` int DEFAULT NULL,
  `wa_autoresponder_count` int DEFAULT NULL,
  `wa_api_count` int DEFAULT NULL,
  `wa_bulk_total_count` int DEFAULT NULL,
  `wa_bulk_sent_count` int DEFAULT NULL,
  `wa_bulk_failed_count` int DEFAULT NULL,
  `wa_time_reset` int DEFAULT NULL,
  `next_update` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_whatsapp_template`
--

CREATE TABLE `sp_whatsapp_template` (
  `id` int NOT NULL,
  `ids` varchar(32) DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` longtext,
  `changed` int DEFAULT NULL,
  `created` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sp_whatsapp_webhook`
--

CREATE TABLE `sp_whatsapp_webhook` (
  `id` int NOT NULL,
  `ids` text,
  `team_id` int DEFAULT NULL,
  `instance_id` text,
  `webhook_url` text,
  `status` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_accounts`
--
ALTER TABLE `sp_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_account_sessions`
--
ALTER TABLE `sp_account_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_ai_prompt_categories`
--
ALTER TABLE `sp_ai_prompt_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_ai_prompt_templates`
--
ALTER TABLE `sp_ai_prompt_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_blogs`
--
ALTER TABLE `sp_blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_captions`
--
ALTER TABLE `sp_captions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_coinpayments_history`
--
ALTER TABLE `sp_coinpayments_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_faqs`
--
ALTER TABLE `sp_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_files`
--
ALTER TABLE `sp_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_groups`
--
ALTER TABLE `sp_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_language`
--
ALTER TABLE `sp_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_language_category`
--
ALTER TABLE `sp_language_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_options`
--
ALTER TABLE `sp_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_payment_history`
--
ALTER TABLE `sp_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_payment_subscriptions`
--
ALTER TABLE `sp_payment_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_plans`
--
ALTER TABLE `sp_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_platform`
--
ALTER TABLE `sp_platform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_posts`
--
ALTER TABLE `sp_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_proxies`
--
ALTER TABLE `sp_proxies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_purchases`
--
ALTER TABLE `sp_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_smtp`
--
ALTER TABLE `sp_smtp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_team`
--
ALTER TABLE `sp_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_team_member`
--
ALTER TABLE `sp_team_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_tiktok_sessions`
--
ALTER TABLE `sp_tiktok_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_users`
--
ALTER TABLE `sp_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_roles`
--
ALTER TABLE `sp_user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_whatsapp_autoresponder`
--
ALTER TABLE `sp_whatsapp_autoresponder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_whatsapp_chatbot`
--
ALTER TABLE `sp_whatsapp_chatbot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_whatsapp_contacts`
--
ALTER TABLE `sp_whatsapp_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_whatsapp_phone_numbers`
--
ALTER TABLE `sp_whatsapp_phone_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_whatsapp_schedules`
--
ALTER TABLE `sp_whatsapp_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_whatsapp_sessions`
--
ALTER TABLE `sp_whatsapp_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_whatsapp_stats`
--
ALTER TABLE `sp_whatsapp_stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_whatsapp_template`
--
ALTER TABLE `sp_whatsapp_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_whatsapp_webhook`
--
ALTER TABLE `sp_whatsapp_webhook`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_accounts`
--
ALTER TABLE `sp_accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sp_account_sessions`
--
ALTER TABLE `sp_account_sessions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_ai_prompt_categories`
--
ALTER TABLE `sp_ai_prompt_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sp_ai_prompt_templates`
--
ALTER TABLE `sp_ai_prompt_templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1106;

--
-- AUTO_INCREMENT for table `sp_blogs`
--
ALTER TABLE `sp_blogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_captions`
--
ALTER TABLE `sp_captions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_coinpayments_history`
--
ALTER TABLE `sp_coinpayments_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_faqs`
--
ALTER TABLE `sp_faqs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_files`
--
ALTER TABLE `sp_files`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sp_groups`
--
ALTER TABLE `sp_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_language`
--
ALTER TABLE `sp_language`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12377;

--
-- AUTO_INCREMENT for table `sp_language_category`
--
ALTER TABLE `sp_language_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sp_options`
--
ALTER TABLE `sp_options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

--
-- AUTO_INCREMENT for table `sp_payment_history`
--
ALTER TABLE `sp_payment_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `sp_payment_subscriptions`
--
ALTER TABLE `sp_payment_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sp_plans`
--
ALTER TABLE `sp_plans`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `sp_platform`
--
ALTER TABLE `sp_platform`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sp_posts`
--
ALTER TABLE `sp_posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `sp_proxies`
--
ALTER TABLE `sp_proxies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sp_purchases`
--
ALTER TABLE `sp_purchases`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sp_smtp`
--
ALTER TABLE `sp_smtp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sp_team`
--
ALTER TABLE `sp_team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_team_member`
--
ALTER TABLE `sp_team_member`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_tiktok_sessions`
--
ALTER TABLE `sp_tiktok_sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sp_users`
--
ALTER TABLE `sp_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_user_roles`
--
ALTER TABLE `sp_user_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_whatsapp_autoresponder`
--
ALTER TABLE `sp_whatsapp_autoresponder`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_whatsapp_chatbot`
--
ALTER TABLE `sp_whatsapp_chatbot`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sp_whatsapp_contacts`
--
ALTER TABLE `sp_whatsapp_contacts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_whatsapp_phone_numbers`
--
ALTER TABLE `sp_whatsapp_phone_numbers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_whatsapp_schedules`
--
ALTER TABLE `sp_whatsapp_schedules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_whatsapp_sessions`
--
ALTER TABLE `sp_whatsapp_sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sp_whatsapp_stats`
--
ALTER TABLE `sp_whatsapp_stats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sp_whatsapp_template`
--
ALTER TABLE `sp_whatsapp_template`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_whatsapp_webhook`
--
ALTER TABLE `sp_whatsapp_webhook`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
