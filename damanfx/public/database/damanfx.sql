-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2022 at 12:56 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `damanfx`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `midname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `visible_password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `is_active` tinyint(11) DEFAULT 0 COMMENT '0 = yes\r\n1 = no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `firstname`, `midname`, `lastname`, `email`, `password`, `phone`, `visible_password`, `address`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, 'loopcon', 'admin@damanfx.com', '$2y$10$9rS9SML9Yo4Lf7xWdvO.ReIMbtJ/LLjYb/20j1D4gUXR4fZIz8F4G', NULL, NULL, 'test address', 'nEB96HixHiPkRjNf7trvqMTfrjmyRkSXoEhCcOP8BnFREZZWMgKcAKDCrWDA', 0, '2021-04-28 04:54:27', '2022-09-15 07:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `artical`
--

CREATE TABLE `artical` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `author_image` varchar(255) DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No;1=Yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artical`
--

INSERT INTO `artical` (`id`, `title`, `slug`, `image`, `description`, `author_name`, `author_image`, `meta_keyword`, `meta_description`, `is_archive`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Worker Buried Under Pinea', 'worker-buried-under-pinea', 'Penguins1663565064.jpg', '<p><strong>A Worker was Buried in Pineapples</strong><br />\r\nnews item text about worker buried under pineapples<br />\r\nThere was a man working at a warehouse. When he was doing his job, he was buried on 1500 pounds of pineapple.<br />\r\nThe identity of the worker was not reported. Though he got that accident, he was not injured but he was sent to a hospital.<br />\r\nT<u>he accident happened when the worker was unloading boxes of pineapple from shipping container. The stack toppled over as result more than one thousand pounds of pineapple buried him.<br />\r\nThe New York Daily News reported that the worker was&nbsp; 39 years old. While he was unloading pineapples from the ship, he got the accident.</u></p>', 'Ab sdf df', 'Lighthouse1663565064.jpg', 'meta fd', 'desc df', 1, 1, '2022-09-18 23:53:08', 1, '2022-09-18 23:54:31');

-- --------------------------------------------------------

--
-- Table structure for table `company_deposit_options`
--

CREATE TABLE `company_deposit_options` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL COMMENT '`id` of `company_details`',
  `payment_option_id` int(11) DEFAULT NULL COMMENT '`id` of `payment_options`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company_details`
--

CREATE TABLE `company_details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_demo_account` tinyint(1) DEFAULT NULL COMMENT '0=No;1=Yes',
  `is_withdrawal_commission` tinyint(1) DEFAULT NULL COMMENT '0=No;1=Yes',
  `minimum_deposit_amount` decimal(15,2) DEFAULT NULL,
  `is_islamic_account` tinyint(1) DEFAULT NULL COMMENT '0=No;1=Yes',
  `year_founded` int(11) DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No;1=Yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_details`
--

INSERT INTO `company_details` (`id`, `name`, `slug`, `image`, `address`, `description`, `is_demo_account`, `is_withdrawal_commission`, `minimum_deposit_amount`, `is_islamic_account`, `year_founded`, `is_archive`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Evest\'s rating updated', 'evest-s-rating-updated', '1661491139Snake_River_(5mb)_(1)1663665384.jpg', 'tututyu', '<h2>Multiple dashboards &amp; pages</h2>\r\n\r\n<p>5 Dashboards and 40+ Pages featuring various components, giving you the freedom of choosing and combining. All components can take variation in color and styling, that can easily be modified using Sass.</p>\r\n\r\n<h2>Multiple dashboards &amp; pages</h2>\r\n\r\n<p>5 Dashboards and 40+ Pages featuring various components, giving you the freedom of choosing and combining. All components can take variation in color and styling, that can easily be modified using Sass.</p>\r\n\r\n<h2>Multiple dashboards &amp; pages</h2>\r\n\r\n<p><span style=\"color:#2ecc71\">5 Dashboards and 40+ Pages featuring various components, giving you the freedom of choosing and combining. All components can take variation in color and styling, that can easily be modified using Sass.</span></p>\r\n\r\n<h2>Multiple dashboards &amp; pages</h2>\r\n\r\n<p>5 Dashboards and 40+ Pages featuring various components, giving you the freedom of choosing and combining. All components can take variation in color and styling, that can easily be modified using Sass.</p>\r\n\r\n<h2>Multiple dashboards &amp; pages</h2>\r\n\r\n<p>5 Dashboards and 40+ Pages featuring various components, giving you the freedom of choosing and combining. All components can take variation in color and styling, that can easily be modified using Sass.</p>\r\n\r\n<h2>Multiple dashboards &amp; pages</h2>\r\n\r\n<p>5 Dashboards and 40+ Pages featuring various components, giving you the freedom of choosing and combining. All components can take variation in color and styling, that can easily be modified using Sass.</p>', 1, 0, '400.00', 0, 1994, 0, 1, '2022-09-20 01:47:16', 1, '2022-09-20 03:46:24'),
(2, 'tyrtyrty', 'tyrtyrty', '1661491799Snake_River_(5mb)_(1)1663666356.jpg', 'yrtyrty', '<p>tryrtyrt</p>', 1, 1, '56.00', 1, 5654, 1, 1, '2022-09-20 04:02:36', 1, '2022-09-20 04:03:25');

-- --------------------------------------------------------

--
-- Table structure for table `company_licenses`
--

CREATE TABLE `company_licenses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL COMMENT '`id` of `company_details`',
  `license_id` int(11) DEFAULT NULL COMMENT '`id` of `licenses`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_licenses`
--

INSERT INTO `company_licenses` (`id`, `company_id`, `license_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 1, 2, 1, '2022-09-20 01:47:17', 1, '2022-09-20 03:44:46'),
(3, 2, 1, 1, '2022-09-20 04:02:37', NULL, '2022-09-20 04:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `company_local_offices`
--

CREATE TABLE `company_local_offices` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL COMMENT '`id` of `company_details`',
  `country_id` int(11) DEFAULT NULL COMMENT '`id` of `countries`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_local_offices`
--

INSERT INTO `company_local_offices` (`id`, `company_id`, `country_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(3, 1, 101, 1, '2022-09-20 03:44:46', 1, '2022-09-20 03:44:46'),
(4, 2, 243, 1, '2022-09-20 04:02:37', NULL, '2022-09-20 04:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `company_trading_assets`
--

CREATE TABLE `company_trading_assets` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL COMMENT '`id` of `company_details`',
  `trading_asset_id` int(11) DEFAULT NULL COMMENT '`id` of `trading_asset`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_trading_assets`
--

INSERT INTO `company_trading_assets` (`id`, `company_id`, `trading_asset_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(2, 1, 1, 1, '2022-09-20 01:47:18', 1, '2022-09-20 03:44:46'),
(3, 1, 2, 1, '2022-09-20 03:45:27', 1, '2022-09-20 03:45:27');

-- --------------------------------------------------------

--
-- Table structure for table `company_trading_platforms`
--

CREATE TABLE `company_trading_platforms` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL COMMENT '`id` of `company_details`',
  `trading_platform_id` int(11) DEFAULT NULL COMMENT '`id` of `trading_platform`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_trading_platforms`
--

INSERT INTO `company_trading_platforms` (`id`, `company_id`, `trading_platform_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(5, 1, 2, 1, '2022-09-20 03:35:41', 1, '2022-09-20 03:35:41'),
(6, 2, 3, 1, '2022-09-20 04:02:37', NULL, '2022-09-20 04:02:37'),
(7, 1, 3, 1, '2022-09-20 04:39:56', 1, '2022-09-20 04:39:56');

-- --------------------------------------------------------

--
-- Table structure for table `company_withdrawal_options`
--

CREATE TABLE `company_withdrawal_options` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL COMMENT '`id` of `company_details`',
  `payment_option_id` int(11) DEFAULT NULL COMMENT '`id` of `payment_options`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_withdrawal_options`
--

INSERT INTO `company_withdrawal_options` (`id`, `company_id`, `payment_option_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 1, 1, 1, '2022-09-20 01:47:17', 1, '2022-09-20 03:44:46');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `shortname` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phonecode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `shortname`, `name`, `phonecode`) VALUES
(1, 'AF', 'Afghanistan', 93),
(2, 'AL', 'Albania', 355),
(3, 'DZ', 'Algeria', 213),
(4, 'AS', 'American Samoa', 1684),
(5, 'AD', 'Andorra', 376),
(6, 'AO', 'Angola', 244),
(7, 'AI', 'Anguilla', 1264),
(8, 'AQ', 'Antarctica', 0),
(9, 'AG', 'Antigua And Barbuda', 1268),
(10, 'AR', 'Argentina', 54),
(11, 'AM', 'Armenia', 374),
(12, 'AW', 'Aruba', 297),
(13, 'AU', 'Australia', 61),
(14, 'AT', 'Austria', 43),
(15, 'AZ', 'Azerbaijan', 994),
(16, 'BS', 'Bahamas The', 1242),
(17, 'BH', 'Bahrain', 973),
(18, 'BD', 'Bangladesh', 880),
(19, 'BB', 'Barbados', 1246),
(20, 'BY', 'Belarus', 375),
(21, 'BE', 'Belgium', 32),
(22, 'BZ', 'Belize', 501),
(23, 'BJ', 'Benin', 229),
(24, 'BM', 'Bermuda', 1441),
(25, 'BT', 'Bhutan', 975),
(26, 'BO', 'Bolivia', 591),
(27, 'BA', 'Bosnia and Herzegovina', 387),
(28, 'BW', 'Botswana', 267),
(29, 'BV', 'Bouvet Island', 0),
(30, 'BR', 'Brazil', 55),
(31, 'IO', 'British Indian Ocean Territory', 246),
(32, 'BN', 'Brunei', 673),
(33, 'BG', 'Bulgaria', 359),
(34, 'BF', 'Burkina Faso', 226),
(35, 'BI', 'Burundi', 257),
(36, 'KH', 'Cambodia', 855),
(37, 'CM', 'Cameroon', 237),
(38, 'CA', 'Canada', 1),
(39, 'CV', 'Cape Verde', 238),
(40, 'KY', 'Cayman Islands', 1345),
(41, 'CF', 'Central African Republic', 236),
(42, 'TD', 'Chad', 235),
(43, 'CL', 'Chile', 56),
(44, 'CN', 'China', 86),
(45, 'CX', 'Christmas Island', 61),
(46, 'CC', 'Cocos (Keeling) Islands', 672),
(47, 'CO', 'Colombia', 57),
(48, 'KM', 'Comoros', 269),
(49, 'CG', 'Republic Of The Congo', 242),
(50, 'CD', 'Democratic Republic Of The Congo', 242),
(51, 'CK', 'Cook Islands', 682),
(52, 'CR', 'Costa Rica', 506),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', 225),
(54, 'HR', 'Croatia (Hrvatska)', 385),
(55, 'CU', 'Cuba', 53),
(56, 'CY', 'Cyprus', 357),
(57, 'CZ', 'Czech Republic', 420),
(58, 'DK', 'Denmark', 45),
(59, 'DJ', 'Djibouti', 253),
(60, 'DM', 'Dominica', 1767),
(61, 'DO', 'Dominican Republic', 1809),
(62, 'TP', 'East Timor', 670),
(63, 'EC', 'Ecuador', 593),
(64, 'EG', 'Egypt', 20),
(65, 'SV', 'El Salvador', 503),
(66, 'GQ', 'Equatorial Guinea', 240),
(67, 'ER', 'Eritrea', 291),
(68, 'EE', 'Estonia', 372),
(69, 'ET', 'Ethiopia', 251),
(70, 'XA', 'External Territories of Australia', 61),
(71, 'FK', 'Falkland Islands', 500),
(72, 'FO', 'Faroe Islands', 298),
(73, 'FJ', 'Fiji Islands', 679),
(74, 'FI', 'Finland', 358),
(75, 'FR', 'France', 33),
(76, 'GF', 'French Guiana', 594),
(77, 'PF', 'French Polynesia', 689),
(78, 'TF', 'French Southern Territories', 0),
(79, 'GA', 'Gabon', 241),
(80, 'GM', 'Gambia The', 220),
(81, 'GE', 'Georgia', 995),
(82, 'DE', 'Germany', 49),
(83, 'GH', 'Ghana', 233),
(84, 'GI', 'Gibraltar', 350),
(85, 'GR', 'Greece', 30),
(86, 'GL', 'Greenland', 299),
(87, 'GD', 'Grenada', 1473),
(88, 'GP', 'Guadeloupe', 590),
(89, 'GU', 'Guam', 1671),
(90, 'GT', 'Guatemala', 502),
(91, 'XU', 'Guernsey and Alderney', 44),
(92, 'GN', 'Guinea', 224),
(93, 'GW', 'Guinea-Bissau', 245),
(94, 'GY', 'Guyana', 592),
(95, 'HT', 'Haiti', 509),
(96, 'HM', 'Heard and McDonald Islands', 0),
(97, 'HN', 'Honduras', 504),
(98, 'HK', 'Hong Kong S.A.R.', 852),
(99, 'HU', 'Hungary', 36),
(100, 'IS', 'Iceland', 354),
(101, 'IN', 'India', 91),
(102, 'ID', 'Indonesia', 62),
(103, 'IR', 'Iran', 98),
(104, 'IQ', 'Iraq', 964),
(105, 'IE', 'Ireland', 353),
(106, 'IL', 'Israel', 972),
(107, 'IT', 'Italy', 39),
(108, 'JM', 'Jamaica', 1876),
(109, 'JP', 'Japan', 81),
(110, 'XJ', 'Jersey', 44),
(111, 'JO', 'Jordan', 962),
(112, 'KZ', 'Kazakhstan', 7),
(113, 'KE', 'Kenya', 254),
(114, 'KI', 'Kiribati', 686),
(115, 'KP', 'Korea North', 850),
(116, 'KR', 'Korea South', 82),
(117, 'KW', 'Kuwait', 965),
(118, 'KG', 'Kyrgyzstan', 996),
(119, 'LA', 'Laos', 856),
(120, 'LV', 'Latvia', 371),
(121, 'LB', 'Lebanon', 961),
(122, 'LS', 'Lesotho', 266),
(123, 'LR', 'Liberia', 231),
(124, 'LY', 'Libya', 218),
(125, 'LI', 'Liechtenstein', 423),
(126, 'LT', 'Lithuania', 370),
(127, 'LU', 'Luxembourg', 352),
(128, 'MO', 'Macau S.A.R.', 853),
(129, 'MK', 'Macedonia', 389),
(130, 'MG', 'Madagascar', 261),
(131, 'MW', 'Malawi', 265),
(132, 'MY', 'Malaysia', 60),
(133, 'MV', 'Maldives', 960),
(134, 'ML', 'Mali', 223),
(135, 'MT', 'Malta', 356),
(136, 'XM', 'Man (Isle of)', 44),
(137, 'MH', 'Marshall Islands', 692),
(138, 'MQ', 'Martinique', 596),
(139, 'MR', 'Mauritania', 222),
(140, 'MU', 'Mauritius', 230),
(141, 'YT', 'Mayotte', 269),
(142, 'MX', 'Mexico', 52),
(143, 'FM', 'Micronesia', 691),
(144, 'MD', 'Moldova', 373),
(145, 'MC', 'Monaco', 377),
(146, 'MN', 'Mongolia', 976),
(147, 'MS', 'Montserrat', 1664),
(148, 'MA', 'Morocco', 212),
(149, 'MZ', 'Mozambique', 258),
(150, 'MM', 'Myanmar', 95),
(151, 'NA', 'Namibia', 264),
(152, 'NR', 'Nauru', 674),
(153, 'NP', 'Nepal', 977),
(154, 'AN', 'Netherlands Antilles', 599),
(155, 'NL', 'Netherlands The', 31),
(156, 'NC', 'New Caledonia', 687),
(157, 'NZ', 'New Zealand', 64),
(158, 'NI', 'Nicaragua', 505),
(159, 'NE', 'Niger', 227),
(160, 'NG', 'Nigeria', 234),
(161, 'NU', 'Niue', 683),
(162, 'NF', 'Norfolk Island', 672),
(163, 'MP', 'Northern Mariana Islands', 1670),
(164, 'NO', 'Norway', 47),
(165, 'OM', 'Oman', 968),
(166, 'PK', 'Pakistan', 92),
(167, 'PW', 'Palau', 680),
(168, 'PS', 'Palestinian Territory Occupied', 970),
(169, 'PA', 'Panama', 507),
(170, 'PG', 'Papua new Guinea', 675),
(171, 'PY', 'Paraguay', 595),
(172, 'PE', 'Peru', 51),
(173, 'PH', 'Philippines', 63),
(174, 'PN', 'Pitcairn Island', 0),
(175, 'PL', 'Poland', 48),
(176, 'PT', 'Portugal', 351),
(177, 'PR', 'Puerto Rico', 1787),
(178, 'QA', 'Qatar', 974),
(179, 'RE', 'Reunion', 262),
(180, 'RO', 'Romania', 40),
(181, 'RU', 'Russia', 70),
(182, 'RW', 'Rwanda', 250),
(183, 'SH', 'Saint Helena', 290),
(184, 'KN', 'Saint Kitts And Nevis', 1869),
(185, 'LC', 'Saint Lucia', 1758),
(186, 'PM', 'Saint Pierre and Miquelon', 508),
(187, 'VC', 'Saint Vincent And The Grenadines', 1784),
(188, 'WS', 'Samoa', 684),
(189, 'SM', 'San Marino', 378),
(190, 'ST', 'Sao Tome and Principe', 239),
(191, 'SA', 'Saudi Arabia', 966),
(192, 'SN', 'Senegal', 221),
(193, 'RS', 'Serbia', 381),
(194, 'SC', 'Seychelles', 248),
(195, 'SL', 'Sierra Leone', 232),
(196, 'SG', 'Singapore', 65),
(197, 'SK', 'Slovakia', 421),
(198, 'SI', 'Slovenia', 386),
(199, 'XG', 'Smaller Territories of the UK', 44),
(200, 'SB', 'Solomon Islands', 677),
(201, 'SO', 'Somalia', 252),
(202, 'ZA', 'South Africa', 27),
(203, 'GS', 'South Georgia', 0),
(204, 'SS', 'South Sudan', 211),
(205, 'ES', 'Spain', 34),
(206, 'LK', 'Sri Lanka', 94),
(207, 'SD', 'Sudan', 249),
(208, 'SR', 'Suriname', 597),
(209, 'SJ', 'Svalbard And Jan Mayen Islands', 47),
(210, 'SZ', 'Swaziland', 268),
(211, 'SE', 'Sweden', 46),
(212, 'CH', 'Switzerland', 41),
(213, 'SY', 'Syria', 963),
(214, 'TW', 'Taiwan', 886),
(215, 'TJ', 'Tajikistan', 992),
(216, 'TZ', 'Tanzania', 255),
(217, 'TH', 'Thailand', 66),
(218, 'TG', 'Togo', 228),
(219, 'TK', 'Tokelau', 690),
(220, 'TO', 'Tonga', 676),
(221, 'TT', 'Trinidad And Tobago', 1868),
(222, 'TN', 'Tunisia', 216),
(223, 'TR', 'Turkey', 90),
(224, 'TM', 'Turkmenistan', 7370),
(225, 'TC', 'Turks And Caicos Islands', 1649),
(226, 'TV', 'Tuvalu', 688),
(227, 'UG', 'Uganda', 256),
(228, 'UA', 'Ukraine', 380),
(229, 'AE', 'United Arab Emirates', 971),
(230, 'GB', 'United Kingdom', 44),
(231, 'US', 'United States', 1),
(232, 'UM', 'United States Minor Outlying Islands', 1),
(233, 'UY', 'Uruguay', 598),
(234, 'UZ', 'Uzbekistan', 998),
(235, 'VU', 'Vanuatu', 678),
(236, 'VA', 'Vatican City State (Holy See)', 39),
(237, 'VE', 'Venezuela', 58),
(238, 'VN', 'Vietnam', 84),
(239, 'VG', 'Virgin Islands (British)', 1284),
(240, 'VI', 'Virgin Islands (US)', 1340),
(241, 'WF', 'Wallis And Futuna Islands', 681),
(242, 'EH', 'Western Sahara', 212),
(243, 'YE', 'Yemen', 967),
(244, 'YU', 'Yugoslavia', 38),
(245, 'ZM', 'Zambia', 260),
(246, 'ZW', 'Zimbabwe', 263);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `template` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `label`, `value`, `template`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'contact_management', 'Contact Management', '<div style=\"border:1px solid #cccccc; display:contents; width:480px\">\r\n<table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" class=\"mob_center\" style=\"width:60%\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:middle\">\r\n			<div class=\"container\" style=\"background:#ffffff; padding:5px 10px\">&nbsp;<br />\r\n			&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\r\n			<p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt=\"\" src=\"http://localhost/crowd/front/images/logo.png\" style=\"height:152px; margin-left:100px; margin-right:100px; width:400px\" /></p>\r\n\r\n			<p>&nbsp;</p>\r\n			</div>\r\n\r\n			<div style=\"border-top:1px solid #cccccc; margin-bottom:0px; margin-left:50px; margin-right:50px; margin-top:0px\">&nbsp;</div>\r\n\r\n			<div class=\"container\" style=\"background:#ffffff; padding:5px 10px\">\r\n			<p style=\"text-align:center\"><em>Hello, Senitap staff</em></p>\r\n\r\n			<p style=\"text-align:center\"><em>The following Contact form has been submitted. Details as follows:&nbsp;</em></p>\r\n\r\n			<p style=\"text-align:center\"><strong>Name:</strong> [SENDER-NAME]</p>\r\n\r\n			<p style=\"text-align:center\"><strong>Email:</strong> [SENDER-EMAIL]</p>\r\n\r\n			<p style=\"text-align:center\"><strong>Subject:</strong>&nbsp;[SENDER-SUBJECT]</p>\r\n\r\n			<p style=\"text-align:center\"><strong>Message:</strong> [SENDER-MESSAGE]</p>\r\n\r\n			<p>&nbsp;</p>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:middle\">\r\n			<div class=\"container\" style=\"background:#eeeeee; padding:5px 10px\">\r\n			<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style=\"font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:medium\"><span style=\"color:#96a5b5\"><span style=\"font-size:13px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#96a5b5\">Copyright &copy; 2022&nbsp;SGFP. All Rights Reserved</span></span></span></span></span></span></span></p>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>', NULL, '2021-02-15 22:43:06', 1, '2022-04-25 17:32:27'),
(2, 'contact_user', 'Contact User', '<div style=\"border:1px solid #cccccc; display:contents; width:480px\">\r\n<table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" class=\"mob_center\" style=\"width:60%\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:middle\">\r\n			<div class=\"container\" style=\"background:#ffffff; padding:5px 10px\">&nbsp;<br />\r\n			&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\r\n			<p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img alt=\"\" src=\"http://localhost/crowd/front/images/logo.png\" style=\"height:152px; margin-left:100px; margin-right:100px; width:400px\" /></p>\r\n\r\n			<p>&nbsp;</p>\r\n			</div>\r\n\r\n			<div style=\"border-top:1px solid #cccccc; margin-bottom:0px; margin-left:50px; margin-right:50px; margin-top:0px\">&nbsp;</div>\r\n\r\n			<div class=\"container\" style=\"background:#ffffff; padding:5px 10px\">\r\n			<p style=\"text-align:center\"><em>Hello,</em></p>\r\n\r\n			<p style=\"text-align:center\">&nbsp;&nbsp;Thank You for contacting Senitap.</p>\r\n\r\n			<p style=\"text-align:center\">&nbsp; &nbsp; We received the following information:&nbsp;</p>\r\n\r\n			<p style=\"text-align:center\"><em>.Details as follows:&nbsp;</em></p>\r\n\r\n			<p style=\"text-align:center\"><strong>Name:</strong> [SENDER-NAME]</p>\r\n\r\n			<p style=\"text-align:center\"><strong>Email:</strong> [SENDER-EMAIL]</p>\r\n\r\n			<p style=\"text-align:center\"><strong>Subject:</strong>&nbsp;[SENDER-SUBJECT]</p>\r\n\r\n			<p style=\"text-align:center\"><strong>Message:</strong> [SENDER-MESSAGE]</p>\r\n\r\n			<p style=\"text-align:center\">&nbsp;Your email will be replied shorlty.</p>\r\n\r\n			<p style=\"text-align:center\">&nbsp; &nbsp; Many Thanks.</p>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align:middle\">\r\n			<div class=\"container\" style=\"background:#eeeeee; padding:5px 10px\">\r\n			<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style=\"font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:medium\"><span style=\"color:#96a5b5\"><span style=\"font-size:13px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#96a5b5\">Copyright &copy; 2022 SGFP</span></span></span></span></span></span></span><span style=\"font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:medium\"><span style=\"color:#96a5b5\"><span style=\"font-size:13px\"><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"color:#96a5b5\">. All Rights Reserved</span></span></span></span></span></span></span></p>\r\n			</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>', NULL, '2021-02-15 22:43:06', 1, '2022-04-25 17:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No,1=Yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`id`, `name`, `slug`, `is_archive`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'tyutyu67', 'tyutyu67', 0, 1, '2022-09-16 03:13:24', 1, '2022-09-16 03:13:44'),
(2, 'yrty8', 'yrty8', 0, 1, '2022-09-16 03:22:08', 1, '2022-09-16 03:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `author_image` varchar(255) DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No;1=Yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `image`, `description`, `author_name`, `author_image`, `meta_keyword`, `meta_description`, `is_archive`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Investigative News', 'investigative-news', 'Penguins1663561495.jpg', '<p>We hold people and institutions accountable by exposing injustice and systemic inequities. AZs only nonpartisan nonprofit newsroom dedicated to statewide investigative reporting. Make A Donation. Data-Driven Reporting. Sign Up For Updates. Options: Monthly, One-Time.</p>\r\n\r\n<p><strong>We hold people and institutions accountable by exposing injustice and systemic inequities. AZs only nonpartisan nonprofit newsroom dedicated to statewide investigative reporting. Make A Donation. Data-Driven Reporting. Sign Up For Updates. Options: Monthly, One-Time.</strong></p>\r\n\r\n<p>We hold people and institutions accountable by exposing injustice and systemic inequities. AZs only nonpartisan nonprofit newsroom dedicated to statewide investigative reporting. Make A Donation. Data-Driven Reporting. Sign Up For Updates. Options: Monthly, One-Time.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We hold people and institutions accountable by exposing injustice and systemic inequities. AZs only nonpartisan nonprofit newsroom dedicated to statewide investigative reporting. Make A Donation. Data-Driven Reporting. Sign Up For Updates. Options: Monthly, One-Time.</p>', 'abc', 'Tulips1663561495.jpg', 'meta', 'meta d', 1, 1, '2022-09-18 22:37:13', 1, '2022-09-18 23:14:42');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_archive` tinyint(4) DEFAULT 0 COMMENT '0=No;1=Yes',
  `meta_keyword` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `name`, `description`, `is_archive`, `meta_keyword`, `meta_description`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'page', 'Page', '<p>abc</p>', 0, NULL, NULL, NULL, '2022-03-22 00:40:45', NULL, '2022-03-22 00:40:45'),
(2, '56757', '56757', '<p><img alt=\"\" src=\"/damanfx/public/plugins/kcfinder/upload/images/16626189261661518844DSC04668%20(1).jpg\" style=\"height:200px; width:300px\" />&nbsp;hdfjhsdjfhsjdhfsjdf sdhjghdjfg</p>', 0, '678768', '78678678', NULL, '2022-09-15 05:07:25', NULL, '2022-09-15 05:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `payment_options`
--

CREATE TABLE `payment_options` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No,1=Yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_options`
--

INSERT INTO `payment_options` (`id`, `name`, `slug`, `is_archive`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'abcdef', 'abcdef', 0, 1, '2022-09-16 04:19:56', 1, '2022-09-16 04:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `label`, `value`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Site Name', 'site_name', 'Daman FX', NULL, '2020-07-08 00:54:10', NULL, '2022-09-12 05:55:54'),
(2, 'Phone', 'phone', '8237823782', NULL, '2020-07-08 01:29:17', NULL, '2022-09-12 05:55:54'),
(3, 'Address', 'address', '5-Hsdf sdfh sdfhj,<br/>\r\nKsdhf sdf hsd sdfh sdjf,<br/>\r\nCIty.', NULL, '2020-07-08 01:29:43', NULL, '2022-09-12 05:55:54'),
(4, 'Contact Email', 'email', 'info@damanfx.com', NULL, '2020-07-08 01:32:25', NULL, '2022-09-12 05:55:54'),
(5, 'Facebook', 'facebook', 'facebook.com', NULL, '2020-07-08 01:33:07', NULL, '2022-09-12 05:55:54'),
(6, 'Google', 'google', 'twitter.com', NULL, '2020-07-08 01:33:34', NULL, '2022-09-12 05:55:54'),
(7, 'Instagram', 'instagram', 'instagram.com', NULL, '2020-07-08 01:33:52', NULL, '2022-09-12 05:55:54'),
(8, 'LinkedIn', 'linkedin', 'www.linkedin.com/damanfx', NULL, '2020-07-08 01:34:19', NULL, '2022-09-12 05:55:54'),
(9, 'Whatsapp', 'whatsapp', '8779875421212', NULL, '2020-07-08 01:34:37', NULL, '2022-09-12 05:55:54'),
(10, 'Fax', 'fax', '8192948588', NULL, '2020-08-01 00:53:25', NULL, '2022-09-12 05:55:54'),
(11, 'Copyright Year', 'copyright_year', '2022', NULL, '2020-09-05 00:59:17', NULL, '2022-09-12 05:55:54'),
(16, 'Cookie Consent', 'cookie_concent', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, '2021-06-05 05:57:53', NULL, '2021-06-05 00:38:28'),
(17, 'Designed By', 'designed_by', 'dsfh7 ghj', NULL, '2022-08-22 05:46:19', NULL, '2022-09-12 05:56:19');

-- --------------------------------------------------------

--
-- Table structure for table `smtp`
--

CREATE TABLE `smtp` (
  `id` int(11) NOT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `mail_address` varchar(255) DEFAULT NULL,
  `mail_mailer` varchar(255) DEFAULT NULL,
  `mail_username` varchar(255) DEFAULT NULL,
  `mail_host` varchar(255) DEFAULT NULL,
  `mail_password` varchar(255) DEFAULT NULL,
  `mail_port` varchar(255) DEFAULT NULL,
  `mail_enc` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `smtp`
--

INSERT INTO `smtp` (`id`, `sender_name`, `mail_address`, `mail_mailer`, `mail_username`, `mail_host`, `mail_password`, `mail_port`, `mail_enc`, `created_at`, `updated_at`) VALUES
(1, 'DamanFx', 'loopcon1001@gmail.com', 'smtp', 'rohitloopcon@gmail.com', 'smtp.gmail.com', 'Rlc@15081991', '465', 'ssl', '2022-03-22 00:40:16', '2022-09-12 00:31:03');

-- --------------------------------------------------------

--
-- Table structure for table `trading_asset`
--

CREATE TABLE `trading_asset` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No,1=Yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trading_asset`
--

INSERT INTO `trading_asset` (`id`, `name`, `slug`, `is_archive`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'asafs', 'asafs', 0, 1, '2022-09-16 05:07:35', NULL, '2022-09-16 05:07:35'),
(2, 'rtyrty', 'rtyrty', 0, 1, '2022-09-16 05:07:48', NULL, '2022-09-16 05:07:48'),
(3, 'fds', 'fds', 0, 1, '2022-09-16 05:08:24', NULL, '2022-09-16 05:08:24'),
(4, 'dfhdfh', 'dfhdfh', 1, 1, '2022-09-16 05:10:54', 1, '2022-09-16 05:11:25');

-- --------------------------------------------------------

--
-- Table structure for table `trading_platform`
--

CREATE TABLE `trading_platform` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No,1=Yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trading_platform`
--

INSERT INTO `trading_platform` (`id`, `name`, `slug`, `is_archive`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'abc def', 'abc-def', 1, 1, '2022-09-16 00:32:30', 1, '2022-09-16 00:32:45'),
(2, 'abcdef', 'abcdef', 0, 1, '2022-09-16 00:43:22', 1, '2022-09-16 01:10:17'),
(3, 'aasd', 'aasd', 0, 1, '2022-09-16 03:10:55', NULL, '2022-09-16 03:10:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_type` tinyint(1) DEFAULT NULL COMMENT '0=investor;1=designer;2=visitor',
  `user_summary` text DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `mname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `nick_name` varchar(100) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL COMMENT '0=male;1=female',
  `activity` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `work` varchar(100) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `document` text DEFAULT NULL,
  `is_online` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-no,1-yes',
  `total_available_credits` int(11) DEFAULT NULL,
  `total_votes` int(11) DEFAULT 0,
  `total_finance` int(11) DEFAULT 0,
  `remember_token` varchar(255) DEFAULT NULL,
  `is_mailing_enable` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-yes , 1-no',
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Yes; 1= No;',
  `is_archive` tinyint(4) NOT NULL DEFAULT 0 COMMENT ' 1=Yes; 0= No;',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `user_summary`, `fname`, `mname`, `lname`, `email`, `password`, `nick_name`, `job`, `company_name`, `bdate`, `gender`, `activity`, `address`, `city`, `state`, `country`, `zip`, `phone`, `mobile`, `work`, `image`, `document`, `is_online`, `total_available_credits`, `total_votes`, `total_finance`, `remember_token`, `is_mailing_enable`, `is_active`, `is_archive`, `created_at`, `updated_at`) VALUES
(1, 0, 'khushalikhanjanpatel27/04/20221101', 'khushali', 'khanjan', 'patel', 'khushaliloopcon1@gmail.com', '$2y$10$kydQnGcz0g2HfUp4tFnXkOR2v1d9VA7POPqJl7YpfE4Z4yqMoyVfy', '345345', 'Khushali Distributor', 'Loopcon Technologies', '2022-04-27', 1, 1, 'Nana mova road, 27556', '43534fdgdf', 'asdasd', 101, NULL, '872536511233', '345345', '345435', 'Tulips1652778936.jpg', NULL, 0, 9993, 8, NULL, NULL, 0, 0, 0, '2022-05-17 03:45:36', '2022-08-05 05:44:53'),
(4, 0, 'khushalikhanjanpatel07/03/20221101', 'Khushali', 'Khanjan', 'Patel', 'khushaliloopcon3@gmail.com', '$2y$10$L3Kg.dXnMvak87awcEyvb.ruhApQHCeBEA/VCw9eWGbApd7DsRDG6', 'Khush', 'Web Developer', 'Loopcon Technologies', '2022-03-07', 1, 1, 'Nana mova road, 27556', 'Adoni', 'Andhra Pradesh', 101, '345345', '9836372728', '8256389451', '7894512445', 'ChinaDELI_Stationery16428363141655198616.png', 'file-sample_100kB1655198616.doc', 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2022-06-14 03:53:36', '2022-06-14 03:53:36'),
(5, 1, 'jencysjadeja03/01/20221101', 'Jency', 'S', 'Jadeja', 'loopcon1001@gmail.com', '$2y$10$EWAlH4u6KmJqvib5JpHnvel97nSdI6UscFSjaboLQKxLMBfXt4eRu', 'jaanu', 'Developer', 'Loopcon Technologies', '2022-01-03', 1, 1, 'Nana mova road, 27556', 'Adoni', 'Andhra Pradesh', 101, '439999', '872536511233', '872536511233', '23333333334', 'Screenshot_11655364793.png', NULL, 0, -1, 4, NULL, NULL, 0, 0, 0, '2022-06-16 02:03:13', '2022-08-10 03:19:23'),
(6, 1, 'khushalikhanjanpatel04/01/20221101', 'Khushali', 'Khanjan', 'Patel', 'khushp4@gmail.com', '$2y$10$mc7BE70rGrFOxmNPCoV4YOz6aCNmrEXZdmohK3PB87NF.TF9liIoy', 'khush', 'Web Developer', NULL, '2022-01-04', 1, 1, 'Nana mova road, 27', 'Rajkot', 'Gujarat', 101, '360002', '872536511233', '902382989', '1233333323234', 'Desert1655365541.jpg', NULL, 1, -2, 5, 0, NULL, 0, 0, 0, '2022-06-16 02:15:41', '2022-09-09 23:53:05'),
(7, 1, 'khushalikdistributor10/03/20221103', 'Khushali', 'K', 'Distributor', 'khushalipatel484@gmail.com', '$2y$10$4Yw.xJldRr524y.U8caht.erYGWtxtb0d35OaCxBE0egvAQ/RXKA2', 'khush', 'Web Developer', 'Loopcon Technologies', '2022-03-10', 1, 1, 'Nana mova road, 27', 'Rajkot', 'Gujarat', 103, '360002', '872536511233', '08723672637', '4355555555555554', 'ChinaDELI_Stationery16428363141655448420.png', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, '2022-06-17 01:17:00', '2022-06-17 01:17:00'),
(8, 0, 'khushkhanjpatel06/03/19961101', 'khush', 'khanj', 'patel', 'khush4785@gmail.com', '$2y$10$y/6kzy/svlPpvltcOdkYcOysGhYsLNTSzo4RhS20HRDH2VUAlc/U6', 'khushi', 'designer', 'Saarthi Pedagogy Pvt. Ltd.', '1996-03-06', 1, 1, 'A-1005, Mondeal Height, Beside Novatel Hotel, Sarkhej -\r\nGandhinagar Hwy', 'Ahmedabad', 'Gujarat', 101, '380054', '902382989', '902382989', '9033961681', 'ChinaDELI_Stationery16428363141657183214.png', 'stadium1657183214.jpg', 0, 700, 1, 300, NULL, 0, 0, 0, '2022-07-07 03:10:14', '2022-07-07 04:55:19'),
(9, 0, 'rozeragrotest28/01/20040101', 'Rozer', 'Agro', 'test', 'rojer22711@agrolivana.com', '$2y$10$5/mccX686w6u6q8CGBxDYO9XTlCw3vKTlPflp1Ta/au0p6pr8LhRa', 'Roz', 'Investor', 'loop', '2004-01-28', 0, 1, 'Nana mova road, 27', 'Rajkot', 'Gujarat', 101, NULL, '872536511233', '872536511233', '9033838833', 'undefined-edited1658992170.jpg', NULL, 0, 75500, 2504, 23000, NULL, 0, 0, 0, '2022-07-28 01:39:30', '2022-08-10 03:24:57'),
(10, 0, 'rinonaltpano02/07/19800101', 'Rinon', 'Alt', 'Pano', 'rinon13029@altpano.com', '$2y$10$8NDo91j7.EWtPhjhGU7Dcu2ZnPVx/qDu3n5zJ/SzWK0hlD02cjtC2', 'Rin', 'web Development', 'Loopcon Technologies', '1980-07-02', 0, 1, 'Nana mova road, 27556', 'Adoni', 'Andhra Pradesh', 101, NULL, '902382989', '08909201234', '56765765', 'Jellyfish-edited(2)1658993814.jpg', NULL, 1, NULL, 2012, 73250, NULL, 0, 0, 0, '2022-07-28 02:06:54', '2022-09-01 06:08:59'),
(11, 2, 'refgoanlub02/07/19801101', 'Ref', 'Go', 'Anlub', 'refego8259@anlubi.com', '$2y$10$YamL7FoY8e6P7pHA0k1D1uB2fi1nB4/xDX7nxocfLqJ1eDzxbun2C', '433333', 'Abc', 'Loopcon Technologies', '1980-07-02', 1, 1, 'Nana mova road, 27556', 'Adoni', 'Andhra Pradesh', 101, '360002', '872536511233', '872536511233', '3222222323', 'Jellyfish-edited1658994634.jpg', NULL, 0, NULL, 7, 0, NULL, 0, 0, 0, '2022-07-28 02:20:34', '2022-07-29 04:21:26'),
(12, 2, 'beneyealt05/06/19790101', 'Ben', 'Eye', 'Alt', 'beneyeg818@altpano.com', '$2y$10$mbqDvqytt/EIr/2NfsxtVeJIK68YZG38qztSOvBkCwc268vnaO9VW', 'Ben', 'Developer', 'test', '1979-06-05', 0, 1, 'asjdkasdj', 'Asarganj', 'Bihar', 101, '126317', '902382989', '872536511233', '857657567657', 'T-shirtWhite1658994980.png', NULL, 0, -1, 7, 0, NULL, 0, 0, 0, '2022-07-28 02:26:19', '2022-08-03 04:31:39'),
(13, 1, 'veglayanl30/01/19901100', 'Veg', 'Lay', 'Anl', 'vegilay405@anlubi.com', '$2y$10$LqAdK4D76ERuGk5Yksz2wenrmvpFMTdwKUrM5V6O/XNFFMAYT9Eey', 'Veg', 'Designer', 'Saarthi Pedagogy Pvt. Ltd.', '1990-01-30', 1, 1, 'A-1005, Mondeal Height, Beside Novatel Hotel, Sarkhej -\r\nGandhinagar Hwy', 'Ahmedabad', 'Gujarat', 100, '380054', '872536511233', '872536511233', '55555555554', 'SampleImage1658999415.png', NULL, 0, NULL, 3, 0, NULL, 0, 0, 0, '2022-07-28 03:40:15', '2022-07-29 04:19:45'),
(14, 0, 'sdfgsdgsdgsg07/09/20220231', 'sdfgsdg', NULL, 'sdgsg', 'loopcon6@gmail.com', '$2y$10$pI0ka4T.5qwmZD.1FazfUOmABX0Q.Gy63Xeb7My2oKa0ezze20TTy', 'dsg', 'sdgsdg', NULL, '2022-09-07', 0, 1, '45, sdgfh', 'new york', 'New York', 231, '10003', '4564565465', '4564565465', '43535345435', 'ChinaDELI_Stationery16428363141662786867.png', NULL, 0, 1000, 0, 0, NULL, 0, 0, 0, '2022-09-09 23:44:26', '2022-09-09 23:44:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artical`
--
ALTER TABLE `artical`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_deposit_options`
--
ALTER TABLE `company_deposit_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_details`
--
ALTER TABLE `company_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_licenses`
--
ALTER TABLE `company_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_local_offices`
--
ALTER TABLE `company_local_offices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_trading_assets`
--
ALTER TABLE `company_trading_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_trading_platforms`
--
ALTER TABLE `company_trading_platforms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_withdrawal_options`
--
ALTER TABLE `company_withdrawal_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_options`
--
ALTER TABLE `payment_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smtp`
--
ALTER TABLE `smtp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trading_asset`
--
ALTER TABLE `trading_asset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trading_platform`
--
ALTER TABLE `trading_platform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `artical`
--
ALTER TABLE `artical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_deposit_options`
--
ALTER TABLE `company_deposit_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_details`
--
ALTER TABLE `company_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company_licenses`
--
ALTER TABLE `company_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company_local_offices`
--
ALTER TABLE `company_local_offices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company_trading_assets`
--
ALTER TABLE `company_trading_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company_trading_platforms`
--
ALTER TABLE `company_trading_platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `company_withdrawal_options`
--
ALTER TABLE `company_withdrawal_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_options`
--
ALTER TABLE `payment_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `smtp`
--
ALTER TABLE `smtp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trading_asset`
--
ALTER TABLE `trading_asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trading_platform`
--
ALTER TABLE `trading_platform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
