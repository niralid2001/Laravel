-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2022 at 01:47 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_mobile` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `pincode` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  `state` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `type`, `mobile`, `alternate_mobile`, `address`, `landmark`, `area_id`, `city_id`, `pincode`, `country_code`, `state`, `country`, `latitude`, `longitude`, `is_default`) VALUES
(1, 13, 'Test user', 'home', '9876543210', NULL, 'safs', NULL, 1, 1, '', 0, 'Gujarat', 'India', NULL, NULL, 0),
(2, 13, 'test', 'home', '9876543210', NULL, 'sasdfsdfdds', NULL, 1, 1, '', 0, 'Gujarat', 'India', NULL, NULL, 1),
(3, 1, 'hello', 'home', '456789533445', NULL, '407 ayodhya chowk rajkot', NULL, NULL, 6, '', 0, 'gbbbbbbc', 'fggcgb', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` int(11) NOT NULL,
  `zipcode_id` int(11) NOT NULL DEFAULT 0,
  `minimum_free_delivery_order_amount` double NOT NULL DEFAULT 100,
  `delivery_charges` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `city_id`, `zipcode_id`, `minimum_free_delivery_order_amount`, `delivery_charges`) VALUES
(1, 'Sorathiya wadi', 1, 1, 10, 55),
(2, 'air port', 1, 5, 10, 55);

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `attribute_set_id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `added_user_is` enum('Seller','Admin') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attribute_set_id`, `name`, `type`, `date_created`, `status`, `added_user_is`, `added_by`) VALUES
(1, 1, 'Color', NULL, '2022-11-22 06:40:21', 1, 'Seller', 12),
(2, 2, 'Size', NULL, '2022-11-22 08:17:06', 1, 'Admin', 1),
(3, 3, 'Color', NULL, '2022-11-22 11:26:11', 1, 'Seller', 25);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_set`
--

CREATE TABLE `attribute_set` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `added_user_is` enum('Seller','Admin') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_set`
--

INSERT INTO `attribute_set` (`id`, `name`, `status`, `added_user_is`, `added_by`) VALUES
(1, 'Color', 1, 'Seller', 12),
(2, 'Size', 1, 'Admin', 1),
(3, 'Color', 1, 'Seller', 25),
(5, 'hello', 1, 'Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `filterable` int(11) DEFAULT 0,
  `value` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `swatche_type` int(11) DEFAULT 0,
  `swatche_value` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `added_user_is` enum('Seller','Admin') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `filterable`, `value`, `swatche_type`, `swatche_value`, `status`, `added_user_is`, `added_by`) VALUES
(1, 1, 0, 'Black', 1, '#000000', 1, 'Seller', 12),
(2, 1, 0, 'Blue', 1, '#0000ff', 1, 'Seller', 12),
(3, 1, 0, 'Green', 1, '#00ff00', 1, 'Seller', 12),
(4, 1, 0, 'Red', 1, '#ff0000', 1, 'Seller', 12),
(5, 1, 0, 'Aqua', 1, '#00ffff', 1, 'Seller', 12),
(6, 1, 0, 'Magenta', 1, '#ff00ff', 1, 'Seller', 12),
(7, 1, 0, 'Yellow', 1, '#ffff00', 1, 'Seller', 12),
(8, 1, 0, 'White', 1, '#ffffff', 1, 'Seller', 12),
(9, 2, 0, '10', 0, '#000000', 1, 'Admin', 1),
(10, 2, 0, '20', 0, '#000000', 1, 'Admin', 1),
(11, 1, 0, 'Orange', 1, '#ff681f', 1, 'Seller', 25);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `row_order` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `name`, `image`, `row_order`, `status`) VALUES
(1, 'Banner 1', 'uploads/media/2022/febricbed.png', NULL, 1),
(2, 'Banner 2', 'uploads/media/2022/iphone.png', NULL, 1),
(3, 'Banner 3', 'uploads/media/2022/banner-3.jpg', NULL, 1),
(4, 'test', 'uploads/media/2022/colored-clay-undereye-corrector-6.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `status`) VALUES
(1, 'Nike', 'nike', 'uploads/media/2022/nike.jpg', 1),
(2, 'Adidas', 'adidas', 'uploads/media/2022/adidas.jpg', 1),
(3, 'vjmbm', 'vjmbm', 'uploads/media/2022/discount3.png', 1),
(4, 'nike', 'nike-1', 'uploads/media/2022/discount3.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `guest_user_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `is_saved_for_later` int(11) NOT NULL DEFAULT 0,
  `is_guest` tinyint(4) NOT NULL DEFAULT 0 COMMENT '(0:No|1:Yes)',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `guest_user_id`, `product_variant_id`, `qty`, `is_saved_for_later`, `is_guest`, `date_created`) VALUES
(20, 0, 1668599463, 2, 1, 0, 1, '2022-11-16 11:51:03'),
(30, 0, 1668597874, 2, 1, 0, 1, '2022-11-16 12:51:28'),
(31, 0, 1668602366, 2, 1, 0, 1, '2022-11-16 12:54:07'),
(32, 0, 1668602366, 3, 1, 0, 1, '2022-11-16 12:54:09'),
(43, 0, 1668669631, 2, 1, 0, 1, '2022-11-19 08:11:37'),
(46, 13, 0, 2, 2, 0, 0, '2022-11-23 11:51:20'),
(47, 13, 0, 3, 2, 0, 0, '2022-11-23 11:51:34'),
(53, 1, 0, 2, 4, 0, 0, '2022-11-30 13:06:20');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row_order` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT NULL,
  `clicks` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `slug`, `image`, `banner`, `row_order`, `status`, `clicks`) VALUES
(1, 'Test', 0, 'test-1', 'uploads/media/2022/vendurs.png', '', 0, NULL, 0),
(2, 'Makeup', 285, 'makeup', 'uploads/media/2022/makeup.jpg', NULL, 0, 1, 0),
(3, 'Eyes', 2, 'eyes', 'uploads/media/2022/eyes.jpg', NULL, 0, 1, 0),
(4, 'False Eyelashes & Adhesives', 3, 'false-eyelashes-adhesives', 'uploads/media/2022/eyelashes.jpg', NULL, 0, 1, 7),
(5, 'Eyebrow Colour', 3, 'eyebrow-colour', 'uploads/media/2022/eyebrow-color.jpg', NULL, 0, 1, 0),
(6, 'Eyeshadow', 3, 'eyeshadow', 'uploads/media/2022/eyeshadow.png', NULL, 0, 1, 0),
(7, 'Eyeliner', 3, 'eyeliner', 'uploads/media/2022/eyeliner.jpg', NULL, 0, 1, 0),
(8, 'Mascara', 3, 'mascara', 'uploads/media/2022/mascara.jpg', NULL, 0, 1, 73),
(9, 'Liner & Shadow Combinations', 3, 'liner-shadow-combinations', 'uploads/media/2022/liner_shadow_combinations.jpg', NULL, 0, 1, 0),
(10, 'Concealer', 3, 'concealer', 'uploads/media/2022/concealer.png', NULL, 0, 1, 3),
(11, 'Eye Gloss', 3, 'eye-gloss', 'uploads/media/2022/71I3CDT+jcL.jpg', NULL, 0, 1, 0),
(12, 'Kohal Pencils', 3, 'kohal-pencils', 'uploads/media/2022/KohalPencils.jpg', NULL, 0, 1, 0),
(13, 'Eyeshadow Bases & Primers', 3, 'eyeshadow-bases-primers', 'uploads/media/2022/Eyeshadow_Bases_Primers.jpg', NULL, 0, 1, 0),
(14, 'Brushes & Tools', 2, 'brushes-tools', 'uploads/media/2022/Brushes_Tools.jpg', NULL, 0, 1, 0),
(15, 'Eyes', 14, 'eyes-1', 'uploads/media/2022/eyes.jpg', NULL, 0, 1, 0),
(16, 'Brush Sets', 14, 'brush-sets', 'uploads/media/2022/Brush_Sets.png', NULL, 0, 1, 0),
(17, 'Sets & Kits', 14, 'sets-kits', 'uploads/media/2022/Sets_Kits.jpg', NULL, 0, 1, 0),
(18, 'Face', 14, 'face', 'uploads/media/2022/Face.jpg', NULL, 0, 1, 0),
(19, 'Brush Cleaners', 14, 'brush-cleaners-1', 'uploads/media/2022/Brush_Cleaners.jpg', '', 0, 1, 0),
(20, 'Lip Brushes', 14, 'lip-brushes', 'uploads/media/2022/Lip_Brushes.jpg', NULL, 0, 1, 0),
(21, 'Makeup Airbrushes', 14, 'makeup-airbrushes', 'uploads/media/2022/Makeup_Airbrushes.png', NULL, 0, 1, 0),
(22, 'Sharpeners', 14, 'sharpeners', 'uploads/media/2022/Sharpeners.jpg', NULL, 0, 1, 0),
(23, 'Body', 2, 'body', 'uploads/media/2022/Body.png', NULL, 0, 1, 0),
(24, 'Temporary Tattoos', 23, 'temporary-tattoos', 'uploads/media/2022/Temporary_Tattoos.jpg', NULL, 0, 1, 0),
(25, 'Body Paint', 23, 'body-paint', 'uploads/media/2022/Body_Paint.jpeg', NULL, 0, 1, 0),
(26, 'Body Glitter', 23, 'body-glitter', 'uploads/media/2022/Body_Glitter.png', NULL, 0, 1, 0),
(27, 'Henna', 23, 'henna', 'uploads/media/2022/heena.jpg', NULL, 0, 1, 0),
(28, 'Concealer', 23, 'concealer-1', 'uploads/media/2022/concealer.png', NULL, 0, 1, 0),
(29, 'Lips', 2, 'lips', 'uploads/media/2022/Lips.jpg', NULL, 0, 1, 0),
(30, 'Lipsticks', 29, 'lipsticks', 'uploads/media/2022/Lipsticks.png', NULL, 0, 1, 0),
(31, 'Lip Glosses', 29, 'lip-glosses', 'uploads/media/2022/Lip_Glosses.png', NULL, 0, 1, 0),
(32, 'Lip Liners', 29, 'lip-liners', 'uploads/media/2022/Lip_Liners.png', NULL, 0, 1, 0),
(33, 'Lip Stains', 29, 'lip-stains', 'uploads/media/2022/Lip_Stains1.png', NULL, 0, 1, 0),
(34, 'Lipstick Primers', 29, 'lipstick-primers', 'uploads/media/2022/Lipstick_Primers.png', NULL, 0, 1, 0),
(35, 'Face', 2, 'face-1', 'uploads/media/2022/Face.jpg', NULL, 0, 1, 0),
(36, 'Foundation', 35, 'foundation', 'uploads/media/2022/Foundation.png', NULL, 0, 1, 0),
(37, 'Powder', 35, 'powder', 'uploads/media/2022/Powder.jpg', NULL, 0, 1, 0),
(38, 'Concealers & Neutralizers', 35, 'concealers-neutralizers', 'uploads/media/2022/Concealers_Neutralizers.jpg', NULL, 0, 1, 0),
(39, 'Blush', 35, 'blush', 'uploads/media/2022/Blush.png', NULL, 0, 1, 0),
(40, 'Foundation Primers', 35, 'foundation-primers', 'uploads/media/2022/FoundationPrimers.jpg', NULL, 0, 1, 0),
(41, 'Blotting Paper', 35, 'blotting-paper', 'uploads/media/2022/BlottingPaper.jpg', NULL, 0, 1, 0),
(42, 'CC Creams', 35, 'cc-creams', 'uploads/media/2022/Creams1.jpg', NULL, 0, 1, 0),
(43, 'BB Creams', 35, 'bb-creams', 'uploads/media/2022/BBCreams.png', NULL, 0, 1, 0),
(44, 'Make-Up Finishers', 35, 'make-up-finishers', 'uploads/media/2022/Make-UpFinishers.png', NULL, 0, 1, 0),
(45, 'Contour Creams', 35, 'contour-creams', 'uploads/media/2022/ContourCreams.png', NULL, 0, 1, 0),
(46, 'Tools & Accessories', 285, 'tools-accessories', 'uploads/media/2022/ToolsAccessories.png', NULL, 0, 1, 0),
(47, 'Bags & Cases', 46, 'bags-cases', 'uploads/media/2022/BagsCases.png', NULL, 0, 1, 0),
(48, 'Toiletry Bags', 47, 'toiletry-bags', 'uploads/media/2022/ToiletryBags.png', NULL, 0, 1, 0),
(49, 'Cosmetic Bags', 47, 'cosmetic-bags', 'uploads/media/2022/CosmeticBags.jpg', NULL, 0, 1, 0),
(50, 'Train Cases', 47, 'train-cases', 'uploads/media/2022/TrainCases.jpg', NULL, 0, 1, 0),
(51, 'Toiletry Kits', 47, 'toiletry-kits', 'uploads/media/2022/ToiletryKits.jpg', NULL, 0, 1, 0),
(52, 'Skin Care Tools', 46, 'skin-care-tools', 'uploads/media/2022/SkinCareTools.png', NULL, 0, 1, 0),
(53, 'Mirrors', 46, 'mirrors', 'uploads/media/2022/Mirrors.png', NULL, 0, 1, 0),
(54, 'Make-Up Mirrors', 53, 'make-up-mirrors', 'uploads/media/2022/Make-UpMirrors.png', NULL, 0, 1, 0),
(55, 'Compact Mirrors', 53, 'compact-mirrors', 'uploads/media/2022/CompactMirrors.jpg', NULL, 0, 1, 0),
(56, 'Handheld Mirrors', 53, 'handheld-mirrors', 'uploads/media/2022/HandheldMirrors.jpg', NULL, 0, 1, 0),
(57, 'Shower Mirrors', 53, 'shower-mirrors', 'uploads/media/2022/ShowerMirrors.jpg', NULL, 0, 1, 0),
(58, 'Refillable Cosmetic Containers', 46, 'refillable-cosmetic-containers', 'uploads/media/2022/RefillableCosmeticContainers.png', NULL, 0, 1, 0),
(59, 'Jars', 58, 'jars', 'uploads/media/2022/Jars.png', NULL, 0, 1, 0),
(60, 'Kits', 58, 'kits', 'uploads/media/2022/Kits.png', NULL, 0, 1, 0),
(61, 'Spray Bottles', 58, 'spray-bottles', 'uploads/media/2022/SprayBottles.png', NULL, 0, 1, 0),
(62, 'Pump Dispensers', 58, 'pump-dispensers', 'uploads/media/2022/PumpDispensers.jpg', NULL, 0, 1, 0),
(63, 'Roller Bottles', 58, 'roller-bottles', 'uploads/media/2022/RollerBottles.jpg', NULL, 0, 1, 0),
(64, 'Cotton Balls & Swabs', 46, 'cotton-balls-swabs', 'uploads/media/2022/CottonBallsSwabs.jpg', NULL, 0, 1, 0),
(65, 'Cotton Swabs', 64, 'cotton-swabs', 'uploads/media/2022/CottonSwabs.png', NULL, 0, 1, 0),
(66, 'Cotton Pads & Rounds', 64, 'cotton-pads-rounds', 'uploads/media/2022/CottonPadsRounds.jpg', NULL, 0, 1, 0),
(67, 'Cotton Balls', 64, 'cotton-balls', 'uploads/media/2022/CottonBalls.jpg', NULL, 0, 1, 0),
(68, 'Salon & Spa Equipment', 46, 'salon-spa-equipment', 'uploads/media/2022/SalonSpaEquipment.jpg', NULL, 0, 1, 0),
(69, 'Hands, Feet & Nail Tools', 46, 'hands-feet-nail-tools', 'uploads/media/2022/HandsFeetNailTools.png', NULL, 0, 1, 0),
(70, 'Nail Art Equipment', 69, 'nail-art-equipment', 'uploads/media/2022/NailArtEquipment.jpg', NULL, 0, 1, 0),
(71, 'Nail Clippers & Trimmers', 69, 'nail-clippers-trimmers', 'uploads/media/2022/NailClippersTrimmers.jpg', NULL, 0, 1, 0),
(72, 'Manicure & Pedicure Kits', 69, 'manicure-pedicure-kits', 'uploads/media/2022/ManicurePedicureKits.jpg', NULL, 0, 1, 0),
(73, 'Acrylic Nail Tools', 69, 'acrylic-nail-tools', 'uploads/media/2022/AcrylicNailTools.jpg', NULL, 0, 1, 0),
(74, 'Nail Files & Buffers', 69, 'nail-files-buffers', 'uploads/media/2022/NailFilesBuffers.jpg', NULL, 0, 1, 0),
(75, 'Nail Drill Bits', 69, 'nail-drill-bits', 'uploads/media/2022/NailDrillBits.jpg', NULL, 0, 1, 0),
(76, 'Foot Bath', 69, 'foot-bath', 'uploads/media/2022/FootBath.png', NULL, 0, 1, 0),
(77, 'Cuticle Tools', 69, 'cuticle-tools', 'uploads/media/2022/CuticleTools.jpg', NULL, 0, 1, 0),
(78, 'Nail Nippers', 69, 'nail-nippers', 'uploads/media/2022/NailNippers.jpg', NULL, 0, 1, 0),
(79, 'Ingrown Toenail Tool', 69, 'ingrown-toenail-tool', 'uploads/media/2022/IngrownToenailTool.jpg', NULL, 0, 1, 0),
(80, 'Hair Care', 285, 'hair-care', 'uploads/media/2022/HairCare.jpg', NULL, 0, 1, 0),
(81, 'Hair Styling Accessories', 80, 'hair-styling-accessories', 'uploads/media/2022/HairStylingAccessories.jpg', NULL, 0, 1, 0),
(82, 'Headbands', 81, 'headbands', 'uploads/media/2022/Headbands.png', NULL, 0, 1, 0),
(83, 'Hair Styling Pins', 81, 'hair-styling-pins', 'uploads/media/2022/HairStylingPins.jpg', NULL, 0, 1, 0),
(84, 'Hair Clips & Barrettes', 81, 'hair-clips-barrettes', 'uploads/media/2022/HairClipsBarrettes.jpg', NULL, 0, 1, 0),
(85, 'Ponytail Holders', 81, 'ponytail-holders', 'uploads/media/2022/PonytailHolders.jpg', NULL, 0, 1, 0),
(86, 'Hair Drying Towels', 81, 'hair-drying-towels', 'uploads/media/2022/HairDryingTowels.jpg', NULL, 0, 1, 0),
(87, 'Decorative Hair Combs', 81, 'decorative-hair-combs', 'uploads/media/2022/DecorativeHairCombs.png', NULL, 0, 1, 0),
(88, 'Hair Styling Claws', 81, 'hair-styling-claws', 'uploads/media/2022/HairStylingClaws.jpg', NULL, 0, 1, 0),
(89, 'Hair Bun & Crown Shapers', 81, 'hair-bun-crown-shapers', 'uploads/media/2022/HairBunCrownShapers.jpg', NULL, 0, 1, 0),
(90, 'Hair Cutting Tools', 80, 'hair-cutting-tools', 'uploads/media/2022/HairCuttingTools.png', NULL, 0, 1, 0),
(91, 'Hair Styling Tools', 80, 'hair-styling-tools', 'uploads/media/2022/HairStylingTools.png', NULL, 0, 1, 0),
(92, 'Hair Brushes', 91, 'hair-brushes', 'uploads/media/2022/HairBrushes.png', NULL, 0, 1, 0),
(93, 'Hair Combs', 91, 'hair-combs', 'uploads/media/2022/HairCombs.jpg', NULL, 0, 1, 0),
(94, 'Hair Irons', 91, 'hair-irons', 'uploads/media/2022/HairIrons.png', NULL, 0, 1, 0),
(95, 'Hair Rollers', 91, 'hair-rollers', 'uploads/media/2022/Hair_Rollers.jpg', NULL, 0, 1, 0),
(96, 'Hair Dryers & Accessories', 91, 'hair-dryers-accessories', 'uploads/media/2022/HairDryersAccessories.jpg', NULL, 0, 1, 0),
(97, 'Hot-Air Brushes', 91, 'hot-air-brushes', 'uploads/media/2022/Hot-AirBrushes.jpg', NULL, 0, 1, 0),
(98, 'Hair Braiders', 91, 'hair-braiders', 'uploads/media/2022/HairBraiders.jpg', NULL, 0, 1, 0),
(99, 'Thermal Hair Styling Gloves', 91, 'thermal-hair-styling-gloves', 'uploads/media/2022/ThermalHairStylingGloves.jpg', NULL, 0, 1, 0),
(100, 'Multi Hair Stylers', 91, 'multi-hair-stylers', 'uploads/media/2022/MultiHairStylers.jpg', NULL, 0, 1, 0),
(101, 'Hair Styling Sets & Kits', 91, 'hair-styling-sets-kits', 'uploads/media/2022/HairStylingSetsKits.jpg', NULL, 0, 1, 0),
(102, 'Hair Colour', 80, 'hair-colour', 'uploads/media/2022/HairColour.jpg', NULL, 0, 1, 0),
(103, 'Hair Colouring Tools', 102, 'hair-colouring-tools', 'uploads/media/2022/HairColouringTools.jpg', NULL, 0, 1, 0),
(104, 'Permanent Colour', 102, 'permanent-colour', 'uploads/media/2022/PermanentColour.jpg', NULL, 0, 1, 0),
(105, 'Hennas', 102, 'hennas', 'uploads/media/2022/Hennas.png', NULL, 0, 1, 0),
(106, 'Hair Mascaras', 102, 'hair-mascaras', 'uploads/media/2022/HairMascaras.jpg', NULL, 0, 1, 0),
(107, 'Hair Chalk', 102, 'hair-chalk', 'uploads/media/2022/HairChalk.jpg', NULL, 0, 1, 0),
(108, 'Colour Refreshers', 102, 'colour-refreshers', 'uploads/media/2022/ColourRefreshers.jpg', NULL, 0, 1, 0),
(109, 'Semi-Permanent Colour', 102, 'semi-permanent-colour', 'uploads/media/2022/Semi-PermanentColour.jpg', NULL, 0, 1, 0),
(110, 'Highlight Kits', 102, 'highlight-kits', 'uploads/media/2022/HighlightKits.jpg', NULL, 0, 1, 0),
(111, 'Mustache & Beard Colour', 102, 'mustache-beard-colour', 'uploads/media/2022/MustacheBeardColour.jpg', NULL, 0, 1, 0),
(112, 'Colour Additives & Fillers', 102, 'colour-additives-fillers', 'uploads/media/2022/ColourAdditivesFillers.jpg', NULL, 0, 1, 0),
(113, 'Shampoo & Conditioner', 80, 'shampoo-conditioner', 'uploads/media/2022/ShampooConditioner.png', NULL, 0, 1, 0),
(114, 'Styling Products', 80, 'styling-products', 'uploads/media/2022/StylingProducts.png', NULL, 0, 1, 0),
(115, 'Hair Spray', 114, 'hair-spray', 'uploads/media/2022/HairSpray.png', NULL, 0, 1, 0),
(116, 'Gels', 114, 'gels', 'uploads/media/2022/Gels.png', NULL, 0, 1, 0),
(117, 'Pomades', 114, 'pomades', 'uploads/media/2022/Pomades.jpg', NULL, 0, 1, 0),
(118, 'Creams & Lotions', 114, 'creams-lotions', 'uploads/media/2022/CreamsLotions.png', NULL, 0, 1, 0),
(119, 'Hair Styling Serums', 114, 'hair-styling-serums', 'uploads/media/2022/HairStylingSerums.png', NULL, 0, 1, 0),
(120, 'Mousses', 114, 'mousses', 'uploads/media/2022/Mousses.jpg', NULL, 0, 1, 0),
(121, 'Waxes', 114, 'waxes', 'uploads/media/2022/Waxes.jpg', NULL, 0, 1, 0),
(122, 'Hair Tonic', 114, 'hair-tonic', 'uploads/media/2022/HairTonic.png', NULL, 0, 1, 0),
(123, 'Hair Fragrances', 114, 'hair-fragrances', 'uploads/media/2022/HairFragrances.jpg', NULL, 0, 1, 0),
(124, 'Thermal Protector Sprays', 114, 'thermal-protector-sprays', 'uploads/media/2022/Thermal_Protector_Sprays.png', NULL, 0, 1, 0),
(125, 'Hair Loss Products', 80, 'hair-loss-products', 'uploads/media/2022/Hair_Loss_Products.jpg', NULL, 0, 1, 0),
(126, 'Women', 0, 'women-2', 'uploads/media/2022/women.jpeg', '', 0, 1, 0),
(127, 'Dresses', 126, 'dresses', 'uploads/media/2022/Dresses.jpg', NULL, 0, 1, 0),
(128, 'Tops & Blouses', 126, 'tops-blouses', 'uploads/media/2022/Tops_Blouses.jpg', NULL, 0, 1, 0),
(129, 'Hair Building Fibers', 125, 'hair-building-fibers', 'uploads/media/2022/Hair_Building_Fibers.jpg', NULL, 0, 1, 0),
(130, 'Sweaters', 126, 'sweaters', 'uploads/media/2022/Sweaters.jpg', NULL, 0, 1, 0),
(131, 'Hair Regrowth Treatments', 125, 'hair-regrowth-treatments', 'uploads/media/2022/Hair_Regrowth_Treatments.jpg', NULL, 0, 1, 0),
(132, 'Jeans', 126, 'jeans', 'uploads/media/2022/Jeans.jpg', NULL, 0, 1, 0),
(133, 'Hair Regrowth Shampoos', 125, 'hair-regrowth-shampoos', 'uploads/media/2022/Hair_Regrowth_Shampoos.jpg', NULL, 0, 1, 0),
(134, 'Pants', 126, 'pants', 'uploads/media/2022/Pants.jpg', NULL, 0, 1, 0),
(135, 'Hair Regrowth Tonic', 125, 'hair-regrowth-tonic', 'uploads/media/2022/Hair_Regrowth_Tonic.jpg', NULL, 0, 1, 0),
(136, 'Skirts', 126, 'skirts', 'uploads/media/2022/Skirts.jpg', NULL, 0, 1, 0),
(137, 'Hair Masks', 80, 'hair-masks', 'uploads/media/2022/Hair_Masks.png', NULL, 0, 1, 0),
(138, 'Coats & Jackets', 126, 'coats-jackets', 'uploads/media/2022/Coats_Jackets.jpg', NULL, 0, 1, 0),
(139, 'Hair Oils', 80, 'hair-oils', 'uploads/media/2022/Hair_Oils.png', NULL, 0, 1, 0),
(140, 'Suits & Blazers', 126, 'suits-blazers', 'uploads/media/2022/Suits_Blazers.jpg', NULL, 0, 1, 0),
(141, 'Hair Perms, Relaxers and Texturizers', 80, 'hair-perms-relaxers-and-texturizers', 'uploads/media/2022/Hair_Perms,_Relaxers_and_Texturizers.jpg', NULL, 0, 1, 0),
(142, 'Athletic Apparel', 126, 'athletic-apparel', 'uploads/media/2022/Athletic_Apparel.jpg', NULL, 0, 1, 0),
(143, 'Swimwear', 126, 'swimwear', 'uploads/media/2022/Swimwear.jpg', NULL, 0, 1, 0),
(144, 'Women\\\'s Handbags', 126, 'womens-handbags', 'uploads/media/2022/Womens_Handbags.jpg', NULL, 0, 1, 0),
(145, 'Women\\\'s Accessories', 126, 'womens-accessories', 'uploads/media/2022/Womens_Accessories.jpg', NULL, 0, 1, 0),
(146, 'Nails', 285, 'nails', 'uploads/media/2022/Nails.png', NULL, 0, 1, 0),
(147, 'Nail Art & Polish', 146, 'nail-art-polish', 'uploads/media/2022/Nail_Art_Polish.jpg', NULL, 0, 1, 0),
(148, 'Jewelry', 126, 'jewelry', 'uploads/media/2022/Jewelry.jpg', NULL, 0, 1, 0),
(149, 'Nail Art Accessories', 147, 'nail-art-accessories', 'uploads/media/2022/Nail_Art_Accessories.jpg', NULL, 0, 1, 0),
(150, 'Maternity', 126, 'maternity', 'uploads/media/2022/Maternity.jpg', NULL, 0, 1, 0),
(151, 'Shoes', 126, 'shoes', 'uploads/media/2022/Shoes.jpg', NULL, 0, 1, 0),
(152, 'Other', 126, 'other', 'uploads/media/2022/Other.jpg', NULL, 0, 1, 0),
(153, 'Nail Art Equipment', 147, 'nail-art-equipment-1', 'uploads/media/2022/Nail_Art_Equipment.jpg', NULL, 0, 1, 0),
(154, 'Underwear', 126, 'underwear', 'uploads/media/2022/Underwear.jpg', NULL, 0, 1, 0),
(155, 'False Nails & Accessories', 147, 'false-nails-accessories', 'uploads/media/2022/False_Nails_Accessories.jpg', NULL, 0, 1, 0),
(156, 'Shorts', 126, 'shorts', 'uploads/media/2022/Shorts.jpg', NULL, 0, 1, 0),
(157, 'Nail Polish', 147, 'nail-polish', 'uploads/media/2022/Nail_Polish.jpg', NULL, 0, 1, 0),
(158, 'Nail Polish Removers', 147, 'nail-polish-removers', 'uploads/media/2022/Nail_Polish_Removers.jpg', NULL, 0, 1, 0),
(159, 'Sleepwear & Robes', 126, 'sleepwear-robes', 'uploads/media/2022/Sleepwear_Robes.jpg', NULL, 0, 1, 0),
(160, 'Gel Polish', 147, 'gel-polish', 'uploads/media/2022/Gel_Polish.jpg', NULL, 0, 1, 0),
(161, 'Nail Thickening Solution', 147, 'nail-thickening-solution', 'uploads/media/2022/Nail_Thickening_Solution.jpg', NULL, 0, 1, 0),
(162, 'Men', 0, 'men', 'uploads/media/2022/Men.jpg', NULL, 0, 1, 0),
(163, 'Nail Top and Base Coats', 147, 'nail-top-and-base-coats', 'uploads/media/2022/Nail_Top_and_Base_Coats.png', NULL, 0, 1, 0),
(164, 'Nail Salon Sets', 147, 'nail-salon-sets', 'uploads/media/2022/Nail_Salon_Sets.jpg', NULL, 0, 1, 0),
(165, 'Dip Manicure', 147, 'dip-manicure', 'uploads/media/2022/Dip_Manicure.jpg', NULL, 0, 1, 0),
(166, 'Tops', 162, 'tops', 'uploads/media/2022/Tops.jpg', NULL, 0, 1, 0),
(167, 'Sweats & Hoodies', 162, 'sweats-hoodies', 'uploads/media/2022/Sweats_Hoodies.jpg', NULL, 0, 1, 0),
(168, 'Above Knee, Mini', 127, 'above-knee-mini', 'uploads/media/2022/Above_Knee,_Mini.jpg', NULL, 0, 1, 0),
(169, 'Knee-Length', 127, 'knee-length', 'uploads/media/2022/Knee-Length.jpg', NULL, 0, 1, 0),
(170, 'Midi', 127, 'midi', 'uploads/media/2022/Midi.jpg', NULL, 0, 1, 0),
(171, 'Maxi', 127, 'maxi', 'uploads/media/2022/Maxi.jpg', NULL, 0, 1, 0),
(172, 'High Low', 127, 'high-low', 'uploads/media/2022/High_Low.jpg', NULL, 0, 1, 0),
(173, 'Other', 127, 'other-1', 'uploads/media/2022/Other_2.jpg', NULL, 0, 1, 0),
(174, 'Jumpsuits & Rompers', 127, 'jumpsuits-rompers', 'uploads/media/2022/Jumpsuits_Rompers.jpg', NULL, 0, 1, 0),
(175, 'Blouses', 128, 'blouses', 'uploads/media/2022/Blouses.jpg', NULL, 0, 1, 0),
(176, 'Nail Treatments', 146, 'nail-treatments', 'uploads/media/2022/Nail_Treatments.jpg', NULL, 0, 1, 0),
(177, 'Nail Repair', 146, 'nail-repair', 'uploads/media/2022/Nail_Repair.jpg', NULL, 0, 1, 0),
(178, 'Nail Whitening', 146, 'nail-whitening', 'uploads/media/2022/Nail_Whitening.jpg', NULL, 0, 1, 0),
(179, 'Nail Strengthening', 176, 'nail-strengthening', 'uploads/media/2022/Nail_Strengthening.jpg', NULL, 0, 1, 0),
(180, 'Ridge Filler', 176, 'ridge-filler', 'uploads/media/2022/Ridge_Filler.jpg', NULL, 0, 1, 0),
(181, 'Button Down Shirts', 128, 'button-down-shirts', 'uploads/media/2022/Button_Down_Shirts.jpg', NULL, 0, 1, 0),
(182, 'Halter', 128, 'halter', 'uploads/media/2022/Halter.jpg', NULL, 0, 1, 0),
(183, 'Growth Formula', 176, 'growth-formula', 'uploads/media/2022/Growth_Formula.jpg', NULL, 0, 1, 0),
(184, 'Knit Tops', 128, 'knit-tops', 'uploads/media/2022/Knit_Tops.jpg', NULL, 0, 1, 0),
(185, 'Cuticle Care', 146, 'cuticle-care', 'uploads/media/2022/Cuticle_Care1.jpg', NULL, 0, 1, 0),
(186, 'Cuticle Creams & Oils', 146, 'cuticle-creams-oils', 'uploads/media/2022/Cuticle_Creams_Oils.jpg', NULL, 0, 1, 0),
(187, 'Polo Shirt', 128, 'polo-shirt', 'uploads/media/2022/Polo_Shirt.jpg', NULL, 0, 1, 0),
(188, 'T-Shirts', 128, 't-shirts', 'uploads/media/2022/T-Shirts.jpg', NULL, 0, 1, 0),
(189, 'Cuticle Removers', 185, 'cuticle-removers', 'uploads/media/2022/Cuticle_Removers.jpg', NULL, 0, 1, 0),
(190, 'Tunics', 128, 'tunics', 'uploads/media/2022/Tunics.jpg', NULL, 0, 1, 0),
(191, 'Turtlenecks', 128, 'turtlenecks', 'uploads/media/2022/Turtlenecks.jpg', NULL, 0, 1, 0),
(192, 'Cuticle Repair', 185, 'cuticle-repair', 'uploads/media/2022/Cuticle_Repair.jpg', NULL, 0, 1, 0),
(193, 'Skin Care', 285, 'skin-care', 'uploads/media/2022/Skin_Care.jpg', NULL, 0, 1, 0),
(194, 'Wraps', 128, 'wraps', 'uploads/media/2022/Wraps.jpg', NULL, 0, 1, 0),
(195, 'Others', 128, 'others', 'uploads/media/2022/Others.png', NULL, 0, 1, 0),
(196, 'Bodysuits', 128, 'bodysuits', 'uploads/media/2022/Bodysuits.jpg', NULL, 0, 1, 0),
(197, 'Camisoles', 128, 'camisoles', 'uploads/media/2022/Camisoles.jpg', NULL, 0, 1, 0),
(198, 'Tank Tops', 128, 'tank-tops', 'uploads/media/2022/Tank_Tops.jpg', NULL, 0, 1, 0),
(199, 'Face', 193, 'face-2', 'uploads/media/2022/Face.png', NULL, 0, 1, 0),
(200, 'Face Treatments', 18, 'face-treatments', 'uploads/media/2022/Face_Treatments.jpg', NULL, 0, 1, 0),
(201, 'Cardigan', 130, 'cardigan', 'uploads/media/2022/Cardigan.jpg', NULL, 0, 1, 0),
(202, 'Collared', 130, 'collared', 'uploads/media/2022/Collared.jpg', NULL, 0, 1, 0),
(203, 'Cowl Neck', 130, 'cowl-neck', 'uploads/media/2022/Cowl_Neck.jpg', NULL, 0, 1, 0),
(204, 'Exfoliators', 18, 'exfoliators', 'uploads/media/2022/Exfoliators.png', NULL, 0, 1, 0),
(205, 'Moisturizers', 18, 'moisturizers', 'uploads/media/2022/Moisturizers.jpg', NULL, 0, 1, 0),
(206, 'Cleanser', 35, 'cleanser', 'uploads/media/2022/Cleanser.jpg', NULL, 0, 1, 0),
(207, 'Crew Neck', 130, 'crew-neck', 'uploads/media/2022/Crew_Neck.jpg', NULL, 0, 1, 0),
(208, 'Serums', 35, 'serums', 'uploads/media/2022/Serums.png', NULL, 0, 1, 0),
(209, 'Full zip', 130, 'full-zip', 'uploads/media/2022/Full_zip.jpg', NULL, 0, 1, 0),
(210, 'Toner & Astringents', 18, 'toner-astringents', 'uploads/media/2022/Toner_Astringents.jpg', NULL, 0, 1, 0),
(211, 'Oils', 18, 'oils', 'uploads/media/2022/Oils.jpg', NULL, 0, 1, 0),
(212, 'Henley', 130, 'henley', 'uploads/media/2022/Henley.jpg', NULL, 0, 1, 0),
(213, 'Sets & Kits', 18, 'sets-kits-1', 'uploads/media/2022/Sets_Kits1.jpg', NULL, 0, 1, 0),
(214, 'Hooded', 130, 'hooded', 'uploads/media/2022/Hooded.jpg', NULL, 0, 1, 0),
(215, 'Body', 193, 'body-1', 'uploads/media/2022/Body.jpg', NULL, 0, 1, 0),
(216, 'Poncho', 130, 'poncho', 'uploads/media/2022/Poncho.jpg', NULL, 0, 1, 0),
(217, 'Scoop Neck', 130, 'scoop-neck', 'uploads/media/2022/Scoop_Neck.jpg', NULL, 0, 1, 0),
(218, 'Shrug', 130, 'shrug', 'uploads/media/2022/Shrug.jpg', NULL, 0, 1, 0),
(219, 'Moisturizers', 23, 'moisturizers-1', 'uploads/media/2022/Moisturizers.png', NULL, 0, 1, 0),
(220, 'Cleansers', 23, 'cleansers', 'uploads/media/2022/Cleansers.png', NULL, 0, 1, 0),
(221, 'Sweater Coat', 130, 'sweater-coat', 'uploads/media/2022/Sweater_Coat.jpg', NULL, 0, 1, 0),
(222, 'Tunics', 130, 'tunics-1', 'uploads/media/2022/Tunic.jpg', NULL, 0, 1, 0),
(223, 'Body Scrubs', 23, 'body-scrubs', 'uploads/media/2022/Body_Scrubs_1122.jpg', NULL, 0, 1, 0),
(224, 'Bath & Shower Sets', 23, 'bath-shower-sets', 'uploads/media/2022/Bath_Shower_Sets.jpg', NULL, 0, 1, 0),
(225, 'V-neck', 130, 'v-neck', 'uploads/media/2022/V-neck.jpg', NULL, 0, 1, 0),
(226, 'Body Mud', 23, 'body-mud', 'uploads/media/2022/Body_Mud.jpeg', NULL, 0, 1, 0),
(227, 'Wrap', 130, 'wrap', 'uploads/media/2022/Wrap.jpg', NULL, 0, 1, 0),
(228, 'Hand, Feet & Nail Care Products', 193, 'hand-feet-nail-care-products', 'uploads/media/2022/Hand,_Feet_Nail_Care_Products.jpg', NULL, 0, 1, 0),
(229, 'Moisturizing Socks', 228, 'moisturizing-socks', 'uploads/media/2022/Moisturizing_Socks.png', NULL, 0, 1, 0),
(230, 'Hand & Nail Creams and Lotions', 228, 'hand-nail-creams-and-lotions', 'uploads/media/2022/Hand_Nail_Creams_and_Lotions.jpg', NULL, 0, 1, 0),
(231, 'Other', 130, 'other-2', 'uploads/media/2022/Other_3.png', NULL, 0, 1, 0),
(232, 'Foot Soaks', 228, 'foot-soaks', 'uploads/media/2022/Foot_Soaks.png', NULL, 0, 1, 0),
(233, 'Mock Sweaters', 130, 'mock-sweaters', 'uploads/media/2022/Mock_Sweaters.jpg', NULL, 0, 1, 0),
(234, 'Turtleneck Sweaters', 130, 'turtleneck-sweaters', 'uploads/media/2022/Turtleneck_Sweaters.jpg', NULL, 0, 1, 0),
(235, 'Foot Creams', 228, 'foot-creams', 'uploads/media/2022/Foot_Creams.png', NULL, 0, 1, 0),
(236, 'Moisturizing Gloves', 228, 'moisturizing-gloves', 'uploads/media/2022/Moisturizing_Gloves.jpg', NULL, 0, 1, 0),
(237, 'Sleeveless Sweaters', 130, 'sleeveless-sweaters', 'uploads/media/2022/Sleeveless_Sweaters.jpg', NULL, 0, 1, 0),
(238, 'Paraffin Baths', 228, 'paraffin-baths', 'uploads/media/2022/Paraffin_Baths.jpg', NULL, 0, 1, 0),
(239, 'Sweater Vests', 130, 'sweater-vests', 'uploads/media/2022/Sweater_Vests.jpg', NULL, 0, 1, 0),
(240, 'Scrubs', 228, 'scrubs', 'uploads/media/2022/11Scrubs.png', NULL, 0, 1, 0),
(241, 'Hand Masks', 228, 'hand-masks', 'uploads/media/2022/Hand_Masks.png', NULL, 0, 1, 0),
(242, 'Eyes', 193, 'eyes-2', 'uploads/media/2022/Eyes.jpg', NULL, 0, 1, 0),
(243, 'Eye Treatment Creams', 3, 'eye-treatment-creams', 'uploads/media/2022/Eye_Treatment_Creams.jpg', NULL, 0, 1, 0),
(244, 'Eye Treatment Serums & Fluids', 3, 'eye-treatment-serums-fluids', 'uploads/media/2022/Eye_Treatment_Serums_Fluids.png', NULL, 0, 1, 0),
(245, 'Eye Wrinkle Pads & Patches', 3, 'eye-wrinkle-pads-patches', 'uploads/media/2022/Eye_Wrinkle_Pads_Patches.png', NULL, 0, 1, 0),
(246, 'Eye Treatment Gels', 3, 'eye-treatment-gels', 'uploads/media/2022/Eye_Treatment_Gels.jpg', NULL, 0, 1, 0),
(247, 'Eye Masks', 3, 'eye-masks', 'uploads/media/2022/Eye_Masks.jpg', NULL, 0, 1, 0),
(248, 'Lip Care', 193, 'lip-care', 'uploads/media/2022/Lip_Care.png', NULL, 0, 1, 0),
(249, 'Lip Care Balms & Treatments', 193, 'lip-care-balms-treatments', 'uploads/media/2022/Lip_Care_Balms_Treatments.png', NULL, 0, 1, 0),
(250, 'Lip Scrubs', 248, 'lip-scrubs', 'uploads/media/2022/Lip_Scrubs.jpg', NULL, 0, 1, 0),
(251, 'Lip Plumpers', 248, 'lip-plumpers', 'uploads/media/2022/Lip_Plumpers.jpg', NULL, 0, 1, 0),
(252, 'Butters', 248, 'butters', 'uploads/media/2022/Butters.jpg', NULL, 0, 1, 0),
(253, 'Lip Sunscreen', 248, 'lip-sunscreen', 'uploads/media/2022/Lip_Sunscreen.png', NULL, 0, 1, 0),
(254, 'Sun Care & Tanning', 193, 'sun-care-tanning', 'uploads/media/2022/Sun_Care_Tanning.jpg', NULL, 0, 1, 0),
(255, 'Self-Tanners and Bronzers', 254, 'self-tanners-and-bronzers', 'uploads/media/2022/Self-Tanners_and_Bronzers.png', NULL, 0, 1, 0),
(256, 'Sunscreen', 254, 'sunscreen', 'uploads/media/2022/Sunscreen.jpg', NULL, 0, 1, 0),
(257, 'After Sun Skin Care', 254, 'after-sun-skin-care', 'uploads/media/2022/After_Sun_Skin_Care.png', NULL, 0, 1, 0),
(258, 'Tanning Enhancers & Accelerators', 254, 'tanning-enhancers-accelerators', 'uploads/media/2022/Tanning_Enhancers_Accelerators.jpg', NULL, 0, 1, 0),
(259, 'Boot Cut', 132, 'boot-cut', 'uploads/media/2022/Boot_Cut.jpg', NULL, 0, 1, 0),
(260, 'Boyfriend', 132, 'boyfriend', 'uploads/media/2022/Boyfriend.jpg', NULL, 0, 1, 0),
(261, 'Cargo', 132, 'cargo', 'uploads/media/2022/Cargo.jpg', NULL, 0, 1, 0),
(262, 'Flare', 132, 'flare', 'uploads/media/2022/Flare.jpg', NULL, 0, 1, 0),
(263, 'Leggings', 132, 'leggings', 'uploads/media/2022/Leggings.jpg', NULL, 0, 1, 0),
(264, 'Overalls', 132, 'overalls', 'uploads/media/2022/Overalls.jpg', NULL, 0, 1, 0),
(265, 'Relaxed', 132, 'relaxed', 'uploads/media/2022/Relaxed.jpg', NULL, 0, 1, 0),
(266, 'Straight Leg', 132, 'straight-leg', 'uploads/media/2022/Straight_Leg.jpg', NULL, 0, 1, 0),
(267, 'Wide Leg', 132, 'wide-leg', 'uploads/media/2022/Wide_Leg.jpg', NULL, 0, 1, 0),
(268, 'Other', 132, 'other-3', 'uploads/media/2022/other_4.jpg', NULL, 0, 1, 0),
(269, 'Capri Jeans', 132, 'capri-jeans', 'uploads/media/2022/Capri_Jeans.jpg', NULL, 0, 1, 0),
(270, 'Cropped Jeans', 132, 'cropped-jeans', 'uploads/media/2022/Cropped_Jeans.jpg', NULL, 0, 1, 0),
(271, 'Skinny Jeans', 0, 'skinny-jeans', 'uploads/media/2022/Skinny_Jeans.jpg', NULL, 0, 1, 0),
(272, 'Slim Jeans', 132, 'slim-jeans', 'uploads/media/2022/Slim_Jeans.jpg', NULL, 0, 1, 0),
(273, 'Cargo', 134, 'cargo-1', 'uploads/media/2022/cargo_pant.jpg', NULL, 0, 1, 0),
(274, 'Casual Pants', 134, 'casual-pants', 'uploads/media/2022/Casual_Pants.jpg', NULL, 0, 1, 0),
(275, 'Corduroys', 134, 'corduroys', 'uploads/media/2022/Corduroys.jpg', NULL, 0, 1, 0),
(276, 'Dress Pants', 134, 'dress-pants', 'uploads/media/2022/Dress_Pants.jpg', NULL, 0, 1, 0),
(277, 'Khakis, Chinos', 134, 'khakis-chinos', 'uploads/media/2022/Khakis,_Chinos.jpg', NULL, 0, 1, 0),
(278, 'Leather', 134, 'leather', 'uploads/media/2022/Leather.jpg', NULL, 0, 1, 0),
(279, 'Linen', 134, 'linen', 'uploads/media/2022/Linen.jpg', NULL, 0, 1, 0),
(280, 'Other', 134, 'other-4', 'uploads/media/2022/Other_pants.jpg', NULL, 0, 1, 0),
(281, 'Capri Pants', 134, 'capri-pants', 'uploads/media/2022/Capri_Pants.jpg', NULL, 0, 1, 0),
(282, 'Cropped Pants', 134, 'cropped-pants', 'uploads/media/2022/Cropped_Pants.jpg', NULL, 0, 1, 0),
(283, 'A-line', 136, 'a-line', 'uploads/media/2022/A-line.jpg', NULL, 0, 1, 0),
(284, 'Asymmetrical', 136, 'asymmetrical', 'uploads/media/2022/Asymmetrical.jpg', NULL, 0, 1, 0),
(285, 'Beauty', 0, 'beauty', 'uploads/media/2022/Beauty.jpg', NULL, 0, 1, 0),
(286, 'Bubble', 136, 'bubble', 'uploads/media/2022/Bubble.jpg', NULL, 0, 1, 0),
(287, 'Full skirt', 136, 'full-skirt', 'uploads/media/2022/Full_skirt.jpg', NULL, 0, 1, 0),
(288, 'Maxi', 136, 'maxi-1', 'uploads/media/2022/Maxi_skirts.jpg', NULL, 0, 1, 0),
(289, 'Mini', 136, 'mini', 'uploads/media/2022/Mini.jpg', NULL, 0, 1, 0),
(290, 'Peasant', 136, 'peasant', 'uploads/media/2022/Peasant.jpg', NULL, 0, 1, 0),
(291, 'Pleated', 136, 'pleated', 'uploads/media/2022/Pleated.jpg', NULL, 0, 1, 0),
(292, 'Straight, Pencil', 136, 'straight-pencil', 'uploads/media/2022/Straight,_Pencil.jpg', NULL, 0, 1, 0),
(293, 'Tiered', 136, 'tiered', 'uploads/media/2022/Tiered.jpg', NULL, 0, 1, 0),
(294, 'Makeup Removers', 193, 'makeup-removers', 'uploads/media/2022/MakeupRemovers.jpg', NULL, 0, 1, 0),
(295, 'Wrap', 136, 'wrap-1', 'uploads/media/2022/Wrap_skirt.jpg', NULL, 0, 1, 0),
(296, 'Other', 136, 'other-5', 'uploads/media/2022/Other_5.jpg', NULL, 0, 1, 0),
(297, 'Makeup Cleansing Water', 294, 'makeup-cleansing-water', 'uploads/media/2022/MakeupCleansingWater.jpg', NULL, 0, 1, 0),
(298, 'Makeup Cleansing Wipes', 294, 'makeup-cleansing-wipes', 'uploads/media/2022/MakeupCleansingWipes.png', NULL, 0, 1, 0),
(299, 'Cape', 138, 'cape', 'uploads/media/2022/Cape.jpg', NULL, 0, 1, 0),
(300, 'Makeup Cleansing Creams', 294, 'makeup-cleansing-creams', 'uploads/media/2022/MakeupCleansingCreams.jpg', NULL, 0, 1, 0),
(301, 'Makeup Cleansing Foams', 294, 'makeup-cleansing-foams', 'uploads/media/2022/MakeupCleansingFoams.jpg', NULL, 0, 1, 0),
(302, 'Fleece Jacket', 138, 'fleece-jacket', 'uploads/media/2022/Fleece_Jacket.jpg', NULL, 0, 1, 0),
(303, 'Makeup Cleansing Gels', 294, 'makeup-cleansing-gels', 'uploads/media/2022/MakeupCleansingGels.jpg', NULL, 0, 1, 0),
(304, 'Jean Jacket', 138, 'jean-jacket', 'uploads/media/2022/Jean_Jacket.jpg', NULL, 0, 1, 0),
(305, 'Military', 138, 'military', 'uploads/media/2022/Military.jpg', NULL, 0, 1, 0),
(306, 'Neck & Decollete', 193, 'neck-decollete', 'uploads/media/2022/NeckDecollete.jpg', NULL, 0, 1, 0),
(307, 'Motorcycle', 138, 'motorcycle', 'uploads/media/2022/Motorcycle.jpg', NULL, 0, 1, 0),
(308, 'Maternity', 193, 'maternity-1', 'uploads/media/2022/Maternity.png', NULL, 0, 1, 0),
(309, 'Parka', 138, 'parka', 'uploads/media/2022/Parka.jpg', NULL, 0, 1, 0),
(310, 'Fragrance', 0, 'fragrance', 'uploads/media/2022/Fragrance.png', NULL, 0, 1, 0),
(311, 'Women', 310, 'women-1', 'uploads/media/2022/Women1.jpg', NULL, 0, 1, 0),
(312, 'Eau de Parfum', 311, 'eau-de-parfum', 'uploads/media/2022/EaudeParfum.jpg', NULL, 0, 1, 0),
(313, 'Eau de Toilette', 311, 'eau-de-toilette', 'uploads/media/2022/EaudeToilette.jpg', NULL, 0, 1, 0),
(314, 'Essential Fragrance Oils', 311, 'essential-fragrance-oils', 'uploads/media/2022/EssentialFragranceOils.jpg', NULL, 0, 1, 0),
(315, 'Body Sprays Fragrance', 311, 'body-sprays-fragrance', 'uploads/media/2022/BodySpraysFragrance.jpg', NULL, 0, 1, 0),
(316, 'Cologne', 311, 'cologne', 'uploads/media/2022/Cologne.jpg', NULL, 0, 1, 0),
(317, 'Perfume', 311, 'perfume', 'uploads/media/2022/Perfume.jpg', NULL, 0, 1, 0),
(318, 'Eau Fraiche', 311, 'eau-fraiche', 'uploads/media/2022/EauFraiche.jpg', NULL, 0, 1, 0),
(319, 'Men', 310, 'men-1', 'uploads/media/2022/Men1.jpg', NULL, 0, 1, 0),
(320, 'Eau de Toilette', 319, 'eau-de-toilette-1', 'uploads/media/2022/EaudeToilette.png', NULL, 0, 1, 0),
(321, 'Eau de Parfum', 319, 'eau-de-parfum-1', 'uploads/media/2022/EaudeParfum.png', NULL, 0, 1, 0),
(322, 'Cologne', 319, 'cologne-1', 'uploads/media/2022/Cologne1.jpg', NULL, 0, 1, 0),
(323, 'Aftershaves', 319, 'aftershaves', 'uploads/media/2022/Aftershaves.png', NULL, 0, 1, 0),
(324, 'Peacoat', 138, 'peacoat', 'uploads/media/2022/Peacoat.jpg', NULL, 0, 1, 0),
(325, 'Solid Perfume Fragrances', 310, 'solid-perfume-fragrances', 'uploads/media/2022/SolidPerfumeFragrances.png', NULL, 0, 1, 0),
(326, 'Poncho', 138, 'poncho-1', 'uploads/media/2022/Poncho_jacket.jpg', NULL, 0, 1, 0),
(327, 'Fragrant Dusting Powders', 310, 'fragrant-dusting-powders', 'uploads/media/2022/FragrantDustingPowders.png', NULL, 0, 1, 0),
(328, 'Puffer', 138, 'puffer', 'uploads/media/2022/Puffer.jpg', NULL, 0, 1, 0),
(329, 'Raincoat', 138, 'raincoat', 'uploads/media/2022/Raincoat.jpg', NULL, 0, 1, 0),
(330, 'Trench', 138, 'trench', 'uploads/media/2022/Trench.jpg', NULL, 0, 1, 0),
(331, 'Vest', 138, 'vest', 'uploads/media/2022/Vest.jpg', NULL, 0, 1, 0),
(332, 'Tools', 0, 'tools-1', 'uploads/media/2022/tools1.jpg', '', 0, 1, 0),
(333, 'Windbreaker', 138, 'windbreaker', 'uploads/media/2022/Windbreaker.jpg', NULL, 0, 1, 0),
(334, 'Air Tools', 332, 'air-tools', 'uploads/media/2022/AirTools.jpg', NULL, 0, 1, 0),
(335, 'Chains & Ropes', 332, 'chains-ropes', 'uploads/media/2022/ChainsRopes.jpg', NULL, 0, 1, 0),
(336, 'Wool', 138, 'wool', 'uploads/media/2022/Wool.jpg', NULL, 0, 1, 0),
(337, 'Cutting Tools', 332, 'cutting-tools', 'uploads/media/2022/CuttingTools.jpg', NULL, 0, 1, 0),
(338, 'Other', 138, 'other-6', 'uploads/media/2022/Other_6.jpg', NULL, 0, 1, 0),
(339, 'Electrical Tools', 332, 'electrical-tools', 'uploads/media/2022/ElectricalTools.jpg', NULL, 0, 1, 0),
(340, 'Fastening Tools', 332, 'fastening-tools', 'uploads/media/2022/FasteningTools.jpg', NULL, 0, 1, 0),
(341, 'Blazer', 140, 'blazer', 'uploads/media/2022/Blazer.jpg', NULL, 0, 1, 0),
(342, 'Hammers', 332, 'hammers', 'uploads/media/2022/Hammers.jpg', NULL, 0, 1, 0),
(343, 'Dress Suit', 140, 'dress-suit', 'uploads/media/2022/Dress_Suit.jpg', NULL, 0, 1, 0),
(344, 'Hand Tools', 332, 'hand-tools', 'uploads/media/2022/HandTools.png', NULL, 0, 1, 0),
(345, 'Pant Suit', 140, 'pant-suit', 'uploads/media/2022/Pant_Suit.jpg', NULL, 0, 1, 0),
(346, 'Measuring & Layout', 332, 'measuring-layout', 'uploads/media/2022/MeasuringLayout.jpg', NULL, 0, 1, 0),
(347, 'Pliers', 332, 'pliers', 'uploads/media/2022/Pliers.jpg', NULL, 0, 1, 0),
(348, 'Skirt suit', 140, 'skirt-suit', 'uploads/media/2022/Skirt_suit.jpg', NULL, 0, 1, 0),
(349, 'Power Tools', 332, 'power-tools', 'uploads/media/2022/PowerTools.jpg', NULL, 0, 1, 0),
(350, 'Other', 140, 'other-7', 'uploads/media/2022/Other7.png', NULL, 0, 1, 0),
(351, 'Power Tool Accessories', 332, 'power-tool-accessories', 'uploads/media/2022/PowerToolAccessories.jpg', NULL, 0, 1, 0),
(352, 'Safety Gear', 332, 'safety-gear', 'uploads/media/2022/SafetyGear.jpg', NULL, 0, 1, 0),
(353, 'Jackets', 142, 'jackets', 'uploads/media/2022/Jackets.jpg', NULL, 0, 1, 0),
(354, 'Saws', 332, 'saws', 'uploads/media/2022/Saws.jpg', NULL, 0, 1, 0),
(355, 'Saw Accessories', 332, 'saw-accessories', 'uploads/media/2022/SawAccessories.jpg', NULL, 0, 1, 0),
(356, 'Jerseys', 142, 'jerseys', 'uploads/media/2022/Jerseys.jpg', NULL, 0, 1, 0),
(357, 'Screwdrivers', 332, 'screwdrivers', 'uploads/media/2022/Screwdrivers.jpg', NULL, 0, 1, 0),
(358, 'Tie Downs', 332, 'tie-downs', 'uploads/media/2022/TieDowns.jpg', NULL, 0, 1, 0),
(359, 'Shorts', 142, 'shorts-1', 'uploads/media/2022/Shorts_athletic.jpg', NULL, 0, 1, 0),
(360, 'Tools Storage', 332, 'tools-storage', 'uploads/media/2022/ToolsStorage.jpg', NULL, 0, 1, 0),
(361, 'Welding Equipment', 332, 'welding-equipment', 'uploads/media/2022/WeldingEquipment.jpg', NULL, 0, 1, 0),
(362, 'Socks', 142, 'socks', 'uploads/media/2022/Socks.jpg', NULL, 0, 1, 0),
(363, 'Wrenches', 332, 'wrenches', 'uploads/media/2022/Wrenches.jpg', NULL, 0, 1, 0),
(364, 'Arts & Crafts', 0, 'arts-crafts', 'uploads/media/2022/Arts_Crafts.jpg', NULL, 0, 1, 0),
(365, 'Photography', 364, 'photography', 'uploads/media/2022/Photography.jpg', NULL, 0, 1, 0),
(366, 'Sports bras', 142, 'sports-bras', 'uploads/media/2022/Sports_bras.jpg', NULL, 0, 1, 0),
(367, 'Handmade Paintings', 364, 'handmade-paintings', 'uploads/media/2022/HandmadePaintings.png', NULL, 0, 1, 0),
(368, 'Vests', 142, 'vests', 'uploads/media/2022/Vests.jpg', NULL, 0, 1, 0),
(369, 'Other', 142, 'other-8', 'uploads/media/2022/Other8.png', NULL, 0, 1, 0),
(370, 'Mixed media', 364, 'mixed-media', 'uploads/media/2022/Mixedmedia.jpg', NULL, 0, 1, 0),
(371, 'Athletic Leggings', 142, 'athletic-leggings', 'uploads/media/2022/Athletic_Leggings.jpg', NULL, 0, 1, 0),
(372, 'Sculptures', 364, 'sculptures', 'uploads/media/2022/Sculptures.jpg', NULL, 0, 1, 0),
(373, 'Athletic Pants', 142, 'athletic-pants', 'uploads/media/2022/Athletic_Pants.jpg', NULL, 0, 1, 0),
(374, 'Athletic Tights', 142, 'athletic-tights', 'uploads/media/2022/Athletic_Tights.jpg', NULL, 0, 1, 0),
(375, 'Illustration', 364, 'illustration', 'uploads/media/2022/Illustration.png', NULL, 0, 1, 0),
(376, 'Athletic Polos', 142, 'athletic-polos', 'uploads/media/2022/Athletic_Polos.jpg', NULL, 0, 1, 0),
(377, 'Collages', 364, 'collages', 'uploads/media/2022/Collages.jpg', NULL, 0, 1, 0),
(378, 'Athletic T-Shirts', 142, 'athletic-t-shirts', 'uploads/media/2022/Athletic_T-Shirts.jpg', NULL, 0, 1, 0),
(379, 'Drawing Supplies', 364, 'drawing-supplies', 'uploads/media/2022/DrawingSupplies.jpg', NULL, 0, 1, 0),
(380, 'Athletic Tank Tops', 142, 'athletic-tank-tops', 'uploads/media/2022/Athletic_Tank_Tops.jpg', NULL, 0, 1, 0),
(381, 'Fiber art', 364, 'fiber-art', 'uploads/media/2022/Fiberart.jpg', NULL, 0, 1, 0),
(382, 'Athletic Dresses', 142, 'athletic-dresses', 'uploads/media/2022/Athletic_Dresses.jpg', NULL, 0, 1, 0),
(383, 'Printmaking', 364, 'printmaking', 'uploads/media/2022/Printmaking.jpg', NULL, 0, 1, 0),
(384, 'Athletic Skirts', 142, 'athletic-skirts', 'uploads/media/2022/Athletic_Skirts.jpg', NULL, 0, 1, 0),
(385, 'ACEO', 364, 'aceo', 'uploads/media/2022/ACEO.jpg', NULL, 0, 1, 0),
(386, 'Athletic Skorts', 142, 'athletic-skorts', 'uploads/media/2022/Athletic_Skorts.jpg', NULL, 0, 1, 0),
(387, 'Other Arts & Crafts', 364, 'other-arts-crafts', 'uploads/media/2022/OtherArtsCrafts.jpg', NULL, 0, 1, 0),
(388, 'Snow Bibs', 142, 'snow-bibs', 'uploads/media/2022/Snow_Bibs.jpg', NULL, 0, 1, 0),
(389, 'Paint', 364, 'paint', 'uploads/media/2022/Paint.jpg', NULL, 0, 1, 0),
(390, 'Native American Arts & Crafts', 364, 'native-american-arts-crafts', 'uploads/media/2022/NativeAmericanArtsCrafts.jpg', NULL, 0, 1, 0),
(391, 'Snow Pants', 142, 'snow-pants', 'uploads/media/2022/Snow_Pants.jpg', NULL, 0, 1, 0),
(392, 'Art Paper & Surfaces', 364, 'art-paper-surfaces', 'uploads/media/2022/ArtPaperSurfaces.png', NULL, 0, 1, 0),
(393, 'Snowsuits', 142, 'snowsuits', 'uploads/media/2022/Snowsuits.jpg', NULL, 0, 1, 0),
(394, 'Art Pencils', 364, 'art-pencils', 'uploads/media/2022/ArtPencils.jpg', NULL, 0, 1, 0),
(395, 'Athletic Hoodies', 142, 'athletic-hoodies', 'uploads/media/2022/Athletic_Hoodies.jpg', NULL, 0, 1, 0),
(396, 'Art Studio Furniture', 364, 'art-studio-furniture', 'uploads/media/2022/ArtStudioFurniture.png', NULL, 0, 1, 0),
(397, 'Athletic Sweat Pants', 142, 'athletic-sweat-pants', 'uploads/media/2022/Athletic_Sweat_Pants.jpg', NULL, 0, 1, 0),
(398, 'Ink & Calligraphy', 364, 'ink-calligraphy', 'uploads/media/2022/InkCalligraphy.jpg', NULL, 0, 1, 0),
(399, 'Paint Accessories', 364, 'paint-accessories', 'uploads/media/2022/PaintAccessories.jpg', NULL, 0, 1, 0),
(400, 'Athletic Sweatshirts', 142, 'athletic-sweatshirts', 'uploads/media/2022/Athletic_Sweatshirts.jpg', NULL, 0, 1, 0),
(401, 'Paint Brushes', 364, 'paint-brushes', 'uploads/media/2022/PaintBrushes.jpg', NULL, 0, 1, 0),
(402, 'Athletic Sweatsuits', 142, 'athletic-sweatsuits', 'uploads/media/2022/Athletic_Sweatsuits.jpg', NULL, 0, 1, 0),
(403, 'Pastels', 364, 'pastels', 'uploads/media/2022/Pastels.jpg', NULL, 0, 1, 0),
(404, 'Track Jackets', 142, 'track-jackets', 'uploads/media/2022/Track_Jackets.jpg', NULL, 0, 1, 0),
(405, 'Mediums & Varnishes', 364, 'mediums-varnishes', 'uploads/media/2022/MediumsVarnishes.jpg', NULL, 0, 1, 0),
(406, 'Resin Art Supplies', 364, 'resin-art-supplies', 'uploads/media/2022/ResinArtSupplies.jpg', NULL, 0, 1, 0),
(407, 'Track Pants', 142, 'track-pants', 'uploads/media/2022/Track_Pants.jpg', NULL, 0, 1, 0),
(408, 'Stamping & Embossing', 364, 'stamping-embossing', 'uploads/media/2022/StampingEmbossing.jpg', NULL, 0, 1, 0),
(409, 'Garden & Outdoor', 0, 'garden-outdoor', 'uploads/media/2022/GardenOutdoor.png', NULL, 0, 1, 0),
(410, 'Tracksuits', 142, 'tracksuits', 'uploads/media/2022/Tracksuits.jpg', NULL, 0, 1, 0),
(411, 'Garden Decor', 409, 'garden-decor', 'uploads/media/2022/GardenDecor.jpg', NULL, 0, 1, 0),
(412, 'Garden Hand Tools & Equipment', 409, 'garden-hand-tools-equipment', 'uploads/media/2022/GardenHandToolsEquipment.jpg', NULL, 0, 1, 0),
(413, 'Garden Protective Gear', 409, 'garden-protective-gear', 'uploads/media/2022/GardenProtectiveGear.jpg', NULL, 0, 1, 0),
(414, 'One-piece', 143, 'one-piece', 'uploads/media/2022/One-piece.jpg', NULL, 0, 1, 0),
(415, 'Garden Structures & Shades', 409, 'garden-structures-shades', 'uploads/media/2022/GardenStructuresShades.jpg', NULL, 0, 1, 0),
(416, 'Two-piece', 143, 'two-piece', 'uploads/media/2022/Two-piece.jpg', NULL, 0, 1, 0),
(417, 'Cover-ups', 143, 'cover-ups', 'uploads/media/2022/Cover-ups.jpg', NULL, 0, 1, 0),
(418, 'Outdoor Heating & Cooking', 409, 'outdoor-heating-cooking', 'uploads/media/2022/OutdoorHeatingCooking.png', NULL, 0, 1, 0),
(419, 'Beach Accessories', 143, 'beach-accessories', 'uploads/media/2022/Beach_Accessories.jpg', NULL, 0, 1, 0),
(420, 'Outdoor Power Equipment', 409, 'outdoor-power-equipment', 'uploads/media/2022/OutdoorPowerEquipment.jpg', NULL, 0, 1, 0),
(421, 'Outdoor Waste & Composting', 409, 'outdoor-waste-composting', 'uploads/media/2022/OutdoorWaste_Composting.jpg', NULL, 0, 1, 0),
(422, 'Patio Furniture', 409, 'patio-furniture', 'uploads/media/2022/PatioFurniture.jpg', NULL, 0, 1, 0),
(423, 'Shoulder Bags', 144, 'shoulder-bags', 'uploads/media/2022/Shoulder_Bags.jpg', NULL, 0, 1, 0),
(424, 'Tote Bags', 144, 'tote-bags', 'uploads/media/2022/Tote_Bags.jpg', NULL, 0, 1, 0),
(425, 'Planting Accessories', 409, 'planting-accessories', 'uploads/media/2022/PlantingAccessories.jpg', NULL, 0, 1, 0),
(426, 'Crossbody Bags', 144, 'crossbody-bags', 'uploads/media/2022/Crossbody_Bags.jpg', NULL, 0, 1, 0),
(427, 'Live Plants', 409, 'live-plants', 'uploads/media/2022/LivePlants.jpg', NULL, 0, 1, 0),
(428, 'Satchel', 144, 'satchel', 'uploads/media/2022/Satchel.jpg', NULL, 0, 1, 0),
(429, 'Hobo Bags', 144, 'hobo-bags', 'uploads/media/2022/Hobo_Bags.jpg', NULL, 0, 1, 0),
(430, 'Backpacks', 144, 'backpacks', 'uploads/media/2022/Backpacks.jpg', NULL, 0, 1, 0),
(431, 'Pool Equipment', 409, 'pool-equipment', 'uploads/media/2022/PoolEquipment.jpg', NULL, 0, 1, 0),
(432, 'Cosmetic Bags', 144, 'cosmetic-bags-1', 'uploads/media/2022/Cosmetic_Bags.jpg', NULL, 0, 1, 0),
(433, 'Sauna & Hot Tub Equipment', 409, 'sauna-hot-tub-equipment', 'uploads/media/2022/SaunaHotTubEquipment.jpg', NULL, 0, 1, 0),
(434, 'Other', 144, 'other-9', 'uploads/media/2022/Other9.jpg', NULL, 0, 1, 0),
(435, 'Watering Equipment', 409, 'watering-equipment', 'uploads/media/2022/WateringEquipment.jpg', NULL, 0, 1, 0),
(436, 'Waist Bags & Fanny Packs', 144, 'waist-bags-fanny-packs', 'uploads/media/2022/Waist_Bags_Fanny_Packs.jpg', NULL, 0, 1, 0),
(437, 'Pet Supplies', 0, 'pet-supplies', 'uploads/media/2022/PetSupplies.jpg', NULL, 0, 1, 0),
(438, 'Messenger Bags', 144, 'messenger-bags', 'uploads/media/2022/Messenger_Bags.jpg', NULL, 0, 1, 0),
(439, 'Aquariums & Fish Supplies', 437, 'aquariums-fish-supplies', 'uploads/media/2022/AquariumsFishSupplies.jpg', NULL, 0, 1, 0),
(440, 'Air Pumps', 439, 'air-pumps', 'uploads/media/2022/AirPumps.jpg', NULL, 0, 1, 0),
(441, 'Bucket Bags', 144, 'bucket-bags', 'uploads/media/2022/Bucket_Bags.jpg', NULL, 0, 1, 0),
(442, 'Aquarium Decor', 439, 'aquarium-decor', 'uploads/media/2022/AquariumDecor.jpg', NULL, 0, 1, 0),
(443, 'Aquarium Heaters', 439, 'aquarium-heaters', 'uploads/media/2022/AquariumHeaters.jpg', NULL, 0, 1, 0),
(444, 'Sunglasses', 145, 'sunglasses', 'uploads/media/2022/Sunglasses.jpg', NULL, 0, 1, 0),
(445, 'Aquarium Lighting', 439, 'aquarium-lighting', 'uploads/media/2022/AquariumLighting.jpg', NULL, 0, 1, 0),
(446, 'Aquarium Water Cleaners', 439, 'aquarium-water-cleaners', 'uploads/media/2022/AquariumWaterCleaners.jpg', NULL, 0, 1, 0),
(447, 'Aquariums & Tanks', 439, 'aquariums-tanks', 'uploads/media/2022/AquariumsTanks.jpg', NULL, 0, 1, 0),
(448, 'Tank Filters', 439, 'tank-filters', 'uploads/media/2022/TankFilters.jpg', NULL, 0, 1, 0),
(449, 'Fish Bowls', 439, 'fish-bowls', 'uploads/media/2022/FishBowls.jpg', NULL, 0, 1, 0),
(450, 'Fish Food', 439, 'fish-food', 'uploads/media/2022/FishFood.jpg', NULL, 0, 1, 0),
(451, 'Aquarium Gravel & Substrate', 439, 'aquarium-gravel-substrate', 'uploads/media/2022/AquariumGravelSubstrate.jpg', NULL, 0, 1, 0),
(452, 'Aquarium UV Sterilizers', 439, 'aquarium-uv-sterilizers', 'uploads/media/2022/AquariumUVSterilizers.jpg', NULL, 0, 1, 0),
(453, 'Aquarium Water Pumps', 439, 'aquarium-water-pumps', 'uploads/media/2022/AquariumWaterPumps.jpeg', NULL, 0, 1, 0),
(454, 'Other Aquarium & Fish Supplies', 439, 'other-aquarium-fish-supplies', 'uploads/media/2022/OtherAquariumFishSupplies.jpg', NULL, 0, 1, 0),
(455, 'Bird Supplies', 437, 'bird-supplies', 'uploads/media/2022/BirdSupplies.jpg', NULL, 0, 1, 0),
(456, 'Bird Cage Covers', 455, 'bird-cage-covers', 'uploads/media/2022/BirdCageCovers.jpg', NULL, 0, 1, 0),
(457, 'Bird Cages', 455, 'bird-cages', 'uploads/media/2022/BirdCages.jpg', NULL, 0, 1, 0),
(458, 'Bird Feed', 455, 'bird-feed', 'uploads/media/2022/BirdFeed.jpg', NULL, 0, 1, 0),
(459, 'Bird Litter', 455, 'bird-litter', 'uploads/media/2022/BirdLitter.jpg', NULL, 0, 1, 0),
(460, 'Bird Perches', 455, 'bird-perches', 'uploads/media/2022/BirdPerches.jpg', NULL, 0, 1, 0),
(461, 'Bird Swings', 455, 'bird-swings', 'uploads/media/2022/BirdSwings.jpg', NULL, 0, 1, 0),
(462, 'Bird Toys', 455, 'bird-toys', 'uploads/media/2022/BirdToys.jpg', NULL, 0, 1, 0),
(463, 'Other Bird Supplies', 455, 'other-bird-supplies', 'uploads/media/2022/OtherBirdSupplies.jpg', NULL, 0, 1, 0),
(464, 'Cat Supplies', 437, 'cat-supplies', 'uploads/media/2022/CatSupplies.jpg', NULL, 0, 1, 0),
(465, 'Cat Beds', 464, 'cat-beds', 'uploads/media/2022/CatBeds.jpeg', NULL, 0, 1, 0),
(466, 'Cat Bowls & Feeders', 464, 'cat-bowls-feeders', 'uploads/media/2022/CatBowlsFeeders.jpg', NULL, 0, 1, 0),
(467, 'Cat Brushes', 464, 'cat-brushes', 'uploads/media/2022/CatBrushes.jpg', NULL, 0, 1, 0),
(468, 'Cat Carriers', 464, 'cat-carriers', 'uploads/media/2022/Cat_Carriers.jpg', NULL, 0, 1, 0),
(469, 'Cat Collars', 464, 'cat-collars', 'uploads/media/2022/Cat_Collars.jpg', NULL, 0, 1, 0),
(470, 'Cat Costumes', 464, 'cat-costumes', 'uploads/media/2022/Cat_Costumes.jpg', NULL, 0, 1, 0),
(471, 'Cat Crates', 464, 'cat-crates', 'uploads/media/2022/Cat_Crates.jpg', NULL, 0, 1, 0),
(472, 'Cat Doors & Flaps', 464, 'cat-doors-flaps', 'uploads/media/2022/Cat_Doors_Flaps.jpg', NULL, 0, 1, 0),
(473, 'Cat Food', 464, 'cat-food', 'uploads/media/2022/Cat_Food.jpg', NULL, 0, 1, 0),
(474, 'Cat Grass', 464, 'cat-grass', 'uploads/media/2022/Cat_Grass.jpg', NULL, 0, 1, 0),
(475, 'Cat Harnesses', 464, 'cat-harnesses', 'uploads/media/2022/Cat_Harnesses.jpg', NULL, 0, 1, 0),
(476, 'Cat Leashes', 464, 'cat-leashes', 'uploads/media/2022/Cat_Leashes.jpg', NULL, 0, 1, 0),
(477, 'Cat Litter', 464, 'cat-litter', 'uploads/media/2022/Cat_Litter.jpg', NULL, 0, 1, 0),
(478, 'Wallets', 145, 'wallets', 'uploads/media/2022/Wallets.jpg', NULL, 0, 1, 0),
(479, 'Cat Scratchers', 464, 'cat-scratchers', 'uploads/media/2022/Cat_Scratchers.jpg', NULL, 0, 1, 0),
(480, 'Belts', 145, 'belts', 'uploads/media/2022/Belts.jpg', NULL, 0, 1, 0),
(481, 'Hats', 145, 'hats', 'uploads/media/2022/Hats.jpg', NULL, 0, 1, 0),
(482, 'Cat Supplements', 464, 'cat-supplements', 'uploads/media/2022/Cat_Supplements.jpg', NULL, 0, 1, 0),
(483, 'Hair Accessories', 145, 'hair-accessories', 'uploads/media/2022/Hair_Accessories.jpg', NULL, 0, 1, 0),
(484, 'Cat Tags', 464, 'cat-tags', 'uploads/media/2022/Cat_Tags.jpg', NULL, 0, 1, 0),
(485, 'Watches', 145, 'watches', 'uploads/media/2022/Watches.jpg', NULL, 0, 1, 0),
(486, 'Cat Toys', 464, 'cat-toys', 'uploads/media/2022/Cat_Toys.jpg', NULL, 0, 1, 0),
(487, 'Cat Treats', 464, 'cat-treats', 'uploads/media/2022/Cat_Treats.jpg', NULL, 0, 1, 0),
(488, 'Catnip', 464, 'catnip', 'uploads/media/2022/Catnip.jpg', NULL, 0, 1, 0),
(489, 'Other', 145, 'other-10', 'uploads/media/2022/Other10.png', NULL, 0, 1, 0),
(490, 'Scarves', 145, 'scarves', 'uploads/media/2022/Scarves.jpg', NULL, 0, 1, 0),
(491, 'Cat Flea & Tick Prevention', 464, 'cat-flea-tick-prevention', 'uploads/media/2022/Cat_Flea_Tick_Prevention.png', NULL, 0, 1, 0),
(492, 'Wraps', 145, 'wraps-1', 'uploads/media/2022/Wraps_acc.jpg', NULL, 0, 1, 0),
(493, 'Cat Litter Boxes', 464, 'cat-litter-boxes', 'uploads/media/2022/Cat_Litter_Boxes.jpg', NULL, 0, 1, 0),
(494, 'Cat Pheromone Treatment', 464, 'cat-pheromone-treatment', 'uploads/media/2022/Cat_Pheromone_Treatment.jpg', NULL, 0, 1, 0),
(495, 'Bandanas', 145, 'bandanas', 'uploads/media/2022/Bandanas.jpg', NULL, 0, 1, 0),
(496, 'Other Cat Supplies', 464, 'other-cat-supplies', 'uploads/media/2022/Other_Cat_Supplies.jpg', NULL, 0, 1, 0),
(497, 'Fascinators', 145, 'fascinators', 'uploads/media/2022/Fascinators.jpg', NULL, 0, 1, 0),
(498, 'Fashion Gloves', 145, 'fashion-gloves', 'uploads/media/2022/Fashion_Gloves.jpg', NULL, 0, 1, 0),
(499, 'Dog Supplies', 437, 'dog-supplies', 'uploads/media/2022/Dog_Supplies.jpg', NULL, 0, 1, 0),
(500, 'Headbands', 145, 'headbands-1', 'uploads/media/2022/Headbands.jpg', NULL, 0, 1, 0),
(501, 'Dog Cages', 499, 'dog-cages', 'uploads/media/2022/Dog_Cages.png', NULL, 0, 1, 0),
(502, 'Hijabs', 145, 'hijabs', 'uploads/media/2022/Hijabs.jpg', NULL, 0, 1, 0),
(503, 'Dog Beds', 499, 'dog-beds', 'uploads/media/2022/Dog_Beds.jpg', NULL, 0, 1, 0),
(504, 'Dog Blankets', 499, 'dog-blankets', 'uploads/media/2022/Dog_Blankets.jpg', NULL, 0, 1, 0),
(505, 'Dog Bowls & Feeders', 499, 'dog-bowls-feeders', 'uploads/media/2022/Dog_Bowls_Feeders.jpg', NULL, 0, 1, 0),
(506, 'Dog Brushes', 499, 'dog-brushes', 'uploads/media/2022/Dog_Brushes.png', NULL, 0, 1, 0),
(507, 'Umbrellas', 145, 'umbrellas', 'uploads/media/2022/Umbrellas2.jpg', NULL, 0, 1, 0),
(508, 'Cardholders', 145, 'cardholders', 'uploads/media/2022/Cardholders.jpg', NULL, 0, 1, 0),
(509, 'Rings', 148, 'rings', 'uploads/media/2022/Rings.jpg', NULL, 0, 1, 0),
(510, 'Necklaces', 148, 'necklaces', 'uploads/media/2022/Necklaces.jpg', NULL, 0, 1, 0),
(511, 'Earrings', 148, 'earrings', 'uploads/media/2022/Earrings.jpg', NULL, 0, 1, 0),
(512, 'Dog Chews & Treats', 499, 'dog-chews-treats', 'uploads/media/2022/Dog_Chews_Treats.png', NULL, 0, 1, 0),
(513, 'Bracelets', 148, 'bracelets', 'uploads/media/2022/Bracelets.jpg', NULL, 0, 1, 0),
(514, 'Dog Collars', 499, 'dog-collars', 'uploads/media/2022/Dog_Collars.png', NULL, 0, 1, 0),
(515, 'Nose Rings', 148, 'nose-rings', 'uploads/media/2022/Nose_Rings.jpg', NULL, 0, 1, 0);
INSERT INTO `categories` (`id`, `name`, `parent_id`, `slug`, `image`, `banner`, `row_order`, `status`, `clicks`) VALUES
(516, 'Dog Combs', 499, 'dog-combs', 'uploads/media/2022/Dog_Combs.jpg', NULL, 0, 1, 0),
(517, 'Dog Costumes', 499, 'dog-costumes', 'uploads/media/2022/Dog_Costumes.jpg', NULL, 0, 1, 0),
(518, 'Toe Rings', 145, 'toe-rings', 'uploads/media/2022/Toe_Rings.jpg', NULL, 0, 1, 0),
(519, 'Dog Crates', 499, 'dog-crates', 'uploads/media/2022/Dog_Cages1.png', NULL, 0, 1, 0),
(520, 'Pins', 148, 'pins', 'uploads/media/2022/Pins.jpg', NULL, 0, 1, 0),
(521, 'Dog Doors & Flaps', 499, 'dog-doors-flaps', 'uploads/media/2022/Dog_Doors_Flaps.jpg', NULL, 0, 1, 0),
(522, 'Dresses', 150, 'dresses-1', 'uploads/media/2022/Dresses_maternity.jpg', NULL, 0, 1, 0),
(523, 'Sweaters', 150, 'sweaters-1', 'uploads/media/2022/Sweaters_2.jpg', NULL, 0, 1, 0),
(524, 'Dog Food', 499, 'dog-food', 'uploads/media/2022/Dog_Food.jpg', NULL, 0, 1, 0),
(525, 'Jeans', 150, 'jeans-1', 'uploads/media/2022/Jeans_2.jpg', NULL, 0, 1, 0),
(526, 'Dog Fur Clippers', 499, 'dog-fur-clippers', 'uploads/media/2022/Dog_Fur_Clippers.jpg', NULL, 0, 1, 0),
(527, 'Pants', 150, 'pants-1', 'uploads/media/2022/Pants_2.jpg', NULL, 0, 1, 0),
(528, 'Skirts', 150, 'skirts-1', 'uploads/media/2022/Skirts_2.jpg', NULL, 0, 1, 0),
(529, 'Dog Harnesses', 499, 'dog-harnesses', 'uploads/media/2022/Dog_Harnesses.jpg', NULL, 0, 1, 0),
(530, 'Coats & Jackets', 150, 'coats-jackets-1', 'uploads/media/2022/Coats_Jackets_2.jpg', NULL, 0, 1, 0),
(531, 'Athletic Apparel', 150, 'athletic-apparel-1', 'uploads/media/2022/Athletic_Apparel_2.jpg', NULL, 0, 1, 0),
(532, 'Dog Houses', 499, 'dog-houses', 'uploads/media/2022/Dog_Houses.jpg', NULL, 0, 1, 0),
(533, 'Dog Leashes', 499, 'dog-leashes', 'uploads/media/2022/Dog_Leashes.png', NULL, 0, 1, 0),
(534, 'Other', 150, 'other-11', 'uploads/media/2022/Other1.jpg', NULL, 0, 1, 0),
(535, 'Maternity Blouses', 150, 'maternity-blouses', 'uploads/media/2022/Maternity_Blouses.jpg', NULL, 0, 1, 0),
(536, 'Dog Muzzles', 499, 'dog-muzzles', 'uploads/media/2022/Dog_Muzzles.jpg', NULL, 0, 1, 0),
(537, 'Dog Nail Trimmers', 499, 'dog-nail-trimmers', 'uploads/media/2022/Dog_Nail_Trimmers.jpg', NULL, 0, 1, 0),
(538, 'Dog Pools', 499, 'dog-pools', 'uploads/media/2022/Dog_Pools.jpg', NULL, 0, 1, 0),
(539, 'Maternity Button-Ups', 150, 'maternity-button-ups', 'uploads/media/2022/Maternity_Button-Ups.jpg', NULL, 0, 1, 0),
(540, 'Dog Shampoo', 499, 'dog-shampoo', 'uploads/media/2022/Dog_Shampoo.jpg', NULL, 0, 1, 0),
(541, 'Maternity Camisoles', 150, 'maternity-camisoles', 'uploads/media/2022/Maternity_Camisoles.jpg', NULL, 0, 1, 0),
(542, 'Dog Shoes', 499, 'dog-shoes', 'uploads/media/2022/Dog-Shoes.jpg', NULL, 0, 1, 0),
(543, 'Maternity-T-Shirts', 150, 'maternity-t-shirts', 'uploads/media/2022/Maternity-T-Shirts.jpg', NULL, 0, 1, 0),
(544, 'Maternity Tank Tops', 150, 'maternity-tank-tops', 'uploads/media/2022/Maternity-Tank-Tops.jpg', NULL, 0, 1, 0),
(545, 'Maternity Suits', 150, 'maternity-suits', 'uploads/media/2022/MaternitySuit.jpg', NULL, 0, 1, 0),
(546, 'Dog Tags', 499, 'dog-tags', 'uploads/media/2022/Dog-Tags.jpg', NULL, 0, 1, 0),
(547, 'Maternity Suit Skirts', 150, 'maternity-suit-skirts', 'uploads/media/2022/MaternitySuitSkirts.jpg', NULL, 0, 1, 0),
(548, 'Dog Toys', 499, 'dog-toys', 'uploads/media/2022/Dog-Toys.jpg', NULL, 0, 1, 0),
(549, 'Dog Waste Bags', 499, 'dog-waste-bags', 'uploads/media/2022/Dog-Waste-Bags.png', NULL, 0, 1, 0),
(550, 'Athletic', 151, 'athletic', 'uploads/media/2022/Athletic.jpg', NULL, 0, 1, 0),
(551, 'Boots', 151, 'boots', 'uploads/media/2022/Boots.jpg', NULL, 0, 1, 0),
(552, 'Dog Whistles', 499, 'dog-whistles', 'uploads/media/2022/Dog-Whistles.png', NULL, 0, 1, 0),
(553, 'Dog Flea & Tick Treatment', 499, 'dog-flea-tick-treatment', 'uploads/media/2022/Dog-Flea-Tick-Treatment.jpg', NULL, 0, 1, 0),
(554, 'Fashion Sneakers', 151, 'fashion-sneakers', 'uploads/media/2022/FashionSneakers.jpg', NULL, 0, 1, 0),
(555, 'Pet Odor & Stain Removal', 499, 'pet-odor-stain-removal', 'uploads/media/2022/Pet-Odor-Stain-Removal.jpg', NULL, 0, 1, 0),
(556, 'Flats', 151, 'flats', 'uploads/media/2022/Flats.jpg', NULL, 0, 1, 0),
(557, 'Pooper Scoopers', 499, 'pooper-scoopers', 'uploads/media/2022/Pooper-Scoopers.jpg', NULL, 0, 1, 0),
(558, 'Outdoor', 151, 'outdoor', 'uploads/media/2022/Outdoor.jpg', NULL, 0, 1, 0),
(559, 'Other Dog Supplies', 499, 'other-dog-supplies', 'uploads/media/2022/Other-Dog-Supplies.jpg', NULL, 0, 1, 0),
(560, 'Oxfords', 151, 'oxfords', 'uploads/media/2022/Oxfords.jpg', NULL, 0, 1, 0),
(561, 'Heels', 151, 'heels', 'uploads/media/2022/Heels.jpg', NULL, 0, 1, 0),
(562, 'Reptile Supplies', 437, 'reptile-supplies', 'uploads/media/2022/Reptile-Supplies.jpg', NULL, 0, 1, 0),
(563, 'Sandals', 151, 'sandals', 'uploads/media/2022/Sandals.jpg', NULL, 0, 1, 0),
(564, 'Reptile Food', 562, 'reptile-food', 'uploads/media/2022/Reptile-Food.jpg', NULL, 0, 1, 0),
(565, 'Reptile Heaters', 562, 'reptile-heaters', 'uploads/media/2022/Reptile-Heaters.jpg', NULL, 0, 1, 0),
(566, 'Slippers', 151, 'slippers', 'uploads/media/2022/Slippers.jpg', NULL, 0, 1, 0),
(567, 'Reptile Terrariums', 562, 'reptile-terrariums', 'uploads/media/2022/Reptile-Terrariums.jpg', NULL, 0, 1, 0),
(568, 'Work & Safety', 151, 'work-safety', 'uploads/media/2022/WorkSafety.jpg', NULL, 0, 1, 0),
(569, 'Other', 151, 'other-12', 'uploads/media/2022/other_41.jpg', NULL, 0, 1, 0),
(570, 'Terrerium Decor', 562, 'terrerium-decor', 'uploads/media/2022/Terrerium-Decor.jpg', NULL, 0, 1, 0),
(571, 'Loafers', 151, 'loafers', 'uploads/media/2022/Loafers.jpg', NULL, 0, 1, 0),
(572, 'Slip-Ons', 151, 'slip-ons', 'uploads/media/2022/Slip-Ons.jpg', NULL, 0, 1, 0),
(573, 'Other Reptile Supplies', 562, 'other-reptile-supplies', 'uploads/media/2022/Other-Reptile-Supplies.png', NULL, 0, 1, 0),
(574, 'Clogs', 151, 'clogs', 'uploads/media/2022/Clogs.jpg', NULL, 0, 1, 0),
(575, 'Office', 0, 'office', 'uploads/media/2022/Office.jpg', NULL, 0, 1, 0),
(576, 'Mules', 151, 'mules', 'uploads/media/2022/Mules.jpg', NULL, 0, 1, 0),
(577, 'G-strings & Thongs', 154, 'g-strings-thongs', 'uploads/media/2022/G-stringsThongs.jpg', NULL, 0, 1, 0),
(578, 'Panties', 154, 'panties', 'uploads/media/2022/Panties.jpg', NULL, 0, 1, 0),
(579, 'School Supplies', 575, 'school-supplies', 'uploads/media/2022/School-Supplies.jpg', NULL, 0, 1, 0),
(580, 'Thermal Underwear', 154, 'thermal-underwear', 'uploads/media/2022/ThermalUnderwear.jpg', NULL, 0, 1, 0),
(581, 'Bras', 154, 'bras', 'uploads/media/2022/Bras.jpg', NULL, 0, 1, 0),
(582, 'Other', 154, 'other-13', 'uploads/media/2022/Other_21.jpg', NULL, 0, 1, 0),
(583, 'Binders', 579, 'binders', 'uploads/media/2022/Binders.jpg', NULL, 0, 1, 0),
(584, 'Binding Covers', 579, 'binding-covers', 'uploads/media/2022/Binding-Covers.jpg', NULL, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(1, 'surat'),
(2, 'Ahmedabad'),
(4, 'Vadodra'),
(5, 'Gondal'),
(6, 'Rajkot');

-- --------------------------------------------------------

--
-- Table structure for table `client_api_keys`
--

CREATE TABLE `client_api_keys` (
  `id` int(11) NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numeric_code` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso2` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonecode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tld` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `native` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subregion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezones` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `emoji` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emojiU` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `flag` tinyint(1) NOT NULL DEFAULT 1,
  `wikiDataId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Rapid API GeoDB Cities'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso3`, `numeric_code`, `iso2`, `phonecode`, `capital`, `currency`, `currency_name`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `created_at`, `updated_at`, `flag`, `wikiDataId`) VALUES
(1, 'Afghanistan', 'AFG', '004', 'AF', '93', 'Kabul', 'AFN', 'Afghan afghani', '??', '.af', '??????????????????', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Kabul\",\"gmtOffset\":16200,\"gmtOffsetName\":\"UTC+04:30\",\"abbreviation\":\"AFT\",\"tzName\":\"Afghanistan Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Afeganist??o\",\"pt\":\"Afeganist??o\",\"nl\":\"Afghanistan\",\"hr\":\"Afganistan\",\"fa\":\"??????????????????\",\"de\":\"Afghanistan\",\"es\":\"Afganist??n\",\"fr\":\"Afghanistan\",\"ja\":\"?????????????????????\",\"it\":\"Afghanistan\",\"cn\":\"?????????\"}', '33.00000000', '65.00000000', '????????', 'U+1F1E6 U+1F1EB', '2018-07-21 01:41:03', '2021-12-11 18:19:42', 1, 'Q889'),
(2, 'Aland Islands', 'ALA', '248', 'AX', '+358-18', 'Mariehamn', 'EUR', 'Euro', '???', '.ax', '??land', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Mariehamn\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"????????? ??????\",\"br\":\"Ilhas de Aland\",\"pt\":\"Ilhas de Aland\",\"nl\":\"??landeilanden\",\"hr\":\"??landski otoci\",\"fa\":\"?????????? ????????\",\"de\":\"??land\",\"es\":\"Alandia\",\"fr\":\"??land\",\"ja\":\"?????????????????????\",\"it\":\"Isole Aland\",\"cn\":\"????????????\"}', '60.11666700', '19.90000000', '????????', 'U+1F1E6 U+1F1FD', '2018-07-21 01:41:03', '2021-12-11 18:26:03', 1, NULL),
(3, 'Albania', 'ALB', '008', 'AL', '355', 'Tirana', 'ALL', 'Albanian lek', 'Lek', '.al', 'Shqip??ria', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Tirane\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Alb??nia\",\"pt\":\"Alb??nia\",\"nl\":\"Albani??\",\"hr\":\"Albanija\",\"fa\":\"????????????\",\"de\":\"Albanien\",\"es\":\"Albania\",\"fr\":\"Albanie\",\"ja\":\"???????????????\",\"it\":\"Albania\",\"cn\":\"???????????????\"}', '41.00000000', '20.00000000', '????????', 'U+1F1E6 U+1F1F1', '2018-07-21 01:41:03', '2021-12-11 18:20:01', 1, 'Q222'),
(4, 'Algeria', 'DZA', '012', 'DZ', '213', 'Algiers', 'DZD', 'Algerian dinar', '????', '.dz', '??????????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Algiers\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Arg??lia\",\"pt\":\"Arg??lia\",\"nl\":\"Algerije\",\"hr\":\"Al??ir\",\"fa\":\"??????????????\",\"de\":\"Algerien\",\"es\":\"Argelia\",\"fr\":\"Alg??rie\",\"ja\":\"??????????????????\",\"it\":\"Algeria\",\"cn\":\"???????????????\"}', '28.00000000', '3.00000000', '????????', 'U+1F1E9 U+1F1FF', '2018-07-21 01:41:03', '2021-12-11 18:20:10', 1, 'Q262'),
(5, 'American Samoa', 'ASM', '016', 'AS', '+1-684', 'Pago Pago', 'USD', 'US Dollar', '$', '.as', 'American Samoa', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Pago_Pago\",\"gmtOffset\":-39600,\"gmtOffsetName\":\"UTC-11:00\",\"abbreviation\":\"SST\",\"tzName\":\"Samoa Standard Time\"}]', '{\"kr\":\"?????????????????????\",\"br\":\"Samoa Americana\",\"pt\":\"Samoa Americana\",\"nl\":\"Amerikaans Samoa\",\"hr\":\"Ameri??ka Samoa\",\"fa\":\"???????????? ????????????\",\"de\":\"Amerikanisch-Samoa\",\"es\":\"Samoa Americana\",\"fr\":\"Samoa am??ricaines\",\"ja\":\"????????????????????????\",\"it\":\"Samoa Americane\",\"cn\":\"???????????????\"}', '-14.33333333', '-170.00000000', '????????', 'U+1F1E6 U+1F1F8', '2018-07-21 01:41:03', '2021-12-11 18:25:50', 1, NULL),
(6, 'Andorra', 'AND', '020', 'AD', '376', 'Andorra la Vella', 'EUR', 'Euro', '???', '.ad', 'Andorra', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Andorra\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Andorra\",\"pt\":\"Andorra\",\"nl\":\"Andorra\",\"hr\":\"Andora\",\"fa\":\"????????????\",\"de\":\"Andorra\",\"es\":\"Andorra\",\"fr\":\"Andorre\",\"ja\":\"????????????\",\"it\":\"Andorra\",\"cn\":\"?????????\"}', '42.50000000', '1.50000000', '????????', 'U+1F1E6 U+1F1E9', '2018-07-21 01:41:03', '2021-12-11 18:20:22', 1, 'Q228'),
(7, 'Angola', 'AGO', '024', 'AO', '244', 'Luanda', 'AOA', 'Angolan kwanza', 'Kz', '.ao', 'Angola', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Luanda\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Angola\",\"pt\":\"Angola\",\"nl\":\"Angola\",\"hr\":\"Angola\",\"fa\":\"????????????\",\"de\":\"Angola\",\"es\":\"Angola\",\"fr\":\"Angola\",\"ja\":\"????????????\",\"it\":\"Angola\",\"cn\":\"?????????\"}', '-12.50000000', '18.50000000', '????????', 'U+1F1E6 U+1F1F4', '2018-07-21 01:41:03', '2021-12-11 18:20:31', 1, 'Q916'),
(8, 'Anguilla', 'AIA', '660', 'AI', '+1-264', 'The Valley', 'XCD', 'East Caribbean dollar', '$', '.ai', 'Anguilla', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Anguilla\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Anguila\",\"pt\":\"Anguila\",\"nl\":\"Anguilla\",\"hr\":\"Angvila\",\"fa\":\"??????????????\",\"de\":\"Anguilla\",\"es\":\"Anguilla\",\"fr\":\"Anguilla\",\"ja\":\"????????????\",\"it\":\"Anguilla\",\"cn\":\"?????????\"}', '18.25000000', '-63.16666666', '????????', 'U+1F1E6 U+1F1EE', '2018-07-21 01:41:03', '2021-12-11 18:20:46', 1, NULL),
(9, 'Antarctica', 'ATA', '010', 'AQ', '672', '', 'AAD', 'Antarctican dollar', '$', '.aq', 'Antarctica', 'Polar', '', '[{\"zoneName\":\"Antarctica/Casey\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AWST\",\"tzName\":\"Australian Western Standard Time\"},{\"zoneName\":\"Antarctica/Davis\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"DAVT\",\"tzName\":\"Davis Time\"},{\"zoneName\":\"Antarctica/DumontDUrville\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"DDUT\",\"tzName\":\"Dumont d\'Urville Time\"},{\"zoneName\":\"Antarctica/Mawson\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"MAWT\",\"tzName\":\"Mawson Station Time\"},{\"zoneName\":\"Antarctica/McMurdo\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"NZDT\",\"tzName\":\"New Zealand Daylight Time\"},{\"zoneName\":\"Antarctica/Palmer\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"CLST\",\"tzName\":\"Chile Summer Time\"},{\"zoneName\":\"Antarctica/Rothera\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ROTT\",\"tzName\":\"Rothera Research Station Time\"},{\"zoneName\":\"Antarctica/Syowa\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"SYOT\",\"tzName\":\"Showa Station Time\"},{\"zoneName\":\"Antarctica/Troll\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"},{\"zoneName\":\"Antarctica/Vostok\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"VOST\",\"tzName\":\"Vostok Station Time\"}]', '{\"kr\":\"??????\",\"br\":\"Ant??rtida\",\"pt\":\"Ant??rctida\",\"nl\":\"Antarctica\",\"hr\":\"Antarktika\",\"fa\":\"??????????????\",\"de\":\"Antarktika\",\"es\":\"Ant??rtida\",\"fr\":\"Antarctique\",\"ja\":\"????????????\",\"it\":\"Antartide\",\"cn\":\"?????????\"}', '-74.65000000', '4.48000000', '????????', 'U+1F1E6 U+1F1F6', '2018-07-21 01:41:03', '2021-12-11 19:19:17', 1, NULL),
(10, 'Antigua And Barbuda', 'ATG', '028', 'AG', '+1-268', 'St. John\'s', 'XCD', 'Eastern Caribbean dollar', '$', '.ag', 'Antigua and Barbuda', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Antigua\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????? ?????????\",\"br\":\"Ant??gua e Barbuda\",\"pt\":\"Ant??gua e Barbuda\",\"nl\":\"Antigua en Barbuda\",\"hr\":\"Antigva i Barbuda\",\"fa\":\"?????????????? ?? ??????????????\",\"de\":\"Antigua und Barbuda\",\"es\":\"Antigua y Barbuda\",\"fr\":\"Antigua-et-Barbuda\",\"ja\":\"????????????????????????????????????\",\"it\":\"Antigua e Barbuda\",\"cn\":\"?????????????????????\"}', '17.05000000', '-61.80000000', '????????', 'U+1F1E6 U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 18:26:34', 1, 'Q781'),
(11, 'Argentina', 'ARG', '032', 'AR', '54', 'Buenos Aires', 'ARS', 'Argentine peso', '$', '.ar', 'Argentina', 'Americas', 'South America', '[{\"zoneName\":\"America/Argentina/Buenos_Aires\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Catamarca\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Cordoba\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Jujuy\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/La_Rioja\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Mendoza\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Rio_Gallegos\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Salta\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/San_Juan\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/San_Luis\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Tucuman\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Ushuaia\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Argentina\",\"pt\":\"Argentina\",\"nl\":\"Argentini??\",\"hr\":\"Argentina\",\"fa\":\"????????????????\",\"de\":\"Argentinien\",\"es\":\"Argentina\",\"fr\":\"Argentine\",\"ja\":\"??????????????????\",\"it\":\"Argentina\",\"cn\":\"?????????\"}', '-34.00000000', '-64.00000000', '????????', 'U+1F1E6 U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 18:21:01', 1, 'Q414'),
(12, 'Armenia', 'ARM', '051', 'AM', '374', 'Yerevan', 'AMD', 'Armenian dram', '??', '.am', '????????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Yerevan\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Armenia Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Arm??nia\",\"pt\":\"Arm??nia\",\"nl\":\"Armeni??\",\"hr\":\"Armenija\",\"fa\":\"????????????????\",\"de\":\"Armenien\",\"es\":\"Armenia\",\"fr\":\"Arm??nie\",\"ja\":\"???????????????\",\"it\":\"Armenia\",\"cn\":\"????????????\"}', '40.00000000', '45.00000000', '????????', 'U+1F1E6 U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 18:21:06', 1, 'Q399'),
(13, 'Aruba', 'ABW', '533', 'AW', '297', 'Oranjestad', 'AWG', 'Aruban florin', '??', '.aw', 'Aruba', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Aruba\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Aruba\",\"pt\":\"Aruba\",\"nl\":\"Aruba\",\"hr\":\"Aruba\",\"fa\":\"??????????\",\"de\":\"Aruba\",\"es\":\"Aruba\",\"fr\":\"Aruba\",\"ja\":\"?????????\",\"it\":\"Aruba\",\"cn\":\"?????????\"}', '12.50000000', '-69.96666666', '????????', 'U+1F1E6 U+1F1FC', '2018-07-21 01:41:03', '2021-12-11 18:26:47', 1, NULL),
(14, 'Australia', 'AUS', '036', 'AU', '61', 'Canberra', 'AUD', 'Australian dollar', '$', '.au', 'Australia', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Antarctica/Macquarie\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"MIST\",\"tzName\":\"Macquarie Island Station Time\"},{\"zoneName\":\"Australia/Adelaide\",\"gmtOffset\":37800,\"gmtOffsetName\":\"UTC+10:30\",\"abbreviation\":\"ACDT\",\"tzName\":\"Australian Central Daylight Saving Time\"},{\"zoneName\":\"Australia/Brisbane\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"AEST\",\"tzName\":\"Australian Eastern Standard Time\"},{\"zoneName\":\"Australia/Broken_Hill\",\"gmtOffset\":37800,\"gmtOffsetName\":\"UTC+10:30\",\"abbreviation\":\"ACDT\",\"tzName\":\"Australian Central Daylight Saving Time\"},{\"zoneName\":\"Australia/Currie\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"},{\"zoneName\":\"Australia/Darwin\",\"gmtOffset\":34200,\"gmtOffsetName\":\"UTC+09:30\",\"abbreviation\":\"ACST\",\"tzName\":\"Australian Central Standard Time\"},{\"zoneName\":\"Australia/Eucla\",\"gmtOffset\":31500,\"gmtOffsetName\":\"UTC+08:45\",\"abbreviation\":\"ACWST\",\"tzName\":\"Australian Central Western Standard Time (Unofficial)\"},{\"zoneName\":\"Australia/Hobart\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"},{\"zoneName\":\"Australia/Lindeman\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"AEST\",\"tzName\":\"Australian Eastern Standard Time\"},{\"zoneName\":\"Australia/Lord_Howe\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"LHST\",\"tzName\":\"Lord Howe Summer Time\"},{\"zoneName\":\"Australia/Melbourne\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"},{\"zoneName\":\"Australia/Perth\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"AWST\",\"tzName\":\"Australian Western Standard Time\"},{\"zoneName\":\"Australia/Sydney\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"}]', '{\"kr\":\"??????\",\"br\":\"Austr??lia\",\"pt\":\"Austr??lia\",\"nl\":\"Australi??\",\"hr\":\"Australija\",\"fa\":\"????????????????\",\"de\":\"Australien\",\"es\":\"Australia\",\"fr\":\"Australie\",\"ja\":\"?????????????????????\",\"it\":\"Australia\",\"cn\":\"????????????\"}', '-27.00000000', '133.00000000', '????????', 'U+1F1E6 U+1F1FA', '2018-07-21 01:41:03', '2021-12-11 18:21:23', 1, 'Q408'),
(15, 'Austria', 'AUT', '040', 'AT', '43', 'Vienna', 'EUR', 'Euro', '???', '.at', '??sterreich', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Vienna\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"??ustria\",\"pt\":\"??ustria\",\"nl\":\"Oostenrijk\",\"hr\":\"Austrija\",\"fa\":\"??????????\",\"de\":\"??sterreich\",\"es\":\"Austria\",\"fr\":\"Autriche\",\"ja\":\"??????????????????\",\"it\":\"Austria\",\"cn\":\"?????????\"}', '47.33333333', '13.33333333', '????????', 'U+1F1E6 U+1F1F9', '2018-07-21 01:41:03', '2021-12-11 18:21:35', 1, 'Q40'),
(16, 'Azerbaijan', 'AZE', '031', 'AZ', '994', 'Baku', 'AZN', 'Azerbaijani manat', 'm', '.az', 'Az??rbaycan', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Baku\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"AZT\",\"tzName\":\"Azerbaijan Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Azerbaij??o\",\"pt\":\"Azerbaij??o\",\"nl\":\"Azerbeidzjan\",\"hr\":\"Azerbajd??an\",\"fa\":\"??????????????????\",\"de\":\"Aserbaidschan\",\"es\":\"Azerbaiy??n\",\"fr\":\"Azerba??djan\",\"ja\":\"????????????????????????\",\"it\":\"Azerbaijan\",\"cn\":\"????????????\"}', '40.50000000', '47.50000000', '????????', 'U+1F1E6 U+1F1FF', '2018-07-21 01:41:03', '2021-12-11 18:21:43', 1, 'Q227'),
(17, 'The Bahamas', 'BHS', '044', 'BS', '+1-242', 'Nassau', 'BSD', 'Bahamian dollar', 'B$', '.bs', 'Bahamas', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Nassau\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America)\"}]', '{\"kr\":\"?????????\",\"br\":\"Bahamas\",\"pt\":\"Baamas\",\"nl\":\"Bahama???s\",\"hr\":\"Bahami\",\"fa\":\"????????????\",\"de\":\"Bahamas\",\"es\":\"Bahamas\",\"fr\":\"Bahamas\",\"ja\":\"?????????\",\"it\":\"Bahamas\",\"cn\":\"?????????\"}', '24.25000000', '-76.00000000', '????????', 'U+1F1E7 U+1F1F8', '2018-07-21 01:41:03', '2022-03-13 16:28:29', 1, 'Q778'),
(18, 'Bahrain', 'BHR', '048', 'BH', '973', 'Manama', 'BHD', 'Bahraini dinar', '.??.??', '.bh', '?????????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Bahrain\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Bahrein\",\"pt\":\"Bar??m\",\"nl\":\"Bahrein\",\"hr\":\"Bahrein\",\"fa\":\"??????????\",\"de\":\"Bahrain\",\"es\":\"Bahrein\",\"fr\":\"Bahre??n\",\"ja\":\"???????????????\",\"it\":\"Bahrein\",\"cn\":\"??????\"}', '26.00000000', '50.55000000', '????????', 'U+1F1E7 U+1F1ED', '2018-07-21 01:41:03', '2021-12-11 18:21:58', 1, 'Q398'),
(19, 'Bangladesh', 'BGD', '050', 'BD', '880', 'Dhaka', 'BDT', 'Bangladeshi taka', '???', '.bd', 'Bangladesh', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Dhaka\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"BDT\",\"tzName\":\"Bangladesh Standard Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Bangladesh\",\"pt\":\"Bangladeche\",\"nl\":\"Bangladesh\",\"hr\":\"Banglade??\",\"fa\":\"??????????????\",\"de\":\"Bangladesch\",\"es\":\"Bangladesh\",\"fr\":\"Bangladesh\",\"ja\":\"?????????????????????\",\"it\":\"Bangladesh\",\"cn\":\"?????????\"}', '24.00000000', '90.00000000', '????????', 'U+1F1E7 U+1F1E9', '2018-07-21 01:41:03', '2021-12-11 18:22:04', 1, 'Q902'),
(20, 'Barbados', 'BRB', '052', 'BB', '+1-246', 'Bridgetown', 'BBD', 'Barbadian dollar', 'Bds$', '.bb', 'Barbados', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Barbados\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Barbados\",\"pt\":\"Barbados\",\"nl\":\"Barbados\",\"hr\":\"Barbados\",\"fa\":\"????????????????\",\"de\":\"Barbados\",\"es\":\"Barbados\",\"fr\":\"Barbade\",\"ja\":\"???????????????\",\"it\":\"Barbados\",\"cn\":\"????????????\"}', '13.16666666', '-59.53333333', '????????', 'U+1F1E7 U+1F1E7', '2018-07-21 01:41:03', '2021-12-11 18:27:03', 1, 'Q244'),
(21, 'Belarus', 'BLR', '112', 'BY', '375', 'Minsk', 'BYN', 'Belarusian ruble', 'Br', '.by', '??????????????????', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Minsk\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Bielorr??ssia\",\"pt\":\"Bielorr??ssia\",\"nl\":\"Wit-Rusland\",\"hr\":\"Bjelorusija\",\"fa\":\"????????????\",\"de\":\"Wei??russland\",\"es\":\"Bielorrusia\",\"fr\":\"Bi??lorussie\",\"ja\":\"???????????????\",\"it\":\"Bielorussia\",\"cn\":\"????????????\"}', '53.00000000', '28.00000000', '????????', 'U+1F1E7 U+1F1FE', '2018-07-21 01:41:03', '2021-12-11 18:27:09', 1, 'Q184'),
(22, 'Belgium', 'BEL', '056', 'BE', '32', 'Brussels', 'EUR', 'Euro', '???', '.be', 'Belgi??', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Brussels\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"B??lgica\",\"pt\":\"B??lgica\",\"nl\":\"Belgi??\",\"hr\":\"Belgija\",\"fa\":\"??????????\",\"de\":\"Belgien\",\"es\":\"B??lgica\",\"fr\":\"Belgique\",\"ja\":\"????????????\",\"it\":\"Belgio\",\"cn\":\"?????????\"}', '50.83333333', '4.00000000', '????????', 'U+1F1E7 U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 18:27:15', 1, 'Q31'),
(23, 'Belize', 'BLZ', '084', 'BZ', '501', 'Belmopan', 'BZD', 'Belize dollar', '$', '.bz', 'Belize', 'Americas', 'Central America', '[{\"zoneName\":\"America/Belize\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America)\"}]', '{\"kr\":\"?????????\",\"br\":\"Belize\",\"pt\":\"Belize\",\"nl\":\"Belize\",\"hr\":\"Belize\",\"fa\":\"????????\",\"de\":\"Belize\",\"es\":\"Belice\",\"fr\":\"Belize\",\"ja\":\"????????????\",\"it\":\"Belize\",\"cn\":\"?????????\"}', '17.25000000', '-88.75000000', '????????', 'U+1F1E7 U+1F1FF', '2018-07-21 01:41:03', '2021-12-11 18:27:21', 1, 'Q242'),
(24, 'Benin', 'BEN', '204', 'BJ', '229', 'Porto-Novo', 'XOF', 'West African CFA franc', 'CFA', '.bj', 'B??nin', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Porto-Novo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"??????\",\"br\":\"Benin\",\"pt\":\"Benim\",\"nl\":\"Benin\",\"hr\":\"Benin\",\"fa\":\"????????\",\"de\":\"Benin\",\"es\":\"Ben??n\",\"fr\":\"B??nin\",\"ja\":\"?????????\",\"it\":\"Benin\",\"cn\":\"??????\"}', '9.50000000', '2.25000000', '????????', 'U+1F1E7 U+1F1EF', '2018-07-21 01:41:03', '2021-12-11 18:27:27', 1, 'Q962'),
(25, 'Bermuda', 'BMU', '060', 'BM', '+1-441', 'Hamilton', 'BMD', 'Bermudian dollar', '$', '.bm', 'Bermuda', 'Americas', 'Northern America', '[{\"zoneName\":\"Atlantic/Bermuda\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Bermudas\",\"pt\":\"Bermudas\",\"nl\":\"Bermuda\",\"hr\":\"Bermudi\",\"fa\":\"????????????\",\"de\":\"Bermuda\",\"es\":\"Bermudas\",\"fr\":\"Bermudes\",\"ja\":\"???????????????\",\"it\":\"Bermuda\",\"cn\":\"?????????\"}', '32.33333333', '-64.75000000', '????????', 'U+1F1E7 U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 18:27:32', 1, NULL),
(26, 'Bhutan', 'BTN', '064', 'BT', '975', 'Thimphu', 'BTN', 'Bhutanese ngultrum', 'Nu.', '.bt', '??brug-yul', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Thimphu\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"BTT\",\"tzName\":\"Bhutan Time\"}]', '{\"kr\":\"??????\",\"br\":\"But??o\",\"pt\":\"But??o\",\"nl\":\"Bhutan\",\"hr\":\"Butan\",\"fa\":\"??????????\",\"de\":\"Bhutan\",\"es\":\"But??n\",\"fr\":\"Bhoutan\",\"ja\":\"????????????\",\"it\":\"Bhutan\",\"cn\":\"??????\"}', '27.50000000', '90.50000000', '????????', 'U+1F1E7 U+1F1F9', '2018-07-21 01:41:03', '2021-12-11 18:27:38', 1, 'Q917'),
(27, 'Bolivia', 'BOL', '068', 'BO', '591', 'Sucre', 'BOB', 'Bolivian boliviano', 'Bs.', '.bo', 'Bolivia', 'Americas', 'South America', '[{\"zoneName\":\"America/La_Paz\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"BOT\",\"tzName\":\"Bolivia Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Bol??via\",\"pt\":\"Bol??via\",\"nl\":\"Bolivia\",\"hr\":\"Bolivija\",\"fa\":\"????????????\",\"de\":\"Bolivien\",\"es\":\"Bolivia\",\"fr\":\"Bolivie\",\"ja\":\"????????????????????????\",\"it\":\"Bolivia\",\"cn\":\"????????????\"}', '-17.00000000', '-65.00000000', '????????', 'U+1F1E7 U+1F1F4', '2018-07-21 01:41:03', '2021-12-11 18:27:50', 1, 'Q750'),
(28, 'Bosnia and Herzegovina', 'BIH', '070', 'BA', '387', 'Sarajevo', 'BAM', 'Bosnia and Herzegovina convertible mark', 'KM', '.ba', 'Bosna i Hercegovina', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Sarajevo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????? ??????????????????\",\"br\":\"B??snia e Herzegovina\",\"pt\":\"B??snia e Herzegovina\",\"nl\":\"Bosni?? en Herzegovina\",\"hr\":\"Bosna i Hercegovina\",\"fa\":\"?????????? ?? ??????????????\",\"de\":\"Bosnien und Herzegowina\",\"es\":\"Bosnia y Herzegovina\",\"fr\":\"Bosnie-Herz??govine\",\"ja\":\"????????????????????????????????????\",\"it\":\"Bosnia ed Erzegovina\",\"cn\":\"??????????????????????????????\"}', '44.00000000', '18.00000000', '????????', 'U+1F1E7 U+1F1E6', '2018-07-21 01:41:03', '2021-12-11 18:28:10', 1, 'Q225'),
(29, 'Botswana', 'BWA', '072', 'BW', '267', 'Gaborone', 'BWP', 'Botswana pula', 'P', '.bw', 'Botswana', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Gaborone\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Botsuana\",\"pt\":\"Botsuana\",\"nl\":\"Botswana\",\"hr\":\"Bocvana\",\"fa\":\"????????????????\",\"de\":\"Botswana\",\"es\":\"Botswana\",\"fr\":\"Botswana\",\"ja\":\"????????????\",\"it\":\"Botswana\",\"cn\":\"????????????\"}', '-22.00000000', '24.00000000', '????????', 'U+1F1E7 U+1F1FC', '2018-07-21 01:41:03', '2021-12-11 18:28:22', 1, 'Q963'),
(30, 'Bouvet Island', 'BVT', '074', 'BV', '0055', '', 'NOK', 'Norwegian Krone', 'kr', '.bv', 'Bouvet??ya', '', '', '[{\"zoneName\":\"Europe/Oslo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????? ???\",\"br\":\"Ilha Bouvet\",\"pt\":\"Ilha Bouvet\",\"nl\":\"Bouveteiland\",\"hr\":\"Otok Bouvet\",\"fa\":\"?????????? ????????\",\"de\":\"Bouvetinsel\",\"es\":\"Isla Bouvet\",\"fr\":\"??le Bouvet\",\"ja\":\"????????????\",\"it\":\"Isola Bouvet\",\"cn\":\"?????????\"}', '-54.43333333', '3.40000000', '????????', 'U+1F1E7 U+1F1FB', '2018-07-21 01:41:03', '2021-12-11 19:17:50', 1, NULL),
(31, 'Brazil', 'BRA', '076', 'BR', '55', 'Brasilia', 'BRL', 'Brazilian real', 'R$', '.br', 'Brasil', 'Americas', 'South America', '[{\"zoneName\":\"America/Araguaina\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Bahia\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Belem\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Boa_Vista\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)[3\"},{\"zoneName\":\"America/Campo_Grande\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)[3\"},{\"zoneName\":\"America/Cuiaba\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasilia Time\"},{\"zoneName\":\"America/Eirunepe\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"ACT\",\"tzName\":\"Acre Time\"},{\"zoneName\":\"America/Fortaleza\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Maceio\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Manaus\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)\"},{\"zoneName\":\"America/Noronha\",\"gmtOffset\":-7200,\"gmtOffsetName\":\"UTC-02:00\",\"abbreviation\":\"FNT\",\"tzName\":\"Fernando de Noronha Time\"},{\"zoneName\":\"America/Porto_Velho\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)[3\"},{\"zoneName\":\"America/Recife\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Rio_Branco\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"ACT\",\"tzName\":\"Acre Time\"},{\"zoneName\":\"America/Santarem\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"},{\"zoneName\":\"America/Sao_Paulo\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Bras??lia Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Brasil\",\"pt\":\"Brasil\",\"nl\":\"Brazili??\",\"hr\":\"Brazil\",\"fa\":\"??????????\",\"de\":\"Brasilien\",\"es\":\"Brasil\",\"fr\":\"Br??sil\",\"ja\":\"????????????\",\"it\":\"Brasile\",\"cn\":\"??????\"}', '-10.00000000', '-55.00000000', '????????', 'U+1F1E7 U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 18:28:56', 1, 'Q155'),
(32, 'British Indian Ocean Territory', 'IOT', '086', 'IO', '246', 'Diego Garcia', 'USD', 'United States dollar', '$', '.io', 'British Indian Ocean Territory', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Chagos\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"IOT\",\"tzName\":\"Indian Ocean Time\"}]', '{\"kr\":\"????????? ????????? ??????\",\"br\":\"Territ??rio Brit??nico do Oceano ????dico\",\"pt\":\"Territ??rio Brit??nico do Oceano ??ndico\",\"nl\":\"Britse Gebieden in de Indische Oceaan\",\"hr\":\"Britanski Indijskooceanski teritorij\",\"fa\":\"?????????? ???????????????? ???? ?????????????? ??????\",\"de\":\"Britisches Territorium im Indischen Ozean\",\"es\":\"Territorio Brit??nico del Oc??ano ??ndico\",\"fr\":\"Territoire britannique de l\'oc??an Indien\",\"ja\":\"?????????????????????????????????\",\"it\":\"Territorio britannico dell\'oceano indiano\",\"cn\":\"?????????????????????\"}', '-6.00000000', '71.50000000', '????????', 'U+1F1EE U+1F1F4', '2018-07-21 01:41:03', '2021-12-11 18:29:10', 1, NULL),
(33, 'Brunei', 'BRN', '096', 'BN', '673', 'Bandar Seri Begawan', 'BND', 'Brunei dollar', 'B$', '.bn', 'Negara Brunei Darussalam', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Brunei\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"BNT\",\"tzName\":\"Brunei Darussalam Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Brunei\",\"pt\":\"Brunei\",\"nl\":\"Brunei\",\"hr\":\"Brunej\",\"fa\":\"????????????\",\"de\":\"Brunei\",\"es\":\"Brunei\",\"fr\":\"Brunei\",\"ja\":\"?????????????????????????????????\",\"it\":\"Brunei\",\"cn\":\"??????\"}', '4.50000000', '114.66666666', '????????', 'U+1F1E7 U+1F1F3', '2018-07-21 01:41:03', '2021-12-11 18:29:19', 1, 'Q921'),
(34, 'Bulgaria', 'BGR', '100', 'BG', '359', 'Sofia', 'BGN', 'Bulgarian lev', '????.', '.bg', '????????????????', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Sofia\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Bulg??ria\",\"pt\":\"Bulg??ria\",\"nl\":\"Bulgarije\",\"hr\":\"Bugarska\",\"fa\":\"??????????????????\",\"de\":\"Bulgarien\",\"es\":\"Bulgaria\",\"fr\":\"Bulgarie\",\"ja\":\"???????????????\",\"it\":\"Bulgaria\",\"cn\":\"????????????\"}', '43.00000000', '25.00000000', '????????', 'U+1F1E7 U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 18:29:26', 1, 'Q219'),
(35, 'Burkina Faso', 'BFA', '854', 'BF', '226', 'Ouagadougou', 'XOF', 'West African CFA franc', 'CFA', '.bf', 'Burkina Faso', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Ouagadougou\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"???????????? ??????\",\"br\":\"Burkina Faso\",\"pt\":\"Burquina Faso\",\"nl\":\"Burkina Faso\",\"hr\":\"Burkina Faso\",\"fa\":\"??????????????????????\",\"de\":\"Burkina Faso\",\"es\":\"Burkina Faso\",\"fr\":\"Burkina Faso\",\"ja\":\"?????????????????????\",\"it\":\"Burkina Faso\",\"cn\":\"???????????????\"}', '13.00000000', '-2.00000000', '????????', 'U+1F1E7 U+1F1EB', '2018-07-21 01:41:03', '2021-12-11 18:29:35', 1, 'Q965'),
(36, 'Burundi', 'BDI', '108', 'BI', '257', 'Bujumbura', 'BIF', 'Burundian franc', 'FBu', '.bi', 'Burundi', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Bujumbura\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Burundi\",\"pt\":\"Bur??ndi\",\"nl\":\"Burundi\",\"hr\":\"Burundi\",\"fa\":\"??????????????\",\"de\":\"Burundi\",\"es\":\"Burundi\",\"fr\":\"Burundi\",\"ja\":\"????????????\",\"it\":\"Burundi\",\"cn\":\"?????????\"}', '-3.50000000', '30.00000000', '????????', 'U+1F1E7 U+1F1EE', '2018-07-21 01:41:03', '2021-12-11 18:29:42', 1, 'Q967'),
(37, 'Cambodia', 'KHM', '116', 'KH', '855', 'Phnom Penh', 'KHR', 'Cambodian riel', 'KHR', '.kh', 'K??mp??ch??a', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Phnom_Penh\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Camboja\",\"pt\":\"Camboja\",\"nl\":\"Cambodja\",\"hr\":\"Kambod??a\",\"fa\":\"????????????\",\"de\":\"Kambodscha\",\"es\":\"Camboya\",\"fr\":\"Cambodge\",\"ja\":\"???????????????\",\"it\":\"Cambogia\",\"cn\":\"?????????\"}', '13.00000000', '105.00000000', '????????', 'U+1F1F0 U+1F1ED', '2018-07-21 01:41:03', '2021-12-11 18:29:47', 1, 'Q424'),
(38, 'Cameroon', 'CMR', '120', 'CM', '237', 'Yaounde', 'XAF', 'Central African CFA franc', 'FCFA', '.cm', 'Cameroon', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Douala\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Camar??es\",\"pt\":\"Camar??es\",\"nl\":\"Kameroen\",\"hr\":\"Kamerun\",\"fa\":\"????????????\",\"de\":\"Kamerun\",\"es\":\"Camer??n\",\"fr\":\"Cameroun\",\"ja\":\"???????????????\",\"it\":\"Camerun\",\"cn\":\"?????????\"}', '6.00000000', '12.00000000', '????????', 'U+1F1E8 U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 18:29:54', 1, 'Q1009'),
(39, 'Canada', 'CAN', '124', 'CA', '1', 'Ottawa', 'CAD', 'Canadian dollar', '$', '.ca', 'Canada', 'Americas', 'Northern America', '[{\"zoneName\":\"America/Atikokan\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America)\"},{\"zoneName\":\"America/Blanc-Sablon\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Cambridge_Bay\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Creston\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Dawson\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Dawson_Creek\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Edmonton\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Fort_Nelson\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Glace_Bay\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Goose_Bay\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Halifax\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Inuvik\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Iqaluit\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Moncton\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Nipigon\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Pangnirtung\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Rainy_River\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Rankin_Inlet\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Regina\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Resolute\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/St_Johns\",\"gmtOffset\":-12600,\"gmtOffsetName\":\"UTC-03:30\",\"abbreviation\":\"NST\",\"tzName\":\"Newfoundland Standard Time\"},{\"zoneName\":\"America/Swift_Current\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Thunder_Bay\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Toronto\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Vancouver\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"},{\"zoneName\":\"America/Whitehorse\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Winnipeg\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Yellowknife\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"}]', '{\"kr\":\"?????????\",\"br\":\"Canad??\",\"pt\":\"Canad??\",\"nl\":\"Canada\",\"hr\":\"Kanada\",\"fa\":\"????????????\",\"de\":\"Kanada\",\"es\":\"Canad??\",\"fr\":\"Canada\",\"ja\":\"?????????\",\"it\":\"Canada\",\"cn\":\"?????????\"}', '60.00000000', '-95.00000000', '????????', 'U+1F1E8 U+1F1E6', '2018-07-21 01:41:03', '2021-12-11 18:29:58', 1, 'Q16'),
(40, 'Cape Verde', 'CPV', '132', 'CV', '238', 'Praia', 'CVE', 'Cape Verdean escudo', '$', '.cv', 'Cabo Verde', 'Africa', 'Western Africa', '[{\"zoneName\":\"Atlantic/Cape_Verde\",\"gmtOffset\":-3600,\"gmtOffsetName\":\"UTC-01:00\",\"abbreviation\":\"CVT\",\"tzName\":\"Cape Verde Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Cabo Verde\",\"pt\":\"Cabo Verde\",\"nl\":\"Kaapverdi??\",\"hr\":\"Zelenortska Republika\",\"fa\":\"?????? ??????\",\"de\":\"Kap Verde\",\"es\":\"Cabo Verde\",\"fr\":\"Cap Vert\",\"ja\":\"??????????????????\",\"it\":\"Capo Verde\",\"cn\":\"?????????\"}', '16.00000000', '-24.00000000', '????????', 'U+1F1E8 U+1F1FB', '2018-07-21 01:41:03', '2021-12-11 18:30:03', 1, 'Q1011'),
(41, 'Cayman Islands', 'CYM', '136', 'KY', '+1-345', 'George Town', 'KYD', 'Cayman Islands dollar', '$', '.ky', 'Cayman Islands', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Cayman\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"????????? ??????\",\"br\":\"Ilhas Cayman\",\"pt\":\"Ilhas Caim??o\",\"nl\":\"Caymaneilanden\",\"hr\":\"Kajmanski otoci\",\"fa\":\"?????????? ????????\",\"de\":\"Kaimaninseln\",\"es\":\"Islas Caim??n\",\"fr\":\"??les Ca??mans\",\"ja\":\"??????????????????\",\"it\":\"Isole Cayman\",\"cn\":\"????????????\"}', '19.50000000', '-80.50000000', '????????', 'U+1F1F0 U+1F1FE', '2018-07-21 01:41:03', '2021-12-11 18:30:09', 1, NULL),
(42, 'Central African Republic', 'CAF', '140', 'CF', '236', 'Bangui', 'XAF', 'Central African CFA franc', 'FCFA', '.cf', 'K??d??r??s??se t?? B??afr??ka', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Bangui\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"?????????????????? ?????????\",\"br\":\"Rep??blica Centro-Africana\",\"pt\":\"Rep??blica Centro-Africana\",\"nl\":\"Centraal-Afrikaanse Republiek\",\"hr\":\"Srednjoafri??ka Republika\",\"fa\":\"???????????? ?????????????? ??????????\",\"de\":\"Zentralafrikanische Republik\",\"es\":\"Rep??blica Centroafricana\",\"fr\":\"R??publique centrafricaine\",\"ja\":\"???????????????????????????\",\"it\":\"Repubblica Centrafricana\",\"cn\":\"??????\"}', '7.00000000', '21.00000000', '????????', 'U+1F1E8 U+1F1EB', '2018-07-21 01:41:03', '2021-12-11 18:30:14', 1, 'Q929'),
(43, 'Chad', 'TCD', '148', 'TD', '235', 'N\'Djamena', 'XAF', 'Central African CFA franc', 'FCFA', '.td', 'Tchad', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Ndjamena\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"??????\",\"br\":\"Chade\",\"pt\":\"Chade\",\"nl\":\"Tsjaad\",\"hr\":\"??ad\",\"fa\":\"??????\",\"de\":\"Tschad\",\"es\":\"Chad\",\"fr\":\"Tchad\",\"ja\":\"?????????\",\"it\":\"Ciad\",\"cn\":\"??????\"}', '15.00000000', '19.00000000', '????????', 'U+1F1F9 U+1F1E9', '2018-07-21 01:41:03', '2021-12-11 18:30:21', 1, 'Q657'),
(44, 'Chile', 'CHL', '152', 'CL', '56', 'Santiago', 'CLP', 'Chilean peso', '$', '.cl', 'Chile', 'Americas', 'South America', '[{\"zoneName\":\"America/Punta_Arenas\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"CLST\",\"tzName\":\"Chile Summer Time\"},{\"zoneName\":\"America/Santiago\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"CLST\",\"tzName\":\"Chile Summer Time\"},{\"zoneName\":\"Pacific/Easter\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EASST\",\"tzName\":\"Easter Island Summer Time\"}]', '{\"kr\":\"??????\",\"br\":\"Chile\",\"pt\":\"Chile\",\"nl\":\"Chili\",\"hr\":\"??ile\",\"fa\":\"????????\",\"de\":\"Chile\",\"es\":\"Chile\",\"fr\":\"Chili\",\"ja\":\"??????\",\"it\":\"Cile\",\"cn\":\"??????\"}', '-30.00000000', '-71.00000000', '????????', 'U+1F1E8 U+1F1F1', '2018-07-21 01:41:03', '2021-12-11 18:30:28', 1, 'Q298'),
(45, 'China', 'CHN', '156', 'CN', '86', 'Beijing', 'CNY', 'Chinese yuan', '??', '.cn', '??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Shanghai\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CST\",\"tzName\":\"China Standard Time\"},{\"zoneName\":\"Asia/Urumqi\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"XJT\",\"tzName\":\"China Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"China\",\"pt\":\"China\",\"nl\":\"China\",\"hr\":\"Kina\",\"fa\":\"??????\",\"de\":\"China\",\"es\":\"China\",\"fr\":\"Chine\",\"ja\":\"??????\",\"it\":\"Cina\",\"cn\":\"??????\"}', '35.00000000', '105.00000000', '????????', 'U+1F1E8 U+1F1F3', '2018-07-21 01:41:03', '2021-12-11 18:30:33', 1, 'Q148'),
(46, 'Christmas Island', 'CXR', '162', 'CX', '61', 'Flying Fish Cove', 'AUD', 'Australian dollar', '$', '.cx', 'Christmas Island', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Indian/Christmas\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"CXT\",\"tzName\":\"Christmas Island Time\"}]', '{\"kr\":\"??????????????? ???\",\"br\":\"Ilha Christmas\",\"pt\":\"Ilha do Natal\",\"nl\":\"Christmaseiland\",\"hr\":\"Bo??i??ni otok\",\"fa\":\"?????????? ????????????\",\"de\":\"Weihnachtsinsel\",\"es\":\"Isla de Navidad\",\"fr\":\"??le Christmas\",\"ja\":\"??????????????????\",\"it\":\"Isola di Natale\",\"cn\":\"?????????\"}', '-10.50000000', '105.66666666', '????????', 'U+1F1E8 U+1F1FD', '2018-07-21 01:41:03', '2021-12-11 19:18:01', 1, NULL),
(47, 'Cocos (Keeling) Islands', 'CCK', '166', 'CC', '61', 'West Island', 'AUD', 'Australian dollar', '$', '.cc', 'Cocos (Keeling) Islands', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Indian/Cocos\",\"gmtOffset\":23400,\"gmtOffsetName\":\"UTC+06:30\",\"abbreviation\":\"CCT\",\"tzName\":\"Cocos Islands Time\"}]', '{\"kr\":\"????????? ??????\",\"br\":\"Ilhas Cocos\",\"pt\":\"Ilhas dos Cocos\",\"nl\":\"Cocoseilanden\",\"hr\":\"Kokosovi Otoci\",\"fa\":\"?????????? ??????????\",\"de\":\"Kokosinseln\",\"es\":\"Islas Cocos o Islas Keeling\",\"fr\":\"??les Cocos\",\"ja\":\"????????????????????????????????????\",\"it\":\"Isole Cocos e Keeling\",\"cn\":\"???????????????????????????\"}', '-12.50000000', '96.83333333', '????????', 'U+1F1E8 U+1F1E8', '2018-07-21 01:41:03', '2021-12-11 19:18:14', 1, NULL),
(48, 'Colombia', 'COL', '170', 'CO', '57', 'Bogot??', 'COP', 'Colombian peso', '$', '.co', 'Colombia', 'Americas', 'South America', '[{\"zoneName\":\"America/Bogota\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"COT\",\"tzName\":\"Colombia Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Col??mbia\",\"pt\":\"Col??mbia\",\"nl\":\"Colombia\",\"hr\":\"Kolumbija\",\"fa\":\"????????????\",\"de\":\"Kolumbien\",\"es\":\"Colombia\",\"fr\":\"Colombie\",\"ja\":\"???????????????\",\"it\":\"Colombia\",\"cn\":\"????????????\"}', '4.00000000', '-72.00000000', '????????', 'U+1F1E8 U+1F1F4', '2018-07-21 01:41:03', '2022-01-22 12:56:05', 1, 'Q739'),
(49, 'Comoros', 'COM', '174', 'KM', '269', 'Moroni', 'KMF', 'Comorian franc', 'CF', '.km', 'Komori', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Comoro\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Comores\",\"pt\":\"Comores\",\"nl\":\"Comoren\",\"hr\":\"Komori\",\"fa\":\"??????????\",\"de\":\"Union der Komoren\",\"es\":\"Comoras\",\"fr\":\"Comores\",\"ja\":\"?????????\",\"it\":\"Comore\",\"cn\":\"?????????\"}', '-12.16666666', '44.25000000', '????????', 'U+1F1F0 U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 18:30:50', 1, 'Q970'),
(50, 'Congo', 'COG', '178', 'CG', '242', 'Brazzaville', 'XAF', 'Central African CFA franc', 'FC', '.cg', 'R??publique du Congo', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Brazzaville\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"??????\",\"br\":\"Congo\",\"pt\":\"Congo\",\"nl\":\"Congo [Republiek]\",\"hr\":\"Kongo\",\"fa\":\"????????\",\"de\":\"Kongo\",\"es\":\"Congo\",\"fr\":\"Congo\",\"ja\":\"??????????????????\",\"it\":\"Congo\",\"cn\":\"??????\"}', '-1.00000000', '15.00000000', '????????', 'U+1F1E8 U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 18:31:09', 1, 'Q971'),
(51, 'Democratic Republic of the Congo', 'COD', '180', 'CD', '243', 'Kinshasa', 'CDF', 'Congolese Franc', 'FC', '.cd', 'R??publique d??mocratique du Congo', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Kinshasa\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"},{\"zoneName\":\"Africa/Lubumbashi\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"?????? ?????? ?????????\",\"br\":\"RD Congo\",\"pt\":\"RD Congo\",\"nl\":\"Congo [DRC]\",\"hr\":\"Kongo, Demokratska Republika\",\"fa\":\"???????????? ????????\",\"de\":\"Kongo (Dem. Rep.)\",\"es\":\"Congo (Rep. Dem.)\",\"fr\":\"Congo (R??p. d??m.)\",\"ja\":\"????????????????????????\",\"it\":\"Congo (Rep. Dem.)\",\"cn\":\"???????????????\"}', '0.00000000', '25.00000000', '????????', 'U+1F1E8 U+1F1E9', '2018-07-21 01:41:03', '2021-12-11 19:18:42', 1, 'Q974'),
(52, 'Cook Islands', 'COK', '184', 'CK', '682', 'Avarua', 'NZD', 'Cook Islands dollar', '$', '.ck', 'Cook Islands', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Rarotonga\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"CKT\",\"tzName\":\"Cook Island Time\"}]', '{\"kr\":\"??? ??????\",\"br\":\"Ilhas Cook\",\"pt\":\"Ilhas Cook\",\"nl\":\"Cookeilanden\",\"hr\":\"Cookovo Oto??je\",\"fa\":\"?????????? ??????\",\"de\":\"Cookinseln\",\"es\":\"Islas Cook\",\"fr\":\"??les Cook\",\"ja\":\"???????????????\",\"it\":\"Isole Cook\",\"cn\":\"????????????\"}', '-21.23333333', '-159.76666666', '????????', 'U+1F1E8 U+1F1F0', '2018-07-21 01:41:03', '2021-12-11 18:31:15', 1, 'Q26988'),
(53, 'Costa Rica', 'CRI', '188', 'CR', '506', 'San Jose', 'CRC', 'Costa Rican col??n', '???', '.cr', 'Costa Rica', 'Americas', 'Central America', '[{\"zoneName\":\"America/Costa_Rica\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"???????????????\",\"br\":\"Costa Rica\",\"pt\":\"Costa Rica\",\"nl\":\"Costa Rica\",\"hr\":\"Kostarika\",\"fa\":\"??????????????????\",\"de\":\"Costa Rica\",\"es\":\"Costa Rica\",\"fr\":\"Costa Rica\",\"ja\":\"???????????????\",\"it\":\"Costa Rica\",\"cn\":\"???????????????\"}', '10.00000000', '-84.00000000', '????????', 'U+1F1E8 U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 18:31:20', 1, 'Q800'),
(54, 'Cote D\'Ivoire (Ivory Coast)', 'CIV', '384', 'CI', '225', 'Yamoussoukro', 'XOF', 'West African CFA franc', 'CFA', '.ci', NULL, 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Abidjan\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Costa do Marfim\",\"pt\":\"Costa do Marfim\",\"nl\":\"Ivoorkust\",\"hr\":\"Obala Bjelokosti\",\"fa\":\"???????? ??????\",\"de\":\"Elfenbeink??ste\",\"es\":\"Costa de Marfil\",\"fr\":\"C??te d\'Ivoire\",\"ja\":\"????????????????????????\",\"it\":\"Costa D\'Avorio\",\"cn\":\"????????????\"}', '8.00000000', '-5.00000000', '????????', 'U+1F1E8 U+1F1EE', '2018-07-21 01:41:03', '2021-12-11 18:31:26', 1, 'Q1008'),
(55, 'Croatia', 'HRV', '191', 'HR', '385', 'Zagreb', 'HRK', 'Croatian kuna', 'kn', '.hr', 'Hrvatska', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Zagreb\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Cro??cia\",\"pt\":\"Cro??cia\",\"nl\":\"Kroati??\",\"hr\":\"Hrvatska\",\"fa\":\"????????????\",\"de\":\"Kroatien\",\"es\":\"Croacia\",\"fr\":\"Croatie\",\"ja\":\"???????????????\",\"it\":\"Croazia\",\"cn\":\"????????????\"}', '45.16666666', '15.50000000', '????????', 'U+1F1ED U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 18:31:33', 1, 'Q224'),
(56, 'Cuba', 'CUB', '192', 'CU', '53', 'Havana', 'CUP', 'Cuban peso', '$', '.cu', 'Cuba', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Havana\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"CST\",\"tzName\":\"Cuba Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"Cuba\",\"pt\":\"Cuba\",\"nl\":\"Cuba\",\"hr\":\"Kuba\",\"fa\":\"????????\",\"de\":\"Kuba\",\"es\":\"Cuba\",\"fr\":\"Cuba\",\"ja\":\"????????????\",\"it\":\"Cuba\",\"cn\":\"??????\"}', '21.50000000', '-80.00000000', '????????', 'U+1F1E8 U+1F1FA', '2018-07-21 01:41:03', '2021-12-11 18:31:39', 1, 'Q241'),
(57, 'Cyprus', 'CYP', '196', 'CY', '357', 'Nicosia', 'EUR', 'Euro', '???', '.cy', '????????????', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Asia/Famagusta\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Asia/Nicosia\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Chipre\",\"pt\":\"Chipre\",\"nl\":\"Cyprus\",\"hr\":\"Cipar\",\"fa\":\"????????\",\"de\":\"Zypern\",\"es\":\"Chipre\",\"fr\":\"Chypre\",\"ja\":\"????????????\",\"it\":\"Cipro\",\"cn\":\"????????????\"}', '35.00000000', '33.00000000', '????????', 'U+1F1E8 U+1F1FE', '2018-07-21 01:41:03', '2021-12-11 18:31:50', 1, 'Q229');
INSERT INTO `countries` (`id`, `name`, `iso3`, `numeric_code`, `iso2`, `phonecode`, `capital`, `currency`, `currency_name`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `created_at`, `updated_at`, `flag`, `wikiDataId`) VALUES
(58, 'Czech Republic', 'CZE', '203', 'CZ', '420', 'Prague', 'CZK', 'Czech koruna', 'K??', '.cz', '??esk?? republika', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Prague\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"??????\",\"br\":\"Rep??blica Tcheca\",\"pt\":\"Rep??blica Checa\",\"nl\":\"Tsjechi??\",\"hr\":\"??e??ka\",\"fa\":\"???????????? ????\",\"de\":\"Tschechische Republik\",\"es\":\"Rep??blica Checa\",\"fr\":\"R??publique tch??que\",\"ja\":\"?????????\",\"it\":\"Repubblica Ceca\",\"cn\":\"??????\"}', '49.75000000', '15.50000000', '????????', 'U+1F1E8 U+1F1FF', '2018-07-21 01:41:03', '2021-12-11 18:31:57', 1, 'Q213'),
(59, 'Denmark', 'DNK', '208', 'DK', '45', 'Copenhagen', 'DKK', 'Danish krone', 'Kr.', '.dk', 'Danmark', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Copenhagen\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Dinamarca\",\"pt\":\"Dinamarca\",\"nl\":\"Denemarken\",\"hr\":\"Danska\",\"fa\":\"??????????????\",\"de\":\"D??nemark\",\"es\":\"Dinamarca\",\"fr\":\"Danemark\",\"ja\":\"???????????????\",\"it\":\"Danimarca\",\"cn\":\"??????\"}', '56.00000000', '10.00000000', '????????', 'U+1F1E9 U+1F1F0', '2018-07-21 01:41:03', '2021-12-11 18:32:05', 1, 'Q35'),
(60, 'Djibouti', 'DJI', '262', 'DJ', '253', 'Djibouti', 'DJF', 'Djiboutian franc', 'Fdj', '.dj', 'Djibouti', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Djibouti\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Djibuti\",\"pt\":\"Djibuti\",\"nl\":\"Djibouti\",\"hr\":\"D??ibuti\",\"fa\":\"????????????\",\"de\":\"Dschibuti\",\"es\":\"Yibuti\",\"fr\":\"Djibouti\",\"ja\":\"?????????\",\"it\":\"Gibuti\",\"cn\":\"?????????\"}', '11.50000000', '43.00000000', '????????', 'U+1F1E9 U+1F1EF', '2018-07-21 01:41:03', '2021-12-11 18:32:11', 1, 'Q977'),
(61, 'Dominica', 'DMA', '212', 'DM', '+1-767', 'Roseau', 'XCD', 'Eastern Caribbean dollar', '$', '.dm', 'Dominica', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Dominica\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"???????????? ??????\",\"br\":\"Dominica\",\"pt\":\"Dominica\",\"nl\":\"Dominica\",\"hr\":\"Dominika\",\"fa\":\"????????????????\",\"de\":\"Dominica\",\"es\":\"Dominica\",\"fr\":\"Dominique\",\"ja\":\"???????????????\",\"it\":\"Dominica\",\"cn\":\"????????????\"}', '15.41666666', '-61.33333333', '????????', 'U+1F1E9 U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 18:32:16', 1, 'Q784'),
(62, 'Dominican Republic', 'DOM', '214', 'DO', '+1-809 and 1-829', 'Santo Domingo', 'DOP', 'Dominican peso', '$', '.do', 'Rep??blica Dominicana', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Santo_Domingo\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"???????????? ?????????\",\"br\":\"Rep??blica Dominicana\",\"pt\":\"Rep??blica Dominicana\",\"nl\":\"Dominicaanse Republiek\",\"hr\":\"Dominikanska Republika\",\"fa\":\"???????????? ????????????????\",\"de\":\"Dominikanische Republik\",\"es\":\"Rep??blica Dominicana\",\"fr\":\"R??publique dominicaine\",\"ja\":\"?????????????????????\",\"it\":\"Repubblica Dominicana\",\"cn\":\"?????????????????????\"}', '19.00000000', '-70.66666666', '????????', 'U+1F1E9 U+1F1F4', '2018-07-21 01:41:03', '2021-12-11 18:32:22', 1, 'Q786'),
(63, 'East Timor', 'TLS', '626', 'TL', '670', 'Dili', 'USD', 'United States dollar', '$', '.tl', 'Timor-Leste', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Dili\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"TLT\",\"tzName\":\"Timor Leste Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Timor Leste\",\"pt\":\"Timor Leste\",\"nl\":\"Oost-Timor\",\"hr\":\"Isto??ni Timor\",\"fa\":\"?????????? ????????\",\"de\":\"Timor-Leste\",\"es\":\"Timor Oriental\",\"fr\":\"Timor oriental\",\"ja\":\"??????????????????\",\"it\":\"Timor Est\",\"cn\":\"?????????\"}', '-8.83333333', '125.91666666', '????????', 'U+1F1F9 U+1F1F1', '2018-07-21 01:41:03', '2021-12-11 18:32:27', 1, 'Q574'),
(64, 'Ecuador', 'ECU', '218', 'EC', '593', 'Quito', 'USD', 'United States dollar', '$', '.ec', 'Ecuador', 'Americas', 'South America', '[{\"zoneName\":\"America/Guayaquil\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"ECT\",\"tzName\":\"Ecuador Time\"},{\"zoneName\":\"Pacific/Galapagos\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"GALT\",\"tzName\":\"Gal??pagos Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Equador\",\"pt\":\"Equador\",\"nl\":\"Ecuador\",\"hr\":\"Ekvador\",\"fa\":\"??????????????\",\"de\":\"Ecuador\",\"es\":\"Ecuador\",\"fr\":\"??quateur\",\"ja\":\"???????????????\",\"it\":\"Ecuador\",\"cn\":\"????????????\"}', '-2.00000000', '-77.50000000', '????????', 'U+1F1EA U+1F1E8', '2018-07-21 01:41:03', '2021-12-11 18:32:33', 1, 'Q736'),
(65, 'Egypt', 'EGY', '818', 'EG', '20', 'Cairo', 'EGP', 'Egyptian pound', '??.??', '.eg', '?????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Cairo\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Egito\",\"pt\":\"Egipto\",\"nl\":\"Egypte\",\"hr\":\"Egipat\",\"fa\":\"??????\",\"de\":\"??gypten\",\"es\":\"Egipto\",\"fr\":\"??gypte\",\"ja\":\"????????????\",\"it\":\"Egitto\",\"cn\":\"??????\"}', '27.00000000', '30.00000000', '????????', 'U+1F1EA U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 18:32:38', 1, 'Q79'),
(66, 'El Salvador', 'SLV', '222', 'SV', '503', 'San Salvador', 'USD', 'United States dollar', '$', '.sv', 'El Salvador', 'Americas', 'Central America', '[{\"zoneName\":\"America/El_Salvador\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"???????????????\",\"br\":\"El Salvador\",\"pt\":\"El Salvador\",\"nl\":\"El Salvador\",\"hr\":\"Salvador\",\"fa\":\"????????????????????\",\"de\":\"El Salvador\",\"es\":\"El Salvador\",\"fr\":\"Salvador\",\"ja\":\"?????????????????????\",\"it\":\"El Salvador\",\"cn\":\"????????????\"}', '13.83333333', '-88.91666666', '????????', 'U+1F1F8 U+1F1FB', '2018-07-21 01:41:03', '2021-12-11 18:32:45', 1, 'Q792'),
(67, 'Equatorial Guinea', 'GNQ', '226', 'GQ', '240', 'Malabo', 'XAF', 'Central African CFA franc', 'FCFA', '.gq', 'Guinea Ecuatorial', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Malabo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"?????? ??????\",\"br\":\"Guin?? Equatorial\",\"pt\":\"Guin?? Equatorial\",\"nl\":\"Equatoriaal-Guinea\",\"hr\":\"Ekvatorijalna Gvineja\",\"fa\":\"???????? ??????????????\",\"de\":\"??quatorial-Guinea\",\"es\":\"Guinea Ecuatorial\",\"fr\":\"Guin??e-??quatoriale\",\"ja\":\"???????????????\",\"it\":\"Guinea Equatoriale\",\"cn\":\"???????????????\"}', '2.00000000', '10.00000000', '????????', 'U+1F1EC U+1F1F6', '2018-07-21 01:41:03', '2021-12-11 18:32:52', 1, 'Q983'),
(68, 'Eritrea', 'ERI', '232', 'ER', '291', 'Asmara', 'ERN', 'Eritrean nakfa', 'Nfk', '.er', '????????????', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Asmara\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Eritreia\",\"pt\":\"Eritreia\",\"nl\":\"Eritrea\",\"hr\":\"Eritreja\",\"fa\":\"????????????\",\"de\":\"Eritrea\",\"es\":\"Eritrea\",\"fr\":\"??rythr??e\",\"ja\":\"???????????????\",\"it\":\"Eritrea\",\"cn\":\"???????????????\"}', '15.00000000', '39.00000000', '????????', 'U+1F1EA U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 18:32:58', 1, 'Q986'),
(69, 'Estonia', 'EST', '233', 'EE', '372', 'Tallinn', 'EUR', 'Euro', '???', '.ee', 'Eesti', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Tallinn\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Est??nia\",\"pt\":\"Est??nia\",\"nl\":\"Estland\",\"hr\":\"Estonija\",\"fa\":\"????????????\",\"de\":\"Estland\",\"es\":\"Estonia\",\"fr\":\"Estonie\",\"ja\":\"???????????????\",\"it\":\"Estonia\",\"cn\":\"????????????\"}', '59.00000000', '26.00000000', '????????', 'U+1F1EA U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 18:33:03', 1, 'Q191'),
(70, 'Ethiopia', 'ETH', '231', 'ET', '251', 'Addis Ababa', 'ETB', 'Ethiopian birr', 'Nkf', '.et', '???????????????', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Addis_Ababa\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Eti??pia\",\"pt\":\"Eti??pia\",\"nl\":\"Ethiopi??\",\"hr\":\"Etiopija\",\"fa\":\"????????????\",\"de\":\"??thiopien\",\"es\":\"Etiop??a\",\"fr\":\"??thiopie\",\"ja\":\"???????????????\",\"it\":\"Etiopia\",\"cn\":\"???????????????\"}', '8.00000000', '38.00000000', '????????', 'U+1F1EA U+1F1F9', '2018-07-21 01:41:03', '2021-12-11 18:46:58', 1, 'Q115'),
(71, 'Falkland Islands', 'FLK', '238', 'FK', '500', 'Stanley', 'FKP', 'Falkland Islands pound', '??', '.fk', 'Falkland Islands', 'Americas', 'South America', '[{\"zoneName\":\"Atlantic/Stanley\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"FKST\",\"tzName\":\"Falkland Islands Summer Time\"}]', '{\"kr\":\"???????????? ??????\",\"br\":\"Ilhas Malvinas\",\"pt\":\"Ilhas Falkland\",\"nl\":\"Falklandeilanden [Islas Malvinas]\",\"hr\":\"Falklandski Otoci\",\"fa\":\"?????????? ??????????????\",\"de\":\"Falklandinseln\",\"es\":\"Islas Malvinas\",\"fr\":\"??les Malouines\",\"ja\":\"????????????????????????????????????????????????\",\"it\":\"Isole Falkland o Isole Malvine\",\"cn\":\"???????????????\"}', '-51.75000000', '-59.00000000', '????????', 'U+1F1EB U+1F1F0', '2018-07-21 01:41:03', '2021-12-11 18:47:05', 1, NULL),
(72, 'Faroe Islands', 'FRO', '234', 'FO', '298', 'Torshavn', 'DKK', 'Danish krone', 'Kr.', '.fo', 'F??royar', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Atlantic/Faroe\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"}]', '{\"kr\":\"?????? ??????\",\"br\":\"Ilhas Faro??\",\"pt\":\"Ilhas Faro??\",\"nl\":\"Faer??er\",\"hr\":\"Farski Otoci\",\"fa\":\"?????????? ????????\",\"de\":\"F??r??er-Inseln\",\"es\":\"Islas Faroe\",\"fr\":\"??les F??ro??\",\"ja\":\"??????????????????\",\"it\":\"Isole Far Oer\",\"cn\":\"????????????\"}', '62.00000000', '-7.00000000', '????????', 'U+1F1EB U+1F1F4', '2018-07-21 01:41:03', '2021-12-11 18:47:11', 1, NULL),
(73, 'Fiji Islands', 'FJI', '242', 'FJ', '679', 'Suva', 'FJD', 'Fijian dollar', 'FJ$', '.fj', 'Fiji', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Fiji\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"FJT\",\"tzName\":\"Fiji Time\"}]', '{\"kr\":\"??????\",\"br\":\"Fiji\",\"pt\":\"Fiji\",\"nl\":\"Fiji\",\"hr\":\"Fi??i\",\"fa\":\"????????\",\"de\":\"Fidschi\",\"es\":\"Fiyi\",\"fr\":\"Fidji\",\"ja\":\"????????????\",\"it\":\"Figi\",\"cn\":\"??????\"}', '-18.00000000', '175.00000000', '????????', 'U+1F1EB U+1F1EF', '2018-07-21 01:41:03', '2021-12-11 18:47:17', 1, 'Q712'),
(74, 'Finland', 'FIN', '246', 'FI', '358', 'Helsinki', 'EUR', 'Euro', '???', '.fi', 'Suomi', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Helsinki\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Finl??ndia\",\"pt\":\"Finl??ndia\",\"nl\":\"Finland\",\"hr\":\"Finska\",\"fa\":\"????????????\",\"de\":\"Finnland\",\"es\":\"Finlandia\",\"fr\":\"Finlande\",\"ja\":\"??????????????????\",\"it\":\"Finlandia\",\"cn\":\"??????\"}', '64.00000000', '26.00000000', '????????', 'U+1F1EB U+1F1EE', '2018-07-21 01:41:03', '2021-12-11 18:47:24', 1, 'Q33'),
(75, 'France', 'FRA', '250', 'FR', '33', 'Paris', 'EUR', 'Euro', '???', '.fr', 'France', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Paris\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Fran??a\",\"pt\":\"Fran??a\",\"nl\":\"Frankrijk\",\"hr\":\"Francuska\",\"fa\":\"????????????\",\"de\":\"Frankreich\",\"es\":\"Francia\",\"fr\":\"France\",\"ja\":\"????????????\",\"it\":\"Francia\",\"cn\":\"??????\"}', '46.00000000', '2.00000000', '????????', 'U+1F1EB U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 18:47:33', 1, 'Q142'),
(76, 'French Guiana', 'GUF', '254', 'GF', '594', 'Cayenne', 'EUR', 'Euro', '???', '.gf', 'Guyane fran??aise', 'Americas', 'South America', '[{\"zoneName\":\"America/Cayenne\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"GFT\",\"tzName\":\"French Guiana Time\"}]', '{\"kr\":\"???????????? ?????????\",\"br\":\"Guiana Francesa\",\"pt\":\"Guiana Francesa\",\"nl\":\"Frans-Guyana\",\"hr\":\"Francuska Gvajana\",\"fa\":\"?????????? ????????????\",\"de\":\"Franz??sisch Guyana\",\"es\":\"Guayana Francesa\",\"fr\":\"Guayane\",\"ja\":\"????????????????????????\",\"it\":\"Guyana francese\",\"cn\":\"???????????????\"}', '4.00000000', '-53.00000000', '????????', 'U+1F1EC U+1F1EB', '2018-07-21 01:41:03', '2021-12-11 18:48:11', 1, NULL),
(77, 'French Polynesia', 'PYF', '258', 'PF', '689', 'Papeete', 'XPF', 'CFP franc', '???', '.pf', 'Polyn??sie fran??aise', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Gambier\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"GAMT\",\"tzName\":\"Gambier Islands Time\"},{\"zoneName\":\"Pacific/Marquesas\",\"gmtOffset\":-34200,\"gmtOffsetName\":\"UTC-09:30\",\"abbreviation\":\"MART\",\"tzName\":\"Marquesas Islands Time\"},{\"zoneName\":\"Pacific/Tahiti\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"TAHT\",\"tzName\":\"Tahiti Time\"}]', '{\"kr\":\"???????????? ???????????????\",\"br\":\"Polin??sia Francesa\",\"pt\":\"Polin??sia Francesa\",\"nl\":\"Frans-Polynesi??\",\"hr\":\"Francuska Polinezija\",\"fa\":\"??????????????? ????????????\",\"de\":\"Franz??sisch-Polynesien\",\"es\":\"Polinesia Francesa\",\"fr\":\"Polyn??sie fran??aise\",\"ja\":\"??????????????????????????????\",\"it\":\"Polinesia Francese\",\"cn\":\"?????????????????????\"}', '-15.00000000', '-140.00000000', '????????', 'U+1F1F5 U+1F1EB', '2018-07-21 01:41:03', '2021-12-11 18:47:54', 1, NULL),
(78, 'French Southern Territories', 'ATF', '260', 'TF', '262', 'Port-aux-Francais', 'EUR', 'Euro', '???', '.tf', 'Territoire des Terres australes et antarctiques fr', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Indian/Kerguelen\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TFT\",\"tzName\":\"French Southern and Antarctic Time\"}]', '{\"kr\":\"???????????? ?????? ??? ??????\",\"br\":\"Terras Austrais e Ant??rticas Francesas\",\"pt\":\"Terras Austrais e Ant??rticas Francesas\",\"nl\":\"Franse Gebieden in de zuidelijke Indische Oceaan\",\"hr\":\"Francuski ju??ni i antarkti??ki teritoriji\",\"fa\":\"????????????????????? ?????????? ?? ???????????????? ????????????\",\"de\":\"Franz??sische S??d- und Antarktisgebiete\",\"es\":\"Tierras Australes y Ant??rticas Francesas\",\"fr\":\"Terres australes et antarctiques fran??aises\",\"ja\":\"????????????????????????????????????\",\"it\":\"Territori Francesi del Sud\",\"cn\":\"??????????????????\"}', '-49.25000000', '69.16700000', '????????', 'U+1F1F9 U+1F1EB', '2018-07-21 01:41:03', '2021-12-11 18:48:34', 1, NULL),
(79, 'Gabon', 'GAB', '266', 'GA', '241', 'Libreville', 'XAF', 'Central African CFA franc', 'FCFA', '.ga', 'Gabon', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Libreville\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"??????\",\"br\":\"Gab??o\",\"pt\":\"Gab??o\",\"nl\":\"Gabon\",\"hr\":\"Gabon\",\"fa\":\"????????\",\"de\":\"Gabun\",\"es\":\"Gab??n\",\"fr\":\"Gabon\",\"ja\":\"?????????\",\"it\":\"Gabon\",\"cn\":\"??????\"}', '-1.00000000', '11.75000000', '????????', 'U+1F1EC U+1F1E6', '2018-07-21 01:41:03', '2021-12-11 18:48:46', 1, 'Q1000'),
(80, 'Gambia The', 'GMB', '270', 'GM', '220', 'Banjul', 'GMD', 'Gambian dalasi', 'D', '.gm', 'Gambia', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Banjul\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"?????????\",\"br\":\"G??mbia\",\"pt\":\"G??mbia\",\"nl\":\"Gambia\",\"hr\":\"Gambija\",\"fa\":\"????????????\",\"de\":\"Gambia\",\"es\":\"Gambia\",\"fr\":\"Gambie\",\"ja\":\"????????????\",\"it\":\"Gambia\",\"cn\":\"?????????\"}', '13.46666666', '-16.56666666', '????????', 'U+1F1EC U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 18:48:53', 1, 'Q1005'),
(81, 'Georgia', 'GEO', '268', 'GE', '995', 'Tbilisi', 'GEL', 'Georgian lari', '???', '.ge', '??????????????????????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Tbilisi\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"GET\",\"tzName\":\"Georgia Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Ge??rgia\",\"pt\":\"Ge??rgia\",\"nl\":\"Georgi??\",\"hr\":\"Gruzija\",\"fa\":\"??????????????\",\"de\":\"Georgien\",\"es\":\"Georgia\",\"fr\":\"G??orgie\",\"ja\":\"????????????\",\"it\":\"Georgia\",\"cn\":\"????????????\"}', '42.00000000', '43.50000000', '????????', 'U+1F1EC U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 18:48:59', 1, 'Q230'),
(82, 'Germany', 'DEU', '276', 'DE', '49', 'Berlin', 'EUR', 'Euro', '???', '.de', 'Deutschland', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Berlin\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"},{\"zoneName\":\"Europe/Busingen\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"??????\",\"br\":\"Alemanha\",\"pt\":\"Alemanha\",\"nl\":\"Duitsland\",\"hr\":\"Njema??ka\",\"fa\":\"??????????\",\"de\":\"Deutschland\",\"es\":\"Alemania\",\"fr\":\"Allemagne\",\"ja\":\"?????????\",\"it\":\"Germania\",\"cn\":\"??????\"}', '51.00000000', '9.00000000', '????????', 'U+1F1E9 U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 18:49:06', 1, 'Q183'),
(83, 'Ghana', 'GHA', '288', 'GH', '233', 'Accra', 'GHS', 'Ghanaian cedi', 'GH???', '.gh', 'Ghana', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Accra\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????\",\"br\":\"Gana\",\"pt\":\"Gana\",\"nl\":\"Ghana\",\"hr\":\"Gana\",\"fa\":\"??????\",\"de\":\"Ghana\",\"es\":\"Ghana\",\"fr\":\"Ghana\",\"ja\":\"?????????\",\"it\":\"Ghana\",\"cn\":\"??????\"}', '8.00000000', '-2.00000000', '????????', 'U+1F1EC U+1F1ED', '2018-07-21 01:41:03', '2021-12-11 18:49:14', 1, 'Q117'),
(84, 'Gibraltar', 'GIB', '292', 'GI', '350', 'Gibraltar', 'GIP', 'Gibraltar pound', '??', '.gi', 'Gibraltar', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Gibraltar\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Gibraltar\",\"pt\":\"Gibraltar\",\"nl\":\"Gibraltar\",\"hr\":\"Gibraltar\",\"fa\":\"?????????????????\",\"de\":\"Gibraltar\",\"es\":\"Gibraltar\",\"fr\":\"Gibraltar\",\"ja\":\"??????????????????\",\"it\":\"Gibilterra\",\"cn\":\"????????????\"}', '36.13333333', '-5.35000000', '????????', 'U+1F1EC U+1F1EE', '2018-07-21 01:41:03', '2021-12-11 18:49:19', 1, NULL),
(85, 'Greece', 'GRC', '300', 'GR', '30', 'Athens', 'EUR', 'Euro', '???', '.gr', '????????????', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Athens\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Gr??cia\",\"pt\":\"Gr??cia\",\"nl\":\"Griekenland\",\"hr\":\"Gr??ka\",\"fa\":\"??????????\",\"de\":\"Griechenland\",\"es\":\"Grecia\",\"fr\":\"Gr??ce\",\"ja\":\"????????????\",\"it\":\"Grecia\",\"cn\":\"??????\"}', '39.00000000', '22.00000000', '????????', 'U+1F1EC U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 18:49:24', 1, 'Q41'),
(86, 'Greenland', 'GRL', '304', 'GL', '299', 'Nuuk', 'DKK', 'Danish krone', 'Kr.', '.gl', 'Kalaallit Nunaat', 'Americas', 'Northern America', '[{\"zoneName\":\"America/Danmarkshavn\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"},{\"zoneName\":\"America/Nuuk\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"WGT\",\"tzName\":\"West Greenland Time\"},{\"zoneName\":\"America/Scoresbysund\",\"gmtOffset\":-3600,\"gmtOffsetName\":\"UTC-01:00\",\"abbreviation\":\"EGT\",\"tzName\":\"Eastern Greenland Time\"},{\"zoneName\":\"America/Thule\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Groel??ndia\",\"pt\":\"Gronel??ndia\",\"nl\":\"Groenland\",\"hr\":\"Grenland\",\"fa\":\"??????????????\",\"de\":\"Gr??nland\",\"es\":\"Groenlandia\",\"fr\":\"Groenland\",\"ja\":\"?????????????????????\",\"it\":\"Groenlandia\",\"cn\":\"????????????\"}', '72.00000000', '-40.00000000', '????????', 'U+1F1EC U+1F1F1', '2018-07-21 01:41:03', '2021-12-11 18:49:31', 1, NULL),
(87, 'Grenada', 'GRD', '308', 'GD', '+1-473', 'St. George\'s', 'XCD', 'Eastern Caribbean dollar', '$', '.gd', 'Grenada', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Grenada\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Granada\",\"pt\":\"Granada\",\"nl\":\"Grenada\",\"hr\":\"Grenada\",\"fa\":\"????????????\",\"de\":\"Grenada\",\"es\":\"Grenada\",\"fr\":\"Grenade\",\"ja\":\"????????????\",\"it\":\"Grenada\",\"cn\":\"????????????\"}', '12.11666666', '-61.66666666', '????????', 'U+1F1EC U+1F1E9', '2018-07-21 01:41:03', '2021-12-11 18:49:40', 1, 'Q769'),
(88, 'Guadeloupe', 'GLP', '312', 'GP', '590', 'Basse-Terre', 'EUR', 'Euro', '???', '.gp', 'Guadeloupe', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Guadeloupe\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Guadalupe\",\"pt\":\"Guadalupe\",\"nl\":\"Guadeloupe\",\"hr\":\"Gvadalupa\",\"fa\":\"?????????? ??????????????\",\"de\":\"Guadeloupe\",\"es\":\"Guadalupe\",\"fr\":\"Guadeloupe\",\"ja\":\"??????????????????\",\"it\":\"Guadeloupa\",\"cn\":\"???????????????\"}', '16.25000000', '-61.58333300', '????????', 'U+1F1EC U+1F1F5', '2018-07-21 01:41:03', '2021-12-11 18:51:29', 1, NULL),
(89, 'Guam', 'GUM', '316', 'GU', '+1-671', 'Hagatna', 'USD', 'US Dollar', '$', '.gu', 'Guam', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Guam\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"CHST\",\"tzName\":\"Chamorro Standard Time\"}]', '{\"kr\":\"???\",\"br\":\"Guam\",\"pt\":\"Guame\",\"nl\":\"Guam\",\"hr\":\"Guam\",\"fa\":\"????????\",\"de\":\"Guam\",\"es\":\"Guam\",\"fr\":\"Guam\",\"ja\":\"?????????\",\"it\":\"Guam\",\"cn\":\"??????\"}', '13.46666666', '144.78333333', '????????', 'U+1F1EC U+1F1FA', '2018-07-21 01:41:03', '2021-12-11 18:50:50', 1, NULL),
(90, 'Guatemala', 'GTM', '320', 'GT', '502', 'Guatemala City', 'GTQ', 'Guatemalan quetzal', 'Q', '.gt', 'Guatemala', 'Americas', 'Central America', '[{\"zoneName\":\"America/Guatemala\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"????????????\",\"br\":\"Guatemala\",\"pt\":\"Guatemala\",\"nl\":\"Guatemala\",\"hr\":\"Gvatemala\",\"fa\":\"????????????????\",\"de\":\"Guatemala\",\"es\":\"Guatemala\",\"fr\":\"Guatemala\",\"ja\":\"???????????????\",\"it\":\"Guatemala\",\"cn\":\"????????????\"}', '15.50000000', '-90.25000000', '????????', 'U+1F1EC U+1F1F9', '2018-07-21 01:41:03', '2021-12-11 18:51:50', 1, 'Q774'),
(91, 'Guernsey and Alderney', 'GGY', '831', 'GG', '+44-1481', 'St Peter Port', 'GBP', 'British pound', '??', '.gg', 'Guernsey', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Guernsey\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????, ?????????\",\"br\":\"Guernsey\",\"pt\":\"Guernsey\",\"nl\":\"Guernsey\",\"hr\":\"Guernsey\",\"fa\":\"??????????\",\"de\":\"Guernsey\",\"es\":\"Guernsey\",\"fr\":\"Guernesey\",\"ja\":\"???????????????\",\"it\":\"Guernsey\",\"cn\":\"?????????\"}', '49.46666666', '-2.58333333', '????????', 'U+1F1EC U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 18:53:37', 1, NULL),
(92, 'Guinea', 'GIN', '324', 'GN', '224', 'Conakry', 'GNF', 'Guinean franc', 'FG', '.gn', 'Guin??e', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Conakry\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????\",\"br\":\"Guin??\",\"pt\":\"Guin??\",\"nl\":\"Guinee\",\"hr\":\"Gvineja\",\"fa\":\"????????\",\"de\":\"Guinea\",\"es\":\"Guinea\",\"fr\":\"Guin??e\",\"ja\":\"?????????\",\"it\":\"Guinea\",\"cn\":\"?????????\"}', '11.00000000', '-10.00000000', '????????', 'U+1F1EC U+1F1F3', '2018-07-21 01:41:03', '2021-12-11 18:53:45', 1, 'Q1006'),
(93, 'Guinea-Bissau', 'GNB', '624', 'GW', '245', 'Bissau', 'XOF', 'West African CFA franc', 'CFA', '.gw', 'Guin??-Bissau', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Bissau\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Guin??-Bissau\",\"pt\":\"Guin??-Bissau\",\"nl\":\"Guinee-Bissau\",\"hr\":\"Gvineja Bisau\",\"fa\":\"???????? ????????????\",\"de\":\"Guinea-Bissau\",\"es\":\"Guinea-Bis??u\",\"fr\":\"Guin??e-Bissau\",\"ja\":\"??????????????????\",\"it\":\"Guinea-Bissau\",\"cn\":\"???????????????\"}', '12.00000000', '-15.00000000', '????????', 'U+1F1EC U+1F1FC', '2018-07-21 01:41:03', '2021-12-11 18:53:54', 1, 'Q1007'),
(94, 'Guyana', 'GUY', '328', 'GY', '592', 'Georgetown', 'GYD', 'Guyanese dollar', '$', '.gy', 'Guyana', 'Americas', 'South America', '[{\"zoneName\":\"America/Guyana\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"GYT\",\"tzName\":\"Guyana Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Guiana\",\"pt\":\"Guiana\",\"nl\":\"Guyana\",\"hr\":\"Gvajana\",\"fa\":\"??????????\",\"de\":\"Guyana\",\"es\":\"Guyana\",\"fr\":\"Guyane\",\"ja\":\"????????????\",\"it\":\"Guyana\",\"cn\":\"?????????\"}', '5.00000000', '-59.00000000', '????????', 'U+1F1EC U+1F1FE', '2018-07-21 01:41:03', '2021-12-11 18:54:01', 1, 'Q734'),
(95, 'Haiti', 'HTI', '332', 'HT', '509', 'Port-au-Prince', 'HTG', 'Haitian gourde', 'G', '.ht', 'Ha??ti', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Port-au-Prince\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"?????????\",\"br\":\"Haiti\",\"pt\":\"Haiti\",\"nl\":\"Ha??ti\",\"hr\":\"Haiti\",\"fa\":\"????????????\",\"de\":\"Haiti\",\"es\":\"Haiti\",\"fr\":\"Ha??ti\",\"ja\":\"?????????\",\"it\":\"Haiti\",\"cn\":\"??????\"}', '19.00000000', '-72.41666666', '????????', 'U+1F1ED U+1F1F9', '2018-07-21 01:41:03', '2021-12-11 18:54:06', 1, 'Q790'),
(96, 'Heard Island and McDonald Islands', 'HMD', '334', 'HM', '672', '', 'AUD', 'Australian dollar', '$', '.hm', 'Heard Island and McDonald Islands', '', '', '[{\"zoneName\":\"Indian/Kerguelen\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TFT\",\"tzName\":\"French Southern and Antarctic Time\"}]', '{\"kr\":\"?????? ???????????? ??????\",\"br\":\"Ilha Heard e Ilhas McDonald\",\"pt\":\"Ilha Heard e Ilhas McDonald\",\"nl\":\"Heard- en McDonaldeilanden\",\"hr\":\"Otok Heard i oto??je McDonald\",\"fa\":\"?????????? ?????? ?? ?????????? ???????????????????\",\"de\":\"Heard und die McDonaldinseln\",\"es\":\"Islas Heard y McDonald\",\"fr\":\"??les Heard-et-MacDonald\",\"ja\":\"???????????????????????????????????????\",\"it\":\"Isole Heard e McDonald\",\"cn\":\"????????????????????????????????\"}', '-53.10000000', '72.51666666', '????????', 'U+1F1ED U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 19:18:51', 1, NULL),
(97, 'Honduras', 'HND', '340', 'HN', '504', 'Tegucigalpa', 'HNL', 'Honduran lempira', 'L', '.hn', 'Honduras', 'Americas', 'Central America', '[{\"zoneName\":\"America/Tegucigalpa\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"????????????\",\"br\":\"Honduras\",\"pt\":\"Honduras\",\"nl\":\"Honduras\",\"hr\":\"Honduras\",\"fa\":\"??????????????\",\"de\":\"Honduras\",\"es\":\"Honduras\",\"fr\":\"Honduras\",\"ja\":\"??????????????????\",\"it\":\"Honduras\",\"cn\":\"????????????\"}', '15.00000000', '-86.50000000', '????????', 'U+1F1ED U+1F1F3', '2018-07-21 01:41:03', '2021-12-11 18:54:16', 1, 'Q783'),
(98, 'Hong Kong S.A.R.', 'HKG', '344', 'HK', '852', 'Hong Kong', 'HKD', 'Hong Kong dollar', '$', '.hk', '??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Hong_Kong\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"HKT\",\"tzName\":\"Hong Kong Time\"}]', '{\"kr\":\"??????\",\"br\":\"Hong Kong\",\"pt\":\"Hong Kong\",\"nl\":\"Hongkong\",\"hr\":\"Hong Kong\",\"fa\":\"???????????????\",\"de\":\"Hong Kong\",\"es\":\"Hong Kong\",\"fr\":\"Hong Kong\",\"ja\":\"??????\",\"it\":\"Hong Kong\",\"cn\":\"????????????\"}', '22.25000000', '114.16666666', '????????', 'U+1F1ED U+1F1F0', '2018-07-21 01:41:03', '2021-12-11 18:54:22', 1, 'Q8646'),
(99, 'Hungary', 'HUN', '348', 'HU', '36', 'Budapest', 'HUF', 'Hungarian forint', 'Ft', '.hu', 'Magyarorsz??g', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Budapest\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Hungria\",\"pt\":\"Hungria\",\"nl\":\"Hongarije\",\"hr\":\"Ma??arska\",\"fa\":\"????????????????\",\"de\":\"Ungarn\",\"es\":\"Hungr??a\",\"fr\":\"Hongrie\",\"ja\":\"???????????????\",\"it\":\"Ungheria\",\"cn\":\"?????????\"}', '47.00000000', '20.00000000', '????????', 'U+1F1ED U+1F1FA', '2018-07-21 01:41:03', '2021-12-11 18:54:30', 1, 'Q28'),
(100, 'Iceland', 'ISL', '352', 'IS', '354', 'Reykjavik', 'ISK', 'Icelandic kr??na', 'kr', '.is', '??sland', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Atlantic/Reykjavik\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Isl??ndia\",\"pt\":\"Isl??ndia\",\"nl\":\"IJsland\",\"hr\":\"Island\",\"fa\":\"????????????\",\"de\":\"Island\",\"es\":\"Islandia\",\"fr\":\"Islande\",\"ja\":\"??????????????????\",\"it\":\"Islanda\",\"cn\":\"??????\"}', '65.00000000', '-18.00000000', '????????', 'U+1F1EE U+1F1F8', '2018-07-21 01:41:03', '2021-12-11 18:54:35', 1, 'Q189'),
(101, 'India', 'IND', '356', 'IN', '91', 'New Delhi', 'INR', 'Indian rupee', '???', '.in', '????????????', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Kolkata\",\"gmtOffset\":19800,\"gmtOffsetName\":\"UTC+05:30\",\"abbreviation\":\"IST\",\"tzName\":\"Indian Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"??ndia\",\"pt\":\"??ndia\",\"nl\":\"India\",\"hr\":\"Indija\",\"fa\":\"??????\",\"de\":\"Indien\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"?????????\",\"it\":\"India\",\"cn\":\"??????\"}', '20.00000000', '77.00000000', '????????', 'U+1F1EE U+1F1F3', '2018-07-21 01:41:03', '2021-12-11 18:54:41', 1, 'Q668'),
(102, 'Indonesia', 'IDN', '360', 'ID', '62', 'Jakarta', 'IDR', 'Indonesian rupiah', 'Rp', '.id', 'Indonesia', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Jakarta\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"WIB\",\"tzName\":\"Western Indonesian Time\"},{\"zoneName\":\"Asia/Jayapura\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"WIT\",\"tzName\":\"Eastern Indonesian Time\"},{\"zoneName\":\"Asia/Makassar\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"WITA\",\"tzName\":\"Central Indonesia Time\"},{\"zoneName\":\"Asia/Pontianak\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"WIB\",\"tzName\":\"Western Indonesian Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Indon??sia\",\"pt\":\"Indon??sia\",\"nl\":\"Indonesi??\",\"hr\":\"Indonezija\",\"fa\":\"??????????????\",\"de\":\"Indonesien\",\"es\":\"Indonesia\",\"fr\":\"Indon??sie\",\"ja\":\"??????????????????\",\"it\":\"Indonesia\",\"cn\":\"???????????????\"}', '-5.00000000', '120.00000000', '????????', 'U+1F1EE U+1F1E9', '2018-07-21 01:41:03', '2021-12-11 18:54:49', 1, 'Q252'),
(103, 'Iran', 'IRN', '364', 'IR', '98', 'Tehran', 'IRR', 'Iranian rial', '???', '.ir', '??????????', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Tehran\",\"gmtOffset\":12600,\"gmtOffsetName\":\"UTC+03:30\",\"abbreviation\":\"IRDT\",\"tzName\":\"Iran Daylight Time\"}]', '{\"kr\":\"??????\",\"br\":\"Ir??\",\"pt\":\"Ir??o\",\"nl\":\"Iran\",\"hr\":\"Iran\",\"fa\":\"??????????\",\"de\":\"Iran\",\"es\":\"Iran\",\"fr\":\"Iran\",\"ja\":\"?????????????????????????????????\",\"cn\":\"??????\"}', '32.00000000', '53.00000000', '????????', 'U+1F1EE U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 18:54:54', 1, 'Q794'),
(104, 'Iraq', 'IRQ', '368', 'IQ', '964', 'Baghdad', 'IQD', 'Iraqi dinar', '??.??', '.iq', '????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Baghdad\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Iraque\",\"pt\":\"Iraque\",\"nl\":\"Irak\",\"hr\":\"Irak\",\"fa\":\"????????\",\"de\":\"Irak\",\"es\":\"Irak\",\"fr\":\"Irak\",\"ja\":\"?????????\",\"it\":\"Iraq\",\"cn\":\"?????????\"}', '33.00000000', '44.00000000', '????????', 'U+1F1EE U+1F1F6', '2018-07-21 01:41:03', '2021-12-11 18:55:01', 1, 'Q796'),
(105, 'Ireland', 'IRL', '372', 'IE', '353', 'Dublin', 'EUR', 'Euro', '???', '.ie', '??ire', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Dublin\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Irlanda\",\"pt\":\"Irlanda\",\"nl\":\"Ierland\",\"hr\":\"Irska\",\"fa\":\"????????????\",\"de\":\"Irland\",\"es\":\"Irlanda\",\"fr\":\"Irlande\",\"ja\":\"??????????????????\",\"it\":\"Irlanda\",\"cn\":\"?????????\"}', '53.00000000', '-8.00000000', '????????', 'U+1F1EE U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 18:55:07', 1, 'Q27'),
(106, 'Israel', 'ISR', '376', 'IL', '972', 'Jerusalem', 'ILS', 'Israeli new shekel', '???', '.il', '????????????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Jerusalem\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"IST\",\"tzName\":\"Israel Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Israel\",\"pt\":\"Israel\",\"nl\":\"Isra??l\",\"hr\":\"Izrael\",\"fa\":\"??????????????\",\"de\":\"Israel\",\"es\":\"Israel\",\"fr\":\"Isra??l\",\"ja\":\"???????????????\",\"it\":\"Israele\",\"cn\":\"?????????\"}', '31.50000000', '34.75000000', '????????', 'U+1F1EE U+1F1F1', '2018-07-21 01:41:03', '2021-12-11 18:55:27', 1, 'Q801'),
(107, 'Italy', 'ITA', '380', 'IT', '39', 'Rome', 'EUR', 'Euro', '???', '.it', 'Italia', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Rome\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"It??lia\",\"pt\":\"It??lia\",\"nl\":\"Itali??\",\"hr\":\"Italija\",\"fa\":\"??????????????\",\"de\":\"Italien\",\"es\":\"Italia\",\"fr\":\"Italie\",\"ja\":\"????????????\",\"it\":\"Italia\",\"cn\":\"?????????\"}', '42.83333333', '12.83333333', '????????', 'U+1F1EE U+1F1F9', '2018-07-21 01:41:03', '2021-12-11 18:55:33', 1, 'Q38'),
(108, 'Jamaica', 'JAM', '388', 'JM', '+1-876', 'Kingston', 'JMD', 'Jamaican dollar', 'J$', '.jm', 'Jamaica', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Jamaica\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"????????????\",\"br\":\"Jamaica\",\"pt\":\"Jamaica\",\"nl\":\"Jamaica\",\"hr\":\"Jamajka\",\"fa\":\"????????????????\",\"de\":\"Jamaika\",\"es\":\"Jamaica\",\"fr\":\"Jama??que\",\"ja\":\"???????????????\",\"it\":\"Giamaica\",\"cn\":\"?????????\"}', '18.25000000', '-77.50000000', '????????', 'U+1F1EF U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 18:55:41', 1, 'Q766'),
(109, 'Japan', 'JPN', '392', 'JP', '81', 'Tokyo', 'JPY', 'Japanese yen', '??', '.jp', '??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Tokyo\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"JST\",\"tzName\":\"Japan Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"Jap??o\",\"pt\":\"Jap??o\",\"nl\":\"Japan\",\"hr\":\"Japan\",\"fa\":\"????????\",\"de\":\"Japan\",\"es\":\"Jap??n\",\"fr\":\"Japon\",\"ja\":\"??????\",\"it\":\"Giappone\",\"cn\":\"??????\"}', '36.00000000', '138.00000000', '????????', 'U+1F1EF U+1F1F5', '2018-07-21 01:41:03', '2021-12-11 18:55:46', 1, 'Q17'),
(110, 'Jersey', 'JEY', '832', 'JE', '+44-1534', 'Saint Helier', 'GBP', 'British pound', '??', '.je', 'Jersey', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Jersey\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"?????? ???\",\"br\":\"Jersey\",\"pt\":\"Jersey\",\"nl\":\"Jersey\",\"hr\":\"Jersey\",\"fa\":\"????????\",\"de\":\"Jersey\",\"es\":\"Jersey\",\"fr\":\"Jersey\",\"ja\":\"???????????????\",\"it\":\"Isola di Jersey\",\"cn\":\"?????????\"}', '49.25000000', '-2.16666666', '????????', 'U+1F1EF U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 18:55:59', 1, 'Q785'),
(111, 'Jordan', 'JOR', '400', 'JO', '962', 'Amman', 'JOD', 'Jordanian dinar', '??.??', '.jo', '????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Amman\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Jord??nia\",\"pt\":\"Jord??nia\",\"nl\":\"Jordani??\",\"hr\":\"Jordan\",\"fa\":\"????????\",\"de\":\"Jordanien\",\"es\":\"Jordania\",\"fr\":\"Jordanie\",\"ja\":\"????????????\",\"it\":\"Giordania\",\"cn\":\"??????\"}', '31.00000000', '36.00000000', '????????', 'U+1F1EF U+1F1F4', '2018-07-21 01:41:03', '2021-12-11 18:56:07', 1, 'Q810'),
(112, 'Kazakhstan', 'KAZ', '398', 'KZ', '7', 'Astana', 'KZT', 'Kazakhstani tenge', '????', '.kz', '??????????????????', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Almaty\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"ALMT\",\"tzName\":\"Alma-Ata Time[1\"},{\"zoneName\":\"Asia/Aqtau\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"AQTT\",\"tzName\":\"Aqtobe Time\"},{\"zoneName\":\"Asia/Aqtobe\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"AQTT\",\"tzName\":\"Aqtobe Time\"},{\"zoneName\":\"Asia/Atyrau\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"MSD+1\",\"tzName\":\"Moscow Daylight Time+1\"},{\"zoneName\":\"Asia/Oral\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"ORAT\",\"tzName\":\"Oral Time\"},{\"zoneName\":\"Asia/Qostanay\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"QYZST\",\"tzName\":\"Qyzylorda Summer Time\"},{\"zoneName\":\"Asia/Qyzylorda\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"QYZT\",\"tzName\":\"Qyzylorda Summer Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Cazaquist??o\",\"pt\":\"Cazaquist??o\",\"nl\":\"Kazachstan\",\"hr\":\"Kazahstan\",\"fa\":\"????????????????\",\"de\":\"Kasachstan\",\"es\":\"Kazajist??n\",\"fr\":\"Kazakhstan\",\"ja\":\"??????????????????\",\"it\":\"Kazakistan\",\"cn\":\"???????????????\"}', '48.00000000', '68.00000000', '????????', 'U+1F1F0 U+1F1FF', '2018-07-21 01:41:03', '2021-12-11 18:56:18', 1, 'Q232'),
(113, 'Kenya', 'KEN', '404', 'KE', '254', 'Nairobi', 'KES', 'Kenyan shilling', 'KSh', '.ke', 'Kenya', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Nairobi\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"??????\",\"br\":\"Qu??nia\",\"pt\":\"Qu??nia\",\"nl\":\"Kenia\",\"hr\":\"Kenija\",\"fa\":\"????????\",\"de\":\"Kenia\",\"es\":\"Kenia\",\"fr\":\"Kenya\",\"ja\":\"?????????\",\"it\":\"Kenya\",\"cn\":\"?????????\"}', '1.00000000', '38.00000000', '????????', 'U+1F1F0 U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 18:56:23', 1, 'Q114'),
(114, 'Kiribati', 'KIR', '296', 'KI', '686', 'Tarawa', 'AUD', 'Australian dollar', '$', '.ki', 'Kiribati', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Enderbury\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"PHOT\",\"tzName\":\"Phoenix Island Time\"},{\"zoneName\":\"Pacific/Kiritimati\",\"gmtOffset\":50400,\"gmtOffsetName\":\"UTC+14:00\",\"abbreviation\":\"LINT\",\"tzName\":\"Line Islands Time\"},{\"zoneName\":\"Pacific/Tarawa\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"GILT\",\"tzName\":\"Gilbert Island Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Kiribati\",\"pt\":\"Quirib??ti\",\"nl\":\"Kiribati\",\"hr\":\"Kiribati\",\"fa\":\"????????????????\",\"de\":\"Kiribati\",\"es\":\"Kiribati\",\"fr\":\"Kiribati\",\"ja\":\"????????????\",\"it\":\"Kiribati\",\"cn\":\"????????????\"}', '1.41666666', '173.00000000', '????????', 'U+1F1F0 U+1F1EE', '2018-07-21 01:41:03', '2021-12-11 18:56:30', 1, 'Q710'),
(115, 'North Korea', 'PRK', '408', 'KP', '850', 'Pyongyang', 'KPW', 'North Korean Won', '???', '.kp', '??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Pyongyang\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"KST\",\"tzName\":\"Korea Standard Time\"}]', '{\"kr\":\"?????????????????????????????????\",\"br\":\"Coreia do Norte\",\"pt\":\"Coreia do Norte\",\"nl\":\"Noord-Korea\",\"hr\":\"Sjeverna Koreja\",\"fa\":\"?????? ??????????\",\"de\":\"Nordkorea\",\"es\":\"Corea del Norte\",\"fr\":\"Cor??e du Nord\",\"ja\":\"?????????????????????????????????\",\"it\":\"Corea del Nord\",\"cn\":\"??????\"}', '40.00000000', '127.00000000', '????????', 'U+1F1F0 U+1F1F5', '2018-07-21 01:41:03', '2021-12-11 19:05:28', 1, 'Q423'),
(116, 'South Korea', 'KOR', '410', 'KR', '82', 'Seoul', 'KRW', 'Won', '???', '.kr', '????????????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Seoul\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"KST\",\"tzName\":\"Korea Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Coreia do Sul\",\"pt\":\"Coreia do Sul\",\"nl\":\"Zuid-Korea\",\"hr\":\"Ju??na Koreja\",\"fa\":\"?????? ??????????\",\"de\":\"S??dkorea\",\"es\":\"Corea del Sur\",\"fr\":\"Cor??e du Sud\",\"ja\":\"????????????\",\"it\":\"Corea del Sud\",\"cn\":\"??????\"}', '37.00000000', '127.50000000', '????????', 'U+1F1F0 U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 19:12:11', 1, 'Q884'),
(117, 'Kuwait', 'KWT', '414', 'KW', '965', 'Kuwait City', 'KWD', 'Kuwaiti dinar', '??.??', '.kw', '????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Kuwait\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Kuwait\",\"pt\":\"Kuwait\",\"nl\":\"Koeweit\",\"hr\":\"Kuvajt\",\"fa\":\"????????\",\"de\":\"Kuwait\",\"es\":\"Kuwait\",\"fr\":\"Kowe??t\",\"ja\":\"???????????????\",\"it\":\"Kuwait\",\"cn\":\"?????????\"}', '29.50000000', '45.75000000', '????????', 'U+1F1F0 U+1F1FC', '2018-07-21 01:41:03', '2021-12-11 18:56:44', 1, 'Q817'),
(118, 'Kyrgyzstan', 'KGZ', '417', 'KG', '996', 'Bishkek', 'KGS', 'Kyrgyzstani som', '????', '.kg', '????????????????????', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Bishkek\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"KGT\",\"tzName\":\"Kyrgyzstan Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Quirguist??o\",\"pt\":\"Quirguizist??o\",\"nl\":\"Kirgizi??\",\"hr\":\"Kirgistan\",\"fa\":\"??????????????????\",\"de\":\"Kirgisistan\",\"es\":\"Kirguizist??n\",\"fr\":\"Kirghizistan\",\"ja\":\"????????????\",\"it\":\"Kirghizistan\",\"cn\":\"??????????????????\"}', '41.00000000', '75.00000000', '????????', 'U+1F1F0 U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 18:56:49', 1, 'Q813'),
(119, 'Laos', 'LAO', '418', 'LA', '856', 'Vientiane', 'LAK', 'Lao kip', '???', '.la', '??????????????????', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Vientiane\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Laos\",\"pt\":\"Laos\",\"nl\":\"Laos\",\"hr\":\"Laos\",\"fa\":\"??????????\",\"de\":\"Laos\",\"es\":\"Laos\",\"fr\":\"Laos\",\"ja\":\"??????????????????????????????\",\"it\":\"Laos\",\"cn\":\"????????????????????????\"}', '18.00000000', '105.00000000', '????????', 'U+1F1F1 U+1F1E6', '2018-07-21 01:41:03', '2021-12-11 18:56:58', 1, 'Q819'),
(120, 'Latvia', 'LVA', '428', 'LV', '371', 'Riga', 'EUR', 'Euro', '???', '.lv', 'Latvija', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Riga\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Let??nia\",\"pt\":\"Let??nia\",\"nl\":\"Letland\",\"hr\":\"Latvija\",\"fa\":\"??????????\",\"de\":\"Lettland\",\"es\":\"Letonia\",\"fr\":\"Lettonie\",\"ja\":\"????????????\",\"it\":\"Lettonia\",\"cn\":\"????????????\"}', '57.00000000', '25.00000000', '????????', 'U+1F1F1 U+1F1FB', '2018-07-21 01:41:03', '2021-12-11 18:57:04', 1, 'Q211'),
(121, 'Lebanon', 'LBN', '422', 'LB', '961', 'Beirut', 'LBP', 'Lebanese pound', '??', '.lb', '??????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Beirut\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"L??bano\",\"pt\":\"L??bano\",\"nl\":\"Libanon\",\"hr\":\"Libanon\",\"fa\":\"??????????\",\"de\":\"Libanon\",\"es\":\"L??bano\",\"fr\":\"Liban\",\"ja\":\"????????????\",\"it\":\"Libano\",\"cn\":\"?????????\"}', '33.83333333', '35.83333333', '????????', 'U+1F1F1 U+1F1E7', '2018-07-21 01:41:03', '2021-12-11 18:57:10', 1, 'Q822'),
(122, 'Lesotho', 'LSO', '426', 'LS', '266', 'Maseru', 'LSL', 'Lesotho loti', 'L', '.ls', 'Lesotho', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Maseru\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"SAST\",\"tzName\":\"South African Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Lesoto\",\"pt\":\"Lesoto\",\"nl\":\"Lesotho\",\"hr\":\"Lesoto\",\"fa\":\"??????????\",\"de\":\"Lesotho\",\"es\":\"Lesotho\",\"fr\":\"Lesotho\",\"ja\":\"?????????\",\"it\":\"Lesotho\",\"cn\":\"?????????\"}', '-29.50000000', '28.50000000', '????????', 'U+1F1F1 U+1F1F8', '2018-07-21 01:41:03', '2021-12-11 18:57:27', 1, 'Q1013'),
(123, 'Liberia', 'LBR', '430', 'LR', '231', 'Monrovia', 'LRD', 'Liberian dollar', '$', '.lr', 'Liberia', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Monrovia\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Lib??ria\",\"pt\":\"Lib??ria\",\"nl\":\"Liberia\",\"hr\":\"Liberija\",\"fa\":\"????????????\",\"de\":\"Liberia\",\"es\":\"Liberia\",\"fr\":\"Liberia\",\"ja\":\"????????????\",\"it\":\"Liberia\",\"cn\":\"????????????\"}', '6.50000000', '-9.50000000', '????????', 'U+1F1F1 U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 18:57:33', 1, 'Q1014'),
(124, 'Libya', 'LBY', '434', 'LY', '218', 'Tripolis', 'LYD', 'Libyan dinar', '??.??', '.ly', '?????????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Tripoli\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"L??bia\",\"pt\":\"L??bia\",\"nl\":\"Libi??\",\"hr\":\"Libija\",\"fa\":\"????????\",\"de\":\"Libyen\",\"es\":\"Libia\",\"fr\":\"Libye\",\"ja\":\"?????????\",\"it\":\"Libia\",\"cn\":\"?????????\"}', '25.00000000', '17.00000000', '????????', 'U+1F1F1 U+1F1FE', '2018-07-21 01:41:03', '2021-12-11 18:57:38', 1, 'Q1016'),
(125, 'Liechtenstein', 'LIE', '438', 'LI', '423', 'Vaduz', 'CHF', 'Swiss franc', 'CHf', '.li', 'Liechtenstein', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Vaduz\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Liechtenstein\",\"pt\":\"Listenstaine\",\"nl\":\"Liechtenstein\",\"hr\":\"Lihten??tajn\",\"fa\":\"?????????????????????????\",\"de\":\"Liechtenstein\",\"es\":\"Liechtenstein\",\"fr\":\"Liechtenstein\",\"ja\":\"???????????????????????????\",\"it\":\"Liechtenstein\",\"cn\":\"???????????????\"}', '47.26666666', '9.53333333', '????????', 'U+1F1F1 U+1F1EE', '2018-07-21 01:41:03', '2021-12-11 18:57:47', 1, 'Q347'),
(126, 'Lithuania', 'LTU', '440', 'LT', '370', 'Vilnius', 'EUR', 'Euro', '???', '.lt', 'Lietuva', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Vilnius\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Litu??nia\",\"pt\":\"Litu??nia\",\"nl\":\"Litouwen\",\"hr\":\"Litva\",\"fa\":\"??????????????\",\"de\":\"Litauen\",\"es\":\"Lituania\",\"fr\":\"Lituanie\",\"ja\":\"???????????????\",\"it\":\"Lituania\",\"cn\":\"?????????\"}', '56.00000000', '24.00000000', '????????', 'U+1F1F1 U+1F1F9', '2018-07-21 01:41:03', '2021-12-11 18:58:00', 1, 'Q37'),
(127, 'Luxembourg', 'LUX', '442', 'LU', '352', 'Luxembourg', 'EUR', 'Euro', '???', '.lu', 'Luxembourg', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Luxembourg\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Luxemburgo\",\"pt\":\"Luxemburgo\",\"nl\":\"Luxemburg\",\"hr\":\"Luksemburg\",\"fa\":\"????????????????????\",\"de\":\"Luxemburg\",\"es\":\"Luxemburgo\",\"fr\":\"Luxembourg\",\"ja\":\"?????????????????????\",\"it\":\"Lussemburgo\",\"cn\":\"?????????\"}', '49.75000000', '6.16666666', '????????', 'U+1F1F1 U+1F1FA', '2018-07-21 01:41:03', '2021-12-11 18:58:06', 1, 'Q32'),
(128, 'Macau S.A.R.', 'MAC', '446', 'MO', '853', 'Macao', 'MOP', 'Macanese pataca', '$', '.mo', '??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Macau\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CST\",\"tzName\":\"China Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Macau\",\"pt\":\"Macau\",\"nl\":\"Macao\",\"hr\":\"Makao\",\"fa\":\"??????????\",\"de\":\"Macao\",\"es\":\"Macao\",\"fr\":\"Macao\",\"ja\":\"?????????\",\"it\":\"Macao\",\"cn\":\"????????????\"}', '22.16666666', '113.55000000', '????????', 'U+1F1F2 U+1F1F4', '2018-07-21 01:41:03', '2021-12-11 18:58:15', 1, NULL),
(129, 'Macedonia', 'MKD', '807', 'MK', '389', 'Skopje', 'MKD', 'Denar', '??????', '.mk', '?????????????? ????????????????????', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Skopje\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Maced??nia\",\"pt\":\"Maced??nia\",\"nl\":\"Macedoni??\",\"hr\":\"Makedonija\",\"fa\":\"\",\"de\":\"Mazedonien\",\"es\":\"Macedonia\",\"fr\":\"Mac??doine\",\"ja\":\"????????????????????????????????????????????????\",\"it\":\"Macedonia\",\"cn\":\"?????????\"}', '41.83333333', '22.00000000', '????????', 'U+1F1F2 U+1F1F0', '2018-07-21 01:41:03', '2021-12-11 18:58:42', 1, 'Q221'),
(130, 'Madagascar', 'MDG', '450', 'MG', '261', 'Antananarivo', 'MGA', 'Malagasy ariary', 'Ar', '.mg', 'Madagasikara', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Antananarivo\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Madagascar\",\"pt\":\"Madag??scar\",\"nl\":\"Madagaskar\",\"hr\":\"Madagaskar\",\"fa\":\"????????????????????\",\"de\":\"Madagaskar\",\"es\":\"Madagascar\",\"fr\":\"Madagascar\",\"ja\":\"??????????????????\",\"it\":\"Madagascar\",\"cn\":\"???????????????\"}', '-20.00000000', '47.00000000', '????????', 'U+1F1F2 U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 18:58:52', 1, 'Q1019');
INSERT INTO `countries` (`id`, `name`, `iso3`, `numeric_code`, `iso2`, `phonecode`, `capital`, `currency`, `currency_name`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `created_at`, `updated_at`, `flag`, `wikiDataId`) VALUES
(131, 'Malawi', 'MWI', '454', 'MW', '265', 'Lilongwe', 'MWK', 'Malawian kwacha', 'MK', '.mw', 'Malawi', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Blantyre\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Malawi\",\"pt\":\"Mal??vi\",\"nl\":\"Malawi\",\"hr\":\"Malavi\",\"fa\":\"????????????\",\"de\":\"Malawi\",\"es\":\"Malawi\",\"fr\":\"Malawi\",\"ja\":\"????????????\",\"it\":\"Malawi\",\"cn\":\"?????????\"}', '-13.50000000', '34.00000000', '????????', 'U+1F1F2 U+1F1FC', '2018-07-21 01:41:03', '2021-12-11 18:59:01', 1, 'Q1020'),
(132, 'Malaysia', 'MYS', '458', 'MY', '60', 'Kuala Lumpur', 'MYR', 'Malaysian ringgit', 'RM', '.my', 'Malaysia', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Kuala_Lumpur\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"MYT\",\"tzName\":\"Malaysia Time\"},{\"zoneName\":\"Asia/Kuching\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"MYT\",\"tzName\":\"Malaysia Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Mal??sia\",\"pt\":\"Mal??sia\",\"nl\":\"Maleisi??\",\"hr\":\"Malezija\",\"fa\":\"??????????\",\"de\":\"Malaysia\",\"es\":\"Malasia\",\"fr\":\"Malaisie\",\"ja\":\"???????????????\",\"it\":\"Malesia\",\"cn\":\"????????????\"}', '2.50000000', '112.50000000', '????????', 'U+1F1F2 U+1F1FE', '2018-07-21 01:41:03', '2021-12-11 18:59:08', 1, 'Q833'),
(133, 'Maldives', 'MDV', '462', 'MV', '960', 'Male', 'MVR', 'Maldivian rufiyaa', 'Rf', '.mv', 'Maldives', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Indian/Maldives\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"MVT\",\"tzName\":\"Maldives Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Maldivas\",\"pt\":\"Maldivas\",\"nl\":\"Maldiven\",\"hr\":\"Maldivi\",\"fa\":\"????????????\",\"de\":\"Malediven\",\"es\":\"Maldivas\",\"fr\":\"Maldives\",\"ja\":\"???????????????\",\"it\":\"Maldive\",\"cn\":\"????????????\"}', '3.25000000', '73.00000000', '????????', 'U+1F1F2 U+1F1FB', '2018-07-21 01:41:03', '2021-12-11 18:59:15', 1, 'Q826'),
(134, 'Mali', 'MLI', '466', 'ML', '223', 'Bamako', 'XOF', 'West African CFA franc', 'CFA', '.ml', 'Mali', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Bamako\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????\",\"br\":\"Mali\",\"pt\":\"Mali\",\"nl\":\"Mali\",\"hr\":\"Mali\",\"fa\":\"????????\",\"de\":\"Mali\",\"es\":\"Mali\",\"fr\":\"Mali\",\"ja\":\"??????\",\"it\":\"Mali\",\"cn\":\"??????\"}', '17.00000000', '-4.00000000', '????????', 'U+1F1F2 U+1F1F1', '2018-07-21 01:41:03', '2021-12-11 18:59:20', 1, 'Q912'),
(135, 'Malta', 'MLT', '470', 'MT', '356', 'Valletta', 'EUR', 'Euro', '???', '.mt', 'Malta', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Malta\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"??????\",\"br\":\"Malta\",\"pt\":\"Malta\",\"nl\":\"Malta\",\"hr\":\"Malta\",\"fa\":\"????????\",\"de\":\"Malta\",\"es\":\"Malta\",\"fr\":\"Malte\",\"ja\":\"?????????\",\"it\":\"Malta\",\"cn\":\"?????????\"}', '35.83333333', '14.58333333', '????????', 'U+1F1F2 U+1F1F9', '2018-07-21 01:41:03', '2021-12-11 18:59:26', 1, 'Q233'),
(136, 'Man (Isle of)', 'IMN', '833', 'IM', '+44-1624', 'Douglas, Isle of Man', 'GBP', 'British pound', '??', '.im', 'Isle of Man', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Isle_of_Man\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??? ???\",\"br\":\"Ilha de Man\",\"pt\":\"Ilha de Man\",\"nl\":\"Isle of Man\",\"hr\":\"Otok Man\",\"fa\":\"?????????? ????\",\"de\":\"Insel Man\",\"es\":\"Isla de Man\",\"fr\":\"??le de Man\",\"ja\":\"?????????\",\"it\":\"Isola di Man\",\"cn\":\"?????????\"}', '54.25000000', '-4.50000000', '????????', 'U+1F1EE U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 18:59:43', 1, NULL),
(137, 'Marshall Islands', 'MHL', '584', 'MH', '692', 'Majuro', 'USD', 'United States dollar', '$', '.mh', 'M??aje??', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Kwajalein\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"MHT\",\"tzName\":\"Marshall Islands Time\"},{\"zoneName\":\"Pacific/Majuro\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"MHT\",\"tzName\":\"Marshall Islands Time\"}]', '{\"kr\":\"?????? ??????\",\"br\":\"Ilhas Marshall\",\"pt\":\"Ilhas Marshall\",\"nl\":\"Marshalleilanden\",\"hr\":\"Mar??alovi Otoci\",\"fa\":\"?????????? ????????????\",\"de\":\"Marshallinseln\",\"es\":\"Islas Marshall\",\"fr\":\"??les Marshall\",\"ja\":\"?????????????????????\",\"it\":\"Isole Marshall\",\"cn\":\"???????????????\"}', '9.00000000', '168.00000000', '????????', 'U+1F1F2 U+1F1ED', '2018-07-21 01:41:03', '2021-12-11 19:00:32', 1, 'Q709'),
(138, 'Martinique', 'MTQ', '474', 'MQ', '596', 'Fort-de-France', 'EUR', 'Euro', '???', '.mq', 'Martinique', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Martinique\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Martinica\",\"pt\":\"Martinica\",\"nl\":\"Martinique\",\"hr\":\"Martinique\",\"fa\":\"????????????????\",\"de\":\"Martinique\",\"es\":\"Martinica\",\"fr\":\"Martinique\",\"ja\":\"?????????????????????\",\"it\":\"Martinica\",\"cn\":\"???????????????\"}', '14.66666700', '-61.00000000', '????????', 'U+1F1F2 U+1F1F6', '2018-07-21 01:41:03', '2021-12-11 19:00:44', 1, NULL),
(139, 'Mauritania', 'MRT', '478', 'MR', '222', 'Nouakchott', 'MRO', 'Mauritanian ouguiya', 'MRU', '.mr', '??????????????????', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Nouakchott\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Maurit??nia\",\"pt\":\"Maurit??nia\",\"nl\":\"Mauritani??\",\"hr\":\"Mauritanija\",\"fa\":\"????????????????\",\"de\":\"Mauretanien\",\"es\":\"Mauritania\",\"fr\":\"Mauritanie\",\"ja\":\"??????????????????\",\"it\":\"Mauritania\",\"cn\":\"???????????????\"}', '20.00000000', '-12.00000000', '????????', 'U+1F1F2 U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 19:01:03', 1, 'Q1025'),
(140, 'Mauritius', 'MUS', '480', 'MU', '230', 'Port Louis', 'MUR', 'Mauritian rupee', '???', '.mu', 'Maurice', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Mauritius\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"MUT\",\"tzName\":\"Mauritius Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Maur??cio\",\"pt\":\"Maur??cia\",\"nl\":\"Mauritius\",\"hr\":\"Mauricijus\",\"fa\":\"??????????\",\"de\":\"Mauritius\",\"es\":\"Mauricio\",\"fr\":\"??le Maurice\",\"ja\":\"??????????????????\",\"it\":\"Mauritius\",\"cn\":\"????????????\"}', '-20.28333333', '57.55000000', '????????', 'U+1F1F2 U+1F1FA', '2018-07-21 01:41:03', '2021-12-11 19:01:10', 1, 'Q1027'),
(141, 'Mayotte', 'MYT', '175', 'YT', '262', 'Mamoudzou', 'EUR', 'Euro', '???', '.yt', 'Mayotte', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Mayotte\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Mayotte\",\"pt\":\"Mayotte\",\"nl\":\"Mayotte\",\"hr\":\"Mayotte\",\"fa\":\"??????????\",\"de\":\"Mayotte\",\"es\":\"Mayotte\",\"fr\":\"Mayotte\",\"ja\":\"????????????\",\"it\":\"Mayotte\",\"cn\":\"?????????\"}', '-12.83333333', '45.16666666', '????????', 'U+1F1FE U+1F1F9', '2018-07-21 01:41:03', '2021-12-11 19:01:15', 1, NULL),
(142, 'Mexico', 'MEX', '484', 'MX', '52', 'Ciudad de M??xico', 'MXN', 'Mexican peso', '$', '.mx', 'M??xico', 'Americas', 'Central America', '[{\"zoneName\":\"America/Bahia_Banderas\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Cancun\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Chihuahua\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Hermosillo\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Matamoros\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Mazatlan\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Merida\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Mexico_City\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Monterrey\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Ojinaga\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Tijuana\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"}]', '{\"kr\":\"?????????\",\"br\":\"M??xico\",\"pt\":\"M??xico\",\"nl\":\"Mexico\",\"hr\":\"Meksiko\",\"fa\":\"??????????\",\"de\":\"Mexiko\",\"es\":\"M??xico\",\"fr\":\"Mexique\",\"ja\":\"????????????\",\"it\":\"Messico\",\"cn\":\"?????????\"}', '23.00000000', '-102.00000000', '????????', 'U+1F1F2 U+1F1FD', '2018-07-21 01:41:03', '2021-12-11 19:01:23', 1, 'Q96'),
(143, 'Micronesia', 'FSM', '583', 'FM', '691', 'Palikir', 'USD', 'United States dollar', '$', '.fm', 'Micronesia', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Chuuk\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"CHUT\",\"tzName\":\"Chuuk Time\"},{\"zoneName\":\"Pacific/Kosrae\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"KOST\",\"tzName\":\"Kosrae Time\"},{\"zoneName\":\"Pacific/Pohnpei\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"PONT\",\"tzName\":\"Pohnpei Standard Time\"}]', '{\"kr\":\"?????????????????? ??????\",\"br\":\"Micron??sia\",\"pt\":\"Micron??sia\",\"nl\":\"Micronesi??\",\"hr\":\"Mikronezija\",\"fa\":\"???????????? ?????????? ????????????????\",\"de\":\"Mikronesien\",\"es\":\"Micronesia\",\"fr\":\"Micron??sie\",\"ja\":\"????????????????????????\",\"it\":\"Micronesia\",\"cn\":\"??????????????????\"}', '6.91666666', '158.25000000', '????????', 'U+1F1EB U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 19:01:30', 1, 'Q702'),
(144, 'Moldova', 'MDA', '498', 'MD', '373', 'Chisinau', 'MDL', 'Moldovan leu', 'L', '.md', 'Moldova', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Chisinau\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Mold??via\",\"pt\":\"Mold??via\",\"nl\":\"Moldavi??\",\"hr\":\"Moldova\",\"fa\":\"??????????????\",\"de\":\"Moldawie\",\"es\":\"Moldavia\",\"fr\":\"Moldavie\",\"ja\":\"?????????????????????\",\"it\":\"Moldavia\",\"cn\":\"????????????\"}', '47.00000000', '29.00000000', '????????', 'U+1F1F2 U+1F1E9', '2018-07-21 01:41:03', '2021-12-11 19:01:39', 1, 'Q217'),
(145, 'Monaco', 'MCO', '492', 'MC', '377', 'Monaco', 'EUR', 'Euro', '???', '.mc', 'Monaco', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Monaco\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"M??naco\",\"pt\":\"M??naco\",\"nl\":\"Monaco\",\"hr\":\"Monako\",\"fa\":\"????????????\",\"de\":\"Monaco\",\"es\":\"M??naco\",\"fr\":\"Monaco\",\"ja\":\"?????????\",\"it\":\"Principato di Monaco\",\"cn\":\"?????????\"}', '43.73333333', '7.40000000', '????????', 'U+1F1F2 U+1F1E8', '2018-07-21 01:41:03', '2021-12-11 19:01:44', 1, 'Q235'),
(146, 'Mongolia', 'MNG', '496', 'MN', '976', 'Ulan Bator', 'MNT', 'Mongolian t??gr??g', '???', '.mn', '???????????? ??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Choibalsan\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CHOT\",\"tzName\":\"Choibalsan Standard Time\"},{\"zoneName\":\"Asia/Hovd\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"HOVT\",\"tzName\":\"Hovd Time\"},{\"zoneName\":\"Asia/Ulaanbaatar\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"ULAT\",\"tzName\":\"Ulaanbaatar Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"Mong??lia\",\"pt\":\"Mong??lia\",\"nl\":\"Mongoli??\",\"hr\":\"Mongolija\",\"fa\":\"????????????????\",\"de\":\"Mongolei\",\"es\":\"Mongolia\",\"fr\":\"Mongolie\",\"ja\":\"????????????\",\"it\":\"Mongolia\",\"cn\":\"??????\"}', '46.00000000', '105.00000000', '????????', 'U+1F1F2 U+1F1F3', '2018-07-21 01:41:03', '2021-12-11 19:02:45', 1, 'Q711'),
(147, 'Montenegro', 'MNE', '499', 'ME', '382', 'Podgorica', 'EUR', 'Euro', '???', '.me', '???????? ????????', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Podgorica\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Montenegro\",\"pt\":\"Montenegro\",\"nl\":\"Montenegro\",\"hr\":\"Crna Gora\",\"fa\":\"?????????????????????\",\"de\":\"Montenegro\",\"es\":\"Montenegro\",\"fr\":\"Mont??n??gro\",\"ja\":\"??????????????????\",\"it\":\"Montenegro\",\"cn\":\"??????\"}', '42.50000000', '19.30000000', '????????', 'U+1F1F2 U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 19:01:46', 1, 'Q236'),
(148, 'Montserrat', 'MSR', '500', 'MS', '+1-664', 'Plymouth', 'XCD', 'Eastern Caribbean dollar', '$', '.ms', 'Montserrat', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Montserrat\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Montserrat\",\"pt\":\"Monserrate\",\"nl\":\"Montserrat\",\"hr\":\"Montserrat\",\"fa\":\"??????????\",\"de\":\"Montserrat\",\"es\":\"Montserrat\",\"fr\":\"Montserrat\",\"ja\":\"??????????????????\",\"it\":\"Montserrat\",\"cn\":\"???????????????\"}', '16.75000000', '-62.20000000', '????????', 'U+1F1F2 U+1F1F8', '2018-07-21 01:41:03', '2021-12-11 19:02:56', 1, NULL),
(149, 'Morocco', 'MAR', '504', 'MA', '212', 'Rabat', 'MAD', 'Moroccan dirham', 'DH', '.ma', '????????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Casablanca\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WEST\",\"tzName\":\"Western European Summer Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Marrocos\",\"pt\":\"Marrocos\",\"nl\":\"Marokko\",\"hr\":\"Maroko\",\"fa\":\"??????????\",\"de\":\"Marokko\",\"es\":\"Marruecos\",\"fr\":\"Maroc\",\"ja\":\"????????????\",\"it\":\"Marocco\",\"cn\":\"?????????\"}', '32.00000000', '-5.00000000', '????????', 'U+1F1F2 U+1F1E6', '2018-07-21 01:41:03', '2021-12-11 19:03:08', 1, 'Q1028'),
(150, 'Mozambique', 'MOZ', '508', 'MZ', '258', 'Maputo', 'MZN', 'Mozambican metical', 'MT', '.mz', 'Mo??ambique', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Maputo\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Mo??ambique\",\"pt\":\"Mo??ambique\",\"nl\":\"Mozambique\",\"hr\":\"Mozambik\",\"fa\":\"????????????????\",\"de\":\"Mosambik\",\"es\":\"Mozambique\",\"fr\":\"Mozambique\",\"ja\":\"??????????????????\",\"it\":\"Mozambico\",\"cn\":\"????????????\"}', '-18.25000000', '35.00000000', '????????', 'U+1F1F2 U+1F1FF', '2018-07-21 01:41:03', '2021-12-11 19:03:19', 1, 'Q1029'),
(151, 'Myanmar', 'MMR', '104', 'MM', '95', 'Nay Pyi Taw', 'MMK', 'Burmese kyat', 'K', '.mm', '??????????????????', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Yangon\",\"gmtOffset\":23400,\"gmtOffsetName\":\"UTC+06:30\",\"abbreviation\":\"MMT\",\"tzName\":\"Myanmar Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Myanmar\",\"pt\":\"Myanmar\",\"nl\":\"Myanmar\",\"hr\":\"Mijanmar\",\"fa\":\"??????????????\",\"de\":\"Myanmar\",\"es\":\"Myanmar\",\"fr\":\"Myanmar\",\"ja\":\"???????????????\",\"it\":\"Birmania\",\"cn\":\"??????\"}', '22.00000000', '98.00000000', '????????', 'U+1F1F2 U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 19:03:25', 1, 'Q836'),
(152, 'Namibia', 'NAM', '516', 'NA', '264', 'Windhoek', 'NAD', 'Namibian dollar', '$', '.na', 'Namibia', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Windhoek\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"WAST\",\"tzName\":\"West Africa Summer Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Nam??bia\",\"pt\":\"Nam??bia\",\"nl\":\"Namibi??\",\"hr\":\"Namibija\",\"fa\":\"??????????????\",\"de\":\"Namibia\",\"es\":\"Namibia\",\"fr\":\"Namibie\",\"ja\":\"????????????\",\"it\":\"Namibia\",\"cn\":\"????????????\"}', '-22.00000000', '17.00000000', '????????', 'U+1F1F3 U+1F1E6', '2018-07-21 01:41:03', '2021-12-11 19:03:32', 1, 'Q1030'),
(153, 'Nauru', 'NRU', '520', 'NR', '674', 'Yaren', 'AUD', 'Australian dollar', '$', '.nr', 'Nauru', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Nauru\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"NRT\",\"tzName\":\"Nauru Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Nauru\",\"pt\":\"Nauru\",\"nl\":\"Nauru\",\"hr\":\"Nauru\",\"fa\":\"????????????\",\"de\":\"Nauru\",\"es\":\"Nauru\",\"fr\":\"Nauru\",\"ja\":\"?????????\",\"it\":\"Nauru\",\"cn\":\"??????\"}', '-0.53333333', '166.91666666', '????????', 'U+1F1F3 U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 19:03:37', 1, 'Q697'),
(154, 'Nepal', 'NPL', '524', 'NP', '977', 'Kathmandu', 'NPR', 'Nepalese rupee', '???', '.np', '?????????', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Kathmandu\",\"gmtOffset\":20700,\"gmtOffsetName\":\"UTC+05:45\",\"abbreviation\":\"NPT\",\"tzName\":\"Nepal Time\"}]', '{\"kr\":\"??????\",\"br\":\"Nepal\",\"pt\":\"Nepal\",\"nl\":\"Nepal\",\"hr\":\"Nepal\",\"fa\":\"????????\",\"de\":\"N??pal\",\"es\":\"Nepal\",\"fr\":\"N??pal\",\"ja\":\"????????????\",\"it\":\"Nepal\",\"cn\":\"?????????\"}', '28.00000000', '84.00000000', '????????', 'U+1F1F3 U+1F1F5', '2018-07-21 01:41:03', '2021-12-11 19:03:41', 1, 'Q837'),
(155, 'Bonaire, Sint Eustatius and Saba', 'BES', '535', 'BQ', '599', 'Kralendijk', 'USD', 'United States dollar', '$', '.an', 'Caribisch Nederland', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Anguilla\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????? ???\",\"br\":\"Bonaire\",\"pt\":\"Bonaire\",\"fa\":\"??????????\",\"de\":\"Bonaire, Sint Eustatius und Saba\",\"fr\":\"Bonaire, Saint-Eustache et Saba\",\"it\":\"Bonaire, Saint-Eustache e Saba\",\"cn\":\"?????????????????????????????????????????????\"}', '12.15000000', '-68.26666700', '????????', 'U+1F1E7 U+1F1F6', '2018-07-21 01:41:03', '2021-12-11 18:28:02', 1, 'Q27561'),
(156, 'Netherlands', 'NLD', '528', 'NL', '31', 'Amsterdam', 'EUR', 'Euro', '???', '.nl', 'Nederland', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Amsterdam\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????? \",\"br\":\"Holanda\",\"pt\":\"Pa??ses Baixos\",\"nl\":\"Nederland\",\"hr\":\"Nizozemska\",\"fa\":\"?????????????? ????????\",\"de\":\"Niederlande\",\"es\":\"Pa??ses Bajos\",\"fr\":\"Pays-Bas\",\"ja\":\"????????????\",\"it\":\"Paesi Bassi\",\"cn\":\"??????\"}', '52.50000000', '5.75000000', '????????', 'U+1F1F3 U+1F1F1', '2018-07-21 01:41:03', '2021-12-11 19:01:52', 1, 'Q55'),
(157, 'New Caledonia', 'NCL', '540', 'NC', '687', 'Noumea', 'XPF', 'CFP franc', '???', '.nc', 'Nouvelle-Cal??donie', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Noumea\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"NCT\",\"tzName\":\"New Caledonia Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Nova Caled??nia\",\"pt\":\"Nova Caled??nia\",\"nl\":\"Nieuw-Caledoni??\",\"hr\":\"Nova Kaledonija\",\"fa\":\"?????????????????? ????????\",\"de\":\"Neukaledonien\",\"es\":\"Nueva Caledonia\",\"fr\":\"Nouvelle-Cal??donie\",\"ja\":\"????????????????????????\",\"it\":\"Nuova Caledonia\",\"cn\":\"??????????????????\"}', '-21.50000000', '165.50000000', '????????', 'U+1F1F3 U+1F1E8', '2018-07-21 01:41:03', '2021-12-11 19:04:11', 1, NULL),
(158, 'New Zealand', 'NZL', '554', 'NZ', '64', 'Wellington', 'NZD', 'New Zealand dollar', '$', '.nz', 'New Zealand', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Pacific/Auckland\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"NZDT\",\"tzName\":\"New Zealand Daylight Time\"},{\"zoneName\":\"Pacific/Chatham\",\"gmtOffset\":49500,\"gmtOffsetName\":\"UTC+13:45\",\"abbreviation\":\"CHAST\",\"tzName\":\"Chatham Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Nova Zel??ndia\",\"pt\":\"Nova Zel??ndia\",\"nl\":\"Nieuw-Zeeland\",\"hr\":\"Novi Zeland\",\"fa\":\"????????????????\",\"de\":\"Neuseeland\",\"es\":\"Nueva Zelanda\",\"fr\":\"Nouvelle-Z??lande\",\"ja\":\"????????????????????????\",\"it\":\"Nuova Zelanda\",\"cn\":\"?????????\"}', '-41.00000000', '174.00000000', '????????', 'U+1F1F3 U+1F1FF', '2018-07-21 01:41:03', '2021-12-11 19:04:18', 1, 'Q664'),
(159, 'Nicaragua', 'NIC', '558', 'NI', '505', 'Managua', 'NIO', 'Nicaraguan c??rdoba', 'C$', '.ni', 'Nicaragua', 'Americas', 'Central America', '[{\"zoneName\":\"America/Managua\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"????????????\",\"br\":\"Nicar??gua\",\"pt\":\"Nicar??gua\",\"nl\":\"Nicaragua\",\"hr\":\"Nikaragva\",\"fa\":\"????????????????????\",\"de\":\"Nicaragua\",\"es\":\"Nicaragua\",\"fr\":\"Nicaragua\",\"ja\":\"???????????????\",\"it\":\"Nicaragua\",\"cn\":\"????????????\"}', '13.00000000', '-85.00000000', '????????', 'U+1F1F3 U+1F1EE', '2018-07-21 01:41:03', '2021-12-11 19:04:25', 1, 'Q811'),
(160, 'Niger', 'NER', '562', 'NE', '227', 'Niamey', 'XOF', 'West African CFA franc', 'CFA', '.ne', 'Niger', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Niamey\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"N??ger\",\"pt\":\"N??ger\",\"nl\":\"Niger\",\"hr\":\"Niger\",\"fa\":\"????????\",\"de\":\"Niger\",\"es\":\"N??ger\",\"fr\":\"Niger\",\"ja\":\"???????????????\",\"it\":\"Niger\",\"cn\":\"?????????\"}', '16.00000000', '8.00000000', '????????', 'U+1F1F3 U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 19:04:32', 1, 'Q1032'),
(161, 'Nigeria', 'NGA', '566', 'NG', '234', 'Abuja', 'NGN', 'Nigerian naira', '???', '.ng', 'Nigeria', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Lagos\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Nig??ria\",\"pt\":\"Nig??ria\",\"nl\":\"Nigeria\",\"hr\":\"Nigerija\",\"fa\":\"????????????\",\"de\":\"Nigeria\",\"es\":\"Nigeria\",\"fr\":\"Nig??ria\",\"ja\":\"??????????????????\",\"it\":\"Nigeria\",\"cn\":\"????????????\"}', '10.00000000', '8.00000000', '????????', 'U+1F1F3 U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 19:04:37', 1, 'Q1033'),
(162, 'Niue', 'NIU', '570', 'NU', '683', 'Alofi', 'NZD', 'New Zealand dollar', '$', '.nu', 'Niu??', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Niue\",\"gmtOffset\":-39600,\"gmtOffsetName\":\"UTC-11:00\",\"abbreviation\":\"NUT\",\"tzName\":\"Niue Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Niue\",\"pt\":\"Niue\",\"nl\":\"Niue\",\"hr\":\"Niue\",\"fa\":\"??????????\",\"de\":\"Niue\",\"es\":\"Niue\",\"fr\":\"Niue\",\"ja\":\"?????????\",\"it\":\"Niue\",\"cn\":\"??????\"}', '-19.03333333', '-169.86666666', '????????', 'U+1F1F3 U+1F1FA', '2018-07-21 01:41:03', '2021-12-11 19:04:42', 1, 'Q34020'),
(163, 'Norfolk Island', 'NFK', '574', 'NF', '672', 'Kingston', 'AUD', 'Australian dollar', '$', '.nf', 'Norfolk Island', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Pacific/Norfolk\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"NFT\",\"tzName\":\"Norfolk Time\"}]', '{\"kr\":\"?????? ???\",\"br\":\"Ilha Norfolk\",\"pt\":\"Ilha Norfolk\",\"nl\":\"Norfolkeiland\",\"hr\":\"Otok Norfolk\",\"fa\":\"?????????? ??????????\",\"de\":\"Norfolkinsel\",\"es\":\"Isla de Norfolk\",\"fr\":\"??le de Norfolk\",\"ja\":\"?????????????????????\",\"it\":\"Isola Norfolk\",\"cn\":\"????????????\"}', '-29.03333333', '167.95000000', '????????', 'U+1F1F3 U+1F1EB', '2018-07-21 01:41:03', '2021-12-11 19:05:39', 1, NULL),
(164, 'Northern Mariana Islands', 'MNP', '580', 'MP', '+1-670', 'Saipan', 'USD', 'United States dollar', '$', '.mp', 'Northern Mariana Islands', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Saipan\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"ChST\",\"tzName\":\"Chamorro Standard Time\"}]', '{\"kr\":\"??????????????? ??????\",\"br\":\"Ilhas Marianas\",\"pt\":\"Ilhas Marianas\",\"nl\":\"Noordelijke Marianeneilanden\",\"hr\":\"Sjevernomarijanski otoci\",\"fa\":\"?????????? ???????????????? ??????????\",\"de\":\"N??rdliche Marianen\",\"es\":\"Islas Marianas del Norte\",\"fr\":\"??les Mariannes du Nord\",\"ja\":\"?????????????????????\",\"it\":\"Isole Marianne Settentrionali\",\"cn\":\"?????????????????????\"}', '15.20000000', '145.75000000', '????????', 'U+1F1F2 U+1F1F5', '2018-07-21 01:41:03', '2021-12-11 19:05:55', 1, NULL),
(165, 'Norway', 'NOR', '578', 'NO', '47', 'Oslo', 'NOK', 'Norwegian krone', 'kr', '.no', 'Norge', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Oslo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Noruega\",\"pt\":\"Noruega\",\"nl\":\"Noorwegen\",\"hr\":\"Norve??ka\",\"fa\":\"????????\",\"de\":\"Norwegen\",\"es\":\"Noruega\",\"fr\":\"Norv??ge\",\"ja\":\"???????????????\",\"it\":\"Norvegia\",\"cn\":\"??????\"}', '62.00000000', '10.00000000', '????????', 'U+1F1F3 U+1F1F4', '2018-07-21 01:41:03', '2021-12-11 19:07:57', 1, 'Q20'),
(166, 'Oman', 'OMN', '512', 'OM', '968', 'Muscat', 'OMR', 'Omani rial', '.??.??', '.om', '????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Muscat\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"GST\",\"tzName\":\"Gulf Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"Om??\",\"pt\":\"Om??\",\"nl\":\"Oman\",\"hr\":\"Oman\",\"fa\":\"????????\",\"de\":\"Oman\",\"es\":\"Om??n\",\"fr\":\"Oman\",\"ja\":\"????????????\",\"it\":\"oman\",\"cn\":\"??????\"}', '21.00000000', '57.00000000', '????????', 'U+1F1F4 U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 19:08:03', 1, 'Q842'),
(167, 'Pakistan', 'PAK', '586', 'PK', '92', 'Islamabad', 'PKR', 'Pakistani rupee', '???', '.pk', 'Pakistan', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Karachi\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"PKT\",\"tzName\":\"Pakistan Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Paquist??o\",\"pt\":\"Paquist??o\",\"nl\":\"Pakistan\",\"hr\":\"Pakistan\",\"fa\":\"??????????????\",\"de\":\"Pakistan\",\"es\":\"Pakist??n\",\"fr\":\"Pakistan\",\"ja\":\"???????????????\",\"it\":\"Pakistan\",\"cn\":\"????????????\"}', '30.00000000', '70.00000000', '????????', 'U+1F1F5 U+1F1F0', '2018-07-21 01:41:03', '2021-12-11 19:08:09', 1, 'Q843'),
(168, 'Palau', 'PLW', '585', 'PW', '680', 'Melekeok', 'USD', 'United States dollar', '$', '.pw', 'Palau', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Palau\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"PWT\",\"tzName\":\"Palau Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Palau\",\"pt\":\"Palau\",\"nl\":\"Palau\",\"hr\":\"Palau\",\"fa\":\"????????????\",\"de\":\"Palau\",\"es\":\"Palau\",\"fr\":\"Palaos\",\"ja\":\"?????????\",\"it\":\"Palau\",\"cn\":\"??????\"}', '7.50000000', '134.50000000', '????????', 'U+1F1F5 U+1F1FC', '2018-07-21 01:41:03', '2021-12-11 19:05:58', 1, 'Q695'),
(169, 'Palestinian Territory Occupied', 'PSE', '275', 'PS', '970', 'East Jerusalem', 'ILS', 'Israeli new shekel', '???', '.ps', '????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Gaza\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Asia/Hebron\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"??????????????? ??????\",\"br\":\"Palestina\",\"pt\":\"Palestina\",\"nl\":\"Palestijnse gebieden\",\"hr\":\"Palestina\",\"fa\":\"????????????\",\"de\":\"Pal??stina\",\"es\":\"Palestina\",\"fr\":\"Palestine\",\"ja\":\"???????????????\",\"it\":\"Palestina\",\"cn\":\"????????????\"}', '31.90000000', '35.20000000', '????????', 'U+1F1F5 U+1F1F8', '2018-07-21 01:41:03', '2021-12-11 19:08:16', 1, NULL),
(170, 'Panama', 'PAN', '591', 'PA', '507', 'Panama City', 'PAB', 'Panamanian balboa', 'B/.', '.pa', 'Panam??', 'Americas', 'Central America', '[{\"zoneName\":\"America/Panama\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"?????????\",\"br\":\"Panam??\",\"pt\":\"Panam??\",\"nl\":\"Panama\",\"hr\":\"Panama\",\"fa\":\"????????????\",\"de\":\"Panama\",\"es\":\"Panam??\",\"fr\":\"Panama\",\"ja\":\"?????????\",\"it\":\"Panama\",\"cn\":\"?????????\"}', '9.00000000', '-80.00000000', '????????', 'U+1F1F5 U+1F1E6', '2018-07-21 01:41:03', '2021-12-11 19:08:22', 1, 'Q804'),
(171, 'Papua new Guinea', 'PNG', '598', 'PG', '675', 'Port Moresby', 'PGK', 'Papua New Guinean kina', 'K', '.pg', 'Papua Niugini', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Bougainville\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"BST\",\"tzName\":\"Bougainville Standard Time[6\"},{\"zoneName\":\"Pacific/Port_Moresby\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"PGT\",\"tzName\":\"Papua New Guinea Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Papua Nova Guin??\",\"pt\":\"Papua Nova Guin??\",\"nl\":\"Papoea-Nieuw-Guinea\",\"hr\":\"Papua Nova Gvineja\",\"fa\":\"?????????? ???????? ????\",\"de\":\"Papua-Neuguinea\",\"es\":\"Pap??a Nueva Guinea\",\"fr\":\"Papouasie-Nouvelle-Guin??e\",\"ja\":\"???????????????????????????\",\"it\":\"Papua Nuova Guinea\",\"cn\":\"?????????????????????\"}', '-6.00000000', '147.00000000', '????????', 'U+1F1F5 U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 19:08:31', 1, 'Q691'),
(172, 'Paraguay', 'PRY', '600', 'PY', '595', 'Asuncion', 'PYG', 'Paraguayan guarani', '???', '.py', 'Paraguay', 'Americas', 'South America', '[{\"zoneName\":\"America/Asuncion\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"PYST\",\"tzName\":\"Paraguay Summer Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Paraguai\",\"pt\":\"Paraguai\",\"nl\":\"Paraguay\",\"hr\":\"Paragvaj\",\"fa\":\"????????????????\",\"de\":\"Paraguay\",\"es\":\"Paraguay\",\"fr\":\"Paraguay\",\"ja\":\"???????????????\",\"it\":\"Paraguay\",\"cn\":\"?????????\"}', '-23.00000000', '-58.00000000', '????????', 'U+1F1F5 U+1F1FE', '2018-07-21 01:41:03', '2021-12-11 19:08:49', 1, 'Q733'),
(173, 'Peru', 'PER', '604', 'PE', '51', 'Lima', 'PEN', 'Peruvian sol', 'S/.', '.pe', 'Per??', 'Americas', 'South America', '[{\"zoneName\":\"America/Lima\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"PET\",\"tzName\":\"Peru Time\"}]', '{\"kr\":\"??????\",\"br\":\"Peru\",\"pt\":\"Peru\",\"nl\":\"Peru\",\"hr\":\"Peru\",\"fa\":\"??????\",\"de\":\"Peru\",\"es\":\"Per??\",\"fr\":\"P??rou\",\"ja\":\"?????????\",\"it\":\"Per??\",\"cn\":\"??????\"}', '-10.00000000', '-76.00000000', '????????', 'U+1F1F5 U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 19:08:59', 1, 'Q419'),
(174, 'Philippines', 'PHL', '608', 'PH', '63', 'Manila', 'PHP', 'Philippine peso', '???', '.ph', 'Pilipinas', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Manila\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"PHT\",\"tzName\":\"Philippine Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Filipinas\",\"pt\":\"Filipinas\",\"nl\":\"Filipijnen\",\"hr\":\"Filipini\",\"fa\":\"?????????? ??????????????????????\",\"de\":\"Philippinen\",\"es\":\"Filipinas\",\"fr\":\"Philippines\",\"ja\":\"???????????????\",\"it\":\"Filippine\",\"cn\":\"?????????\"}', '13.00000000', '122.00000000', '????????', 'U+1F1F5 U+1F1ED', '2018-07-21 01:41:03', '2021-12-11 19:09:03', 1, 'Q928'),
(175, 'Pitcairn Island', 'PCN', '612', 'PN', '870', 'Adamstown', 'NZD', 'New Zealand dollar', '$', '.pn', 'Pitcairn Islands', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Pitcairn\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"}]', '{\"kr\":\"????????? ??????\",\"br\":\"Ilhas Pitcairn\",\"pt\":\"Ilhas Pic??rnia\",\"nl\":\"Pitcairneilanden\",\"hr\":\"Pitcairnovo oto??je\",\"fa\":\"????????????\",\"de\":\"Pitcairn\",\"es\":\"Islas Pitcairn\",\"fr\":\"??les Pitcairn\",\"ja\":\"???????????????\",\"it\":\"Isole Pitcairn\",\"cn\":\"??????????????????\"}', '-25.06666666', '-130.10000000', '????????', 'U+1F1F5 U+1F1F3', '2018-07-21 01:41:03', '2021-12-11 19:09:08', 1, NULL),
(176, 'Poland', 'POL', '616', 'PL', '48', 'Warsaw', 'PLN', 'Polish z??oty', 'z??', '.pl', 'Polska', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Warsaw\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Pol??nia\",\"pt\":\"Pol??nia\",\"nl\":\"Polen\",\"hr\":\"Poljska\",\"fa\":\"????????????\",\"de\":\"Polen\",\"es\":\"Polonia\",\"fr\":\"Pologne\",\"ja\":\"???????????????\",\"it\":\"Polonia\",\"cn\":\"??????\"}', '52.00000000', '20.00000000', '????????', 'U+1F1F5 U+1F1F1', '2018-07-21 01:41:03', '2021-12-11 19:09:19', 1, 'Q36'),
(177, 'Portugal', 'PRT', '620', 'PT', '351', 'Lisbon', 'EUR', 'Euro', '???', '.pt', 'Portugal', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Atlantic/Azores\",\"gmtOffset\":-3600,\"gmtOffsetName\":\"UTC-01:00\",\"abbreviation\":\"AZOT\",\"tzName\":\"Azores Standard Time\"},{\"zoneName\":\"Atlantic/Madeira\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"},{\"zoneName\":\"Europe/Lisbon\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Portugal\",\"pt\":\"Portugal\",\"nl\":\"Portugal\",\"hr\":\"Portugal\",\"fa\":\"????????????\",\"de\":\"Portugal\",\"es\":\"Portugal\",\"fr\":\"Portugal\",\"ja\":\"???????????????\",\"it\":\"Portogallo\",\"cn\":\"?????????\"}', '39.50000000', '-8.00000000', '????????', 'U+1F1F5 U+1F1F9', '2018-07-21 01:41:03', '2021-12-11 19:02:09', 1, 'Q45'),
(178, 'Puerto Rico', 'PRI', '630', 'PR', '+1-787 and 1-939', 'San Juan', 'USD', 'United States dollar', '$', '.pr', 'Puerto Rico', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Puerto_Rico\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Porto Rico\",\"pt\":\"Porto Rico\",\"nl\":\"Puerto Rico\",\"hr\":\"Portoriko\",\"fa\":\"?????????? ????????\",\"de\":\"Puerto Rico\",\"es\":\"Puerto Rico\",\"fr\":\"Porto Rico\",\"ja\":\"??????????????????\",\"it\":\"Porto Rico\",\"cn\":\"????????????\"}', '18.25000000', '-66.50000000', '????????', 'U+1F1F5 U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 19:06:02', 1, NULL),
(179, 'Qatar', 'QAT', '634', 'QA', '974', 'Doha', 'QAR', 'Qatari riyal', '??.??', '.qa', '??????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Qatar\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Catar\",\"pt\":\"Catar\",\"nl\":\"Qatar\",\"hr\":\"Katar\",\"fa\":\"??????\",\"de\":\"Katar\",\"es\":\"Catar\",\"fr\":\"Qatar\",\"ja\":\"????????????\",\"it\":\"Qatar\",\"cn\":\"?????????\"}', '25.50000000', '51.25000000', '????????', 'U+1F1F6 U+1F1E6', '2018-07-21 01:41:03', '2021-12-11 19:09:24', 1, 'Q846'),
(180, 'Reunion', 'REU', '638', 'RE', '262', 'Saint-Denis', 'EUR', 'Euro', '???', '.re', 'La R??union', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Reunion\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"RET\",\"tzName\":\"R??union Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Reuni??o\",\"pt\":\"Reuni??o\",\"nl\":\"R??union\",\"hr\":\"R??union\",\"fa\":\"??????????????\",\"de\":\"R??union\",\"es\":\"Reuni??n\",\"fr\":\"R??union\",\"ja\":\"???????????????\",\"it\":\"Riunione\",\"cn\":\"????????????\"}', '-21.15000000', '55.50000000', '????????', 'U+1F1F7 U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 19:01:59', 1, NULL),
(181, 'Romania', 'ROU', '642', 'RO', '40', 'Bucharest', 'RON', 'Romanian leu', 'lei', '.ro', 'Rom??nia', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Bucharest\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Rom??nia\",\"pt\":\"Rom??nia\",\"nl\":\"Roemeni??\",\"hr\":\"Rumunjska\",\"fa\":\"????????????\",\"de\":\"Rum??nien\",\"es\":\"Rumania\",\"fr\":\"Roumanie\",\"ja\":\"???????????????\",\"it\":\"Romania\",\"cn\":\"????????????\"}', '46.00000000', '25.00000000', '????????', 'U+1F1F7 U+1F1F4', '2018-07-21 01:41:03', '2021-12-11 19:09:31', 1, 'Q218'),
(182, 'Russia', 'RUS', '643', 'RU', '7', 'Moscow', 'RUB', 'Russian ruble', '???', '.ru', '????????????', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Asia/Anadyr\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"ANAT\",\"tzName\":\"Anadyr Time[4\"},{\"zoneName\":\"Asia/Barnaul\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"KRAT\",\"tzName\":\"Krasnoyarsk Time\"},{\"zoneName\":\"Asia/Chita\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"YAKT\",\"tzName\":\"Yakutsk Time\"},{\"zoneName\":\"Asia/Irkutsk\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"IRKT\",\"tzName\":\"Irkutsk Time\"},{\"zoneName\":\"Asia/Kamchatka\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"PETT\",\"tzName\":\"Kamchatka Time\"},{\"zoneName\":\"Asia/Khandyga\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"YAKT\",\"tzName\":\"Yakutsk Time\"},{\"zoneName\":\"Asia/Krasnoyarsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"KRAT\",\"tzName\":\"Krasnoyarsk Time\"},{\"zoneName\":\"Asia/Magadan\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"MAGT\",\"tzName\":\"Magadan Time\"},{\"zoneName\":\"Asia/Novokuznetsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"KRAT\",\"tzName\":\"Krasnoyarsk Time\"},{\"zoneName\":\"Asia/Novosibirsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"NOVT\",\"tzName\":\"Novosibirsk Time\"},{\"zoneName\":\"Asia/Omsk\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"OMST\",\"tzName\":\"Omsk Time\"},{\"zoneName\":\"Asia/Sakhalin\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"SAKT\",\"tzName\":\"Sakhalin Island Time\"},{\"zoneName\":\"Asia/Srednekolymsk\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"SRET\",\"tzName\":\"Srednekolymsk Time\"},{\"zoneName\":\"Asia/Tomsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"MSD+3\",\"tzName\":\"Moscow Daylight Time+3\"},{\"zoneName\":\"Asia/Ust-Nera\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"VLAT\",\"tzName\":\"Vladivostok Time\"},{\"zoneName\":\"Asia/Vladivostok\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"VLAT\",\"tzName\":\"Vladivostok Time\"},{\"zoneName\":\"Asia/Yakutsk\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"YAKT\",\"tzName\":\"Yakutsk Time\"},{\"zoneName\":\"Asia/Yekaterinburg\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"YEKT\",\"tzName\":\"Yekaterinburg Time\"},{\"zoneName\":\"Europe/Astrakhan\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SAMT\",\"tzName\":\"Samara Time\"},{\"zoneName\":\"Europe/Kaliningrad\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Europe/Kirov\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"},{\"zoneName\":\"Europe/Moscow\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"},{\"zoneName\":\"Europe/Samara\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SAMT\",\"tzName\":\"Samara Time\"},{\"zoneName\":\"Europe/Saratov\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"MSD\",\"tzName\":\"Moscow Daylight Time+4\"},{\"zoneName\":\"Europe/Ulyanovsk\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SAMT\",\"tzName\":\"Samara Time\"},{\"zoneName\":\"Europe/Volgograd\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"R??ssia\",\"pt\":\"R??ssia\",\"nl\":\"Rusland\",\"hr\":\"Rusija\",\"fa\":\"??????????\",\"de\":\"Russland\",\"es\":\"Rusia\",\"fr\":\"Russie\",\"ja\":\"???????????????\",\"it\":\"Russia\",\"cn\":\"???????????????\"}', '60.00000000', '100.00000000', '????????', 'U+1F1F7 U+1F1FA', '2018-07-21 01:41:03', '2021-12-11 19:09:37', 1, 'Q159'),
(183, 'Rwanda', 'RWA', '646', 'RW', '250', 'Kigali', 'RWF', 'Rwandan franc', 'FRw', '.rw', 'Rwanda', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Kigali\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Ruanda\",\"pt\":\"Ruanda\",\"nl\":\"Rwanda\",\"hr\":\"Ruanda\",\"fa\":\"????????????\",\"de\":\"Ruanda\",\"es\":\"Ruanda\",\"fr\":\"Rwanda\",\"ja\":\"????????????\",\"it\":\"Ruanda\",\"cn\":\"?????????\"}', '-2.00000000', '30.00000000', '????????', 'U+1F1F7 U+1F1FC', '2018-07-21 01:41:03', '2021-12-11 19:09:42', 1, 'Q1037'),
(184, 'Saint Helena', 'SHN', '654', 'SH', '290', 'Jamestown', 'SHP', 'Saint Helena pound', '??', '.sh', 'Saint Helena', 'Africa', 'Western Africa', '[{\"zoneName\":\"Atlantic/St_Helena\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Santa Helena\",\"pt\":\"Santa Helena\",\"nl\":\"Sint-Helena\",\"hr\":\"Sveta Helena\",\"fa\":\"?????? ?????????? ?????????? ?? ?????????????? ???? ????????\",\"de\":\"Sankt Helena\",\"es\":\"Santa Helena\",\"fr\":\"Sainte-H??l??ne\",\"ja\":\"??????????????????????????????????????????????????????????????????????????????\",\"it\":\"Sant\'Elena\",\"cn\":\"????????????\"}', '-15.95000000', '-5.70000000', '????????', 'U+1F1F8 U+1F1ED', '2018-07-21 01:41:03', '2021-12-11 19:09:50', 1, NULL),
(185, 'Saint Kitts And Nevis', 'KNA', '659', 'KN', '+1-869', 'Basseterre', 'XCD', 'Eastern Caribbean dollar', '$', '.kn', 'Saint Kitts and Nevis', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Kitts\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"??????????????? ?????????\",\"br\":\"S??o Crist??v??o e Neves\",\"pt\":\"S??o Crist??v??o e Neves\",\"nl\":\"Saint Kitts en Nevis\",\"hr\":\"Sveti Kristof i Nevis\",\"fa\":\"?????? ???????? ?? ????????\",\"de\":\"St. Kitts und Nevis\",\"es\":\"San Crist??bal y Nieves\",\"fr\":\"Saint-Christophe-et-Ni??v??s\",\"ja\":\"?????????????????????????????????????????????\",\"it\":\"Saint Kitts e Nevis\",\"cn\":\"?????????????????????\"}', '17.33333333', '-62.75000000', '????????', 'U+1F1F0 U+1F1F3', '2018-07-21 01:41:03', '2021-12-11 19:09:56', 1, 'Q763'),
(186, 'Saint Lucia', 'LCA', '662', 'LC', '+1-758', 'Castries', 'XCD', 'Eastern Caribbean dollar', '$', '.lc', 'Saint Lucia', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Lucia\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Santa L??cia\",\"pt\":\"Santa L??cia\",\"nl\":\"Saint Lucia\",\"hr\":\"Sveta Lucija\",\"fa\":\"?????? ??????????\",\"de\":\"Saint Lucia\",\"es\":\"Santa Luc??a\",\"fr\":\"Saint-Lucie\",\"ja\":\"??????????????????\",\"it\":\"Santa Lucia\",\"cn\":\"????????????\"}', '13.88333333', '-60.96666666', '????????', 'U+1F1F1 U+1F1E8', '2018-07-21 01:41:03', '2021-12-11 19:09:58', 1, 'Q760'),
(187, 'Saint Pierre and Miquelon', 'SPM', '666', 'PM', '508', 'Saint-Pierre', 'EUR', 'Euro', '???', '.pm', 'Saint-Pierre-et-Miquelon', 'Americas', 'Northern America', '[{\"zoneName\":\"America/Miquelon\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"PMDT\",\"tzName\":\"Pierre & Miquelon Daylight Time\"}]', '{\"kr\":\"???????????? ?????????\",\"br\":\"Saint-Pierre e Miquelon\",\"pt\":\"S??o Pedro e Miquelon\",\"nl\":\"Saint Pierre en Miquelon\",\"hr\":\"Sveti Petar i Mikelon\",\"fa\":\"???? ?????? ?? ??????????\",\"de\":\"Saint-Pierre und Miquelon\",\"es\":\"San Pedro y Miquel??n\",\"fr\":\"Saint-Pierre-et-Miquelon\",\"ja\":\"???????????????????????????????????????\",\"it\":\"Saint-Pierre e Miquelon\",\"cn\":\"????????????????????????\"}', '46.83333333', '-56.33333333', '????????', 'U+1F1F5 U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 19:02:00', 1, NULL),
(188, 'Saint Vincent And The Grenadines', 'VCT', '670', 'VC', '+1-784', 'Kingstown', 'XCD', 'Eastern Caribbean dollar', '$', '.vc', 'Saint Vincent and the Grenadines', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Vincent\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"?????????????????? ????????????\",\"br\":\"S??o Vicente e Granadinas\",\"pt\":\"S??o Vicente e Granadinas\",\"nl\":\"Saint Vincent en de Grenadines\",\"hr\":\"Sveti Vincent i Grenadini\",\"fa\":\"?????? ???????????? ?? ?????????????????????\",\"de\":\"Saint Vincent und die Grenadinen\",\"es\":\"San Vicente y Granadinas\",\"fr\":\"Saint-Vincent-et-les-Grenadines\",\"ja\":\"????????????????????????????????????????????????????????????\",\"it\":\"Saint Vincent e Grenadine\",\"cn\":\"??????????????????????????????\"}', '13.25000000', '-61.20000000', '????????', 'U+1F1FB U+1F1E8', '2018-07-21 01:41:03', '2021-12-11 19:09:59', 1, 'Q757'),
(189, 'Saint-Barthelemy', 'BLM', '652', 'BL', '590', 'Gustavia', 'EUR', 'Euro', '???', '.bl', 'Saint-Barth??lemy', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Barthelemy\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"S??o Bartolomeu\",\"pt\":\"S??o Bartolomeu\",\"nl\":\"Saint Barth??lemy\",\"hr\":\"Saint Barth??lemy\",\"fa\":\"????-??????????????\",\"de\":\"Saint-Barth??lemy\",\"es\":\"San Bartolom??\",\"fr\":\"Saint-Barth??lemy\",\"ja\":\"???????????????????????????\",\"it\":\"Antille Francesi\",\"cn\":\"???????????????\"}', '18.50000000', '-63.41666666', '????????', 'U+1F1E7 U+1F1F1', '2018-07-21 01:41:03', '2021-12-11 19:06:08', 1, NULL),
(190, 'Saint-Martin (French part)', 'MAF', '663', 'MF', '590', 'Marigot', 'EUR', 'Euro', '???', '.mf', 'Saint-Martin', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Marigot\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"??????????????? ???\",\"br\":\"Saint Martin\",\"pt\":\"Ilha S??o Martinho\",\"nl\":\"Saint-Martin\",\"hr\":\"Sveti Martin\",\"fa\":\"???????? ??????????\",\"de\":\"Saint Martin\",\"es\":\"Saint Martin\",\"fr\":\"Saint-Martin\",\"ja\":\"??????????????????????????????????????????\",\"it\":\"Saint Martin\",\"cn\":\"??????????????????\"}', '18.08333333', '-63.95000000', '????????', 'U+1F1F2 U+1F1EB', '2018-07-21 01:41:03', '2021-12-11 19:06:10', 1, NULL),
(191, 'Samoa', 'WSM', '882', 'WS', '685', 'Apia', 'WST', 'Samoan t??l??', 'SAT', '.ws', 'Samoa', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Apia\",\"gmtOffset\":50400,\"gmtOffsetName\":\"UTC+14:00\",\"abbreviation\":\"WST\",\"tzName\":\"West Samoa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Samoa\",\"pt\":\"Samoa\",\"nl\":\"Samoa\",\"hr\":\"Samoa\",\"fa\":\"??????????\",\"de\":\"Samoa\",\"es\":\"Samoa\",\"fr\":\"Samoa\",\"ja\":\"?????????\",\"it\":\"Samoa\",\"cn\":\"?????????\"}', '-13.58333333', '-172.33333333', '????????', 'U+1F1FC U+1F1F8', '2018-07-21 01:41:03', '2021-12-11 19:10:07', 1, 'Q683'),
(192, 'San Marino', 'SMR', '674', 'SM', '378', 'San Marino', 'EUR', 'Euro', '???', '.sm', 'San Marino', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/San_Marino\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"San Marino\",\"pt\":\"S??o Marinho\",\"nl\":\"San Marino\",\"hr\":\"San Marino\",\"fa\":\"?????? ????????????\",\"de\":\"San Marino\",\"es\":\"San Marino\",\"fr\":\"Saint-Marin\",\"ja\":\"???????????????\",\"it\":\"San Marino\",\"cn\":\"????????????\"}', '43.76666666', '12.41666666', '????????', 'U+1F1F8 U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 19:02:15', 1, 'Q238'),
(193, 'Sao Tome and Principe', 'STP', '678', 'ST', '239', 'Sao Tome', 'STD', 'Dobra', 'Db', '.st', 'S??o Tom?? e Pr??ncipe', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Sao_Tome\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"????????? ????????????\",\"br\":\"S??o Tom?? e Pr??ncipe\",\"pt\":\"S??o Tom?? e Pr??ncipe\",\"nl\":\"Sao Tom?? en Principe\",\"hr\":\"Sveti Toma i Princip\",\"fa\":\"???????????? ???? ????????????\",\"de\":\"S??o Tom?? und Pr??ncipe\",\"es\":\"Santo Tom?? y Pr??ncipe\",\"fr\":\"Sao Tom??-et-Principe\",\"ja\":\"??????????????????????????????\",\"it\":\"S??o Tom?? e Pr??ncipe\",\"cn\":\"????????????????????????\"}', '1.00000000', '7.00000000', '????????', 'U+1F1F8 U+1F1F9', '2018-07-21 01:41:03', '2021-12-11 19:10:28', 1, 'Q1039'),
(194, 'Saudi Arabia', 'SAU', '682', 'SA', '966', 'Riyadh', 'SAR', 'Saudi riyal', '???', '.sa', '?????????????? ?????????????? ????????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Riyadh\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"?????????????????????\",\"br\":\"Ar??bia Saudita\",\"pt\":\"Ar??bia Saudita\",\"nl\":\"Saoedi-Arabi??\",\"hr\":\"Saudijska Arabija\",\"fa\":\"?????????????? ??????????\",\"de\":\"Saudi-Arabien\",\"es\":\"Arabia Saud??\",\"fr\":\"Arabie Saoudite\",\"ja\":\"?????????????????????\",\"it\":\"Arabia Saudita\",\"cn\":\"???????????????\"}', '25.00000000', '45.00000000', '????????', 'U+1F1F8 U+1F1E6', '2018-07-21 01:41:03', '2021-12-11 19:10:44', 1, 'Q851'),
(195, 'Senegal', 'SEN', '686', 'SN', '221', 'Dakar', 'XOF', 'West African CFA franc', 'CFA', '.sn', 'S??n??gal', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Dakar\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Senegal\",\"pt\":\"Senegal\",\"nl\":\"Senegal\",\"hr\":\"Senegal\",\"fa\":\"??????????\",\"de\":\"Senegal\",\"es\":\"Senegal\",\"fr\":\"S??n??gal\",\"ja\":\"????????????\",\"it\":\"Senegal\",\"cn\":\"????????????\"}', '14.00000000', '-14.00000000', '????????', 'U+1F1F8 U+1F1F3', '2018-07-21 01:41:03', '2021-12-11 19:10:50', 1, 'Q1041');
INSERT INTO `countries` (`id`, `name`, `iso3`, `numeric_code`, `iso2`, `phonecode`, `capital`, `currency`, `currency_name`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `created_at`, `updated_at`, `flag`, `wikiDataId`) VALUES
(196, 'Serbia', 'SRB', '688', 'RS', '381', 'Belgrade', 'RSD', 'Serbian dinar', 'din', '.rs', '????????????', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Belgrade\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????????\",\"br\":\"S??rvia\",\"pt\":\"S??rvia\",\"nl\":\"Servi??\",\"hr\":\"Srbija\",\"fa\":\"??????????????\",\"de\":\"Serbien\",\"es\":\"Serbia\",\"fr\":\"Serbie\",\"ja\":\"????????????\",\"it\":\"Serbia\",\"cn\":\"????????????\"}', '44.00000000', '21.00000000', '????????', 'U+1F1F7 U+1F1F8', '2018-07-21 01:41:03', '2021-12-11 19:10:55', 1, 'Q403'),
(197, 'Seychelles', 'SYC', '690', 'SC', '248', 'Victoria', 'SCR', 'Seychellois rupee', 'SRe', '.sc', 'Seychelles', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Mahe\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SCT\",\"tzName\":\"Seychelles Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Seicheles\",\"pt\":\"Seicheles\",\"nl\":\"Seychellen\",\"hr\":\"Sej??eli\",\"fa\":\"????????\",\"de\":\"Seychellen\",\"es\":\"Seychelles\",\"fr\":\"Seychelles\",\"ja\":\"???????????????\",\"it\":\"Seychelles\",\"cn\":\"?????????\"}', '-4.58333333', '55.66666666', '????????', 'U+1F1F8 U+1F1E8', '2018-07-21 01:41:03', '2021-12-11 19:11:01', 1, 'Q1042'),
(198, 'Sierra Leone', 'SLE', '694', 'SL', '232', 'Freetown', 'SLL', 'Sierra Leonean leone', 'Le', '.sl', 'Sierra Leone', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Freetown\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Serra Leoa\",\"pt\":\"Serra Leoa\",\"nl\":\"Sierra Leone\",\"hr\":\"Sijera Leone\",\"fa\":\"????????????????\",\"de\":\"Sierra Leone\",\"es\":\"Sierra Leone\",\"fr\":\"Sierra Leone\",\"ja\":\"??????????????????\",\"it\":\"Sierra Leone\",\"cn\":\"????????????\"}', '8.50000000', '-11.50000000', '????????', 'U+1F1F8 U+1F1F1', '2018-07-21 01:41:03', '2021-12-11 19:11:06', 1, 'Q1044'),
(199, 'Singapore', 'SGP', '702', 'SG', '65', 'Singapur', 'SGD', 'Singapore dollar', '$', '.sg', 'Singapore', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Singapore\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"SGT\",\"tzName\":\"Singapore Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Singapura\",\"pt\":\"Singapura\",\"nl\":\"Singapore\",\"hr\":\"Singapur\",\"fa\":\"??????????????\",\"de\":\"Singapur\",\"es\":\"Singapur\",\"fr\":\"Singapour\",\"ja\":\"??????????????????\",\"it\":\"Singapore\",\"cn\":\"?????????\"}', '1.36666666', '103.80000000', '????????', 'U+1F1F8 U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 19:11:12', 1, 'Q334'),
(200, 'Slovakia', 'SVK', '703', 'SK', '421', 'Bratislava', 'EUR', 'Euro', '???', '.sk', 'Slovensko', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Bratislava\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Eslov??quia\",\"pt\":\"Eslov??quia\",\"nl\":\"Slowakije\",\"hr\":\"Slova??ka\",\"fa\":\"??????????????\",\"de\":\"Slowakei\",\"es\":\"Rep??blica Eslovaca\",\"fr\":\"Slovaquie\",\"ja\":\"???????????????\",\"it\":\"Slovacchia\",\"cn\":\"????????????\"}', '48.66666666', '19.50000000', '????????', 'U+1F1F8 U+1F1F0', '2018-07-21 01:41:03', '2021-12-11 19:07:01', 1, 'Q214'),
(201, 'Slovenia', 'SVN', '705', 'SI', '386', 'Ljubljana', 'EUR', 'Euro', '???', '.si', 'Slovenija', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Ljubljana\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Eslov??nia\",\"pt\":\"Eslov??nia\",\"nl\":\"Sloveni??\",\"hr\":\"Slovenija\",\"fa\":\"??????????????\",\"de\":\"Slowenien\",\"es\":\"Eslovenia\",\"fr\":\"Slov??nie\",\"ja\":\"???????????????\",\"it\":\"Slovenia\",\"cn\":\"???????????????\"}', '46.11666666', '14.81666666', '????????', 'U+1F1F8 U+1F1EE', '2018-07-21 01:41:03', '2021-12-11 19:07:05', 1, 'Q215'),
(202, 'Solomon Islands', 'SLB', '090', 'SB', '677', 'Honiara', 'SBD', 'Solomon Islands dollar', 'Si$', '.sb', 'Solomon Islands', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Guadalcanal\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"SBT\",\"tzName\":\"Solomon Islands Time\"}]', '{\"kr\":\"????????? ??????\",\"br\":\"Ilhas Salom??o\",\"pt\":\"Ilhas Salom??o\",\"nl\":\"Salomonseilanden\",\"hr\":\"Solomonski Otoci\",\"fa\":\"?????????? ????????????\",\"de\":\"Salomonen\",\"es\":\"Islas Salom??n\",\"fr\":\"??les Salomon\",\"ja\":\"??????????????????\",\"it\":\"Isole Salomone\",\"cn\":\"???????????????\"}', '-8.00000000', '159.00000000', '????????', 'U+1F1F8 U+1F1E7', '2018-07-21 01:41:03', '2021-12-11 19:11:36', 1, 'Q685'),
(203, 'Somalia', 'SOM', '706', 'SO', '252', 'Mogadishu', 'SOS', 'Somali shilling', 'Sh.so.', '.so', 'Soomaaliya', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Mogadishu\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Som??lia\",\"pt\":\"Som??lia\",\"nl\":\"Somali??\",\"hr\":\"Somalija\",\"fa\":\"????????????\",\"de\":\"Somalia\",\"es\":\"Somalia\",\"fr\":\"Somalie\",\"ja\":\"????????????\",\"it\":\"Somalia\",\"cn\":\"?????????\"}', '10.00000000', '49.00000000', '????????', 'U+1F1F8 U+1F1F4', '2018-07-21 01:41:03', '2021-12-11 19:11:41', 1, 'Q1045'),
(204, 'South Africa', 'ZAF', '710', 'ZA', '27', 'Pretoria', 'ZAR', 'South African rand', 'R', '.za', 'South Africa', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Johannesburg\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"SAST\",\"tzName\":\"South African Standard Time\"}]', '{\"kr\":\"??????????????? ?????????\",\"br\":\"Rep??blica Sul-Africana\",\"pt\":\"Rep??blica Sul-Africana\",\"nl\":\"Zuid-Afrika\",\"hr\":\"Ju??noafri??ka Republika\",\"fa\":\"?????????????? ??????????\",\"de\":\"Republik S??dafrika\",\"es\":\"Rep??blica de Sud??frica\",\"fr\":\"Afrique du Sud\",\"ja\":\"???????????????\",\"it\":\"Sud Africa\",\"cn\":\"??????\"}', '-29.00000000', '24.00000000', '????????', 'U+1F1FF U+1F1E6', '2018-07-21 01:41:03', '2021-12-11 19:11:49', 1, 'Q258'),
(205, 'South Georgia', 'SGS', '239', 'GS', '500', 'Grytviken', 'GBP', 'British pound', '??', '.gs', 'South Georgia', 'Americas', 'South America', '[{\"zoneName\":\"Atlantic/South_Georgia\",\"gmtOffset\":-7200,\"gmtOffsetName\":\"UTC-02:00\",\"abbreviation\":\"GST\",\"tzName\":\"South Georgia and the South Sandwich Islands Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Ilhas Ge??rgias do Sul e Sandwich do Sul\",\"pt\":\"Ilhas Ge??rgia do Sul e Sandu??che do Sul\",\"nl\":\"Zuid-Georgia en Zuidelijke Sandwicheilanden\",\"hr\":\"Ju??na Georgija i oto??je Ju??ni Sandwich\",\"fa\":\"?????????? ?????????????? ?????????? ?? ?????????????? ??????????\",\"de\":\"S??dgeorgien und die S??dlichen Sandwichinseln\",\"es\":\"Islas Georgias del Sur y Sandwich del Sur\",\"fr\":\"G??orgie du Sud-et-les ??les Sandwich du Sud\",\"ja\":\"???????????????????????????????????????????????????????????????\",\"it\":\"Georgia del Sud e Isole Sandwich Meridionali\",\"cn\":\"????????????\"}', '-54.50000000', '-37.00000000', '????????', 'U+1F1EC U+1F1F8', '2018-07-21 01:41:03', '2021-12-11 19:06:45', 1, NULL),
(206, 'South Sudan', 'SSD', '728', 'SS', '211', 'Juba', 'SSP', 'South Sudanese pound', '??', '.ss', 'South Sudan', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Juba\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Sud??o do Sul\",\"pt\":\"Sud??o do Sul\",\"nl\":\"Zuid-Soedan\",\"hr\":\"Ju??ni Sudan\",\"fa\":\"?????????? ??????????\",\"de\":\"S??dsudan\",\"es\":\"Sud??n del Sur\",\"fr\":\"Soudan du Sud\",\"ja\":\"???????????????\",\"it\":\"Sudan del sud\",\"cn\":\"?????????\"}', '7.00000000', '30.00000000', '????????', 'U+1F1F8 U+1F1F8', '2018-07-21 01:41:03', '2021-12-11 19:12:25', 1, 'Q958'),
(207, 'Spain', 'ESP', '724', 'ES', '34', 'Madrid', 'EUR', 'Euro', '???', '.es', 'Espa??a', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Africa/Ceuta\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"},{\"zoneName\":\"Atlantic/Canary\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"},{\"zoneName\":\"Europe/Madrid\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Espanha\",\"pt\":\"Espanha\",\"nl\":\"Spanje\",\"hr\":\"??panjolska\",\"fa\":\"??????????????\",\"de\":\"Spanien\",\"es\":\"Espa??a\",\"fr\":\"Espagne\",\"ja\":\"????????????\",\"it\":\"Spagna\",\"cn\":\"?????????\"}', '40.00000000', '-4.00000000', '????????', 'U+1F1EA U+1F1F8', '2018-07-21 01:41:03', '2021-12-11 19:02:30', 1, 'Q29'),
(208, 'Sri Lanka', 'LKA', '144', 'LK', '94', 'Colombo', 'LKR', 'Sri Lankan rupee', 'Rs', '.lk', '??r?? la???k??va', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Colombo\",\"gmtOffset\":19800,\"gmtOffsetName\":\"UTC+05:30\",\"abbreviation\":\"IST\",\"tzName\":\"Indian Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Sri Lanka\",\"pt\":\"Sri Lanka\",\"nl\":\"Sri Lanka\",\"hr\":\"??ri Lanka\",\"fa\":\"???????????????????\",\"de\":\"Sri Lanka\",\"es\":\"Sri Lanka\",\"fr\":\"Sri Lanka\",\"ja\":\"???????????????\",\"it\":\"Sri Lanka\",\"cn\":\"????????????\"}', '7.00000000', '81.00000000', '????????', 'U+1F1F1 U+1F1F0', '2018-07-21 01:41:03', '2021-12-11 19:12:30', 1, 'Q854'),
(209, 'Sudan', 'SDN', '729', 'SD', '249', 'Khartoum', 'SDG', 'Sudanese pound', '.??.??', '.sd', '??????????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Khartoum\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EAT\",\"tzName\":\"Eastern African Time\"}]', '{\"kr\":\"??????\",\"br\":\"Sud??o\",\"pt\":\"Sud??o\",\"nl\":\"Soedan\",\"hr\":\"Sudan\",\"fa\":\"??????????\",\"de\":\"Sudan\",\"es\":\"Sud??n\",\"fr\":\"Soudan\",\"ja\":\"????????????\",\"it\":\"Sudan\",\"cn\":\"??????\"}', '15.00000000', '30.00000000', '????????', 'U+1F1F8 U+1F1E9', '2018-07-21 01:41:03', '2021-12-11 19:12:35', 1, 'Q1049'),
(210, 'Suriname', 'SUR', '740', 'SR', '597', 'Paramaribo', 'SRD', 'Surinamese dollar', '$', '.sr', 'Suriname', 'Americas', 'South America', '[{\"zoneName\":\"America/Paramaribo\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"SRT\",\"tzName\":\"Suriname Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Suriname\",\"pt\":\"Suriname\",\"nl\":\"Suriname\",\"hr\":\"Surinam\",\"fa\":\"??????????????\",\"de\":\"Suriname\",\"es\":\"Surinam\",\"fr\":\"Surinam\",\"ja\":\"????????????\",\"it\":\"Suriname\",\"cn\":\"?????????\"}', '4.00000000', '-56.00000000', '????????', 'U+1F1F8 U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 19:12:40', 1, 'Q730'),
(211, 'Svalbard And Jan Mayen Islands', 'SJM', '744', 'SJ', '47', 'Longyearbyen', 'NOK', 'Norwegian Krone', 'kr', '.sj', 'Svalbard og Jan Mayen', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Arctic/Longyearbyen\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"???????????? ????????? ??????\",\"br\":\"Svalbard\",\"pt\":\"Svalbard\",\"nl\":\"Svalbard en Jan Mayen\",\"hr\":\"Svalbard i Jan Mayen\",\"fa\":\"???????????????? ?? ?????? ????????\",\"de\":\"Svalbard und Jan Mayen\",\"es\":\"Islas Svalbard y Jan Mayen\",\"fr\":\"Svalbard et Jan Mayen\",\"ja\":\"?????????????????????????????????????????????????????????\",\"it\":\"Svalbard e Jan Mayen\",\"cn\":\"??????????????????????????????\"}', '78.00000000', '20.00000000', '????????', 'U+1F1F8 U+1F1EF', '2018-07-21 01:41:03', '2021-12-11 19:12:54', 1, NULL),
(212, 'Swaziland', 'SWZ', '748', 'SZ', '268', 'Mbabane', 'SZL', 'Lilangeni', 'E', '.sz', 'Swaziland', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Mbabane\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"SAST\",\"tzName\":\"South African Standard Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Suazil??ndia\",\"pt\":\"Suazil??ndia\",\"nl\":\"Swaziland\",\"hr\":\"Svazi\",\"fa\":\"????????????????\",\"de\":\"Swasiland\",\"es\":\"Suazilandia\",\"fr\":\"Swaziland\",\"ja\":\"??????????????????\",\"it\":\"Swaziland\",\"cn\":\"????????????\"}', '-26.50000000', '31.50000000', '????????', 'U+1F1F8 U+1F1FF', '2018-07-21 01:41:03', '2021-12-11 19:13:12', 1, 'Q1050'),
(213, 'Sweden', 'SWE', '752', 'SE', '46', 'Stockholm', 'SEK', 'Swedish krona', 'kr', '.se', 'Sverige', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Stockholm\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Su??cia\",\"pt\":\"Su??cia\",\"nl\":\"Zweden\",\"hr\":\"??vedska\",\"fa\":\"????????\",\"de\":\"Schweden\",\"es\":\"Suecia\",\"fr\":\"Su??de\",\"ja\":\"??????????????????\",\"it\":\"Svezia\",\"cn\":\"??????\"}', '62.00000000', '15.00000000', '????????', 'U+1F1F8 U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 19:13:24', 1, 'Q34'),
(214, 'Switzerland', 'CHE', '756', 'CH', '41', 'Bern', 'CHF', 'Swiss franc', 'CHf', '.ch', 'Schweiz', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Zurich\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Su????a\",\"pt\":\"Su????a\",\"nl\":\"Zwitserland\",\"hr\":\"??vicarska\",\"fa\":\"??????????\",\"de\":\"Schweiz\",\"es\":\"Suiza\",\"fr\":\"Suisse\",\"ja\":\"?????????\",\"it\":\"Svizzera\",\"cn\":\"??????\"}', '47.00000000', '8.00000000', '????????', 'U+1F1E8 U+1F1ED', '2018-07-21 01:41:03', '2021-12-11 19:13:31', 1, 'Q39'),
(215, 'Syria', 'SYR', '760', 'SY', '963', 'Damascus', 'SYP', 'Syrian pound', 'LS', '.sy', '??????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Damascus\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"S??ria\",\"pt\":\"S??ria\",\"nl\":\"Syri??\",\"hr\":\"Sirija\",\"fa\":\"??????????\",\"de\":\"Syrien\",\"es\":\"Siria\",\"fr\":\"Syrie\",\"ja\":\"??????????????????????????????\",\"it\":\"Siria\",\"cn\":\"?????????\"}', '35.00000000', '38.00000000', '????????', 'U+1F1F8 U+1F1FE', '2018-07-21 01:41:03', '2021-12-11 19:13:36', 1, 'Q858'),
(216, 'Taiwan', 'TWN', '158', 'TW', '886', 'Taipei', 'TWD', 'New Taiwan dollar', '$', '.tw', '??????', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Taipei\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CST\",\"tzName\":\"China Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"Taiwan\",\"pt\":\"Taiwan\",\"nl\":\"Taiwan\",\"hr\":\"Tajvan\",\"fa\":\"????????????\",\"de\":\"Taiwan\",\"es\":\"Taiw??n\",\"fr\":\"Ta??wan\",\"ja\":\"????????????????????????\",\"it\":\"Taiwan\",\"cn\":\"????????????\"}', '23.50000000', '121.00000000', '????????', 'U+1F1F9 U+1F1FC', '2018-07-21 01:41:03', '2021-12-11 19:13:41', 1, 'Q865'),
(217, 'Tajikistan', 'TJK', '762', 'TJ', '992', 'Dushanbe', 'TJS', 'Tajikistani somoni', 'SM', '.tj', '????????????????????', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Dushanbe\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TJT\",\"tzName\":\"Tajikistan Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Tajiquist??o\",\"pt\":\"Tajiquist??o\",\"nl\":\"Tadzjikistan\",\"hr\":\"Ta??ikistan\",\"fa\":\"??????????????????\",\"de\":\"Tadschikistan\",\"es\":\"Tayikist??n\",\"fr\":\"Tadjikistan\",\"ja\":\"??????????????????\",\"it\":\"Tagikistan\",\"cn\":\"???????????????\"}', '39.00000000', '71.00000000', '????????', 'U+1F1F9 U+1F1EF', '2018-07-21 01:41:03', '2021-12-11 19:13:46', 1, 'Q863'),
(218, 'Tanzania', 'TZA', '834', 'TZ', '255', 'Dodoma', 'TZS', 'Tanzanian shilling', 'TSh', '.tz', 'Tanzania', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Dar_es_Salaam\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Tanz??nia\",\"pt\":\"Tanz??nia\",\"nl\":\"Tanzania\",\"hr\":\"Tanzanija\",\"fa\":\"????????????????\",\"de\":\"Tansania\",\"es\":\"Tanzania\",\"fr\":\"Tanzanie\",\"ja\":\"???????????????\",\"it\":\"Tanzania\",\"cn\":\"????????????\"}', '-6.00000000', '35.00000000', '????????', 'U+1F1F9 U+1F1FF', '2018-07-21 01:41:03', '2021-12-11 19:13:57', 1, 'Q924'),
(219, 'Thailand', 'THA', '764', 'TH', '66', 'Bangkok', 'THB', 'Thai baht', '???', '.th', '???????????????????????????', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Bangkok\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]', '{\"kr\":\"??????\",\"br\":\"Tail??ndia\",\"pt\":\"Tail??ndia\",\"nl\":\"Thailand\",\"hr\":\"Tajland\",\"fa\":\"????????????\",\"de\":\"Thailand\",\"es\":\"Tailandia\",\"fr\":\"Tha??lande\",\"ja\":\"??????\",\"it\":\"Tailandia\",\"cn\":\"??????\"}', '15.00000000', '100.00000000', '????????', 'U+1F1F9 U+1F1ED', '2018-07-21 01:41:03', '2021-12-11 19:14:06', 1, 'Q869'),
(220, 'Togo', 'TGO', '768', 'TG', '228', 'Lome', 'XOF', 'West African CFA franc', 'CFA', '.tg', 'Togo', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Lome\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????\",\"br\":\"Togo\",\"pt\":\"Togo\",\"nl\":\"Togo\",\"hr\":\"Togo\",\"fa\":\"????????\",\"de\":\"Togo\",\"es\":\"Togo\",\"fr\":\"Togo\",\"ja\":\"?????????\",\"it\":\"Togo\",\"cn\":\"??????\"}', '8.00000000', '1.16666666', '????????', 'U+1F1F9 U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 19:14:14', 1, 'Q945'),
(221, 'Tokelau', 'TKL', '772', 'TK', '690', '', 'NZD', 'New Zealand dollar', '$', '.tk', 'Tokelau', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Fakaofo\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"TKT\",\"tzName\":\"Tokelau Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Tokelau\",\"pt\":\"Toquelau\",\"nl\":\"Tokelau\",\"hr\":\"Tokelau\",\"fa\":\"??????????????\",\"de\":\"Tokelau\",\"es\":\"Islas Tokelau\",\"fr\":\"Tokelau\",\"ja\":\"????????????\",\"it\":\"Isole Tokelau\",\"cn\":\"?????????\"}', '-9.00000000', '-172.00000000', '????????', 'U+1F1F9 U+1F1F0', '2018-07-21 01:41:03', '2021-12-11 19:14:33', 1, NULL),
(222, 'Tonga', 'TON', '776', 'TO', '676', 'Nuku\'alofa', 'TOP', 'Tongan pa??anga', '$', '.to', 'Tonga', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Tongatapu\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"TOT\",\"tzName\":\"Tonga Time\"}]', '{\"kr\":\"??????\",\"br\":\"Tonga\",\"pt\":\"Tonga\",\"nl\":\"Tonga\",\"hr\":\"Tonga\",\"fa\":\"??????????\",\"de\":\"Tonga\",\"es\":\"Tonga\",\"fr\":\"Tonga\",\"ja\":\"?????????\",\"it\":\"Tonga\",\"cn\":\"??????\"}', '-20.00000000', '-175.00000000', '????????', 'U+1F1F9 U+1F1F4', '2018-07-21 01:41:03', '2021-12-11 19:14:44', 1, 'Q678'),
(223, 'Trinidad And Tobago', 'TTO', '780', 'TT', '+1-868', 'Port of Spain', 'TTD', 'Trinidad and Tobago dollar', '$', '.tt', 'Trinidad and Tobago', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Port_of_Spain\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"??????????????? ?????????\",\"br\":\"Trinidad e Tobago\",\"pt\":\"Trindade e Tobago\",\"nl\":\"Trinidad en Tobago\",\"hr\":\"Trinidad i Tobago\",\"fa\":\"???????????????? ?? ????????????\",\"de\":\"Trinidad und Tobago\",\"es\":\"Trinidad y Tobago\",\"fr\":\"Trinit?? et Tobago\",\"ja\":\"??????????????????????????????\",\"it\":\"Trinidad e Tobago\",\"cn\":\"????????????????????????\"}', '11.00000000', '-61.00000000', '????????', 'U+1F1F9 U+1F1F9', '2018-07-21 01:41:03', '2021-12-11 19:14:51', 1, 'Q754'),
(224, 'Tunisia', 'TUN', '788', 'TN', '216', 'Tunis', 'TND', 'Tunisian dinar', '??.??', '.tn', '????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Tunis\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Tun??sia\",\"pt\":\"Tun??sia\",\"nl\":\"Tunesi??\",\"hr\":\"Tunis\",\"fa\":\"????????\",\"de\":\"Tunesien\",\"es\":\"T??nez\",\"fr\":\"Tunisie\",\"ja\":\"???????????????\",\"it\":\"Tunisia\",\"cn\":\"?????????\"}', '34.00000000', '9.00000000', '????????', 'U+1F1F9 U+1F1F3', '2018-07-21 01:41:03', '2021-12-11 19:15:00', 1, 'Q948'),
(225, 'Turkey', 'TUR', '792', 'TR', '90', 'Ankara', 'TRY', 'Turkish lira', '???', '.tr', 'T??rkiye', 'Asia', 'Western Asia', '[{\"zoneName\":\"Europe/Istanbul\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"??????\",\"br\":\"Turquia\",\"pt\":\"Turquia\",\"nl\":\"Turkije\",\"hr\":\"Turska\",\"fa\":\"??????????\",\"de\":\"T??rkei\",\"es\":\"Turqu??a\",\"fr\":\"Turquie\",\"ja\":\"?????????\",\"it\":\"Turchia\",\"cn\":\"?????????\"}', '39.00000000', '35.00000000', '????????', 'U+1F1F9 U+1F1F7', '2018-07-21 01:41:03', '2021-12-11 19:15:05', 1, 'Q43'),
(226, 'Turkmenistan', 'TKM', '795', 'TM', '993', 'Ashgabat', 'TMT', 'Turkmenistan manat', 'T', '.tm', 'T??rkmenistan', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Ashgabat\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TMT\",\"tzName\":\"Turkmenistan Time\"}]', '{\"kr\":\"?????????????????????\",\"br\":\"Turcomenist??o\",\"pt\":\"Turquemenist??o\",\"nl\":\"Turkmenistan\",\"hr\":\"Turkmenistan\",\"fa\":\"??????????????????\",\"de\":\"Turkmenistan\",\"es\":\"Turkmenist??n\",\"fr\":\"Turkm??nistan\",\"ja\":\"????????????????????????\",\"it\":\"Turkmenistan\",\"cn\":\"???????????????\"}', '40.00000000', '60.00000000', '????????', 'U+1F1F9 U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 19:15:10', 1, 'Q874'),
(227, 'Turks And Caicos Islands', 'TCA', '796', 'TC', '+1-649', 'Cockburn Town', 'USD', 'United States dollar', '$', '.tc', 'Turks and Caicos Islands', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Grand_Turk\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"????????? ???????????? ??????\",\"br\":\"Ilhas Turcas e Caicos\",\"pt\":\"Ilhas Turcas e Caicos\",\"nl\":\"Turks- en Caicoseilanden\",\"hr\":\"Otoci Turks i Caicos\",\"fa\":\"?????????? ?????????? ?? ????????????\",\"de\":\"Turks- und Caicosinseln\",\"es\":\"Islas Turks y Caicos\",\"fr\":\"??les Turques-et-Ca??ques\",\"ja\":\"?????????????????????????????????\",\"it\":\"Isole Turks e Caicos\",\"cn\":\"???????????????????????????\"}', '21.75000000', '-71.58333333', '????????', 'U+1F1F9 U+1F1E8', '2018-07-21 01:41:03', '2021-12-11 19:06:26', 1, NULL),
(228, 'Tuvalu', 'TUV', '798', 'TV', '688', 'Funafuti', 'AUD', 'Australian dollar', '$', '.tv', 'Tuvalu', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Funafuti\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"TVT\",\"tzName\":\"Tuvalu Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Tuvalu\",\"pt\":\"Tuvalu\",\"nl\":\"Tuvalu\",\"hr\":\"Tuvalu\",\"fa\":\"????????????\",\"de\":\"Tuvalu\",\"es\":\"Tuvalu\",\"fr\":\"Tuvalu\",\"ja\":\"?????????\",\"it\":\"Tuvalu\",\"cn\":\"?????????\"}', '-8.00000000', '178.00000000', '????????', 'U+1F1F9 U+1F1FB', '2018-07-21 01:41:03', '2021-12-11 19:07:37', 1, 'Q672'),
(229, 'Uganda', 'UGA', '800', 'UG', '256', 'Kampala', 'UGX', 'Ugandan shilling', 'USh', '.ug', 'Uganda', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Kampala\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Uganda\",\"pt\":\"Uganda\",\"nl\":\"Oeganda\",\"hr\":\"Uganda\",\"fa\":\"??????????????\",\"de\":\"Uganda\",\"es\":\"Uganda\",\"fr\":\"Uganda\",\"ja\":\"????????????\",\"it\":\"Uganda\",\"cn\":\"?????????\"}', '1.00000000', '32.00000000', '????????', 'U+1F1FA U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 19:15:17', 1, 'Q1036'),
(230, 'Ukraine', 'UKR', '804', 'UA', '380', 'Kiev', 'UAH', 'Ukrainian hryvnia', '???', '.ua', '??????????????', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Kiev\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Europe/Simferopol\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"},{\"zoneName\":\"Europe/Uzhgorod\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Europe/Zaporozhye\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Ucr??nia\",\"pt\":\"Ucr??nia\",\"nl\":\"Oekra??ne\",\"hr\":\"Ukrajina\",\"fa\":\"????????????\",\"de\":\"Ukraine\",\"es\":\"Ucrania\",\"fr\":\"Ukraine\",\"ja\":\"???????????????\",\"it\":\"Ucraina\",\"cn\":\"?????????\"}', '49.00000000', '32.00000000', '????????', 'U+1F1FA U+1F1E6', '2018-07-21 01:41:03', '2021-12-11 19:15:22', 1, 'Q212'),
(231, 'United Arab Emirates', 'ARE', '784', 'AE', '971', 'Abu Dhabi', 'AED', 'United Arab Emirates dirham', '??.??', '.ae', '???????? ???????????????? ?????????????? ??????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Dubai\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"GST\",\"tzName\":\"Gulf Standard Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Emirados ??rabes Unidos\",\"pt\":\"Emirados ??rabes Unidos\",\"nl\":\"Verenigde Arabische Emiraten\",\"hr\":\"Ujedinjeni Arapski Emirati\",\"fa\":\"???????????? ?????????? ????????\",\"de\":\"Vereinigte Arabische Emirate\",\"es\":\"Emiratos ??rabes Unidos\",\"fr\":\"??mirats arabes unis\",\"ja\":\"????????????????????????\",\"it\":\"Emirati Arabi Uniti\",\"cn\":\"????????????????????????\"}', '24.00000000', '54.00000000', '????????', 'U+1F1E6 U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 19:15:29', 1, 'Q878'),
(232, 'United Kingdom', 'GBR', '826', 'GB', '44', 'London', 'GBP', 'British pound', '??', '.uk', 'United Kingdom', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/London\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC??00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"??????\",\"br\":\"Reino Unido\",\"pt\":\"Reino Unido\",\"nl\":\"Verenigd Koninkrijk\",\"hr\":\"Ujedinjeno Kraljevstvo\",\"fa\":\"?????????????????? ???????? ?? ???????????? ??????????\",\"de\":\"Vereinigtes K??nigreich\",\"es\":\"Reino Unido\",\"fr\":\"Royaume-Uni\",\"ja\":\"????????????\",\"it\":\"Regno Unito\",\"cn\":\"??????\"}', '54.00000000', '-2.00000000', '????????', 'U+1F1EC U+1F1E7', '2018-07-21 01:41:03', '2021-12-11 19:07:13', 1, 'Q145'),
(233, 'United States', 'USA', '840', 'US', '1', 'Washington', 'USD', 'United States dollar', '$', '.us', 'United States', 'Americas', 'Northern America', '[{\"zoneName\":\"America/Adak\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"HST\",\"tzName\":\"Hawaii???Aleutian Standard Time\"},{\"zoneName\":\"America/Anchorage\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/Boise\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Chicago\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Denver\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Detroit\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Indianapolis\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Knox\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Marengo\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Petersburg\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Tell_City\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Vevay\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Vincennes\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Winamac\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Juneau\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/Kentucky/Louisville\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Kentucky/Monticello\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Los_Angeles\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"},{\"zoneName\":\"America/Menominee\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Metlakatla\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/New_York\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Nome\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/North_Dakota/Beulah\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/North_Dakota/Center\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/North_Dakota/New_Salem\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Phoenix\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Sitka\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/Yakutat\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"Pacific/Honolulu\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"HST\",\"tzName\":\"Hawaii???Aleutian Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"Estados Unidos\",\"pt\":\"Estados Unidos\",\"nl\":\"Verenigde Staten\",\"hr\":\"Sjedinjene Ameri??ke Dr??ave\",\"fa\":\"???????????? ?????????? ????????????\",\"de\":\"Vereinigte Staaten von Amerika\",\"es\":\"Estados Unidos\",\"fr\":\"??tats-Unis\",\"ja\":\"?????????????????????\",\"it\":\"Stati Uniti D\'America\",\"cn\":\"??????\"}', '38.00000000', '-97.00000000', '????????', 'U+1F1FA U+1F1F8', '2018-07-21 01:41:03', '2021-12-11 19:06:28', 1, 'Q30'),
(234, 'United States Minor Outlying Islands', 'UMI', '581', 'UM', '1', '', 'USD', 'United States dollar', '$', '.us', 'United States Minor Outlying Islands', 'Americas', 'Northern America', '[{\"zoneName\":\"Pacific/Midway\",\"gmtOffset\":-39600,\"gmtOffsetName\":\"UTC-11:00\",\"abbreviation\":\"SST\",\"tzName\":\"Samoa Standard Time\"},{\"zoneName\":\"Pacific/Wake\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"WAKT\",\"tzName\":\"Wake Island Time\"}]', '{\"kr\":\"????????? ?????? ??????\",\"br\":\"Ilhas Menores Distantes dos Estados Unidos\",\"pt\":\"Ilhas Menores Distantes dos Estados Unidos\",\"nl\":\"Kleine afgelegen eilanden van de Verenigde Staten\",\"hr\":\"Mali udaljeni otoci SAD-a\",\"fa\":\"?????????? ???????? ????????????????? ???????????? ?????????? ????????????\",\"de\":\"Kleinere Inselbesitzungen der Vereinigten Staaten\",\"es\":\"Islas Ultramarinas Menores de Estados Unidos\",\"fr\":\"??les mineures ??loign??es des ??tats-Unis\",\"ja\":\"????????????????????????\",\"it\":\"Isole minori esterne degli Stati Uniti d\'America\",\"cn\":\"????????????????????????\"}', '0.00000000', '0.00000000', '????????', 'U+1F1FA U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 19:06:30', 1, NULL),
(235, 'Uruguay', 'URY', '858', 'UY', '598', 'Montevideo', 'UYU', 'Uruguayan peso', '$', '.uy', 'Uruguay', 'Americas', 'South America', '[{\"zoneName\":\"America/Montevideo\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"UYT\",\"tzName\":\"Uruguay Standard Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Uruguai\",\"pt\":\"Uruguai\",\"nl\":\"Uruguay\",\"hr\":\"Urugvaj\",\"fa\":\"??????????????\",\"de\":\"Uruguay\",\"es\":\"Uruguay\",\"fr\":\"Uruguay\",\"ja\":\"???????????????\",\"it\":\"Uruguay\",\"cn\":\"?????????\"}', '-33.00000000', '-56.00000000', '????????', 'U+1F1FA U+1F1FE', '2018-07-21 01:41:03', '2021-12-11 19:15:36', 1, 'Q77'),
(236, 'Uzbekistan', 'UZB', '860', 'UZ', '998', 'Tashkent', 'UZS', 'Uzbekistani so??m', '????', '.uz', 'O???zbekiston', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Samarkand\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"UZT\",\"tzName\":\"Uzbekistan Time\"},{\"zoneName\":\"Asia/Tashkent\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"UZT\",\"tzName\":\"Uzbekistan Time\"}]', '{\"kr\":\"??????????????????\",\"br\":\"Uzbequist??o\",\"pt\":\"Usbequist??o\",\"nl\":\"Oezbekistan\",\"hr\":\"Uzbekistan\",\"fa\":\"????????????????\",\"de\":\"Usbekistan\",\"es\":\"Uzbekist??n\",\"fr\":\"Ouzb??kistan\",\"ja\":\"?????????????????????\",\"it\":\"Uzbekistan\",\"cn\":\"??????????????????\"}', '41.00000000', '64.00000000', '????????', 'U+1F1FA U+1F1FF', '2018-07-21 01:41:03', '2021-12-11 19:15:40', 1, 'Q265'),
(237, 'Vanuatu', 'VUT', '548', 'VU', '678', 'Port Vila', 'VUV', 'Vanuatu vatu', 'VT', '.vu', 'Vanuatu', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Efate\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"VUT\",\"tzName\":\"Vanuatu Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Vanuatu\",\"pt\":\"Vanuatu\",\"nl\":\"Vanuatu\",\"hr\":\"Vanuatu\",\"fa\":\"??????????????\",\"de\":\"Vanuatu\",\"es\":\"Vanuatu\",\"fr\":\"Vanuatu\",\"ja\":\"????????????\",\"it\":\"Vanuatu\",\"cn\":\"????????????\"}', '-16.00000000', '167.00000000', '????????', 'U+1F1FB U+1F1FA', '2018-07-21 01:41:03', '2021-12-11 19:15:47', 1, 'Q686'),
(238, 'Vatican City State (Holy See)', 'VAT', '336', 'VA', '379', 'Vatican City', 'EUR', 'Euro', '???', '.va', 'Vaticano', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Vatican\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"????????? ??????\",\"br\":\"Vaticano\",\"pt\":\"Vaticano\",\"nl\":\"Heilige Stoel\",\"hr\":\"Sveta Stolica\",\"fa\":\"???????? ????????\",\"de\":\"Heiliger Stuhl\",\"es\":\"Santa Sede\",\"fr\":\"voir Saint\",\"ja\":\"??????\",\"it\":\"Santa Sede\",\"cn\":\"?????????\"}', '41.90000000', '12.45000000', '????????', 'U+1F1FB U+1F1E6', '2018-07-21 01:41:03', '2021-12-11 19:02:24', 1, 'Q237'),
(239, 'Venezuela', 'VEN', '862', 'VE', '58', 'Caracas', 'VEF', 'Bol??var', 'Bs', '.ve', 'Venezuela', 'Americas', 'South America', '[{\"zoneName\":\"America/Caracas\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"VET\",\"tzName\":\"Venezuelan Standard Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Venezuela\",\"pt\":\"Venezuela\",\"nl\":\"Venezuela\",\"hr\":\"Venezuela\",\"fa\":\"??????????????\",\"de\":\"Venezuela\",\"es\":\"Venezuela\",\"fr\":\"Venezuela\",\"ja\":\"???????????????????????????????????????\",\"it\":\"Venezuela\",\"cn\":\"????????????\"}', '8.00000000', '-66.00000000', '????????', 'U+1F1FB U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 19:16:04', 1, 'Q717'),
(240, 'Vietnam', 'VNM', '704', 'VN', '84', 'Hanoi', 'VND', 'Vietnamese ?????ng', '???', '.vn', 'Vi???t Nam', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Ho_Chi_Minh\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Vietn??\",\"pt\":\"Vietname\",\"nl\":\"Vietnam\",\"hr\":\"Vijetnam\",\"fa\":\"????????????\",\"de\":\"Vietnam\",\"es\":\"Vietnam\",\"fr\":\"Vi??t Nam\",\"ja\":\"????????????\",\"it\":\"Vietnam\",\"cn\":\"??????\"}', '16.16666666', '107.83333333', '????????', 'U+1F1FB U+1F1F3', '2018-07-21 01:41:03', '2021-12-11 19:16:14', 1, 'Q881'),
(241, 'Virgin Islands (British)', 'VGB', '092', 'VG', '+1-284', 'Road Town', 'USD', 'United States dollar', '$', '.vg', 'British Virgin Islands', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Tortola\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????? ??????????????????\",\"br\":\"Ilhas Virgens Brit??nicas\",\"pt\":\"Ilhas Virgens Brit??nicas\",\"nl\":\"Britse Maagdeneilanden\",\"hr\":\"Britanski Djevi??anski Otoci\",\"fa\":\"?????????? ???????????? ????????????????\",\"de\":\"Britische Jungferninseln\",\"es\":\"Islas V??rgenes del Reino Unido\",\"fr\":\"??les Vierges britanniques\",\"ja\":\"????????????????????????????????????\",\"it\":\"Isole Vergini Britanniche\",\"cn\":\"??????????????????????????????\"}', '18.43138300', '-64.62305000', '????????', 'U+1F1FB U+1F1EC', '2018-07-21 01:41:03', '2021-12-11 19:06:33', 1, NULL),
(242, 'Virgin Islands (US)', 'VIR', '850', 'VI', '+1-340', 'Charlotte Amalie', 'USD', 'United States dollar', '$', '.vi', 'United States Virgin Islands', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Thomas\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"????????? ??????????????????\",\"br\":\"Ilhas Virgens Americanas\",\"pt\":\"Ilhas Virgens Americanas\",\"nl\":\"Verenigde Staten Maagdeneilanden\",\"fa\":\"?????????? ???????????? ????????????\",\"de\":\"Amerikanische Jungferninseln\",\"es\":\"Islas V??rgenes de los Estados Unidos\",\"fr\":\"??les Vierges des ??tats-Unis\",\"ja\":\"????????????????????????????????????\",\"it\":\"Isole Vergini americane\",\"cn\":\"???????????????????????????\"}', '18.34000000', '-64.93000000', '????????', 'U+1F1FB U+1F1EE', '2018-07-21 01:41:03', '2021-12-11 19:16:20', 1, NULL),
(243, 'Wallis And Futuna Islands', 'WLF', '876', 'WF', '681', 'Mata Utu', 'XPF', 'CFP franc', '???', '.wf', 'Wallis et Futuna', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Wallis\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"WFT\",\"tzName\":\"Wallis & Futuna Time\"}]', '{\"kr\":\"????????? ?????????\",\"br\":\"Wallis e Futuna\",\"pt\":\"Wallis e Futuna\",\"nl\":\"Wallis en Futuna\",\"hr\":\"Wallis i Fortuna\",\"fa\":\"?????????? ?? ????????????\",\"de\":\"Wallis und Futuna\",\"es\":\"Wallis y Futuna\",\"fr\":\"Wallis-et-Futuna\",\"ja\":\"????????????????????????\",\"it\":\"Wallis e Futuna\",\"cn\":\"?????????????????????????????????\"}', '-13.30000000', '-176.20000000', '????????', 'U+1F1FC U+1F1EB', '2018-07-21 01:41:03', '2021-12-11 19:16:25', 1, NULL),
(244, 'Western Sahara', 'ESH', '732', 'EH', '212', 'El-Aaiun', 'MAD', 'Moroccan Dirham', 'MAD', '.eh', '?????????????? ??????????????', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/El_Aaiun\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WEST\",\"tzName\":\"Western European Summer Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Saara Ocidental\",\"pt\":\"Saara Ocidental\",\"nl\":\"Westelijke Sahara\",\"hr\":\"Zapadna Sahara\",\"fa\":\"???????????? ?????????????????? ???????? ????????\",\"de\":\"Westsahara\",\"es\":\"Sahara Occidental\",\"fr\":\"Sahara Occidental\",\"ja\":\"????????????\",\"it\":\"Sahara Occidentale\",\"cn\":\"????????????\"}', '24.50000000', '-13.00000000', '????????', 'U+1F1EA U+1F1ED', '2018-07-21 01:41:03', '2021-12-11 19:16:40', 1, NULL),
(245, 'Yemen', 'YEM', '887', 'YE', '967', 'Sanaa', 'YER', 'Yemeni rial', '???', '.ye', '??????????????', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Aden\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"??????\",\"br\":\"I??men\",\"pt\":\"I??men\",\"nl\":\"Jemen\",\"hr\":\"Jemen\",\"fa\":\"??????\",\"de\":\"Jemen\",\"es\":\"Yemen\",\"fr\":\"Y??men\",\"ja\":\"????????????\",\"it\":\"Yemen\",\"cn\":\"??????\"}', '15.00000000', '48.00000000', '????????', 'U+1F1FE U+1F1EA', '2018-07-21 01:41:03', '2021-12-11 19:16:48', 1, 'Q805'),
(246, 'Zambia', 'ZMB', '894', 'ZM', '260', 'Lusaka', 'ZMW', 'Zambian kwacha', 'ZK', '.zm', 'Zambia', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Lusaka\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Z??mbia\",\"pt\":\"Z??mbia\",\"nl\":\"Zambia\",\"hr\":\"Zambija\",\"fa\":\"????????????\",\"de\":\"Sambia\",\"es\":\"Zambia\",\"fr\":\"Zambie\",\"ja\":\"????????????\",\"it\":\"Zambia\",\"cn\":\"?????????\"}', '-15.00000000', '30.00000000', '????????', 'U+1F1FF U+1F1F2', '2018-07-21 01:41:03', '2021-12-11 19:16:53', 1, 'Q953'),
(247, 'Zimbabwe', 'ZWE', '716', 'ZW', '263', 'Harare', 'ZWL', 'Zimbabwe Dollar', '$', '.zw', 'Zimbabwe', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Harare\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"????????????\",\"br\":\"Zimbabwe\",\"pt\":\"Zimbabu??\",\"nl\":\"Zimbabwe\",\"hr\":\"Zimbabve\",\"fa\":\"??????????????\",\"de\":\"Simbabwe\",\"es\":\"Zimbabue\",\"fr\":\"Zimbabwe\",\"ja\":\"???????????????\",\"it\":\"Zimbabwe\",\"cn\":\"????????????\"}', '-20.00000000', '30.00000000', '????????', 'U+1F1FF U+1F1FC', '2018-07-21 01:41:03', '2021-12-11 19:17:10', 1, 'Q954'),
(248, 'Kosovo', 'XKX', '926', 'XK', '383', 'Pristina', 'EUR', 'Euro', '???', '.xk', 'Republika e Kosov??s', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Belgrade\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"?????????\",\"cn\":\"?????????\"}', '42.56129090', '20.34030350', '????????', 'U+1F1FD U+1F1F0', '2020-08-15 21:03:50', '2021-12-11 18:56:38', 1, 'Q1246'),
(249, 'Cura??ao', 'CUW', '531', 'CW', '599', 'Willemstad', 'ANG', 'Netherlands Antillean guilder', '??', '.cw', 'Cura??ao', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Curacao\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"?????????\",\"br\":\"Cura??ao\",\"pt\":\"Cura??ao\",\"nl\":\"Cura??ao\",\"fa\":\"????????????????\",\"de\":\"Cura??ao\",\"fr\":\"Cura??ao\",\"it\":\"Cura??ao\",\"cn\":\"?????????\"}', '12.11666700', '-68.93333300', '????????', 'U+1F1E8 U+1F1FC', '2020-10-25 20:24:20', '2021-12-11 18:31:45', 1, 'Q25279'),
(250, 'Sint Maarten (Dutch part)', 'SXM', '534', 'SX', '1721', 'Philipsburg', 'ANG', 'Netherlands Antillean guilder', '??', '.sx', 'Sint Maarten', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Anguilla\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"???????????????\",\"br\":\"Sint Maarten\",\"pt\":\"S??o Martinho\",\"nl\":\"Sint Maarten\",\"fa\":\"???????? ??????????\",\"de\":\"Sint Maarten (niederl. Teil)\",\"fr\":\"Saint Martin (partie n??erlandaise)\",\"it\":\"Saint Martin (parte olandese)\",\"cn\":\"??????????????????????????????\"}', '18.03333300', '-63.05000000', '????????', 'U+1F1F8 U+1F1FD', '2020-12-05 18:33:39', '2021-12-11 19:11:24', 1, 'Q26273');

-- --------------------------------------------------------

--
-- Table structure for table `custom_notifications`
--

CREATE TABLE `custom_notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(2048) DEFAULT NULL,
  `message` varchar(4096) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custom_notifications`
--

INSERT INTO `custom_notifications` (`id`, `title`, `message`, `type`, `date_sent`) VALUES
(3, 'gggggggggggg', 'dddddddddddddd', 'settle_cashback_discount', '2022-11-28 10:08:35'),
(4, 'ASSx', 'SxZSx', 'place_order', '2022-11-29 11:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `product_ids` longtext NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `time_hours` int(11) NOT NULL,
  `offer` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`id`, `title`, `product_ids`, `start_date`, `end_date`, `time_hours`, `offer`, `date_created`, `last_updated`, `is_deleted`) VALUES
(1, 'Best Deal 1', '[\\\"3\\\"]', '2022-11-24 06:03:34', '2022-11-24 04:29:34', 7, 5, '2022-10-29 08:41:12', '2022-11-24 12:36:55', 1),
(2, 'Best Deal 2', '[\\\"2\\\"]', '2022-10-29 03:01:01', '2022-11-02 09:01:01', 90, 5, '2022-10-29 09:25:03', '2022-11-24 12:37:43', 1),
(3, 'test', '[\\\"3\\\"]', '2022-10-29 03:04:40', '2022-11-02 07:04:40', 100, 5, '2022-10-29 09:34:40', '2022-10-31 05:51:15', 1),
(4, 'test', '[\\\"4\\\"]', '2022-11-24 06:24:10', '2022-11-24 04:29:10', 7, 0, '2022-11-24 12:12:26', '2022-11-24 13:03:55', 1),
(5, 'demo', '[\\\"2\\\"]', '2022-11-24 05:51:01', '2022-11-24 03:29:01', 7, 0, '2022-11-24 12:21:01', '2022-11-24 12:46:02', 1),
(6, 'test', '[\\\"2\\\"]', '2022-11-24 06:23:10', '2022-11-24 03:29:10', 8, 0, '2022-11-24 12:53:10', '2022-11-24 12:53:10', 0),
(7, 'demo', '[\\\"2\\\"]', '2022-11-24 06:36:15', '2022-11-25 05:36:15', 11, 0, '2022-11-24 13:06:15', '2022-11-24 13:06:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_notifications`
--

CREATE TABLE `delivery_boy_notifications` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(56) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`) VALUES
(6, 13, 3),
(8, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfers`
--

CREATE TABLE `fund_transfers` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `opening_balance` double NOT NULL,
  `closing_balance` double NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(28) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'delivery_boy', 'Delivery Boys'),
(4, 'seller', 'Sellers');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_rtl` tinyint(4) NOT NULL DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `code`, `is_rtl`, `created_on`) VALUES
(1, 'english', 'en', 0, '2021-02-11 05:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL DEFAULT 0,
  `title` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_directory` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `seller_id`, `title`, `name`, `extension`, `type`, `sub_directory`, `size`, `date_created`) VALUES
(1, 0, 'eshop-logo-full', 'eshop-logo-full.png', 'png', 'image', 'uploads/media/2021/', '32358', '2021-03-31 06:32:50'),
(2, 0, 'favicon 64', 'eshop-favicon.png', 'png', 'image', 'uploads/media/2021/', '14131', '2021-03-31 06:34:15'),
(3, 0, 'vendurs', 'vendurs.png', 'png', 'image', 'uploads/media/2022/', '7.93', '2022-10-12 11:18:23'),
(4, 0, 'vendurs-favicon', 'vendurs-favicon.png', 'png', 'image', 'uploads/media/2022/', '2.21', '2022-10-12 12:06:56'),
(5, 0, 'nike', 'nike.jpg', 'jpg', 'image', 'uploads/media/2022/', '17.78', '2022-10-12 12:54:43'),
(6, 0, 'adidas', 'adidas.jpg', 'jpg', 'image', 'uploads/media/2022/', '9.76', '2022-10-12 12:54:43'),
(7, 0, 'makeup', 'makeup.jpg', 'jpg', 'image', 'uploads/media/2022/', '61.55', '2022-10-13 11:44:12'),
(8, 0, 'eyes', 'eyes.jpg', 'jpg', 'image', 'uploads/media/2022/', '77.16', '2022-10-13 11:44:24'),
(9, 0, 'eyelashes', 'eyelashes.jpg', 'jpg', 'image', 'uploads/media/2022/', '18.85', '2022-10-13 11:36:53'),
(10, 0, 'eyebrow-color', 'eyebrow-color.jpg', 'jpg', 'image', 'uploads/media/2022/', '24.54', '2022-10-13 11:39:10'),
(11, 0, 'eyeshadow', 'eyeshadow.png', 'png', 'image', 'uploads/media/2022/', '455.09', '2022-10-13 11:40:28'),
(12, 0, 'eyeliner', 'eyeliner.jpg', 'jpg', 'image', 'uploads/media/2022/', '77.16', '2022-10-13 11:48:21'),
(13, 0, 'mascara', 'mascara.jpg', 'jpg', 'image', 'uploads/media/2022/', '34.81', '2022-10-13 11:49:33'),
(14, 0, 'liner_shadow_combinations', 'liner_shadow_combinations.jpg', 'jpg', 'image', 'uploads/media/2022/', '48.68', '2022-10-13 11:53:34'),
(15, 0, 'colored-clay-undereye-corrector-1', 'colored-clay-undereye-corrector-1.jpg', 'jpg', 'image', 'uploads/media/2022/', '42.9', '2022-10-13 12:10:04'),
(16, 0, 'colored-clay-undereye-corrector-2', 'colored-clay-undereye-corrector-2.jpg', 'jpg', 'image', 'uploads/media/2022/', '88.93', '2022-10-13 12:10:04'),
(17, 0, 'colored-clay-undereye-corrector-3', 'colored-clay-undereye-corrector-3.jpg', 'jpg', 'image', 'uploads/media/2022/', '71.8', '2022-10-13 12:10:04'),
(18, 0, 'colored-clay-undereye-corrector-4', 'colored-clay-undereye-corrector-4.jpg', 'jpg', 'image', 'uploads/media/2022/', '68.31', '2022-10-13 12:10:04'),
(19, 0, 'colored-clay-undereye-corrector-5', 'colored-clay-undereye-corrector-5.jpg', 'jpg', 'image', 'uploads/media/2022/', '21.73', '2022-10-13 12:10:04'),
(20, 0, 'colored-clay-undereye-corrector-6', 'colored-clay-undereye-corrector-6.jpg', 'jpg', 'image', 'uploads/media/2022/', '30.73', '2022-10-13 12:10:04'),
(21, 0, 'concealer', 'concealer.png', 'png', 'image', 'uploads/media/2022/', '1490.09', '2022-10-13 12:17:03'),
(22, 0, 'banner-1', 'banner-1.png', 'png', 'image', 'uploads/media/2022/', '179.46', '2022-10-28 12:17:50'),
(23, 0, 'banner-2', 'banner-2.jpg', 'jpg', 'image', 'uploads/media/2022/', '24.78', '2022-10-28 12:35:38'),
(24, 0, 'banner-3', 'banner-3.jpg', 'jpg', 'image', 'uploads/media/2022/', '18.49', '2022-10-28 12:38:09'),
(25, 0, 'nav-bg', 'nav-bg.png', 'png', 'image', 'uploads/media/2022/', '928.46', '2022-10-31 11:20:51'),
(26, 0, 'dummy-image', 'dummy-image.png', 'png', 'image', 'uploads/media/2022/', '1.02', '2022-11-02 09:16:45'),
(27, 0, 'discount1', 'discount1.png', 'png', 'image', 'uploads/media/2022/', '120.79', '2022-11-04 06:12:51'),
(28, 0, 'discount2', 'discount2.png', 'png', 'image', 'uploads/media/2022/', '130.99', '2022-11-04 06:12:51'),
(29, 0, 'discount3', 'discount3.png', 'png', 'image', 'uploads/media/2022/', '164.88', '2022-11-04 06:12:51'),
(30, 0, 'febricbed', 'febricbed.png', 'png', 'image', 'uploads/media/2022/', '119.84', '2022-11-04 06:19:02'),
(31, 0, 'iphone', 'iphone.png', 'png', 'image', 'uploads/media/2022/', '52.17', '2022-11-04 06:19:12'),
(32, 0, 'women', 'women.jpeg', 'jpeg', 'image', 'uploads/media/2022/', '42.52', '2022-11-04 10:58:48'),
(33, 0, 'tools1', 'tools1.jpg', 'jpg', 'image', 'uploads/media/2022/', '22.23', '2022-11-04 11:04:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(8);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_to` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `users_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `message`, `type`, `type_id`, `send_to`, `users_id`, `image`, `date_sent`) VALUES
(1, 'asdasd', 'asdads', 'default', '', 'all_users', '0', NULL, '2022-11-26 04:55:19'),
(2, 'xdfxf', 'xvxc', 'default', '', 'all_users', '0', NULL, '2022-11-26 05:02:27');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` int(11) DEFAULT 0,
  `offer_type` enum('Percentage','Amount') COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer_amount` int(11) NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `text`, `type`, `type_id`, `offer_type`, `offer_amount`, `image`, `date_added`) VALUES
(1, 'Up to 20% off- on Make up', 'default', 0, 'Percentage', 20, 'uploads/media/2022/discount1.png', '2022-11-02 10:59:14'),
(2, 'Up to 30% off- on Eletronics', 'default', 0, 'Percentage', 30, 'uploads/media/2022/discount2.png', '2022-11-02 10:59:39'),
(3, 'Up to 10% off- on Toys', 'default', 3, 'Percentage', 11, 'uploads/media/2022/discount3.png', '2022-11-04 06:17:27'),
(4, 'jjjjjjjjj', 'products', 3, 'Percentage', 12, 'uploads/media/2022/tools1.jpg', '2022-11-28 10:24:04');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `is_guest` tinyint(4) NOT NULL DEFAULT 0 COMMENT '(0:No|1:Yes)',
  `user_id` int(11) NOT NULL,
  `guest_user_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double NOT NULL,
  `delivery_charge` double DEFAULT 0,
  `is_delivery_charge_returnable` tinyint(4) NOT NULL DEFAULT 0,
  `wallet_balance` double DEFAULT 0,
  `promo_code` varchar(28) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promo_discount` double DEFAULT NULL,
  `discount` double DEFAULT 0,
  `total_payable` double DEFAULT NULL,
  `final_total` double DEFAULT NULL,
  `payment_method` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_time` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `otp` int(11) DEFAULT 0,
  `notes` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `is_guest`, `user_id`, `guest_user_id`, `address_id`, `firstname`, `lastname`, `email`, `mobile`, `address_line_1`, `address_line_2`, `city`, `state`, `country`, `zipcode`, `total`, `delivery_charge`, `is_delivery_charge_returnable`, `wallet_balance`, `promo_code`, `promo_discount`, `discount`, `total_payable`, `final_total`, `payment_method`, `latitude`, `longitude`, `address`, `delivery_time`, `delivery_date`, `date_added`, `otp`, `notes`) VALUES
(1, 1, 0, 1668156659, NULL, 'Test', 'Demo', 'testdemo1@mailinator.com', '9876543212', 'Test', 'Demo', 'Rajkot', 'Gujarat', 'India', '360001', 60, 10, 1, 0, '', 0, 0, 70, 70, 'COD', NULL, NULL, NULL, NULL, NULL, '2022-11-14 10:21:49', 0, ''),
(2, 1, 0, 1668421843, NULL, 'Test', 'Demo', 'testdemo1@mailinator.com', '9876543210', 'Test', 'Demo', 'Rajkot', 'Gujarat', 'India', '360001', 55, 10, 1, 0, '', 0, 0, 65, 65, 'COD', NULL, NULL, NULL, NULL, NULL, '2022-11-14 10:32:45', 0, ''),
(3, 0, 13, 0, 2, '', '', '', '9876543210', '', '', '', '', '', '', 60, 0, 0, 0, '', 0, 0, 60, 60, 'Stripe', '', '', 'sasdfsdfdds, Sorathiya wadi, Rajkot, Gujarat, India, ', NULL, NULL, '2022-11-23 10:26:11', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `order_bank_transfer`
--

CREATE TABLE `order_bank_transfer` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `attachments` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) DEFAULT 0 COMMENT '(0:pending|1:rejected|2:accepted)',
  `date_created` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `is_guest` tinyint(4) NOT NULL DEFAULT 0 COMMENT '(0:No|1:Yes)',
  `user_id` int(11) NOT NULL,
  `guest_user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  `is_credited` tinyint(2) NOT NULL DEFAULT 0,
  `otp` int(11) NOT NULL DEFAULT 0,
  `product_name` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variant_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `discounted_price` double DEFAULT NULL,
  `tax_percent` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount` double DEFAULT 0,
  `sub_total` double NOT NULL,
  `deliver_by` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` int(11) DEFAULT 0,
  `status` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_commission_amount` double NOT NULL DEFAULT 0,
  `seller_commission_amount` double NOT NULL DEFAULT 0,
  `active_status` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `is_guest`, `user_id`, `guest_user_id`, `order_id`, `delivery_boy_id`, `seller_id`, `is_credited`, `otp`, `product_name`, `variant_name`, `product_variant_id`, `quantity`, `price`, `discounted_price`, `tax_percent`, `tax_amount`, `discount`, `sub_total`, `deliver_by`, `updated_by`, `status`, `admin_commission_amount`, `seller_commission_amount`, `active_status`, `date_added`) VALUES
(1, 1, 0, 1668156659, 1, NULL, 3, 0, 942179, 'TARTE TARTE CC Colored clay undereye corrector in LIGHT MEDIUM', '', 2, 4, 15, NULL, 0, 0, 0, 60, NULL, 0, '[[\"received\",\"14-11-2022 03:51:49pm\"]]', 0, 0, 'received', '2022-11-14 10:21:49'),
(2, 1, 0, 1668421843, 2, NULL, 3, 0, 549574, 'test', '', 3, 4, 10, NULL, 0, 0, 0, 40, NULL, 0, '[[\"received\",\"14-11-2022 04:02:45pm\"]]', 0, 0, 'received', '2022-11-14 10:32:45'),
(3, 1, 0, 1668421843, 2, NULL, 3, 0, 199559, 'TARTE TARTE CC Colored clay undereye corrector in LIGHT MEDIUM', '', 2, 1, 15, NULL, 0, 0, 0, 15, NULL, 0, '[[\"received\",\"14-11-2022 04:02:45pm\"]]', 0, 0, 'received', '2022-11-14 10:32:45'),
(4, 0, 13, 0, 3, NULL, 3, 0, 240156, 'TARTE TARTE CC Colored clay undereye corrector in LIGHT MEDIUM', '', 2, 4, 15, NULL, 0, 0, 0, 60, NULL, 0, '[[\"awaiting\",\"23-11-2022 03:56:11pm\"]]', 0, 0, 'awaiting', '2022-11-23 10:26:11');

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `courier_agency` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(56) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_address` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_requested` int(11) NOT NULL,
  `remarks` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_identity` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `tax` double DEFAULT NULL,
  `row_order` int(11) DEFAULT 0,
  `type` varchar(34) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '0 =>''Simple_Product_Stock_Active'' 1 => "Product_Level" 1 => "Variable_Level"',
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indicator` tinyint(4) DEFAULT NULL COMMENT '0 - none | 1 - veg | 2 - non-veg',
  `cod_allowed` int(11) NOT NULL DEFAULT 1,
  `minimum_order_quantity` int(11) NOT NULL DEFAULT 1,
  `quantity_step_size` int(11) NOT NULL DEFAULT 1,
  `total_allowed_quantity` int(11) DEFAULT NULL,
  `is_prices_inclusive_tax` int(11) NOT NULL DEFAULT 0,
  `is_returnable` int(11) DEFAULT 0,
  `is_cancelable` int(11) DEFAULT 0,
  `cancelable_till` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `other_images` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty_period` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guarantee_period` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `made_in` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `availability` tinyint(4) DEFAULT NULL,
  `rating` double DEFAULT 0,
  `no_of_ratings` int(11) DEFAULT 0,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliverable_type` int(11) NOT NULL DEFAULT 1 COMMENT '(0:none, 1:all, 2:include, 3:exclude)',
  `deliverable_zipcodes` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(2) DEFAULT 1,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_identity`, `category_id`, `seller_id`, `tax`, `row_order`, `type`, `stock_type`, `name`, `short_description`, `slug`, `indicator`, `cod_allowed`, `minimum_order_quantity`, `quantity_step_size`, `total_allowed_quantity`, `is_prices_inclusive_tax`, `is_returnable`, `is_cancelable`, `cancelable_till`, `image`, `other_images`, `video_type`, `video`, `tags`, `warranty_period`, `guarantee_period`, `made_in`, `brand`, `sku`, `stock`, `availability`, `rating`, `no_of_ratings`, `description`, `deliverable_type`, `deliverable_zipcodes`, `status`, `date_added`) VALUES
(2, NULL, 8, 3, 0, 0, 'simple_product', NULL, 'TARTE TARTE CC Colored clay undereye corrector in LIGHT MEDIUM', '<p>TARTE TARTE CC Colored clay undereye corrector in LIGHT MEDIUM 11</p>', 'tarte-tarte-cc-colored-clay-undereye-corrector-in-light-medium', 1, 1, 1, 1, NULL, 1, 1, 1, 'shipped', 'uploads/media/2022/colored-clay-undereye-corrector-1.jpg', '[\"uploads\\/media\\/2022\\/colored-clay-undereye-corrector-1.jpg\",\"uploads\\/media\\/2022\\/colored-clay-undereye-corrector-2.jpg\",\"uploads\\/media\\/2022\\/colored-clay-undereye-corrector-3.jpg\",\"uploads\\/media\\/2022\\/colored-clay-undereye-corrector-4.jpg\",\"uploads\\/media\\/2022\\/colored-clay-undereye-corrector-5.jpg\",\"uploads\\/media\\/2022\\/colored-clay-undereye-corrector-6.jpg\"]', '', '', '', '', '', 'India', NULL, NULL, NULL, NULL, 0, 0, '<p>TARTE TARTE CC Colored clay undereye corrector in LIGHT MEDIUM</p>', 1, NULL, 1, '2022-10-13 12:55:12'),
(3, NULL, 8, 3, 0, 0, 'simple_product', NULL, 'test', '<p>sadsd</p>', 'test', 0, 1, 1, 1, NULL, 0, 0, 0, '', 'uploads/media/2022/concealer.png', '[]', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, 0, 0, '', 1, NULL, 1, '2022-10-29 08:18:46'),
(4, NULL, 2, 3, 0, 0, 'simple_product', NULL, 'afdsd', '<p>sadfd</p>', 'afdsd', 0, 0, 1, 1, NULL, 0, 0, 0, '', 'uploads/media/2022/dummy-image.png', '[]', '', '', 'sda', '', '', NULL, NULL, NULL, NULL, NULL, 0, 0, '', 1, NULL, 1, '2022-11-10 08:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_value_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `attribute_value_ids`, `date_created`) VALUES
(1, 1, '', '2022-04-04 05:12:09'),
(2, 2, '', '2022-10-13 12:55:12'),
(3, 3, '', '2022-10-29 08:18:46'),
(4, 4, '', '2022-11-10 08:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_faqs`
--

CREATE TABLE `product_faqs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT 0,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `answered_by` int(11) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_faqs`
--

INSERT INTO `product_faqs` (`id`, `user_id`, `product_id`, `votes`, `question`, `answer`, `answered_by`, `date_added`) VALUES
(1, 1, 2, 0, '', '', 0, '2022-11-24 13:23:08'),
(2, 1, 2, 0, 'xgh', 'xgh', 1, '2022-11-28 12:26:07'),
(3, 1, 4, 0, 'chh', 'dsd', 1, '2022-11-28 12:31:28'),
(4, 1, 3, 0, 'xgh', 'dsd', 1, '2022-11-28 12:31:57'),
(5, 1, 2, 0, 'bjknkj', 'bjknk,', 1, '2022-11-28 12:34:19'),
(6, 1, 4, 0, 'gxfg', 'fdxf', 1, '2022-11-28 12:37:15'),
(7, 1, 3, 0, '', '', 0, '2022-12-01 08:59:46');

-- --------------------------------------------------------

--
-- Table structure for table `product_rating`
--

CREATE TABLE `product_rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` double NOT NULL DEFAULT 0,
  `images` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_value_ids` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_set` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `special_price` double DEFAULT 0,
  `sku` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `availability` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `attribute_value_ids`, `attribute_set`, `price`, `special_price`, `sku`, `stock`, `images`, `availability`, `status`, `date_added`) VALUES
(2, 2, NULL, NULL, 20, 15, NULL, NULL, NULL, NULL, 1, '2022-10-13 12:55:12'),
(3, 3, NULL, NULL, 10, 10, NULL, NULL, NULL, NULL, 1, '2022-10-29 08:18:46'),
(4, 4, NULL, NULL, 32, 21, NULL, NULL, NULL, NULL, 1, '2022-11-10 08:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `promo_code` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` varchar(28) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(28) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_users` int(11) DEFAULT NULL,
  `minimum_order_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `discount_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_discount_amount` double DEFAULT NULL,
  `repeat_usage` tinyint(4) NOT NULL,
  `no_of_repeat_usage` int(11) NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `is_cashback` tinyint(4) DEFAULT 0,
  `list_promocode` tinyint(4) DEFAULT 1,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `promo_code`, `message`, `start_date`, `end_date`, `no_of_users`, `minimum_order_amount`, `discount`, `discount_type`, `max_discount_amount`, `repeat_usage`, `no_of_repeat_usage`, `image`, `status`, `is_cashback`, `list_promocode`, `date_created`) VALUES
(1, 'dfzsdf', 'dfsfd', '2022-11-11', '2022-11-26', 1, 154, 16, 'percentage', 15, 0, 0, 'uploads/media/2022/discount3.png', 1, 0, 1, '2022-11-25 12:11:39');

-- --------------------------------------------------------

--
-- Table structure for table `return_requests`
--

CREATE TABLE `return_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remarks` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `title` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `style` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_ids` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `categories` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `title`, `short_description`, `style`, `product_ids`, `row_order`, `categories`, `product_type`, `date_added`) VALUES
(1, 'new', 'new', 'default', NULL, 0, '1', 'new_added_products', '2022-04-04 05:12:44'),
(2, 'dsd', 'sdsdsd', 'style_1', NULL, 1, '141', 'top_rated_products', '2022-11-25 11:38:33'),
(3, 'sdfdsz', 'sdfszdf', 'style_1', NULL, 2, '285', 'top_rated_products', '2022-11-25 11:45:57'),
(4, 'gfcxg', 'cfgn', 'style_3', NULL, 3, '5', 'top_rated_products', '2022-11-25 11:46:40'),
(5, 'fgcvb', 'cvghch', 'style_4', NULL, 4, '6', 'most_selling_products', '2022-11-25 11:48:31');

-- --------------------------------------------------------

--
-- Table structure for table `seller_commission`
--

CREATE TABLE `seller_commission` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `commission` double(10,2) NOT NULL DEFAULT 0.00,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_commission`
--

INSERT INTO `seller_commission` (`id`, `seller_id`, `category_id`, `commission`, `date_created`) VALUES
(1, 2, 1, 0.00, '2022-04-04 05:11:35'),
(2, 3, 2, 2.00, '2022-10-13 12:21:55'),
(3, 3, 3, 2.00, '2022-10-13 12:21:55'),
(4, 3, 4, 2.00, '2022-10-13 12:21:55'),
(5, 3, 10, 2.00, '2022-10-13 12:21:55'),
(6, 3, 9, 2.00, '2022-10-13 12:21:55'),
(7, 4, 2, 2.00, '2022-10-13 12:29:34'),
(8, 4, 3, 2.00, '2022-10-13 12:29:34'),
(9, 4, 10, 2.00, '2022-10-13 12:29:34'),
(10, 4, 9, 2.00, '2022-10-13 12:29:34'),
(11, 4, 4, 2.00, '2022-10-13 12:29:34'),
(16, 12, 2, 0.00, '2022-10-20 08:13:59'),
(17, 12, 3, 0.00, '2022-10-20 08:13:59'),
(18, 12, 5, 0.00, '2022-10-20 08:13:59'),
(19, 12, 7, 0.00, '2022-10-20 08:13:59');

-- --------------------------------------------------------

--
-- Table structure for table `seller_data`
--

CREATE TABLE `seller_data` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `slug` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_ids` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `store_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_description` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL,
  `logo` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `store_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_ratings` int(11) DEFAULT 0,
  `rating` double(8,2) DEFAULT 0.00,
  `bank_name` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `bank_code` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `account_name` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `account_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_identity_card` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `address_proof` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `pan_number` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `tax_name` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `tax_number` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `permissions` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `commission` double(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(2) NOT NULL DEFAULT 3 COMMENT 'approved: 1 | not-approved: 2 | deactive:3 | deactive:0 | removed :7',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_data`
--

INSERT INTO `seller_data` (`id`, `user_id`, `slug`, `category_ids`, `store_name`, `store_description`, `logo`, `store_url`, `no_of_ratings`, `rating`, `bank_name`, `bank_code`, `account_name`, `account_number`, `national_identity_card`, `address_proof`, `pan_number`, `tax_name`, `tax_number`, `permissions`, `commission`, `status`, `date_added`) VALUES
(1, 2, 'dikshita-dikshita-1', '1', 'dikshita dikshita', '', '', '', 0, 0.00, '', '', '', '', 'uploads/seller/51Ptg9X9mdL.jpg', 'uploads/seller/logo.png', '', 'test', '1234', '{\"require_products_approval\":\"0\",\"customer_privacy\":\"0\",\"view_order_otp\":\"0\",\"assign_delivery_boy\":\"0\"}', 0.00, 1, '2022-04-04 05:11:35'),
(2, 3, 'test-seller-store', '2,3,4,10,9', 'Test seller Store', '', 'uploads/seller/dummy-image.png', '', 0, 0.00, '', '', '9876543211', '', 'uploads/seller/dummy-image1.png', 'uploads/seller/dummy-image2.png', '', 'Tax', '123456', '{\"require_products_approval\":\"0\",\"customer_privacy\":\"0\",\"view_order_otp\":\"0\",\"assign_delivery_boy\":\"0\"}', 2.00, 1, '2022-10-13 12:21:55'),
(3, 4, 'demo-seller-store', '2,3,10,9,4', 'Demo seller Store', '', 'uploads/seller/dummy-image15.png', '', 0, 0.00, '', '', '', '', 'uploads/seller/dummy-image16.png', 'uploads/seller/dummy-image17.png', '', 'Tax', '123456', '{\"require_products_approval\":\"0\",\"customer_privacy\":\"0\",\"view_order_otp\":\"0\",\"assign_delivery_boy\":\"0\"}', 2.00, 1, '2022-10-13 12:29:34'),
(4, 12, 'seller-store', '2,3,5,7', 'Seller store', 'sfsdf', 'uploads/seller/dummy-image1.png', 'seller-one', 0, 0.00, 'SBI', '34513', 'Seller Bank name', '1234567890', 'uploads/seller/id-cartd.jpg', '', 'ABCDE1234F', 'VAT', '7865678979878', '{\"require_products_approval\":\"0\",\"customer_privacy\":\"0\",\"view_order_otp\":\"0\",\"assign_delivery_boy\":\"0\"}', 0.00, 1, '2022-10-15 08:43:59'),
(8, 0, 'seller-two', NULL, 'Seller Two', '', 'uploads/seller/dummy-image14.png', '', 0, 0.00, '', '', '', '', 'uploads/seller/dummy-image16.png', 'uploads/seller/dummy-image17.png', '', 'GST', '24ABCDEF1234E33', NULL, 0.00, 2, '2022-10-20 12:25:53'),
(12, 25, 'seller-three-store', NULL, 'Seller Three Store', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'uploads/seller/dummy-image2.png', 'seller-three-store-url', 0, 0.00, 'Bank Of India', '652148', 'Seller Three', '963215487', 'uploads/seller/dummy-image3.png', 'uploads/seller/dummy-image4.png', 'ASDFG1234H', 'GST', '23ASDFG1234H52', '{\"require_products_approval\":\"0\",\"customer_privacy\":\"0\",\"view_order_otp\":\"0\",\"assign_delivery_boy\":\"0\"}', 0.00, 1, '2022-11-17 13:11:09'),
(13, 26, 'cbcb', NULL, 'cbcb', NULL, NULL, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, '2022-11-29 13:05:51'),
(14, 27, 'iknk', NULL, 'iknk,', NULL, NULL, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, '2022-11-30 11:25:42'),
(15, 28, 'dfdf', NULL, 'dfdf', NULL, NULL, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, '2022-11-30 11:27:58'),
(16, 29, 'ohkvhk', NULL, 'ohkvhk', NULL, NULL, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, '2022-11-30 11:29:20'),
(17, 30, 'mknmbnm', NULL, 'mknmbnm', NULL, NULL, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, '2022-11-30 11:31:16'),
(18, 31, 'cxfghcgh', NULL, 'cxfghcgh', NULL, NULL, NULL, 0, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, '2022-11-30 11:34:24');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `variable` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `variable`, `value`) VALUES
(1, 'logo', 'uploads/media/2022/vendurs.png'),
(2, 'privacy_policy', '<p></p><h2><b>Privacy policy</b></h2>??costumers ACCESSING, BROWSING OR OTHERWISE USING THE \\r\\nWEBSITE eShop.com, Missed Call Service or mobile application \\r\\nINDICATES user is in AGREEMENT with eShop vegetables & \\r\\nfruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. \\r\\nUser is requested to READ terms and conditions CAREFULLY BEFORE \\r\\nPROCEEDING FURTHER.<br>\\r\\nUser is the person, group of person, company, trust, society, legal \\r\\nentity, legal personality or anyone who visits website, mobile app or \\r\\ngives missed call or places order with eShop via phone or website \\r\\nor mobile application or browse through website www.eShop.com.<p></p>\\r\\n\\r\\n<p>eShop reserves the right to add, alter, change, modify or delete\\r\\n any of these terms and conditions at any time without prior \\r\\ninformation. The altered terms and conditions becomes binding on the \\r\\nuser since the moment same are unloaded on the website \\r\\nwww.eShop.com</p>\\r\\n\\r\\n<p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user???s desired address) directly.</p>\\r\\n\\r\\n<p>That any user who gives missed call/call for order on any number \\r\\npublished/used by eShop.com, consents to receive, accept calls and \\r\\nmessages or any after communication from eShop vegetables & \\r\\nfruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p>\\r\\n\\r\\n<p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p>\\r\\n\\r\\n<p>eShop accept orders on all seven days and user will receive the \\r\\ndelivery next day from date of order placement, as we at eShop \\r\\nprocure the fresh produce from the procurement center and deliver it \\r\\nstraight to user.</p>\\r\\n\\r\\n<p>There is Minimum Order value of Rs. 200. There are no delivery \\r\\ncharges on an order worth Rs. 200 or above. In special cases, if \\r\\npermitted, order value is less then Rs. 200/??? , Rs. 40 as shipping \\r\\ncharges shall be charged from user.</p>\\r\\n\\r\\n<p>eShop updates the prices on daily basis and the price displayed \\r\\nat our website www.eShop.com, at the time of placement of order by \\r\\nuser he/she/it will be charged as per the price listed at the website \\r\\nwww.eShop.com.</p>\\r\\n\\r\\n<p>In the event, though there are remote possibilities, of wrong invoice\\r\\n generation due to any reason, in case it happens eShop vegetables \\r\\n& fruits Pvt Ltd reserve its right to again raise the correct \\r\\ninvoice at the revised amount and same shall be paid by user.</p>\\r\\n\\r\\n<p>At times it is difficult to weigh certain vegetables or fruits \\r\\nexactly as per the order or desired quantity of user, hence the delivery\\r\\n might be with five percent variation on both higher or lower side of \\r\\nexact ordered quantity, user are hereby under takes to pay to eShop\\r\\n vegetables & fruits Pvt Ltd as per the final invoice. We at \\r\\neShop understands and our endeavor is to always deliver in exact \\r\\nquantity in consonance with quantity ordered but every time it???s not \\r\\npossible but eShop guarantee the fair deal and weight to all its \\r\\nusers. eShop further assures its users that at no instance delivery\\r\\n weights/quantity vary dramatically from what quantity ordered by user.</p>\\r\\n\\r\\n<p>If some product is not available or is not of good quality, the same \\r\\nitem will not be delivered and will be adjusted accordingly in the \\r\\ninvoice; all rights in this regards are reserved with eShop. Images\\r\\n of Fruits & Vegetables present in the website are for demonstration\\r\\n purpose and may not resemble exactly in size, colour, weight, contrast \\r\\netc; though we assure our best to maintain the best quality in product, \\r\\nwhich is being our foremost commitment to the customer.</p>\\r\\n\\r\\n<p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),
(3, 'terms_conditions', '<h3><b>Terms and conditions</b></h3><p>??costumers eshop.com is a sole proprietary firm , Juridical rights of eshop.com are reserved with eshop</p><p>Personal Information eshop.com and the website eshop.com (???The Site???) . respects your privacy. This Privacy Policy succinctly provides the manner your data is collected and used by eshop.com. on the Site. As a visitor to the Site/ Customer you are advised to please read the Privacy Policy carefully.</p><p><br></p><p>Services Overview As part of the registration process on the Site, eshop.com may collect the following personally identifiable information about you: Name including first and last name, alternate email address, mobile phone number and contact details, Postal code, GPS location, Demographic profile &#40;like your age, gender, occupation, education, address etc.&#41; and information about the pages on the site you visit/access, the links you click on the site, the number of times you access the page and any such browsing information.</p><p><br></p><p>Eligibility Services of the Site would be available to only select geographies in India. Persons who are \\\"incompetent to contract\\\" within the meaning of the Indian Contract Act, 1872 including un-discharged insolvents etc. are not eligible to use the Site. If you are a minor i.e. under the age of 18 years but at least 13 years of age you may use the Site only under the supervision of a parent or legal guardian who agrees to be bound by these Terms of Use. If your age is below 18 years, your parents or legal guardians can transact on behalf of you if they are registered users. You are prohibited from purchasing any material which is for adult consumption and the sale of which to minors is prohibited.</p><p><br></p><p>License & Site Access eshop.com grants you a limited sub-license to access and make personal use of this site and not to download (other than page caching) or modify it, or any portion of it, except with express written consent of eshop.com. This license does not include any resale or commercial use of this site or its contents; any collection and use of any product listings, descriptions, or prices; any derivative use of this site or its contents; any downloading or copying of account information for the benefit of another merchant; or any use of data mining, robots, or similar data gathering and extraction tools. This site or any portion of this site may not be reproduced, duplicated, copied, sold, resold, visited or otherwise exploited for any commercial purpose without express written consent of eshop.com. You may not frame or utilize framing techniques to enclose any trademark, logo, or other proprietary information (including images, text, page layout, or form) of the Site or of eshop.com and its affiliates without express written consent. You may not use any meta tags or any other \\\"hidden text\\\" utilizing the Site???s or eshop.com???s name or eshop.com???s name or trademarks without the express written consent of eshop.com. Any unauthorized use, terminates the permission or license granted by eshop.com</p><p><br></p><p>Account & Registration Obligations All shoppers have to register and login for placing orders on the Site. You have to keep your account and registration details current and correct for communications related to your purchases from the site. By agreeing to the terms and conditions, the shopper agrees to receive promotional communication and newsletters upon registration. The customer can opt out either by unsubscribing in \\\"My Account\\\" or by contacting the customer service.</p><p><br></p><p>Pricing All the products listed on the Site will be sold at MRP unless otherwise specified. The prices mentioned at the time of ordering will be the prices charged on the date of the delivery. Although prices of most of the products do not fluctuate on a daily basis but some of the commodities and fresh food prices do change on a daily basis. In case the prices are higher or lower on the date of delivery not additional charges will be collected or refunded as the case may be at the time of the delivery of the order.</p><p><br></p><p>Cancellation by Site / Customer You as a customer can cancel your order anytime up to the cut-off time of the slot for which you have placed an order by calling our customer service. In such a case we will Credit your wallet against any payments already made by you for the order. If we suspect any fraudulent transaction by any customer or any transaction which defies the terms & conditions of using the website, we at our sole discretion could cancel such orders. We will maintain a negative list of all fraudulent transactions and customers and would deny access to them or cancel any orders placed by them.</p><p><br></p><p>Return & Refunds We have a \\\"no questions asked return policy\\\" which entitles all our Delivery Ambassadors to return the product at the time of delivery if due to any reason they are not satisfied with the quality or freshness of the product. We will take the returned product back with us and issue a credit note for the value of the return products which will be credited to your account on the Site. This can be used to pay your subsequent shopping bills. Refund will be processed through same online mode within 7 working days.</p><p><br></p><p><br></p><p>Delivery & Shipping Charge</p><p><br></p><p>1.You can expect to receive your order depending on the delivery option you have chosen.</p><p><br></p><p>2.You can order 24*7 in website & mobile application , Our delivery timeings are between 06:00 AM - 02:00PM Same day delivery.</p><p><br></p><p>3.You will get free shipping on order amount above Rs.150.</p><p>You Agree and Confirm</p><p>1. That in the event that a non-delivery occurs on account of a mistake by you (i.e. wrong name or address or any other wrong information) any extra cost incurred by eshop. for redelivery shall be claimed from you.</p><p>2. That you will use the services provided by the Site, its affiliates, consultants and contracted companies, for lawful purposes only and comply with all applicable laws and regulations while using and transacting on the Site.</p><p>3. You will provide authentic and true information in all instances where such information is requested you. eshop reserves the right to confirm and validate the information and other details provided by you at any point of time. If upon confirmation your details are found not to be true (wholly or partly), it has the right in its sole discretion to reject the registration and debar you from using the Services and / or other affiliated websites without prior intimation whatsoever.</p><p>4. That you are accessing the services available on this Site and transacting at your sole risk and are using your best and prudent judgment before entering into any transaction through this Site.</p><p>5. That the address at which delivery of the product ordered by you is to be made will be correct and proper in all respects.</p><p>6. That before placing an order you will check the product description carefully. By placing an order for a product you agree to be bound by the conditions of sale included in the item\\\'s description.</p><p><br></p><p>You may not use the Site for any of the following purposes:</p><p>1. Disseminating any unlawful, harassing, libelous, abusive, threatening, harmful, vulgar, obscene, or otherwise objectionable material.</p><p>2. Transmitting material that encourages conduct that constitutes a criminal offence or results in civil liability or otherwise breaches any relevant laws, regulations or code of practice.</p><p>3. Gaining unauthorized access to other computer systems.</p><p>4. Interfering with any other person\\\'s use or enjoyment of the Site.</p><p>5. Breaching any applicable laws;</p><p>6. Interfering or disrupting networks or web sites connected to the Site.</p><p>7. Making, transmitting or storing electronic copies of materials protected by copyright without the permission of the owner.</p><p><br></p><p>Colors we have made every effort to display the colors of our products that appear on the Website as accurately as possible. However, as the actual colors you see will depend on your monitor, we cannot guarantee that your monitor\\\'s display of any color will be accurate.</p><p><br></p><p>Modification of Terms & Conditions of Service eshop may at any time modify the Terms & Conditions of Use of the Website without any prior notification to you. You can access the latest version of these Terms & Conditions at any given time on the Site. You should regularly review the Terms & Conditions on the Site. In the event the modified Terms & Conditions is not acceptable to you, you should discontinue using the Service. However, if you continue to use the Service you shall be deemed to have agreed to accept and abide by the modified Terms & Conditions of Use of this Site.</p><p><br></p><p>Governing Law and Jurisdiction This User Agreement shall be construed in accordance with the applicable laws of India. The Courts at Faridabad shall have exclusive jurisdiction in any proceedings arising out of this agreement. Any dispute or difference either in interpretation or otherwise, of any terms of this User Agreement between the parties hereto, the same shall be referred to an independent arbitrator who will be appointed by eshop and his decision shall be final and binding on the parties hereto. The above arbitration shall be in accordance with the Arbitration and Conciliation Act, 1996 as amended from time to time. The arbitration shall be held in Nagpur. The High Court of judicature at Nagpur Bench of Mumbai High Court alone shall have the jurisdiction and the Laws of India shall apply.</p><p><br></p><p>Reviews, Feedback, Submissions All reviews, comments, feedback, postcards, suggestions, ideas, and other submissions disclosed, submitted or offered to the Site on or by this Site or otherwise disclosed, submitted or offered in connection with your use of this Site (collectively, the \\\"Comments\\\") shall be and remain the property of eshop Such disclosure, submission or offer of any Comments shall constitute an assignment to eshop of all worldwide rights, titles and interests in all copyrights and other intellectual properties in the Comments. Thus, eshop owns exclusively all such rights, titles and interests and shall not be limited in any way in its use, commercial or otherwise, of any Comments. eshopwill be entitled to use, reproduce, disclose, modify, adapt, create derivative works from, publish, display and distribute any Comments you submit for any purpose whatsoever, without restriction and without compensating you in any way. eshop is and shall be under no obligation (1) to maintain any Comments in confidence; (2) to pay you any compensation for any Comments; or (3) to respond to any Comments. You agree that any Comments submitted by you to the Site will not violate this policy or any right of any third party, including copyright, trademark, privacy or other personal or proprietary right(s), and will not cause injury to any person or entity. You further agree that no Comments submitted by you to the Website will be or contain libelous or otherwise unlawful, threatening, abusive or obscene material, or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mailings or any form of \\\"spam\\\". eshop does not regularly review posted Comments, but does reserve the right (but not the obligation) to monitor and edit or remove any Comments submitted to the Site. You grant eshopthe right to use the name that you submit in connection with any Comments. You agree not to use a false email address, impersonate any person or entity, or otherwise mislead as to the origin of any Comments you submit. You are and shall remain solely responsible for the content of any Comments you make and you agree to indemnify eshop and its affiliates for all claims resulting from any Comments you submit. eshop and its affiliates take no responsibility and assume no liability for any Comments submitted by you or any third party.</p><p><br></p><p>Copyright & Trademark eshop.com and eshop.com, its suppliers and licensors expressly reserve all intellectual property rights in all text, programs, products, processes, technology, content and other materials, which appear on this Site. Access to this Website does not confer and shall not be considered as conferring upon anyone any license under any of eshop.com or any third party\\\'s intellectual property rights. All rights, including copyright, in this website are owned by or licensed to eshop.com from eshop.com. Any use of this website or its contents, including copying or storing it or them in whole or part, other than for your own personal, non-commercial use is prohibited without the permission of eshop.com and/or eshop.com. You may not modify, distribute or re-post anything on this website for any purpose.The names and logos and all related product and service names, design marks and slogans are the trademarks or service marks of eshop.com, eshop.com, its affiliates, its partners or its suppliers. All other marks are the property of their respective companies. No trademark or service mark license is granted in connection with the materials contained on this Site. Access to this Site does not authorize anyone to use any name, logo or mark in any manner.References on this Site to any names, marks, products or services of third parties or hypertext links to third party sites or information are provided solely as a convenience to you and do not in any way constitute or imply eshop.com or eshop.com\\\'s endorsement, sponsorship or recommendation of the third party, information, product or service. eshop.com or eshop.com is not responsible for the content of any third party sites and does not make any representations regarding the content or accuracy of material on such sites. If you decide to link to any such third party websites, you do so entirely at your own risk. All materials, including images, text, illustrations, designs, icons, photographs, programs, music clips or downloads, video clips and written and other materials that are part of this Website (collectively, the \\\"Contents\\\") are intended solely for personal, non-commercial use. You may download or copy the Contents and other downloadable materials displayed on the Website for your personal use only. No right, title or interest in any downloaded materials or software is transferred to you as a result of any such downloading or copying. You may not reproduce (except as noted above), publish, transmit, distribute, display, modify, create derivative works from, sell or participate in any sale of or exploit in any way, in whole or in part, any of the Contents, the Website or any related software. All software used on this Website is the property of eshop.com or its licensees and suppliers and protected by Indian and international copyright laws. The Contents and software on this Website may be used only as a shopping resource. Any other use, including the reproduction, modification, distribution, transmission, republication, display, or performance, of the Contents on this Website is strictly prohibited. Unless otherwise noted, all Contents are copyrights, trademarks, trade dress and/or other intellectual property owned, controlled or licensed by eshop.com, one of its affiliates or by third parties who have licensed their materials to eshop.com and are protected by Indian and international copyright laws. The compilation (meaning the collection, arrangement, and assembly) of all Contents on this Website is the exclusive property of eshop.com and eshop.com and is also protected by Indian and international copyright laws.</p><p><br></p><p>Objectionable Material You understand that by using this Site or any services provided on the Site, you may encounter Content that may be deemed by some to be offensive, indecent, or objectionable, which Content may or may not be identified as such. You agree to use the Site and any service at your sole risk and that to the fullest extent permitted under applicable law, eshop.com and/or eshop.com and its affiliates shall have no liability to you for Content that may be deemed offensive, indecent, or objectionable to you.</p><p><br></p><p>Indemnity You agree to defend, indemnify and hold harmless eshop.com, eshop.com, its employees, directors, Coordinators, officers, agents, interns and their successors and assigns from and against any and all claims, liabilities, damages, losses, costs and expenses, including attorney\\\'s fees, caused by or arising out of claims based upon your actions or inactions, which may result in any loss or liability to eshop.com or eshop.com or any third party including but not limited to breach of any warranties, representations or undertakings or in relation to the non-fulfillment of any of your obligations under this User Agreement or arising out of the violation of any applicable laws, regulations including but not limited to Intellectual Property Rights, payment of statutory dues and taxes, claim of libel, defamation, violation of rights of privacy or publicity, loss of service by other subscribers and infringement of intellectual property or other rights. This clause shall survive the expiry or termination of this User Agreement.</p><p><br></p><p>Termination This User Agreement is effective unless and until terminated by either you or eshop.com. You may terminate this User Agreement at any time, provided that you discontinue any further use of this Site. eshop.com may terminate this User Agreement at any time and may do so immediately without notice, and accordingly deny you access to the Site, Such termination will be without any liability to eshop.com. Upon any termination of the User Agreement by either you or eshop.com, you must promptly destroy all materials downloaded or otherwise obtained from this Site, as well as all copies of such materials, whether made under the User Agreement or otherwise. eshop.com\\\'s right to any Comments shall survive any termination of this User Agreement. Any such termination of the User Agreement shall not cancel your obligation to pay for the product already ordered from the Website or affect any liability that may have arisen under the User Agreement.</p>'),
(4, 'fcm_server_key', 'your_fcm_server_key'),
(5, 'contact_us', '<h2><strong xss=removed>Contact Us</strong></h2>\\r\\n\\r\\n<p>For any kind of queries related to products, orders or services feel free to contact us on our official email address or phone number as given below :</p>\\r\\n\\r\\n<p>??</p>\\r\\n\\r\\n<h3><strong>Areas we deliver :??</strong></h3>\\r\\n\\r\\n<p>??</p>\\r\\n\\r\\n<h3><strong>Delivery Timings :</strong></h3>\\r\\n\\r\\n<ol>\\r\\n <li><strong>?? 8:00 AM To 10:30 AM</strong></li>\\r\\n <li><strong>10:30 AM To 12:30 PM</strong></li>\\r\\n <li><strong>?? 4:00 PM To?? 7:00 PM</strong></li></ol><h3>??<strong></strong>\\r\\n\\r\\n</h3><p><strong>Note : </strong>You can order for maximum 2days in advance. i.e., Today & Tomorrow only.?? <br></p>'),
(6, 'system_settings', '{\"system_configurations\":\"1\",\"system_timezone_gmt\":\"+05:30\",\"system_configurations_id\":\"13\",\"app_name\":\"Vendurs - ecommerce\",\"support_number\":\"9876543210\",\"support_email\":\"support@eshop.com\",\"current_version\":\"1.0.0\",\"current_version_ios\":\"1.0.0\",\"is_version_system_on\":\"1\",\"area_wise_delivery_charge\":\"1\",\"currency\":\"$\",\"delivery_charge\":\"10\",\"min_amount\":\"100\",\"system_timezone\":\"Asia\\/Kolkata\",\"is_refer_earn_on\":\"1\",\"min_refer_earn_order_amount\":\"100\",\"refer_earn_bonus\":\"10\",\"refer_earn_method\":\"percentage\",\"max_refer_earn_amount\":\"50\",\"refer_earn_bonus_times\":\"2\",\"welcome_wallet_balance_on\":\"0\",\"wallet_balance_amount\":\"\",\"minimum_cart_amt\":\"50\",\"low_stock_limit\":\"15\",\"max_items_cart\":\"12\",\"delivery_boy_bonus_percentage\":\"1\",\"max_product_return_days\":\"1\",\"is_delivery_boy_otp_setting_on\":\"1\",\"is_single_seller_order\":\"0\",\"is_customer_app_under_maintenance\":\"0\",\"is_seller_app_under_maintenance\":\"0\",\"is_delivery_boy_app_under_maintenance\":\"0\",\"message_for_customer_app\":\"\",\"message_for_seller_app\":\"\",\"message_for_delivery_boy_app\":\"\",\"cart_btn_on_list\":\"1\",\"expand_product_images\":\"0\",\"tax_name\":\"GST Number\",\"tax_number\":\"24GSTIN1022520\",\"company_name\":\"\",\"company_url\":\"\",\"supported_locals\":\"USD\",\"decimal_point\":\"0\"}'),
(7, 'payment_method', '{\"paypal_payment_method\":\"0\",\"paypal_mode\":\"sandbox\",\"paypal_business_email\":\"paypal_business_email\",\"currency_code\":\"USD\",\"razorpay_payment_method\":\"0\",\"razorpay_key_id\":\"rzp_test_key\",\"razorpay_secret_key\":\"secret_key\",\"refund_webhook_secret_key\":\"\",\"paystack_payment_method\":\"0\",\"paystack_key_id\":\"paystack_public_key\",\"paystack_secret_key\":\"paystack_secret_key\",\"stripe_payment_method\":\"1\",\"stripe_payment_mode\":\"test\",\"stripe_publishable_key\":\"pk_test_51Jn3kSJlncDjKFTgaHb2HOOjTyX4F1KxqszmD1DOqpTKmKGANgy64sinlbsrbG6gplAr6RkNwLexNBUfY2JQWQuV00dR5D1UJn\",\"stripe_secret_key\":\"sk_test_51Jn3kSJlncDjKFTg19uAu6dyZU3SDethGb38xgxXsmbsI79kKT472yTmxJLnXf6j7uRBAFoIEbzta5c5D0w14Fo600TgofWL0U\",\"stripe_webhook_secret_key\":\"webhook_secret\",\"stripe_currency_code\":\"USD\",\"flutterwave_payment_method\":\"0\",\"flutterwave_public_key\":\"public_key\",\"flutterwave_secret_key\":\"secret_key\",\"flutterwave_encryption_key\":\"enc_key\",\"flutterwave_webhook_secret_key\":\"\",\"flutterwave_currency_code\":\"NGN\",\"paytm_payment_method\":\"0\",\"paytm_payment_mode\":\"sandbox\",\"paytm_merchant_key\":\"merchant_key\",\"paytm_merchant_id\":\"merchant_id\",\"paytm_website\":\"WEBSTAGING\",\"paytm_industry_type_id\":\"Retail\",\"midtrans_payment_mode\":\"sandbox\",\"midtrans_payment_method\":\"0\",\"midtrans_client_key\":\"\",\"midtrans_merchant_id\":\"\",\"midtrans_server_key\":\"\",\"direct_bank_transfer\":\"0\",\"account_name\":\"eShop E-Commerce LLC.\",\"account_number\":\"020211022000001\",\"bank_name\":\"State Bank of India\",\"bank_code\":\"SBIIN0007\",\"notes\":\"<p>Please do not forget to upload the bank transfer receipt upon sending \\/ depositing money to the above-mentioned account. Once the amount deposit is confirmed the order will be processed further. To upload the receipt go to your order details page or screen and find a form to upload the receipt.<\\/p>\",\"cod_method\":\"1\"}'),
(8, 'about_us', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>'),
(9, 'currency', '$'),
(11, 'email_settings', '{\"email\":\"loopcon111@mailinator.com\",\"password\":\"Loopcon@111$\",\"smtp_host\":\"smtp.gmail.com\",\"smtp_port\":\"465\",\"mail_content_type\":\"html\",\"smtp_encryption\":\"ssl\"}'),
(12, 'time_slot_config', '{\"time_slot_config\":\"1\",\"is_time_slots_enabled\":\"0\",\"delivery_starts_from\":\"1\",\"allowed_days\":\"7\"}'),
(13, 'favicon', 'uploads/media/2022/vendurs-favicon.png'),
(14, 'delivery_boy_privacy_policy', '<p><span xss=\\\"removed\\\"> delivery boy ACCESSING,??</span>BROWSING OR OTHERWISE USING THE WEBSITE eShop.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with eShop vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.<br>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with eShop via phone or website or mobile application or browse through website www.eShop.com.</p><p>eShop reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.eShop.com</p><p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user???s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by eShop.com, consents to receive, accept calls and messages or any after communication from eShop vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p><p>eShop accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at eShop procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/??? , Rs. 40 as shipping charges shall be charged from user.</p><p>eShop updates the prices on daily basis and the price displayed at our website www.eShop.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.eShop.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens eShop vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to eShop vegetables & fruits Pvt Ltd as per the final invoice. We at eShop understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it???s not possible but eShop guarantee the fair deal and weight to all its users. eShop further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with eShop. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),
(15, 'delivery_boy_terms_conditions', '<p><span xss=\\\"removed\\\"> delivery boy ACCESSING,</span><span xss=\\\"removed\\\">??</span>BROWSING OR OTHERWISE USING THE WEBSITE eShop.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with eShop vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.<br>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with eShop via phone or website or mobile application or browse through website www.eShop.com.</p><p>eShop reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.eShop.com</p><p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user???s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by eShop.com, consents to receive, accept calls and messages or any after communication from eShop vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p><p>eShop accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at eShop procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/??? , Rs. 40 as shipping charges shall be charged from user.</p><p>eShop updates the prices on daily basis and the price displayed at our website www.eShop.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.eShop.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens eShop vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to eShop vegetables & fruits Pvt Ltd as per the final invoice. We at eShop understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it???s not possible but eShop guarantee the fair deal and weight to all its users. eShop further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with eShop. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),
(16, 'web_logo', 'uploads/media/2022/vendurs.png'),
(17, 'web_favicon', 'uploads/media/2022/vendurs-favicon.png'),
(18, 'web_settings', '{\"site_title\":\"eShop - Multipurpose Ecommerce Store\",\"support_number\":\"1234567890\",\"support_email\":\"eshop@gmail.com\",\"copyright_details\":\"Copyright \\u00a9 2021, All Right Reserved WRTeam\",\"address\":\"Time Square Empire, WRTeam , Mirzapar Highway , Bhuj , Kutch , Gujarat - 370001\",\"app_short_description\":\"eShop is a multipurpose Ecommerce Platform best suitable for all kinds of sectors like Electronics, Fashion, Groceries and Vegetables, Flowers, Gift articles, Medical, and more ..\",\"map_iframe\":\"&lt;iframe src=\\\\\\\"https:\\/\\/www.google.com\\/maps\\/embed?pb=!1m18!1m12!1m3!1d58652.60185263579!2d69.63381478835316!3d23.250814410717105!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3950e209000b6f17:0x7077f358af0774a6!2sBhuj, Gujarat!5e0!3m2!1sen!2sin!4v1614852897708!5m2!1sen!2sin\\\\\\\" width=\\\\\\\"600\\\\\\\" height=\\\\\\\"450\\\\\\\" style=\\\\\\\"border:0;\\\\\\\" allowfullscreen=\\\\\\\"\\\\\\\" loading=\\\\\\\"lazy\\\\\\\"&gt;&lt;\\/iframe&gt;\",\"logo\":\"uploads\\/media\\/2021\\/eshop-logo-full.png\",\"favicon\":\"uploads\\/media\\/2021\\/eshop-favicon.png\",\"meta_keywords\":\"Eshop , E-commerce\",\"meta_description\":\"Eshop is an ecommerce platform\",\"app_download_section\":true,\"app_download_section_title\":\"eShop Mobile App\",\"app_download_section_tagline\":\"Affordable Ecommerce Platform\",\"app_download_section_short_description\":\"Shop with us at affordable prices and get exciting cashback & offers.\",\"app_download_section_playstore_url\":\"https:\\/\\/play.google.com\\/\",\"app_download_section_appstore_url\":\"https:\\/\\/www.apple.com\\/in\\/app-store\\/\",\"twitter_link\":\"https:\\/\\/twitter.com\\/\",\"facebook_link\":\"https:\\/\\/facebook.com\\/\",\"instagram_link\":\"https:\\/\\/instagram.com\\/\",\"youtube_link\":\"https:\\/\\/youtube.com\\/\",\"shipping_mode\":true,\"shipping_title\":\"Free Shipping\",\"shipping_description\":\"Free Shipping at your door step.\",\"return_mode\":true,\"return_title\":\"Free Returns\",\"return_description\":\"Free return if products are damaged.\",\"support_mode\":true,\"support_title\":\"Support 24\\/7\",\"support_description\":\"24\\/7 and 365 days support is available.\",\"safety_security_mode\":true,\"safety_security_title\":\"100% Safe & Secure\",\"safety_security_description\":\"100% safe & secure.\"}'),
(19, 'firebase_settings', '{\"apiKey\":\"apiKey\",\"authDomain\":\"authDomain\",\"databaseURL\":\"databaseURL\",\"projectId\":\"projectId\",\"storageBucket\":\"storageBucket\",\"messagingSenderId\":\"messagingSenderId\",\"appId\":\"appId\",\"measurementId\":\"measurementId\"}'),
(20, 'admin_privacy_policy', '<p>Admin ACCESSING, BROWSING</span>??OR OTHERWISE USING THE WEBSITE eShop.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with eShop vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.</span></p><p>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with eShop via phone or website or mobile application or browse through website www.eShop.com.</p><p>eShop reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.eShop.com</p><p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user???s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by eShop.com, consents to receive, accept calls and messages or any after communication from eShop vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p><p>eShop accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at eShop procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/??? , Rs. 40 as shipping charges shall be charged from user.</p><p>eShop updates the prices on daily basis and the price displayed at our website www.eShop.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.eShop.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens eShop vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to eShop vegetables &??<span xss=\\\"removed\\\">ACCESSING??</span><span xss=\\\"removed\\\">fruits Pvt Ltd as per the final invoice. We at eShop understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it???s not possible but eShop guarantee the fair deal and weight to all its users. eShop further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</span></p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with eShop. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),
(21, 'admin_terms_conditions', '<p><span xss=\\\"removed\\\"><span xss=\\\"removed\\\"> admin ACCESSING, BROWSING</span>??OR OTHERWISE USING THE WEBSITE eShop.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with eShop vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.</span></p><p>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with eShop via phone or website or mobile application or browse through website www.eShop.com.</p><p>eShop reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.eShop.com</p><p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user???s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by eShop.com, consents to receive, accept calls and messages or any after communication from eShop vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p><p>eShop accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at eShop procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/??? , Rs. 40 as shipping charges shall be charged from user.</p><p>eShop updates the prices on daily basis and the price displayed at our website www.eShop.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.eShop.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens eShop vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to eShop vegetables & fruits Pvt Ltd as per the final invoice. We at eShop understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it???s not possible but eShop guarantee the fair deal and weight to all its users. eShop further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with eShop. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),
(22, 'seller_privacy_policy', '<p><span xss=\\\"removed\\\"><span xss=\\\"removed\\\" xss=removed><b>Privacy Policy</b></span><br></span></p><p><span xss=\\\"removed\\\">Seller ACCESSING,??</span>BROWSING OR OTHERWISE USING THE WEBSITE eShop.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with eShop vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.<br>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with eShop via phone or website or mobile application or browse through website www.eShop.com.</p><p>eShop reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.eShop.com</p><p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user???s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by eShop.com, consents to receive, accept calls and messages or any after communication from eShop vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p><p>eShop accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at eShop procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/??? , Rs. 40 as shipping charges shall be charged from user.</p><p>eShop updates the prices on daily basis and the price displayed at our website www.eShop.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.eShop.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens eShop vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to eShop vegetables & fruits Pvt Ltd as per the final invoice. We at eShop understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it???s not possible but eShop guarantee the fair deal and weight to all its users. eShop further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with eShop. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>');
INSERT INTO `settings` (`id`, `variable`, `value`) VALUES
(23, 'seller_terms_conditions', '<p><span xss=\\\"removed\\\"><span xss=\\\"removed\\\" xss=removed><b>Terms & Conditions</b></span></span><span xss=\\\"removed\\\">???</span><span xss=\\\"removed\\\"><br></span></p><p><span xss=\\\"removed\\\">Seller ACCESSING,??</span>BROWSING OR OTHERWISE USING THE WEBSITE eShop.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with eShop vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.<br>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with eShop via phone or website or mobile application or browse through website www.eShop.com.</p><p>eShop reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.eShop.com</p><p>eShop is in trade of fresh fruits and vegetables and delivers the order to home (user???s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by eShop.com, consents to receive, accept calls and messages or any after communication from eShop vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from eShop, please SMS NO OFFERS to 9512512125.</p><p>eShop accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at eShop procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/??? , Rs. 40 as shipping charges shall be charged from user.</p><p>eShop updates the prices on daily basis and the price displayed at our website www.eShop.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.eShop.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens eShop vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to eShop vegetables & fruits Pvt Ltd as per the final invoice. We at eShop understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it???s not possible but eShop guarantee the fair deal and weight to all its users. eShop further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with eShop. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),
(24, 'doctor_brown', '{\"code_bravo\":\"c026bcfd-7fe4-4541-94bb-142487e10684\",\"time_check\":\"f566326ac6925636fff8cf3d94f4d12435a1f7be201bbe7d8f7de2bd554976b1\",\"code_adam\":\"abhishekk89\",\"dr_firestone\":34380052}'),
(25, 'homepage_settings', '{\"app_name\":\"eShop - ecommerce\",\"banner\":\"uploads\\/media\\/2022\\/nav-bg.png\",\"categories\":[\"271\",\"285\",\"2\",\"46\",\"80\",\"146\",\"193\",\"310\",\"311\",\"319\",\"325\",\"575\",\"332\",\"364\",\"126\",\"409\",\"162\",\"437\"],\"main_category_1\":\"126\",\"sub_categories_1\":[\"127\",\"128\",\"130\",\"132\",\"134\",\"136\",\"138\",\"140\"],\"main_category_2\":\"332\",\"sub_categories_2\":[\"334\",\"335\",\"339\",\"342\",\"347\",\"349\",\"352\",\"358\"],\"main_category_3\":\"364\",\"sub_categories_3\":[\"365\",\"367\",\"370\",\"372\",\"375\",\"377\",\"379\",\"381\"],\"main_category_4\":\"409\",\"sub_categories_4\":[\"411\",\"412\",\"413\",\"415\",\"418\",\"420\",\"421\",\"422\"]}'),
(26, 'shipping_policy', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>'),
(27, 'return_policy', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `type`, `type_id`, `image`, `date_added`) VALUES
(1, 'categories', 285, 'uploads/media/2022/discount3.png', '2022-11-25 10:49:50'),
(2, 'default', 0, 'uploads/media/2022/discount3.png', '2022-11-25 10:51:20');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`id`, `email`, `date_created`) VALUES
(1, 'test1demo1@mailinator.com', '2022-11-04 09:17:32'),
(2, 'test2demo2@mailinator.com', '2022-11-04 10:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `system_notification`
--

CREATE TABLE `system_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(256) DEFAULT NULL,
  `message` varchar(20) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL,
  `type_id` int(11) DEFAULT 0,
  `read_by` tinyint(4) NOT NULL DEFAULT 0,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `system_notification`
--

INSERT INTO `system_notification` (`id`, `title`, `message`, `type`, `type_id`, `read_by`, `date_sent`) VALUES
(1, 'New order placed ID #1', 'New order received f', 'place_order', 1, 0, '2022-11-14 10:21:53'),
(2, 'New order placed ID #2', 'New order received f', 'place_order', 2, 0, '2022-11-14 10:32:49'),
(3, 'New order placed ID #3', 'New order received f', 'place_order', 3, 0, '2022-11-23 10:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `title` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `title`, `percentage`, `status`) VALUES
(1, 'dgdg', '90', 1),
(2, 'fvgbnv', '56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `slug`, `image`, `is_default`, `status`, `created_on`) VALUES
(1, 'Classic', 'classic', 'classic.jpg', 1, 0, '2021-02-11 05:18:42');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `ticket_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subject` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` int(11) NOT NULL,
  `user_type` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `attachments` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `title`, `date_created`) VALUES
(1, 'xfgxf', '2022-11-28 10:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `last_order_time` time NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `transaction_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txn_id` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payu_txn_id` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_email` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_date` timestamp NULL DEFAULT current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_refund` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transaction_type`, `user_id`, `order_id`, `order_item_id`, `type`, `txn_id`, `payu_txn_id`, `amount`, `status`, `currency_code`, `payer_email`, `message`, `transaction_date`, `date_created`, `is_refund`) VALUES
(1, 'transaction', 13, '3', 4, 'stripe', 'pi_3M7G9dJlncDjKFTg05cgmmlg', NULL, 60, 'success', NULL, NULL, 'Order Placed Successfully', '2022-11-23 10:26:16', '2022-11-23 10:26:16', 0),
(2, 'wallet', 6, NULL, 0, 'credit', NULL, NULL, 750, NULL, NULL, NULL, 'fghh', '2022-11-25 11:10:50', '2022-11-25 11:10:50', 0),
(3, 'wallet', 6, NULL, 0, 'credit', NULL, NULL, 677, NULL, NULL, NULL, 'gvhvbm', '2022-11-25 11:14:15', '2022-11-25 11:14:15', 0),
(4, 'wallet', 13, NULL, 0, 'credit', NULL, NULL, 4555, NULL, NULL, NULL, 'ghcgh', '2022-11-25 11:15:03', '2022-11-25 11:15:03', 0),
(5, 'wallet', 13, NULL, 0, 'debit', NULL, NULL, 27, NULL, NULL, NULL, 'gbhjbhjk', '2022-11-30 09:49:41', '2022-11-30 09:49:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `version` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `version`) VALUES
(1, '1.0'),
(2, '1.0.1'),
(3, '1.0.2'),
(4, '1.0.3'),
(5, '2.0.0'),
(7, '2.0.1'),
(14, '2.0.2'),
(15, '2.0.3'),
(16, '2.0.4'),
(17, '2.0.5'),
(18, '2.0.6'),
(19, '2.0.7');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double DEFAULT 0,
  `activation_selector` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgotten_password_selector` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgotten_password_time` int(11) DEFAULT NULL,
  `remember_selector` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `company` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bonus_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'percentage_per_order',
  `bonus` int(11) DEFAULT NULL,
  `cash_received` double(15,2) NOT NULL DEFAULT 0.00,
  `dob` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  `city` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serviceable_zipcodes` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apikey` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `friends_code` varchar(28) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `mobile`, `image`, `balance`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `company`, `address`, `bonus_type`, `bonus`, `cash_received`, `dob`, `country_code`, `city`, `area`, `street`, `pincode`, `serviceable_zipcodes`, `apikey`, `referral_code`, `friends_code`, `fcm_id`, `latitude`, `longitude`, `created_at`) VALUES
(1, '41.176.193.214', 'Admin', '$2y$12$90Lo4TbEUsmtQZA6B0iaYOp8i6NF3lf/3KPJfyTkw.Otf8NYbwqlu', 'loopcon111@gmail.com', '9876543211', NULL, 21610473638.449993, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1268889823, 1669884376, 1, 'ADMIN', NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, '57', '157', NULL, NULL, NULL, NULL, 'vXaEvNuR', NULL, 'fFQa3MftQ6uliFS6T1IdGk:APA91bGNY-dntY4Yu0zTtjS9hB1ncLHnVmyDnnF4QCvRx3BOT57TfKAIIg036aBQ2tNt3SKFyLVGamBviZu0TjDluRdojAVJMdH40BwL3Hrpr6YNkYwQGYzwmKfpf42Ktp0AyITmT7R5', NULL, NULL, '2020-06-30 10:20:08'),
(2, '::1', 'dikshita', '$2y$10$JkeDBNNmpfx7aD9UET/pZe6mfqlN2daHNJ5m.jcfaUkQvpZmYYl3e', 'dikshita@gmail.com', '222222222', NULL, 0, '9bab4eda6f47dce6ddcd', '$2y$10$53cUBe9kLAVrpyS.A8Mz/OP6eeXc/u5uQUdbV6TP0MU/aS03Yv8c.', NULL, NULL, NULL, NULL, NULL, 1649049092, NULL, 1, NULL, '237 time square', 'percentage_per_order', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2022-04-04 05:11:32'),
(3, '::1', 'Test Seller', '$2y$10$Pb7BJR4k2HN8oTClK5LwV.m4L1G7qSBFgi2TUBqKEEYotI0i7yhhe', 'testseller@mailinator.com', '9876543210', NULL, 0, '20cd49c3b8e24fa8f014', '$2y$10$Q2rBvVK9VPmcMydEVght7.iRTPxPERtCOk2DW3ZvHXg9ssb4V4OuW', NULL, NULL, NULL, NULL, NULL, 1665663713, NULL, 1, NULL, 'Ayodhya chowk, 150 ft. Ring Road, Rajkot', 'percentage_per_order', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2022-10-13 12:21:53'),
(4, '::1', 'Demo Seller', '$2y$10$Lo6srzFyxOUTdXDJLyXPXuDBMSvA32McFNscmjKPOIWi.ZigtxhKe', 'demoseller@mailinator.com', '9876543212', NULL, 0, '518c02c3e603a1ebe844', '$2y$10$/0LMaTrAWKHzmH6.xP8gV.XDpOy.JodC0f8sO9413rYjPUzHluuF6', NULL, NULL, NULL, NULL, NULL, 1665664172, NULL, 1, NULL, 'Ayodhya chowk, 150 Ft. Ring road, Rajkot', 'percentage_per_order', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '2022-10-13 12:29:32'),
(6, '::1', 'testdemo', '$2y$10$0hJZqVCdCHlM0uJ6eM7fDee0VZQWuX9oi1LYgcU4RWYWcjhy8Hq6q', 'testdemo@mailinator.com', NULL, NULL, 1427, 'a125ce59621d3eac5074', '$2y$10$iLOaZmYBJcoTvUt/X8HAT.e4sDkOsT5VMTljfHes5Rij1fERwlpsC', NULL, NULL, NULL, NULL, NULL, 1665733354, 1666073560, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-14 07:42:34'),
(12, '::1', 'Seller One', '$2y$10$LIb93sRwFjAb23tYeH1vEu.7gk8aYs.7qGWMDDsSSlW1f06jomIDm', 'sellerone@mailinator.com', '968563217', NULL, 0, '4245c8308a4180409f23', '$2y$10$3/cPAWOwuPfYo/Y7PvFLTO9GrxIu1QWhFImzTMz8.1KsgX6hbLiwu', NULL, NULL, NULL, NULL, NULL, 1665823437, 1669276778, 1, NULL, 'Ayodhya chowk', 'percentage_per_order', NULL, 0.00, NULL, NULL, 'Rajkot', NULL, NULL, '360007', NULL, NULL, NULL, NULL, NULL, '', '', '2022-10-15 08:43:57'),
(13, '::1', 'testuser', '$2y$10$C7252fJycprMWS99KQCngu4WhqkvZZF87u0KwjMjnWpk7HenzuuCa', 'testuser@mailinator.com', NULL, NULL, 4528, '29144d47ad765dd6b27c', '$2y$10$u2mbH.SCLwqK6uq8.Je1B.SgctQ.0FnKSDfx.YubsUBylovekntW2', NULL, NULL, NULL, NULL, NULL, 1666072079, 1669266516, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-18 05:47:59'),
(17, '::1', 'Seller Two', '$2y$10$IQO89jEpkWDN0Es389/X6OKQLxRTItNrETfqo5vi9s8Ruy2XWXcvW', 'sellertwo@mailinator.com', NULL, NULL, 0, '21b5118bb13b1df6c104', '$2y$10$pGw74WUNQFJpylzxClmaI.Qa7XCV3PuYol4Je2u9HkxW0M1sUGYvS', NULL, NULL, NULL, NULL, NULL, 1666268751, 1669113167, 1, NULL, 'sdgfahs', 'percentage_per_order', NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-20 12:25:51'),
(25, '::1', 'Seller Three', '$2y$10$SV0P8cb68Pe2v4v.NhLKJ.svUWM0cyB6PJYJvmyiiRolAawuQDZ0K', 'sellerthree@mailinator.com', '9876543201', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1668690667, 1669113191, 1, NULL, 'Ayodhya chowk', 'percentage_per_order', NULL, 0.00, NULL, NULL, 'Rajkot', NULL, NULL, '360001', NULL, NULL, NULL, NULL, NULL, '45.258741', '12.32554', '2022-11-17 13:11:07'),
(26, '::1', 'cbcb cbcb', '$2y$10$aRnGbU39UQ6dJzDB2hQXS.pkK.r9agC219GSASyETJs9FICoSvhlu', 'superadmin@gmail.com', '456789533445', NULL, 0, '3d773b1991dfbe09d1fc', '$2y$10$xu1mA.iOJ1UyyP686hf5GOogYWMBe95fRmqoJDLQ4M2Gd5ZR8PcxW', NULL, NULL, NULL, NULL, NULL, 1669727149, NULL, 0, NULL, 'hjbbbbg', 'percentage_per_order', NULL, 0.00, NULL, NULL, 'ffffffffffg', NULL, NULL, '360008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-29 13:05:49'),
(27, '::1', 'bjk, bbbbbk', '$2y$10$OnHP0GWjMqftS15c9.UvEusfYH.QstIjzl93SOHiOmBpgmu91Nj1.', '123@gmail.com', '456798778', NULL, 0, '0458b86e9002771d0c09', '$2y$10$3WU8qjJMbnlh1bF6rEVXeunAbf9JpNLgg0gnFPxvMvEdv26L56MTi', NULL, NULL, NULL, NULL, NULL, 1669807541, NULL, 0, NULL, 'hjbbbbg', 'percentage_per_order', NULL, 0.00, NULL, NULL, 'ffffffffffg', NULL, NULL, '360008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-30 11:25:41'),
(28, '::1', 'xdfxdfv xdfvxfv', '$2y$10$3QTzqBZpE7jt3dRjkkpideeTRT8rl6IDOlmyN/41z7fAMB2dzvyjK', '345@gmail.vom', '674544546567', NULL, 0, '6b35c6b144cec20f7b59', '$2y$10$vOJr4CQVEToZmujuQQmrx.Nzi05mQRgyAWLOGU8rJN699zyp49ef2', NULL, NULL, NULL, NULL, NULL, 1669807677, NULL, 0, NULL, 'rcvhn vbn', 'percentage_per_order', NULL, 0.00, NULL, NULL, 'ffffffffffg', NULL, NULL, '345666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-30 11:27:57'),
(29, '::1', 'xdfxdfv xdfvxfv', '$2y$10$i1sxeNRTkBnLWda0ppE.n.YcA/Rye0dT9bmwXklh7o7orNzz0DutS', '345222@gmail.vom', '674544546548', NULL, 0, 'b0af0e6a145fe3581222', '$2y$10$srqZRanEFOH9CXzoH9Is.uU7jFSopjM8kaMG2s17A5NBAMJSWL4Re', NULL, NULL, NULL, NULL, NULL, 1669807758, NULL, 0, NULL, 'rcvhn vbn', 'percentage_per_order', NULL, 0.00, NULL, NULL, 'ffffffffffg', NULL, NULL, '345666', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-30 11:29:18'),
(30, '::1', 'n,mn., hvnnm', '$2y$10$TFzXS3W2xAC8duhXbXlcX.qIl.nH07bsXYA3V87PfAJzWAYYVflW.', '345345@gmail.vom', '86426413231', NULL, 0, '738a52b0a9c582cfc467', '$2y$10$uoq4IUrNM7P3QWs57Dt4GuGUvJN2g/fHDbOWJkzGL03NmUI0eyUyG', NULL, NULL, NULL, NULL, NULL, 1669807875, NULL, 0, NULL, 'hjbbbbg', 'percentage_per_order', NULL, 0.00, NULL, NULL, 'ffffffffffg', NULL, NULL, '360008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-30 11:31:15'),
(31, '::1', 'cghcgh cfghcfgh', '$2y$10$noSIbCZfkZRtXdVMaCVU8uPjh/D2.O7NUbixK667vlU.VLbLFR7E2', '666@gmail.com', '457788542415', NULL, 0, 'eddb5ea1645dfc6176fe', '$2y$10$CyZt.Y1af1fkgyiLv5S.bOlgoSvwBSjokfgniE2surWqsAiiSXgOi', NULL, NULL, NULL, NULL, NULL, 1669808063, NULL, 0, NULL, 'fgccfgfg', 'percentage_per_order', NULL, 0.00, NULL, NULL, 'fxcgfg', NULL, NULL, '360008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-30 11:34:23');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 4),
(3, 3, 4),
(4, 4, 4),
(5, 5, 2),
(6, 6, 2),
(12, 12, 4),
(13, 13, 2),
(14, 14, 4),
(15, 15, 4),
(16, 16, 4),
(17, 17, 4),
(18, 18, 4),
(19, 19, 4),
(20, 20, 4),
(21, 21, 4),
(22, 22, 4),
(23, 23, 4),
(24, 24, 4),
(25, 25, 4),
(26, 26, 4),
(27, 27, 4),
(28, 28, 4),
(29, 29, 4),
(30, 30, 4),
(31, 31, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `permissions` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `role`, `permissions`, `created_by`) VALUES
(1, 1, 0, NULL, '2021-05-06 04:24:52');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'credit | debit',
  `amount` double NOT NULL,
  `message` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zipcodes`
--

CREATE TABLE `zipcodes` (
  `id` int(11) NOT NULL,
  `zipcode` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zipcodes`
--

INSERT INTO `zipcodes` (`id`, `zipcode`, `date_created`) VALUES
(1, '360001', '2022-11-23 08:42:58'),
(2, '360002', '2022-11-23 08:43:06'),
(3, '360003', '2022-11-23 08:43:12'),
(4, '360007', '2022-11-23 08:43:18'),
(5, '360005', '2022-11-26 06:53:09'),
(6, '360006', '2022-11-26 06:56:22'),
(7, '345666', '2022-11-30 10:07:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_set_id` (`attribute_set_id`);

--
-- Indexes for table `attribute_set`
--
ALTER TABLE `attribute_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_variant_id` (`product_variant_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_api_keys`
--
ALTER TABLE `client_api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_notifications`
--
ALTER TABLE `custom_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy_notifications`
--
ALTER TABLE `delivery_boy_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_boy_id` (`delivery_boy_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_boy_id` (`delivery_boy_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_bank_transfer`
--
ALTER TABLE `order_bank_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_variant_id` (`product_variant_id`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_faqs`
--
ALTER TABLE `product_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_rating`
--
ALTER TABLE `product_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_requests`
--
ALTER TABLE `return_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_commission`
--
ALTER TABLE `seller_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_data`
--
ALTER TABLE `seller_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variable` (`variable`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_notification`
--
ALTER TABLE `system_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile` (`mobile`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `zipcodes`
--
ALTER TABLE `zipcodes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attribute_set`
--
ALTER TABLE `attribute_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=585;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `client_api_keys`
--
ALTER TABLE `client_api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `custom_notifications`
--
ALTER TABLE `custom_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `delivery_boy_notifications`
--
ALTER TABLE `delivery_boy_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_bank_transfer`
--
ALTER TABLE `order_bank_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_faqs`
--
ALTER TABLE `product_faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_rating`
--
ALTER TABLE `product_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `return_requests`
--
ALTER TABLE `return_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `seller_commission`
--
ALTER TABLE `seller_commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `seller_data`
--
ALTER TABLE `seller_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_notification`
--
ALTER TABLE `system_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zipcodes`
--
ALTER TABLE `zipcodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
