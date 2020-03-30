-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2020 at 07:57 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deskplant`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('SHIPPING','BILLING') COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_super_admin` tinyint(4) DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `is_super_admin`, `role_id`, `first_name`, `last_name`, `email`, `password`, `language`, `image_path`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Chamuth Chamandana', 'Chamandana', 'c.chamandana@gmail.com', '$2y$10$/d0l8G7SL5ctP9SNaaAIU.3WCg2SftNygDW.IJsIVeRfYIphA6aAe', 'en', NULL, NULL, NULL, '2020-03-18 20:09:46', '2020-03-18 20:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_as` enum('IMAGE','TEXT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'TEXT',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `slug`, `display_as`, `created_at`, `updated_at`) VALUES
(1, 'Color', 'color', 'IMAGE', '2020-03-18 20:02:59', '2020-03-18 20:02:59');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_dropdown_options`
--

CREATE TABLE `attribute_dropdown_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `display_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_dropdown_options`
--

INSERT INTO `attribute_dropdown_options` (`id`, `attribute_id`, `display_text`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, 'Red', 'uploads/catalog/attributes/red-attribute.jpg', '2020-03-18 20:02:59', '2020-03-18 20:02:59'),
(2, 1, 'Blue', 'uploads/catalog/attributes/blue-attribute.png', '2020-03-18 20:03:00', '2020-03-18 20:03:00'),
(3, 1, 'Yellow', 'uploads/catalog/attributes/yellow-attribute.png', '2020-03-18 20:03:00', '2020-03-18 20:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_product`
--

CREATE TABLE `attribute_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_product_values`
--

CREATE TABLE `attribute_product_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_dropdown_option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ENABLED','DISABLED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ENABLED',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'AvoRed', 'avored', NULL, NULL, '2020-03-18 20:02:59', '2020-03-18 20:02:59'),
(2, 'PHP', 'php', NULL, NULL, '2020-03-18 20:02:59', '2020-03-18 20:02:59'),
(3, 'Laravel', 'laravel', NULL, NULL, '2020-03-18 20:02:59', '2020-03-18 20:02:59'),
(4, 'Deskplants', 'deskplants', NULL, NULL, '2020-03-29 00:45:40', '2020-03-29 00:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `category_filters`
--

CREATE TABLE `category_filters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `filter_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('ATTRIBUTE','PROPERTY') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_filters`
--

INSERT INTO `category_filters` (`id`, `category_id`, `filter_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'PROPERTY', '2020-03-18 20:03:00', '2020-03-18 20:03:00'),
(2, 2, 1, 'PROPERTY', '2020-03-18 20:03:00', '2020-03-18 20:03:00'),
(3, 3, 1, 'PROPERTY', '2020-03-18 20:03:00', '2020-03-18 20:03:00'),
(4, 1, 2, 'PROPERTY', '2020-03-18 20:03:01', '2020-03-18 20:03:01'),
(5, 2, 2, 'PROPERTY', '2020-03-18 20:03:01', '2020-03-18 20:03:01'),
(6, 3, 2, 'PROPERTY', '2020-03-18 20:03:01', '2020-03-18 20:03:01'),
(7, 4, 1, 'PROPERTY', '2020-03-29 00:50:25', '2020-03-29 00:50:25');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`id`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(10, 4, 10, NULL, NULL),
(11, 4, 11, NULL, NULL),
(12, 4, 12, NULL, NULL),
(13, 4, 13, NULL, NULL),
(14, 4, 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`id`, `code`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Deskplant LK - Indoor Potted Plants Delivery in Sri Lanka', '2020-03-29 01:40:14', '2020-03-29 01:40:14'),
(2, 'tax_percentage', NULL, '2020-03-29 01:40:14', '2020-03-29 01:40:14'),
(3, 'a_cash_on_delivery_status', 'true', '2020-03-29 01:40:14', '2020-03-29 01:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `phone_code`, `currency_code`, `currency_symbol`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'af', '93', 'AFN', '؋', 'Pashto', '2020-03-18 20:01:46', '2020-03-18 20:01:46'),
(2, 'Åland Islands', 'ax', '358', 'EUR', '€', 'Swedish', '2020-03-18 20:01:46', '2020-03-18 20:01:46'),
(3, 'Albania', 'al', '355', 'ALL', 'L', 'Albanian', '2020-03-18 20:01:46', '2020-03-18 20:01:46'),
(4, 'Algeria', 'dz', '213', 'DZD', 'د.ج', 'Arabic', '2020-03-18 20:01:46', '2020-03-18 20:01:46'),
(5, 'American Samoa', 'as', '1684', 'USD', '$', 'English', '2020-03-18 20:01:46', '2020-03-18 20:01:46'),
(6, 'Andorra', 'ad', '376', 'EUR', '€', 'Catalan', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(7, 'Angola', 'ao', '244', 'AOA', 'Kz', 'Portuguese', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(8, 'Anguilla', 'ai', '1264', 'XCD', '$', 'English', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(9, 'Antarctica', 'aq', '672', 'AUD', '$', 'English', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(10, 'Antigua and Barbuda', 'ag', '1268', 'XCD', '$', 'English', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(11, 'Argentina', 'ar', '54', 'ARS', '$', 'Spanish', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(12, 'Armenia', 'am', '374', 'AMD', NULL, 'Armenian', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(13, 'Aruba', 'aw', '297', 'AWG', 'ƒ', 'Dutch', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(14, 'Australia', 'au', '61', 'AUD', '$', 'English', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(15, 'Austria', 'at', '43', 'EUR', '€', 'German', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(16, 'Azerbaijan', 'az', '994', 'AZN', NULL, 'Azerbaijani', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(17, 'Bahamas', 'bs', '1242', 'BSD', '$', 'English', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(18, 'Bahrain', 'bh', '973', 'BHD', '.د.ب', 'Arabic', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(19, 'Bangladesh', 'bd', '880', 'BDT', '৳', 'Bengali', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(20, 'Barbados', 'bb', '1246', 'BBD', '$', 'English', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(21, 'Belarus', 'by', '375', 'BYN', 'Br', 'Belarusian', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(22, 'Belgium', 'be', '32', 'EUR', '€', 'Dutch', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(23, 'Belize', 'bz', '501', 'BZD', '$', 'English', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(24, 'Benin', 'bj', '229', 'XOF', 'Fr', 'French', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(25, 'Bermuda', 'bm', '1441', 'BMD', '$', 'English', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(26, 'Bhutan', 'bt', '975', 'BTN', 'Nu.', 'Dzongkha', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(27, 'Bolivia (Plurinational State of)', 'bo', '591', 'BOB', 'Bs.', 'Spanish', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(28, 'Bonaire, Sint Eustatius and Saba', 'bq', '5997', 'USD', '$', 'Dutch', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(29, 'Bosnia and Herzegovina', 'ba', '387', 'BAM', NULL, 'Bosnian', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(30, 'Botswana', 'bw', '267', 'BWP', 'P', 'English', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(31, 'Bouvet Island', 'bv', '', 'NOK', 'kr', 'Norwegian', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(32, 'Brazil', 'br', '55', 'BRL', 'R$', 'Portuguese', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(33, 'British Indian Ocean Territory', 'io', '246', 'USD', '$', 'English', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(34, 'United States Minor Outlying Islands', 'um', '', 'USD', '$', 'English', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(35, 'Virgin Islands (British)', 'vg', '1284', NULL, '$', 'English', '2020-03-18 20:01:47', '2020-03-18 20:01:47'),
(36, 'Virgin Islands (U.S.)', 'vi', '1 340', 'USD', '$', 'English', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(37, 'Brunei Darussalam', 'bn', '673', 'BND', '$', 'Malay', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(38, 'Bulgaria', 'bg', '359', 'BGN', 'лв', 'Bulgarian', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(39, 'Burkina Faso', 'bf', '226', 'XOF', 'Fr', 'French', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(40, 'Burundi', 'bi', '257', 'BIF', 'Fr', 'French', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(41, 'Cambodia', 'kh', '855', 'KHR', '៛', 'Khmer', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(42, 'Cameroon', 'cm', '237', 'XAF', 'Fr', 'English', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(43, 'Canada', 'ca', '1', 'CAD', '$', 'English', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(44, 'Cabo Verde', 'cv', '238', 'CVE', 'Esc', 'Portuguese', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(45, 'Cayman Islands', 'ky', '1345', 'KYD', '$', 'English', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(46, 'Central African Republic', 'cf', '236', 'XAF', 'Fr', 'French', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(47, 'Chad', 'td', '235', 'XAF', 'Fr', 'French', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(48, 'Chile', 'cl', '56', 'CLP', '$', 'Spanish', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(49, 'China', 'cn', '86', 'CNY', '¥', 'Chinese', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(50, 'Christmas Island', 'cx', '61', 'AUD', '$', 'English', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(51, 'Cocos (Keeling) Islands', 'cc', '61', 'AUD', '$', 'English', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(52, 'Colombia', 'co', '57', 'COP', '$', 'Spanish', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(53, 'Comoros', 'km', '269', 'KMF', 'Fr', 'Arabic', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(54, 'Congo', 'cg', '242', 'XAF', 'Fr', 'French', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(55, 'Congo (Democratic Republic of the)', 'cd', '243', 'CDF', 'Fr', 'French', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(56, 'Cook Islands', 'ck', '682', 'NZD', '$', 'English', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(57, 'Costa Rica', 'cr', '506', 'CRC', '₡', 'Spanish', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(58, 'Croatia', 'hr', '385', 'HRK', 'kn', 'Croatian', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(59, 'Cuba', 'cu', '53', 'CUC', '$', 'Spanish', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(60, 'Curaçao', 'cw', '599', 'ANG', 'ƒ', 'Dutch', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(61, 'Cyprus', 'cy', '357', 'EUR', '€', 'Greek (modern)', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(62, 'Czech Republic', 'cz', '420', 'CZK', 'Kč', 'Czech', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(63, 'Denmark', 'dk', '45', 'DKK', 'kr', 'Danish', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(64, 'Djibouti', 'dj', '253', 'DJF', 'Fr', 'French', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(65, 'Dominica', 'dm', '1767', 'XCD', '$', 'English', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(66, 'Dominican Republic', 'do', '1809', 'DOP', '$', 'Spanish', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(67, 'Ecuador', 'ec', '593', 'USD', '$', 'Spanish', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(68, 'Egypt', 'eg', '20', 'EGP', '£', 'Arabic', '2020-03-18 20:01:48', '2020-03-18 20:01:48'),
(69, 'El Salvador', 'sv', '503', 'USD', '$', 'Spanish', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(70, 'Equatorial Guinea', 'gq', '240', 'XAF', 'Fr', 'Spanish', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(71, 'Eritrea', 'er', '291', 'ERN', 'Nfk', 'Tigrinya', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(72, 'Estonia', 'ee', '372', 'EUR', '€', 'Estonian', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(73, 'Ethiopia', 'et', '251', 'ETB', 'Br', 'Amharic', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(74, 'Falkland Islands (Malvinas)', 'fk', '500', 'FKP', '£', 'English', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(75, 'Faroe Islands', 'fo', '298', 'DKK', 'kr', 'Faroese', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(76, 'Fiji', 'fj', '679', 'FJD', '$', 'English', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(77, 'Finland', 'fi', '358', 'EUR', '€', 'Finnish', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(78, 'France', 'fr', '33', 'EUR', '€', 'French', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(79, 'French Guiana', 'gf', '594', 'EUR', '€', 'French', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(80, 'French Polynesia', 'pf', '689', 'XPF', 'Fr', 'French', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(81, 'French Southern Territories', 'tf', '', 'EUR', '€', 'French', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(82, 'Gabon', 'ga', '241', 'XAF', 'Fr', 'French', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(83, 'Gambia', 'gm', '220', 'GMD', 'D', 'English', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(84, 'Georgia', 'ge', '995', 'GEL', 'ლ', 'Georgian', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(85, 'Germany', 'de', '49', 'EUR', '€', 'German', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(86, 'Ghana', 'gh', '233', 'GHS', '₵', 'English', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(87, 'Gibraltar', 'gi', '350', 'GIP', '£', 'English', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(88, 'Greece', 'gr', '30', 'EUR', '€', 'Greek (modern)', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(89, 'Greenland', 'gl', '299', 'DKK', 'kr', 'Kalaallisut', '2020-03-18 20:01:49', '2020-03-18 20:01:49'),
(90, 'Grenada', 'gd', '1473', 'XCD', '$', 'English', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(91, 'Guadeloupe', 'gp', '590', 'EUR', '€', 'French', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(92, 'Guam', 'gu', '1671', 'USD', '$', 'English', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(93, 'Guatemala', 'gt', '502', 'GTQ', 'Q', 'Spanish', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(94, 'Guernsey', 'gg', '44', 'GBP', '£', 'English', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(95, 'Guinea', 'gn', '224', 'GNF', 'Fr', 'French', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(96, 'Guinea-Bissau', 'gw', '245', 'XOF', 'Fr', 'Portuguese', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(97, 'Guyana', 'gy', '592', 'GYD', '$', 'English', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(98, 'Haiti', 'ht', '509', 'HTG', 'G', 'French', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(99, 'Heard Island and McDonald Islands', 'hm', '', 'AUD', '$', 'English', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(100, 'Holy See', 'va', '379', 'EUR', '€', 'Latin', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(101, 'Honduras', 'hn', '504', 'HNL', 'L', 'Spanish', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(102, 'Hong Kong', 'hk', '852', 'HKD', '$', 'English', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(103, 'Hungary', 'hu', '36', 'HUF', 'Ft', 'Hungarian', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(104, 'Iceland', 'is', '354', 'ISK', 'kr', 'Icelandic', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(105, 'India', 'in', '91', 'INR', '₹', 'Hindi', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(106, 'Indonesia', 'id', '62', 'IDR', 'Rp', 'Indonesian', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(107, 'Côte d\'Ivoire', 'ci', '225', 'XOF', 'Fr', 'French', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(108, 'Iran (Islamic Republic of)', 'ir', '98', 'IRR', '﷼', 'Persian (Farsi)', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(109, 'Iraq', 'iq', '964', 'IQD', 'ع.د', 'Arabic', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(110, 'Ireland', 'ie', '353', 'EUR', '€', 'Irish', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(111, 'Isle of Man', 'im', '44', 'GBP', '£', 'English', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(112, 'Israel', 'il', '972', 'ILS', '₪', 'Hebrew (modern)', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(113, 'Italy', 'it', '39', 'EUR', '€', 'Italian', '2020-03-18 20:01:50', '2020-03-18 20:01:50'),
(114, 'Jamaica', 'jm', '1876', 'JMD', '$', 'English', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(115, 'Japan', 'jp', '81', 'JPY', '¥', 'Japanese', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(116, 'Jersey', 'je', '44', 'GBP', '£', 'English', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(117, 'Jordan', 'jo', '962', 'JOD', 'د.ا', 'Arabic', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(118, 'Kazakhstan', 'kz', '76', 'KZT', NULL, 'Kazakh', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(119, 'Kenya', 'ke', '254', 'KES', 'Sh', 'English', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(120, 'Kiribati', 'ki', '686', 'AUD', '$', 'English', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(121, 'Kuwait', 'kw', '965', 'KWD', 'د.ك', 'Arabic', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(122, 'Kyrgyzstan', 'kg', '996', 'KGS', 'с', 'Kyrgyz', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(123, 'Lao People\'s Democratic Republic', 'la', '856', 'LAK', '₭', 'Lao', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(124, 'Latvia', 'lv', '371', 'EUR', '€', 'Latvian', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(125, 'Lebanon', 'lb', '961', 'LBP', 'ل.ل', 'Arabic', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(126, 'Lesotho', 'ls', '266', 'LSL', 'L', 'English', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(127, 'Liberia', 'lr', '231', 'LRD', '$', 'English', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(128, 'Libya', 'ly', '218', 'LYD', 'ل.د', 'Arabic', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(129, 'Liechtenstein', 'li', '423', 'CHF', 'Fr', 'German', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(130, 'Lithuania', 'lt', '370', 'EUR', '€', 'Lithuanian', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(131, 'Luxembourg', 'lu', '352', 'EUR', '€', 'French', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(132, 'Macao', 'mo', '853', 'MOP', 'P', 'Chinese', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(133, 'Macedonia (the former Yugoslav Republic of)', 'mk', '389', 'MKD', 'ден', 'Macedonian', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(134, 'Madagascar', 'mg', '261', 'MGA', 'Ar', 'French', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(135, 'Malawi', 'mw', '265', 'MWK', 'MK', 'English', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(136, 'Malaysia', 'my', '60', 'MYR', 'RM', 'Malaysian', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(137, 'Maldives', 'mv', '960', 'MVR', '.ރ', 'Divehi', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(138, 'Mali', 'ml', '223', 'XOF', 'Fr', 'French', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(139, 'Malta', 'mt', '356', 'EUR', '€', 'Maltese', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(140, 'Marshall Islands', 'mh', '692', 'USD', '$', 'English', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(141, 'Martinique', 'mq', '596', 'EUR', '€', 'French', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(142, 'Mauritania', 'mr', '222', 'MRO', 'UM', 'Arabic', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(143, 'Mauritius', 'mu', '230', 'MUR', '₨', 'English', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(144, 'Mayotte', 'yt', '262', 'EUR', '€', 'French', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(145, 'Mexico', 'mx', '52', 'MXN', '$', 'Spanish', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(146, 'Micronesia (Federated States of)', 'fm', '691', NULL, '$', 'English', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(147, 'Moldova (Republic of)', 'md', '373', 'MDL', 'L', 'Romanian', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(148, 'Monaco', 'mc', '377', 'EUR', '€', 'French', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(149, 'Mongolia', 'mn', '976', 'MNT', '₮', 'Mongolian', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(150, 'Montenegro', 'me', '382', 'EUR', '€', 'Serbian', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(151, 'Montserrat', 'ms', '1664', 'XCD', '$', 'English', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(152, 'Morocco', 'ma', '212', 'MAD', 'د.م.', 'Arabic', '2020-03-18 20:01:51', '2020-03-18 20:01:51'),
(153, 'Mozambique', 'mz', '258', 'MZN', 'MT', 'Portuguese', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(154, 'Myanmar', 'mm', '95', 'MMK', 'Ks', 'Burmese', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(155, 'Namibia', 'na', '264', 'NAD', '$', 'English', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(156, 'Nauru', 'nr', '674', 'AUD', '$', 'English', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(157, 'Nepal', 'np', '977', 'NPR', '₨', 'Nepali', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(158, 'Netherlands', 'nl', '31', 'EUR', '€', 'Dutch', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(159, 'New Caledonia', 'nc', '687', 'XPF', 'Fr', 'French', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(160, 'New Zealand', 'nz', '64', 'NZD', '$', 'English', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(161, 'Nicaragua', 'ni', '505', 'NIO', 'C$', 'Spanish', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(162, 'Niger', 'ne', '227', 'XOF', 'Fr', 'French', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(163, 'Nigeria', 'ng', '234', 'NGN', '₦', 'English', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(164, 'Niue', 'nu', '683', 'NZD', '$', 'English', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(165, 'Norfolk Island', 'nf', '672', 'AUD', '$', 'English', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(166, 'Korea (Democratic People\'s Republic of)', 'kp', '850', 'KPW', '₩', 'Korean', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(167, 'Northern Mariana Islands', 'mp', '1670', 'USD', '$', 'English', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(168, 'Norway', 'no', '47', 'NOK', 'kr', 'Norwegian', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(169, 'Oman', 'om', '968', 'OMR', 'ر.ع.', 'Arabic', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(170, 'Pakistan', 'pk', '92', 'PKR', '₨', 'English', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(171, 'Palau', 'pw', '680', '(none)', '$', 'English', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(172, 'Palestine, State of', 'ps', '970', 'ILS', '₪', 'Arabic', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(173, 'Panama', 'pa', '507', 'PAB', 'B/.', 'Spanish', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(174, 'Papua New Guinea', 'pg', '675', 'PGK', 'K', 'English', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(175, 'Paraguay', 'py', '595', 'PYG', '₲', 'Spanish', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(176, 'Peru', 'pe', '51', 'PEN', 'S/.', 'Spanish', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(177, 'Philippines', 'ph', '63', 'PHP', '₱', 'English', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(178, 'Pitcairn', 'pn', '64', 'NZD', '$', 'English', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(179, 'Poland', 'pl', '48', 'PLN', 'zł', 'Polish', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(180, 'Portugal', 'pt', '351', 'EUR', '€', 'Portuguese', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(181, 'Puerto Rico', 'pr', '1787', 'USD', '$', 'Spanish', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(182, 'Qatar', 'qa', '974', 'QAR', 'ر.ق', 'Arabic', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(183, 'Republic of Kosovo', 'xk', '383', 'EUR', '€', 'Albanian', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(184, 'Réunion', 're', '262', 'EUR', '€', 'French', '2020-03-18 20:01:52', '2020-03-18 20:01:52'),
(185, 'Romania', 'ro', '40', 'RON', 'lei', 'Romanian', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(186, 'Russian Federation', 'ru', '7', 'RUB', '₽', 'Russian', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(187, 'Rwanda', 'rw', '250', 'RWF', 'Fr', 'Kinyarwanda', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(188, 'Saint Barthélemy', 'bl', '590', 'EUR', '€', 'French', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(189, 'Saint Helena, Ascension and Tristan da Cunha', 'sh', '290', 'SHP', '£', 'English', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(190, 'Saint Kitts and Nevis', 'kn', '1869', 'XCD', '$', 'English', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(191, 'Saint Lucia', 'lc', '1758', 'XCD', '$', 'English', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(192, 'Saint Martin (French part)', 'mf', '590', 'EUR', '€', 'English', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(193, 'Saint Pierre and Miquelon', 'pm', '508', 'EUR', '€', 'French', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(194, 'Saint Vincent and the Grenadines', 'vc', '1784', 'XCD', '$', 'English', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(195, 'Samoa', 'ws', '685', 'WST', 'T', 'Samoan', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(196, 'San Marino', 'sm', '378', 'EUR', '€', 'Italian', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(197, 'Sao Tome and Principe', 'st', '239', 'STD', 'Db', 'Portuguese', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(198, 'Saudi Arabia', 'sa', '966', 'SAR', 'ر.س', 'Arabic', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(199, 'Senegal', 'sn', '221', 'XOF', 'Fr', 'French', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(200, 'Serbia', 'rs', '381', 'RSD', 'дин.', 'Serbian', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(201, 'Seychelles', 'sc', '248', 'SCR', '₨', 'French', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(202, 'Sierra Leone', 'sl', '232', 'SLL', 'Le', 'English', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(203, 'Singapore', 'sg', '65', 'BND', '$', 'English', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(204, 'Sint Maarten (Dutch part)', 'sx', '1721', 'ANG', 'ƒ', 'Dutch', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(205, 'Slovakia', 'sk', '421', 'EUR', '€', 'Slovak', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(206, 'Slovenia', 'si', '386', 'EUR', '€', 'Slovene', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(207, 'Solomon Islands', 'sb', '677', 'SBD', '$', 'English', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(208, 'Somalia', 'so', '252', 'SOS', 'Sh', 'Somali', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(209, 'South Africa', 'za', '27', 'ZAR', 'R', 'Afrikaans', '2020-03-18 20:01:53', '2020-03-18 20:01:53'),
(210, 'South Georgia and the South Sandwich Islands', 'gs', '500', 'GBP', '£', 'English', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(211, 'Korea (Republic of)', 'kr', '82', 'KRW', '₩', 'Korean', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(212, 'South Sudan', 'ss', '211', 'SSP', '£', 'English', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(213, 'Spain', 'es', '34', 'EUR', '€', 'Spanish', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(214, 'Sri Lanka', 'lk', '94', 'LKR', 'Rs', 'Sinhalese', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(215, 'Sudan', 'sd', '249', 'SDG', 'ج.س.', 'Arabic', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(216, 'Suriname', 'sr', '597', 'SRD', '$', 'Dutch', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(217, 'Svalbard and Jan Mayen', 'sj', '4779', 'NOK', 'kr', 'Norwegian', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(218, 'Swaziland', 'sz', '268', 'SZL', 'L', 'English', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(219, 'Sweden', 'se', '46', 'SEK', 'kr', 'Swedish', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(220, 'Switzerland', 'ch', '41', 'CHF', 'Fr', 'German', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(221, 'Syrian Arab Republic', 'sy', '963', 'SYP', '£', 'Arabic', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(222, 'Taiwan', 'tw', '886', 'TWD', '$', 'Chinese', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(223, 'Tajikistan', 'tj', '992', 'TJS', 'ЅМ', 'Tajik', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(224, 'Tanzania, United Republic of', 'tz', '255', 'TZS', 'Sh', 'Swahili', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(225, 'Thailand', 'th', '66', 'THB', '฿', 'Thai', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(226, 'Timor-Leste', 'tl', '670', 'USD', '$', 'Portuguese', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(227, 'Togo', 'tg', '228', 'XOF', 'Fr', 'French', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(228, 'Tokelau', 'tk', '690', 'NZD', '$', 'English', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(229, 'Tonga', 'to', '676', 'TOP', 'T$', 'English', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(230, 'Trinidad and Tobago', 'tt', '1868', 'TTD', '$', 'English', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(231, 'Tunisia', 'tn', '216', 'TND', 'د.ت', 'Arabic', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(232, 'Turkey', 'tr', '90', 'TRY', NULL, 'Turkish', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(233, 'Turkmenistan', 'tm', '993', 'TMT', 'm', 'Turkmen', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(234, 'Turks and Caicos Islands', 'tc', '1649', 'USD', '$', 'English', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(235, 'Tuvalu', 'tv', '688', 'AUD', '$', 'English', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(236, 'Uganda', 'ug', '256', 'UGX', 'Sh', 'English', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(237, 'Ukraine', 'ua', '380', 'UAH', '₴', 'Ukrainian', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(238, 'United Arab Emirates', 'ae', '971', 'AED', 'د.إ', 'Arabic', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(239, 'United Kingdom of Great Britain and Northern Ireland', 'gb', '44', 'GBP', '£', 'English', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(240, 'United States of America', 'us', '1', 'USD', '$', 'English', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(241, 'Uruguay', 'uy', '598', 'UYU', '$', 'Spanish', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(242, 'Uzbekistan', 'uz', '998', 'UZS', NULL, 'Uzbek', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(243, 'Vanuatu', 'vu', '678', 'VUV', 'Vt', 'Bislama', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(244, 'Venezuela (Bolivarian Republic of)', 've', '58', 'VEF', 'Bs F', 'Spanish', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(245, 'Viet Nam', 'vn', '84', 'VND', '₫', 'Vietnamese', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(246, 'Wallis and Futuna', 'wf', '681', 'XPF', 'Fr', 'French', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(247, 'Western Sahara', 'eh', '212', 'MAD', 'د.م.', 'Spanish', '2020-03-18 20:01:54', '2020-03-18 20:01:54'),
(248, 'Yemen', 'ye', '967', 'YER', '﷼', 'Arabic', '2020-03-18 20:01:55', '2020-03-18 20:01:55'),
(249, 'Zambia', 'zm', '260', 'ZMW', 'ZK', 'English', '2020-03-18 20:01:55', '2020-03-18 20:01:55'),
(250, 'Zimbabwe', 'zw', '263', 'BWP', 'P', 'English', '2020-03-18 20:01:55', '2020-03-18 20:01:55');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversation_rate` double(8,2) NOT NULL,
  `status` enum('ENABLED','DISABLED') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `conversation_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sri Lankan Rupee', 'LKR', 'Rs', 1.00, 'ENABLED', '2020-03-18 20:03:06', '2020-03-29 01:39:48');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '2020-03-18 20:03:06', '2020-03-18 20:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_group_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_group_id`, `parent_id`, `name`, `url`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'AvoRed', '/category/avored', 0, '2020-03-18 20:03:05', '2020-03-18 20:03:05'),
(2, 1, NULL, 'PHP', '/category/php', 0, '2020-03-18 20:03:05', '2020-03-18 20:03:05'),
(3, 1, NULL, 'Laravel', '/category/laravel', 0, '2020-03-18 20:03:05', '2020-03-18 20:03:05'),
(4, 1, NULL, 'Cart', '/cart', 0, '2020-03-18 20:03:05', '2020-03-18 20:03:05'),
(5, 1, NULL, 'Checkout', '/checkout', 0, '2020-03-18 20:03:05', '2020-03-18 20:03:05'),
(6, 1, NULL, 'Login', '/login', 0, '2020-03-18 20:03:05', '2020-03-18 20:03:05'),
(7, 1, NULL, 'Register', '/register', 0, '2020-03-18 20:03:05', '2020-03-18 20:03:05'),
(8, 2, NULL, 'AvoRed', '/category/avored', 0, '2020-03-18 20:03:05', '2020-03-18 20:03:05'),
(9, 2, NULL, 'PHP', '/category/php', 0, '2020-03-18 20:03:05', '2020-03-18 20:03:05'),
(10, 2, NULL, 'Laravel', '/category/laravel', 0, '2020-03-18 20:03:05', '2020-03-18 20:03:05'),
(11, 2, NULL, 'Cart', '/cart', 0, '2020-03-18 20:03:06', '2020-03-18 20:03:06'),
(12, 2, NULL, 'Checkout', '/checkout', 0, '2020-03-18 20:03:06', '2020-03-18 20:03:06'),
(13, 2, NULL, 'Account', '/account', 0, '2020-03-18 20:03:06', '2020-03-18 20:03:06'),
(14, 2, 13, 'Logout', '/logout', 0, '2020-03-18 20:03:06', '2020-03-18 20:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `menu_groups`
--

CREATE TABLE `menu_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_groups`
--

INSERT INTO `menu_groups` (`id`, `name`, `identifier`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Main Menu', 'main-menu', 0, '2020-03-18 20:03:05', '2020-03-18 20:03:05'),
(2, 'Main Auth Menu', 'main-auth-menu', 0, '2020-03-18 20:03:05', '2020-03-18 20:03:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_03_29_000000_avored_framework_schema', 1),
(9, '2017_03_29_000001_avored_banner_schema', 1),
(10, '2017_03_29_000001_avored_review_schema', 1),
(11, '2017_03_29_000001_avored_wishlist_schema', 1),
(12, '2019_09_21_003425_alter_user_table', 1),
(13, '2017_03_29_000000_avored_demo_data_schema', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_option` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_option` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status_id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `track_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `qty` decimal(11,6) NOT NULL,
  `price` decimal(11,6) NOT NULL,
  `tax_amount` decimal(11,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product_attributes`
--

CREATE TABLE `order_product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_dropdown_option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `name`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 1, '2020-03-18 20:03:06', '2020-03-18 20:03:06'),
(2, 'Processing', 0, '2020-03-18 20:03:06', '2020-03-18 20:03:06'),
(3, 'Completed', 0, '2020-03-18 20:03:06', '2020-03-18 20:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `content`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'HomePage', 'home-page', '%%%avored-banner%%%', NULL, NULL, '2020-03-18 20:03:06', '2020-03-18 20:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('BASIC','VARIATION','DOWNLOADABLE','VARIABLE_PRODUCT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BASIC',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `in_stock` tinyint(4) DEFAULT NULL,
  `track_stock` tinyint(4) DEFAULT NULL,
  `qty` decimal(10,6) DEFAULT NULL,
  `is_taxable` tinyint(4) DEFAULT NULL,
  `price` decimal(10,6) DEFAULT NULL,
  `cost_price` decimal(10,6) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `width` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `type`, `name`, `slug`, `sku`, `barcode`, `description`, `status`, `in_stock`, `track_stock`, `qty`, `is_taxable`, `price`, `cost_price`, `weight`, `width`, `height`, `length`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(10, 'BASIC', 'Geometric oak pot with Opuntia monacantha cactus plant', 'geo-oak-0032', NULL, NULL, NULL, 0, NULL, 1, '12.000000', 0, '1500.000000', '1800.000000', NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-29 00:41:59', '2020-03-29 01:42:38'),
(11, 'BASIC', 'Geometric oak pot with albo peperomia plant', 'geo-oak–0031', NULL, NULL, NULL, 0, NULL, 1, '11.000000', 0, '1500.000000', '1800.000000', NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-29 00:44:20', '2020-03-29 01:42:50'),
(12, 'BASIC', 'Notocactus rutilans cactus with geometric oak pot – 0030', 'noto-0030', NULL, NULL, NULL, 1, NULL, 1, '11.000000', 0, '1500.000000', '1800.000000', NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-29 01:54:13', '2020-03-29 01:55:21'),
(13, 'BASIC', 'Deskplant LK Podda with aloe juvenna plant – 0029', 'podda-0029', NULL, NULL, NULL, 1, NULL, 1, '7.000000', 0, '1500.000000', '1800.000000', NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-29 01:56:28', '2020-03-29 01:57:04'),
(14, 'BASIC', 'Geometric oak pot with mini pine tree- 0028', 'geo-oak-28', NULL, NULL, NULL, 0, NULL, 1, '4.000000', 0, '1500.000000', '1800.000000', NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-29 01:57:58', '2020-03-29 01:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_main_image` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `path`, `alt_text`, `is_main_image`, `created_at`, `updated_at`) VALUES
(10, 10, 'uploads/catalog/10/HCqiemvNmuiyfHxFpaDXGyqzjAl8fAtN6smoPiEC.jpeg', '', 1, '2020-03-29 00:42:30', '2020-03-29 00:50:24'),
(11, 11, 'uploads/catalog/11/DmIrrXmTB5O4UColWiWAKzB0pm4eVgCSiKTRZChO.jpeg', '', 1, '2020-03-29 00:44:45', '2020-03-29 00:50:50'),
(12, 12, 'uploads/catalog/12/11ByGeB4HvFc2MlCp979PGT1TOtwUqWsEIydyPPL.jpeg', '', 1, '2020-03-29 01:55:05', '2020-03-29 01:55:21'),
(14, 13, 'uploads/catalog/13/uYKvhmwuKja71kJMc5b9YFUppfZ1ocxlNsV5Oprl.jpeg', '', 1, '2020-03-29 01:57:00', '2020-03-29 01:57:04'),
(15, 14, 'uploads/catalog/14/TGU5lZRp15DlDTf349BJdLkksjd30XjKMLNDG8G2.jpeg', '', 1, '2020-03-29 01:58:19', '2020-03-29 01:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_property`
--

CREATE TABLE `product_property` (
  `id` int(10) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_property`
--

INSERT INTO `product_property` (`id`, `property_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 1, 10, NULL, NULL),
(4, 1, 11, NULL, NULL),
(5, 1, 12, NULL, NULL),
(6, 1, 13, NULL, NULL),
(7, 1, 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_property_boolean_values`
--

CREATE TABLE `product_property_boolean_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `value` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_property_datetime_values`
--

CREATE TABLE `product_property_datetime_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `value` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_property_decimal_values`
--

CREATE TABLE `product_property_decimal_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `value` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_property_integer_values`
--

CREATE TABLE `product_property_integer_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_property_integer_values`
--

INSERT INTO `product_property_integer_values` (`id`, `property_id`, `product_id`, `value`, `created_at`, `updated_at`) VALUES
(19, 1, 10, 3, '2020-03-29 00:50:25', '2020-03-29 00:50:25'),
(20, 1, 11, 3, '2020-03-29 00:50:50', '2020-03-29 00:50:50'),
(21, 1, 12, 3, '2020-03-29 01:55:21', '2020-03-29 01:55:21'),
(22, 1, 13, 3, '2020-03-29 01:57:04', '2020-03-29 01:57:04'),
(23, 1, 14, 3, '2020-03-29 01:58:24', '2020-03-29 01:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_property_text_values`
--

CREATE TABLE `product_property_text_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_property_varchar_values`
--

CREATE TABLE `product_property_varchar_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `star` double(2,1) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('APPROVED','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotion_codes`
--

CREATE TABLE `promotion_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `type` enum('PERCENTAGE','FIXED','FREE_SHIPPING') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,4) DEFAULT NULL,
  `active_from` timestamp NULL DEFAULT NULL,
  `active_till` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_type` enum('INTEGER','DECIMAL','DATETIME','VARCHAR','BOOLEAN','TEXT') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_type` enum('TEXT','TEXTAREA','CKEDITOR','SELECT','FILE','DATETIME','RADIO','SWITCH') COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_for_all_products` tinyint(4) NOT NULL DEFAULT 0,
  `use_for_category_filter` tinyint(4) NOT NULL DEFAULT 0,
  `is_visible_frontend` tinyint(4) DEFAULT 1,
  `sort_order` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `slug`, `data_type`, `field_type`, `use_for_all_products`, `use_for_category_filter`, `is_visible_frontend`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Brand', 'brand', 'INTEGER', 'SELECT', 1, 0, 1, 10, '2020-03-18 20:03:00', '2020-03-29 00:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `property_dropdown_options`
--

CREATE TABLE `property_dropdown_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `display_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_dropdown_options`
--

INSERT INTO `property_dropdown_options` (`id`, `property_id`, `display_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'Avored', '2020-03-18 20:03:00', '2020-03-18 20:03:00'),
(2, 1, 'PHP', '2020-03-18 20:03:00', '2020-03-18 20:03:00'),
(3, 1, 'Deskplant', '2020-03-18 20:03:00', '2020-03-29 00:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', NULL, '2020-03-18 20:03:06', '2020-03-18 20:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_groups`
--

CREATE TABLE `tax_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` double(10,6) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `postcode` int(11) DEFAULT NULL,
  `rate_type` enum('PERCENTAGE','FIXED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PERCENTAGE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_group_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `name`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Default Group', 1, '2020-03-18 20:03:06', '2020-03-18 20:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_country_id_foreign` (`country_id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`),
  ADD KEY `admin_password_resets_token_index` (`token`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_email_unique` (`email`),
  ADD KEY `admin_users_role_id_foreign` (`role_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_slug_unique` (`slug`);

--
-- Indexes for table `attribute_dropdown_options`
--
ALTER TABLE `attribute_dropdown_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_dropdown_options_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_product_attribute_id_foreign` (`attribute_id`),
  ADD KEY `attribute_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `attribute_product_values`
--
ALTER TABLE `attribute_product_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_product_values_attribute_id_foreign` (`attribute_id`),
  ADD KEY `attribute_product_values_product_id_foreign` (`product_id`),
  ADD KEY `attribute_product_values_variation_id_foreign` (`variation_id`),
  ADD KEY `attribute_product_values_attribute_dropdown_option_id_foreign` (`attribute_dropdown_option_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_filters`
--
ALTER TABLE `category_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_filters_category_id_foreign` (`category_id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_translations_category_id_foreign` (`category_id`),
  ADD KEY `category_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_menu_group_id_foreign` (`menu_group_id`);

--
-- Indexes for table `menu_groups`
--
ALTER TABLE `menu_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_currency_id_foreign` (`currency_id`),
  ADD KEY `orders_shipping_address_id_foreign` (`shipping_address_id`),
  ADD KEY `orders_billing_address_id_foreign` (`billing_address_id`),
  ADD KEY `orders_order_status_id_foreign` (`order_status_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`),
  ADD KEY `order_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `order_product_attributes`
--
ALTER TABLE `order_product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_attributes_order_product_id_foreign` (`order_product_id`),
  ADD KEY `order_product_attributes_attribute_id_foreign` (`attribute_id`),
  ADD KEY `order_product_attributes_attribute_dropdown_option_id_foreign` (`attribute_dropdown_option_id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_translations_page_id_foreign` (`page_id`),
  ADD KEY `page_translations_language_id_foreign` (`language_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property`
--
ALTER TABLE `product_property`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_property_id_foreign` (`property_id`),
  ADD KEY `product_property_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property_boolean_values`
--
ALTER TABLE `product_property_boolean_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_boolean_values_property_id_foreign` (`property_id`),
  ADD KEY `product_property_boolean_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property_datetime_values`
--
ALTER TABLE `product_property_datetime_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_datetime_values_property_id_foreign` (`property_id`),
  ADD KEY `product_property_datetime_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property_decimal_values`
--
ALTER TABLE `product_property_decimal_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_decimal_values_property_id_foreign` (`property_id`),
  ADD KEY `product_property_decimal_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property_integer_values`
--
ALTER TABLE `product_property_integer_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_integer_values_property_id_foreign` (`property_id`),
  ADD KEY `product_property_integer_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property_text_values`
--
ALTER TABLE `product_property_text_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_text_values_property_id_foreign` (`property_id`),
  ADD KEY `product_property_text_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_property_varchar_values`
--
ALTER TABLE `product_property_varchar_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_property_varchar_values_property_id_foreign` (`property_id`),
  ADD KEY `product_property_varchar_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `promotion_codes`
--
ALTER TABLE `promotion_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `properties_slug_unique` (`slug`);

--
-- Indexes for table `property_dropdown_options`
--
ALTER TABLE `property_dropdown_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_dropdown_options_property_id_foreign` (`property_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

--
-- Indexes for table `tax_groups`
--
ALTER TABLE `tax_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attribute_dropdown_options`
--
ALTER TABLE `attribute_dropdown_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attribute_product`
--
ALTER TABLE `attribute_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_product_values`
--
ALTER TABLE `attribute_product_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category_filters`
--
ALTER TABLE `category_filters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `menu_groups`
--
ALTER TABLE `menu_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product_attributes`
--
ALTER TABLE `order_product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_property`
--
ALTER TABLE `product_property`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_property_boolean_values`
--
ALTER TABLE `product_property_boolean_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_property_datetime_values`
--
ALTER TABLE `product_property_datetime_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_property_decimal_values`
--
ALTER TABLE `product_property_decimal_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_property_integer_values`
--
ALTER TABLE `product_property_integer_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_property_text_values`
--
ALTER TABLE `product_property_text_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_property_varchar_values`
--
ALTER TABLE `product_property_varchar_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotion_codes`
--
ALTER TABLE `promotion_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `property_dropdown_options`
--
ALTER TABLE `property_dropdown_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_groups`
--
ALTER TABLE `tax_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD CONSTRAINT `admin_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_dropdown_options`
--
ALTER TABLE `attribute_dropdown_options`
  ADD CONSTRAINT `attribute_dropdown_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD CONSTRAINT `attribute_product_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `attribute_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `attribute_product_values`
--
ALTER TABLE `attribute_product_values`
  ADD CONSTRAINT `attribute_product_values_attribute_dropdown_option_id_foreign` FOREIGN KEY (`attribute_dropdown_option_id`) REFERENCES `attribute_dropdown_options` (`id`),
  ADD CONSTRAINT `attribute_product_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `attribute_product_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `attribute_product_values_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_filters`
--
ALTER TABLE `category_filters`
  ADD CONSTRAINT `category_filters_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_menu_group_id_foreign` FOREIGN KEY (`menu_group_id`) REFERENCES `menu_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_billing_address_id_foreign` FOREIGN KEY (`billing_address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `orders_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`),
  ADD CONSTRAINT `orders_shipping_address_id_foreign` FOREIGN KEY (`shipping_address_id`) REFERENCES `addresses` (`id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `order_product_attributes`
--
ALTER TABLE `order_product_attributes`
  ADD CONSTRAINT `order_product_attributes_attribute_dropdown_option_id_foreign` FOREIGN KEY (`attribute_dropdown_option_id`) REFERENCES `attribute_dropdown_options` (`id`),
  ADD CONSTRAINT `order_product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `order_product_attributes_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id`);

--
-- Constraints for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `page_translations_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property`
--
ALTER TABLE `product_property`
  ADD CONSTRAINT `product_property_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property_boolean_values`
--
ALTER TABLE `product_property_boolean_values`
  ADD CONSTRAINT `product_property_boolean_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_boolean_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property_datetime_values`
--
ALTER TABLE `product_property_datetime_values`
  ADD CONSTRAINT `product_property_datetime_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_datetime_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property_decimal_values`
--
ALTER TABLE `product_property_decimal_values`
  ADD CONSTRAINT `product_property_decimal_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_decimal_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property_integer_values`
--
ALTER TABLE `product_property_integer_values`
  ADD CONSTRAINT `product_property_integer_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_integer_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property_text_values`
--
ALTER TABLE `product_property_text_values`
  ADD CONSTRAINT `product_property_text_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_text_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_property_varchar_values`
--
ALTER TABLE `product_property_varchar_values`
  ADD CONSTRAINT `product_property_varchar_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_property_varchar_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property_dropdown_options`
--
ALTER TABLE `property_dropdown_options`
  ADD CONSTRAINT `property_dropdown_options_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
