-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2022 at 10:43 AM
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
-- Database: `institutemanagement_eacademy1`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_versions`
--

CREATE TABLE `app_versions` (
  `id` int(11) NOT NULL,
  `latest_version` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_versions`
--

INSERT INTO `app_versions` (`id`, `latest_version`) VALUES
(1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `added_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(250) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `student_id`, `added_id`, `date`, `time`, `batch_id`, `admin_id`) VALUES
(1, 65, 11, '2021-09-22', '03:31:41 PM', 0, 1),
(2, 85, 11, '2021-09-29', '04:15:37 PM', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sub_cat_id` int(11) NOT NULL,
  `batch_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `batch_type` int(11) NOT NULL COMMENT '1= batch free , 2=batch paid',
  `batch_price` varchar(100) NOT NULL,
  `batch_offer_price` varchar(50) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch_image` varchar(200) NOT NULL,
  `no_of_student` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `pay_mode` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batches`
--

INSERT INTO `batches` (`id`, `admin_id`, `cat_id`, `sub_cat_id`, `batch_name`, `start_date`, `end_date`, `start_time`, `end_time`, `batch_type`, `batch_price`, `batch_offer_price`, `description`, `batch_image`, `no_of_student`, `status`, `pay_mode`) VALUES
(25, 1, 7, 21, '01-07-2022 To 31-8-2022 Batch 1', '2022-07-01', '2022-08-31', '09:30:00', '18:30:00', 2, '15000', '12500', '', '', 0, 0, 'Online'),
(26, 1, 7, 21, 'october morning batch ', '2022-11-01', '2022-11-30', '09:00:00', '12:00:00', 2, '1000', '1000', 'A short descripion', '', 0, 1, 'offline');

-- --------------------------------------------------------

--
-- Table structure for table `batch_category`
--

CREATE TABLE `batch_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch_category`
--

INSERT INTO `batch_category` (`id`, `name`, `slug`, `status`, `time`, `admin_id`) VALUES
(7, 'Short Course', 'short_course', 1, '2022-07-01 13:40:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `batch_fecherd`
--

CREATE TABLE `batch_fecherd` (
  `id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `batch_specification_heading` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch_fecherd` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `batch_fecherd`
--

INSERT INTO `batch_fecherd` (`id`, `batch_id`, `batch_specification_heading`, `batch_fecherd`) VALUES
(1, 1, 'What will I learn?', '[\"You will be able to solve complex problem easily.\",\"Feature 2\",\"Feature 3\"]'),
(3, 2, 'ddgf', '[\"gfhgffdgh\",\"fdghgfhjkhkj\"]'),
(4, 2, '', '[\"Hello testing 1\"]'),
(5, 3, '', '[\"\"]'),
(6, 4, '', '[\"\"]'),
(7, 5, 'What will I learn?', '[\"You will be able to solve complex problem easily.\",\"Feature 2\",\"Feature 3\"]'),
(8, 5, 'What will I get?', '[\"10000+ Questions\",\"1000+ Test Series\",\"Video Lectures\"]'),
(9, 6, 'What will I learn?', '[\"You will be able to solve complex problem easily.\",\"Understand concepts of networking.\",\"Feature 3\"]'),
(10, 6, 'What will I get?', '[\"Books\",\"Practice Kit\",\"Live support\"]'),
(11, 7, 'What will I learn?', '[\"You will be able to solve complex problem easily.\",\"Features 2\",\"Features 3\"]'),
(12, 7, 'What will I get?', '[\"10000 + questions\",\"100+ test papers\",\"Video Lectures for all topic\"]'),
(13, 8, 'What will I learn?', '[\"You will be able to solve complex problem easily.\",\"Features 2\",\"Features 3\"]'),
(14, 8, 'What will I get?', '[\"10000+ questions\",\"Free pdf books\",\"Free Notes\",\"Live classes\"]'),
(15, 9, 'What will I learn?', '[\"You will be able to solve complex problem easily.\",\"Features 2\",\"Features 3\"]'),
(16, 9, 'What will I get?', '[\"10000+ Questions\",\"100+ Papers\",\"Live Classes\",\"Video Lectures\"]'),
(17, 10, 'What will I learn?', '[\"You will be able to solve complex problem easily.\",\"Feature 2\",\"Feature 3\"]'),
(18, 10, 'What will I get?', '[\"1000+ questions\",\"500+ papers\",\"Study Material\"]'),
(19, 11, '', '[\"\"]'),
(20, 12, 'What will I learn?', '[\"You will be able to solve complex problems easily.\",\"You will be able to solve complex problems easily.\",\"You will be able to solve complex problems easily.\"]'),
(21, 13, '', '[\"\"]'),
(22, 14, 'What will I learn?', '[\"You will be able to solve tricky problems easily.\",\"You will be able to solve tricky problems easily.\"]'),
(23, 15, 'What will I learn?', '[\"You will be able to solve complex problem easily.\",\"You will be able to solve complex problem easily.\"]'),
(24, 15, 'What will I get?', '[\"10000+ questions\",\"100+ Sample papers\",\"Weekly live classes\"]'),
(25, 16, 'What will I learn?', '[\"You will be able to solve complex problem easily.\",\"You will be able to solve complex problem easily.\"]'),
(26, 16, 'What will I get?', '[\"1000+ Question papers\",\"100+ Test series\",\"Daily live classes\"]'),
(27, 17, 'What will I learn?', '[\"You will be able to solve complex problem easily.\",\"You will be able to solve complex problem easily.\"]'),
(28, 17, 'What will I get?', '[\"1000+ Question papers\",\"1000+ Solved papers\",\"Live Classes\"]'),
(29, 18, 'What will I learn?', '[\"You will be able to solve complex problem easily.\",\"You will be able to solve complex problem easily.\"]'),
(30, 18, 'What will I get?', '[\"Video Tutorial\",\"100+ Series of programs\",\"10+ Programs for your portfolio \",\"Certificate after course completion\"]'),
(31, 14, 'What will I get?', '[\"Live classes\",\"24*7 Support\",\"5 Projects for portfolio \",\"Certificate after completion\"]'),
(32, 12, 'What will I get?', '[\"Live classes\",\"5 Projects for your portfolio\",\"Certificate after completions\",\"24*7 Support\",\"Life time access\"]'),
(33, 19, 'What will I learn?', '[\"You will be able to solve complex problem easily.\",\"You will be able to solve complex problem easily.\",\"You will be able to solve complex problem easily.\"]'),
(34, 19, 'What will I get?', '[\"10 Programs to showcase in your portfolio \",\"Certificate after completion\",\"24*7 Support\",\"Live classes\"]'),
(35, 20, '', '[\"\"]'),
(36, 21, 'What will I learn?', '[\"Test 1\",\"Test 2\"]'),
(37, 22, 'test', '[\"test\"]'),
(38, 23, '', '[\"\"]'),
(39, 24, '', '[\"\"]'),
(40, 25, '', '[\"\"]'),
(41, 26, 'They will learn how to hair cut', '[\"basics\",\"\"]'),
(42, 26, '', '[\"\"]');

-- --------------------------------------------------------

--
-- Table structure for table `batch_subcategory`
--

CREATE TABLE `batch_subcategory` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch_subcategory`
--

INSERT INTO `batch_subcategory` (`id`, `cat_id`, `name`, `slug`, `status`, `time`, `admin_id`) VALUES
(16, 6, 'Painting', 'qwrqwrqw', 1, '2022-05-23 04:25:08', 1),
(17, 6, 'Craft', 'craft', 1, '2022-05-23 04:25:08', 1),
(18, 4, 'Java', 'java', 1, '2022-05-23 04:25:08', 1),
(19, 5, 'Python', 'python', 1, '2022-11-03 08:56:09', 1),
(20, 2, 'Maths', 'maths', 1, '2022-05-23 04:25:08', 1),
(21, 7, 'Hair Colour Theory', 'hair_colour_theory', 1, '2022-07-01 13:41:26', 1),
(22, 2, 'Hair cut', 'hair_cut', 1, '2022-11-03 08:56:05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `batch_subjects`
--

CREATE TABLE `batch_subjects` (
  `id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `chapter` varchar(500) NOT NULL,
  `sub_start_date` date NOT NULL,
  `sub_end_date` date NOT NULL,
  `sub_start_time` time NOT NULL,
  `sub_end_time` time NOT NULL,
  `chapter_status` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'id of completed chapter',
  `chapter_complt_date` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `total_chapter_complt_date` datetime NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch_subjects`
--

INSERT INTO `batch_subjects` (`id`, `batch_id`, `teacher_id`, `subject_id`, `chapter`, `sub_start_date`, `sub_end_date`, `sub_start_time`, `sub_end_time`, `chapter_status`, `chapter_complt_date`, `total_chapter_complt_date`, `added_on`) VALUES
(134, 15, 8, 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', '2021-09-16', '2021-12-31', '14:00:00', '16:00:00', '', '', '0000-00-00 00:00:00', '2021-10-02 14:39:42'),
(135, 15, 11, 13, '[\"74\"]', '2021-10-08', '2021-10-29', '14:00:00', '16:00:00', '', '', '0000-00-00 00:00:00', '2021-10-02 14:39:42'),
(153, 9, 9, 3, '[\"81\"]', '2021-08-26', '2021-12-31', '16:00:00', '19:00:00', '', '', '0000-00-00 00:00:00', '2021-10-30 15:43:29'),
(116, 10, 10, 7, '[\"46\",\"47\",\"48\"]', '2021-08-25', '2021-12-31', '17:00:00', '20:00:00', '', '', '0000-00-00 00:00:00', '2021-09-28 15:03:01'),
(117, 10, 8, 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', '2021-08-25', '2021-12-31', '17:00:00', '20:00:00', '', '', '0000-00-00 00:00:00', '2021-09-28 15:03:01'),
(155, 5, 8, 1, '[\"85\",\"84\"]', '2021-08-18', '2021-12-31', '16:00:00', '19:00:00', '', '', '0000-00-00 00:00:00', '2021-10-30 15:52:59'),
(154, 8, 8, 2, '[\"83\"]', '2021-08-24', '2021-12-31', '14:00:00', '16:00:00', '', '', '0000-00-00 00:00:00', '2021-10-30 15:43:44'),
(150, 24, 10, 7, '[\"47\"]', '2021-10-04', '2021-10-30', '12:00:00', '13:00:00', '', '', '0000-00-00 00:00:00', '2021-10-30 15:12:55'),
(132, 14, 11, 12, '[\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\"]', '2021-09-16', '2021-09-30', '17:00:00', '06:00:00', '', '', '0000-00-00 00:00:00', '2021-10-02 11:43:39'),
(122, 16, 8, 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', '2021-09-16', '2021-11-30', '12:00:00', '14:00:00', '', '', '0000-00-00 00:00:00', '2021-09-28 15:05:22'),
(121, 17, 8, 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', '2021-09-16', '2021-11-30', '14:00:00', '16:00:00', '', '', '0000-00-00 00:00:00', '2021-09-28 15:05:09'),
(114, 18, 11, 12, '[\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\"]', '2021-09-16', '2021-12-31', '15:00:00', '17:00:00', '[\"51\"]', '{\"51\":\"29-09-2021\"}', '0000-00-00 00:00:00', '2021-09-28 15:02:22'),
(133, 12, 11, 11, '[\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\"]', '2021-09-22', '2021-09-21', '15:00:00', '16:00:00', '', '', '0000-00-00 00:00:00', '2021-10-02 11:43:54'),
(113, 19, 11, 13, '[\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\"]', '2021-09-16', '2021-12-31', '16:00:00', '18:00:00', '', '', '0000-00-00 00:00:00', '2021-09-28 15:02:09'),
(125, 20, 11, 11, '[\"65\"]', '2021-09-16', '2021-12-31', '12:00:00', '00:00:00', '', '', '0000-00-00 00:00:00', '2021-09-28 15:06:00'),
(152, 21, 10, 7, '[\"48\"]', '2021-10-22', '2021-10-31', '15:00:00', '20:00:00', '', '', '0000-00-00 00:00:00', '2021-10-30 15:13:35'),
(136, 22, 11, 13, '[\"72\",\"74\",\"75\"]', '2021-09-04', '2021-09-04', '18:00:00', '20:00:00', '', '', '0000-00-00 00:00:00', '2021-10-02 16:54:03'),
(156, 25, 15, 15, '[\"95\",\"94\",\"93\",\"92\"]', '2022-07-01', '2022-07-31', '09:30:00', '18:30:00', '', '', '0000-00-00 00:00:00', '2022-07-01 14:07:39'),
(157, 25, 15, 16, '[\"96\"]', '2022-07-01', '2022-07-31', '09:30:00', '18:30:00', '', '', '0000-00-00 00:00:00', '2022-07-01 14:07:39'),
(158, 25, 14, 17, '[\"97\"]', '2022-08-01', '2022-08-31', '09:30:00', '18:30:00', '', '', '0000-00-00 00:00:00', '2022-07-01 14:07:39'),
(159, 25, 14, 18, '[\"98\"]', '2022-08-01', '2022-08-31', '09:30:00', '18:30:00', '', '', '0000-00-00 00:00:00', '2022-07-01 14:07:39'),
(160, 26, 14, 18, '[\"98\"]', '2022-11-01', '2022-11-15', '09:00:00', '10:00:00', '', '', '0000-00-00 00:00:00', '2022-09-28 10:36:54');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL,
  `added_by` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `image`, `description`, `admin_id`, `added_by`, `status`, `create_at`) VALUES
(1, 'How to manage Time?', 'blog-celebrating-student-success_210920181157.png', '<div><h3>A 5-step time management program for more productive days Due to the sheer number of ways you can increase and optimize your time management, we’ve broken this guide up into a 5-step program. Start from the beginning or feel free to jump to the section where you need the most help.</h3><h4>Step 1: </h4><p>Understand where your time is going a time audit to set your intentions and see where your time currently goesUnderstand the Planning Fallacy so you can be realistic about what can be done in a dayDiscover the unseen distractions that are eating up your time Set up systems to track your daily progress and stay on track</p><p>Step 2: </p><p>Set smart goals and prioritize time for meaningful work Set smarter goals Prioritize your tasks ruthlessly using one of this practical methods Separate the urgent from the important workUse the 30X rule to delegate more tasksProtect your priorities by learning to say “no” to your boss, clients, and managers</p><p>Step 3: </p><p>Build an efficient daily scheduleBuild a morning routine that gives you momentum Use time blocking to create a daily template Make time for interruptions and breaks‘Batch’ your communication time Give up on multitasking and context switching Work with your body’s natural energy cycle</p><p>Step 4:</p><p> Optimize your work environment Get rid of the clutter (both physical and digital)Reduce noise issues with headphones or (the right) music Bring a bit of nature into your workspace Set up your tools for focusTry the “Workstation Popcorn” method</p><p>Step 5: </p><p>Protect your time (and your focus) from distractions strategic laziness to work on the right things automate non-negotiable focused time throughout the day Use the Ivy Lee Method to end your day properly Don’t forget the benefits of free time Use the right time management tools</p></div>', 1, '', 1, '2021-09-20 18:11:57'),
(2, 'Is English is easy?', 'English_211030152100.jpg', '<div><div><h2 xss=\"removed\">What is Lorem Ipsum?</h2><p xss=\"removed\"><strong xss=\"removed\">Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. </p></div></div>', 1, '', 1, '2021-09-21 12:58:45');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `admin_id` int(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_role` varchar(11) NOT NULL,
  `user_name` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `user_email` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `user_mobile` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `user_image` varchar(100) NOT NULL,
  `comments` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 = painding ,1 =complete , 2 = decline',
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `blog_id`, `admin_id`, `user_id`, `user_role`, `user_name`, `user_email`, `user_mobile`, `user_image`, `comments`, `status`, `create_at`) VALUES
(1, 1, 1, '1', '1', 'admin', 'admin@bizacademy.com', '', 'student_img.png', 'dsdsa', 0, '2021-09-21 19:10:51'),
(2, 1, 1, '1', '1', 'admin', 'admin@bizacademy.com', '', 'student_img.png', 'dsdsa', 0, '2021-09-21 19:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments_reply`
--

CREATE TABLE `blog_comments_reply` (
  `id` int(11) NOT NULL,
  `comment_id` varchar(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `name` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `email` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `reply` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `book_pdf`
--

CREATE TABLE `book_pdf` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_pdf`
--

INSERT INTO `book_pdf` (`id`, `admin_id`, `title`, `batch`, `topic`, `subject`, `file_name`, `status`, `added_by`, `added_at`) VALUES
(12, 1, 'Hair', '[\"25\"]', '', '15', '01220702000432.pdf', 1, 1, '2022-07-02 00:04:32');

-- --------------------------------------------------------

--
-- Table structure for table `call_log`
--

CREATE TABLE `call_log` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` longtext NOT NULL,
  `next_followup_date` timestamp NULL DEFAULT NULL,
  `call_duration` decimal(10,0) NOT NULL,
  `call_type` varchar(255) NOT NULL,
  `note` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `call_log`
--

INSERT INTO `call_log` (`id`, `name`, `phone`, `date`, `description`, `next_followup_date`, `call_duration`, `call_type`, `note`, `created_at`) VALUES
(2, 'Aaaa', 9852415245, '2022-10-23 03:52:36', 'LOrem Ipsum LOrem Ipsum', '2022-10-27 03:52:36', '6', 'Incoming', 'Lorem Ipsum Lorem Ipsum', '2022-10-31 03:52:36'),
(4, 'xyz', 8854752888, '2022-10-23 03:52:36', 'LOrem Ipsum LOrem Ipsum', '2022-10-27 03:52:36', '6', 'Incoming', 'Lorem Ipsum Lorem Ipsum', '2022-10-31 03:52:36'),
(5, 'Tasty', 9852144444, '2022-10-29 18:30:00', 'Lorem Ipsum', '2022-10-29 18:30:00', '9', 'Incoming', 'Aaaaaaaaaaaaafgfghfhg', '2022-10-28 04:26:56'),
(6, 'Demo', 9852145214, '2022-10-27 18:30:00', 'Lorem Ipsum Lorem Ipsum', '2022-10-27 18:30:00', '10', 'Incoming', 'Lorem Ipsum Lorem Ipsum', '2022-10-28 04:46:22');

-- --------------------------------------------------------

--
-- Table structure for table `certificate`
--

CREATE TABLE `certificate` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `added_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `certificate_setting`
--

CREATE TABLE `certificate_setting` (
  `id` int(11) NOT NULL,
  `heading` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sub_heading` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `certificate_logo` varchar(500) NOT NULL,
  `signature_image` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `certificate_setting`
--

INSERT INTO `certificate_setting` (`id`, `heading`, `sub_heading`, `title`, `description`, `certificate_logo`, `signature_image`) VALUES
(1, 'Certificate', 'Certificate of Completion', 'Program', 'hjhj', 'logobizacademy.svg', 'sign-12.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `chapter_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `no_of_questions` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `subject_id`, `chapter_name`, `status`, `no_of_questions`) VALUES
(38, 8, 'Guptas Vakatakas and Vardhanas', 1, 0),
(42, 9, 'International Events', 1, 0),
(43, 9, 'India and its neighbouring countries', 1, 0),
(44, 9, 'Chronology of Medieval India and their important systems', 1, 0),
(45, 9, 'Name of the Kings who built important ancient Temples and Institutions like Nalanda', 1, 0),
(46, 7, 'Verbs', 1, 0),
(47, 7, 'Grammar', 1, 0),
(48, 7, 'Article', 1, 0),
(49, 10, 'test 1', 1, 0),
(50, 10, 'test 2', 1, 0),
(51, 12, 'Basics', 1, 0),
(52, 12, 'Variable Declaration', 1, 0),
(53, 12, 'Definition and Scope', 1, 0),
(54, 12, 'Data Types', 1, 0),
(55, 12, 'Storage Classes', 1, 0),
(56, 12, 'Input and Output', 1, 2),
(57, 12, 'Operators', 1, 0),
(58, 12, 'Preprocessor', 1, 0),
(59, 12, 'Arrays and String', 1, 0),
(60, 11, 'Basics', 1, 0),
(61, 11, 'Variable Declaration', 1, 0),
(62, 11, 'Definition and Scope', 1, 0),
(63, 11, 'Data Types', 1, 0),
(64, 11, 'Storage Classes', 1, 0),
(65, 11, 'Input and Output', 1, 0),
(66, 11, 'Operators', 1, 0),
(67, 11, 'Preprocessor', 1, 0),
(68, 11, 'Arrays and String', 1, 0),
(69, 13, 'Variable Declaration', 1, 0),
(70, 13, 'Definition and Scope', 1, 0),
(71, 13, 'Data Types', 1, 0),
(72, 13, 'Storage Classes', 1, 0),
(73, 13, 'Input and Output', 1, 0),
(74, 13, 'Operators', 1, 0),
(75, 13, 'Preprocessor', 1, 0),
(76, 13, 'Arrays and String', 1, 0),
(79, 3, 'Inorganic', 1, 0),
(80, 3, 'Organic', 1, 0),
(81, 3, 'Periodic table', 1, 0),
(82, 2, 'Atoms', 1, 0),
(83, 2, 'Molecules', 1, 0),
(84, 1, 'Alegebra', 1, 0),
(85, 1, 'Addition', 1, 0),
(92, 15, 'Structure of the Hair', 1, 1),
(93, 15, 'Hair Analysis – Texture Type Density Elasticity Porosity', 1, 1),
(94, 15, 'Natural Hair Colour – Melanin Pigment Eumelanin Pheomelanin', 1, 1),
(95, 15, 'Colour Wheel – Primary Secondary Tertiary and Warm Colours', 1, 1),
(96, 16, 'Numbering system', 1, 1),
(97, 17, 'Chapter 1', 1, 1),
(98, 18, 'Chapter 1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL,
  `course_duration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class_size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time_duration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_name`, `status`, `start_date`, `end_date`, `image`, `admin_id`, `course_duration`, `class_size`, `time_duration`, `description`) VALUES
(1, 'Hair/Skin etc..', 0, '2022-10-26', '2022-11-09', '', 0, '15 days', '', '1 Hour', 'Lorem Ipsum'),
(2, 'Cooking...', 0, '2022-11-01', '2022-11-15', '', 0, '15 Days', '', '2 Hours', 'Lorem Ipsum');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enquiry_status` varchar(255) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry`
--

INSERT INTO `enquiry` (`id`, `name`, `mobile`, `email`, `subject`, `message`, `enquiry_status`, `date`) VALUES
(3, 'Test1', '9582351452', 'test@gmail.com', 'test test', 'testiiiiii', 'Call unavailable', '2022-10-13'),
(12, 'Tesat', '9855544111', '', '', 'AAAA', 'Call answered', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL COMMENT '1 - mock, 2 - practice',
  `format` int(11) NOT NULL COMMENT '1 - Shuffle, 2 - Fix',
  `batch_id` int(11) NOT NULL,
  `total_question` varchar(255) NOT NULL,
  `time_duration` varchar(255) NOT NULL COMMENT 'In Minute Only',
  `question_ids` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mock_sheduled_date` date NOT NULL,
  `mock_sheduled_time` time NOT NULL,
  `status` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `admin_id`, `name`, `type`, `format`, `batch_id`, `total_question`, `time_duration`, `question_ids`, `mock_sheduled_date`, `mock_sheduled_time`, `status`, `added_by`, `added_at`) VALUES
(32, 1, 'Basic Hair Colour Theory', 2, 1, 25, '4', '15', '[\"24\",\"25\",\"26\",\"27\"]', '0000-00-00', '00:00:00', 1, 1, '2022-07-02 00:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `extra_classes`
--

CREATE TABLE `extra_classes` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) NOT NULL,
  `batch_id` varchar(500) NOT NULL,
  `added_at` datetime NOT NULL,
  `completed_date_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `extra_classes`
--

INSERT INTO `extra_classes` (`id`, `admin_id`, `date`, `start_time`, `end_time`, `teacher_id`, `description`, `status`, `batch_id`, `added_at`, `completed_date_time`) VALUES
(4, 1, '2022-07-24', '00:00:00', '15:00:00', 15, 'Special Class', 'Incomplete', '[\"25\"]', '2022-07-02 00:09:53', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `extra_class_attendance`
--

CREATE TABLE `extra_class_attendance` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `added_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `title`, `icon`, `description`, `status`) VALUES
(1, 'Study Material', 'icofont-address-book', 'We Provide Top Class Study Material to our students.', 1),
(2, 'Test Series', 'icofont-notepad', 'We provide 100+ test series for all the courses.', 1),
(3, 'Certificate', 'icofont-certificate', 'We provide certificates after completing the course successfully.', 1),
(4, 'Class Rooms', 'icofont-building', 'Fully furnished classrooms.', 1),
(5, '24 hrs. Expert Guidance', 'icofont-teacher', 'We provide around-the-clock support to our students.', 1),
(6, 'brainstorming', 'icofont-brainstorming', 'Brainstorming session Every week. ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `frontend_details`
--

CREATE TABLE `frontend_details` (
  `id` int(11) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `map_api` varchar(255) NOT NULL,
  `slider_details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cont_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cont_sub_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cont_form_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faci_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faci_sub_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `frst_crse_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `frst_crse_sub_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `frst_crse_desc` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sec_crse_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sec_crse_sub_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abt_frst_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abt_frst_sub_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abt_year` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abt_frst_desc` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abt_frst_img` varchar(255) NOT NULL,
  `abt_sec_img` varchar(255) NOT NULL,
  `abt_sec_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abt_sec_desc` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abt_secbtn_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abt_secbtn_url` varchar(255) NOT NULL,
  `abt_thrd_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abt_thrd_sub_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abt_thrd_desc` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abt_thrd_img` varchar(255) NOT NULL,
  `total_toppers` int(11) NOT NULL,
  `trusted_students` int(11) NOT NULL,
  `years_of_histry` int(11) NOT NULL,
  `testimonial` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `testi_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `testi_subheading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `selectn_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `selectn_subheading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `selection` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `teacher_heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `teacher_subheading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `no_of_teacher` int(11) NOT NULL,
  `header_btn_txt` varchar(255) NOT NULL,
  `header_btn_url` varchar(255) NOT NULL,
  `client_imgs` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `frontend_details`
--

INSERT INTO `frontend_details` (`id`, `mobile`, `email`, `address`, `facebook`, `youtube`, `twitter`, `instagram`, `linkedin`, `map_api`, `slider_details`, `cont_heading`, `cont_sub_heading`, `cont_form_heading`, `faci_heading`, `faci_sub_heading`, `frst_crse_heading`, `frst_crse_sub_heading`, `frst_crse_desc`, `sec_crse_heading`, `sec_crse_sub_heading`, `abt_frst_heading`, `abt_frst_sub_heading`, `abt_year`, `abt_frst_desc`, `abt_frst_img`, `abt_sec_img`, `abt_sec_heading`, `abt_sec_desc`, `abt_secbtn_text`, `abt_secbtn_url`, `abt_thrd_heading`, `abt_thrd_sub_heading`, `abt_thrd_desc`, `abt_thrd_img`, `total_toppers`, `trusted_students`, `years_of_histry`, `testimonial`, `testi_heading`, `testi_subheading`, `selectn_heading`, `selectn_subheading`, `selection`, `teacher_heading`, `teacher_subheading`, `no_of_teacher`, `header_btn_txt`, `header_btn_url`, `client_imgs`) VALUES
(1, '1234567890', 'info@bizzonit.com', '04 A Agroha Nagar, Dewas, Madhya Pradesh', 'https://www.facebook.com', 'https://www.youtube.com', 'https://www.twitter.com', 'https://www.instagram.com', 'https://www.linkedin.com', '', '{\"slider_heading\":[\"Choose Best For Your Education\",\"Choose Best For Your Education\",\"Choose Best For Your Education\"],\"slider_subheading\":[\"Welcome to E-Academy\",\"Welcome to E-Academy\",\"Welcome to E-Academy\"],\"slider_desc\":[\"\",\"\",\"\"],\"slider_img\":[\"slider3.png\",\"slider1.png\",\"slider2.png\"]}', 'Contact Us For You Query', 'START WITH US', 'Send Us A Message', 'Our Facilities are', 'Our Facilities', 'Online Learning Plateform', 'WE ARE E - ACADEMY', '', 'Our Syllabus', 'WE ENHANCE YOUR TALENT', 'Why Choose Us', 'ABOUT E-ACADEMY', '1997', 'Consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore eesdoeit dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation and in ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum<br /><br />Excepteur sint occaecat cupidatat noesn proident sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut peerspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantiuws totam rem aperiam, eaque ipsa quae.Consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore eesdoeit dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.', 'about_img1.png', 'about_img2.png', 'We Take Care Of Your Careers Do Not Worry', 'We Are Very Cost Friendly And We Would Love To Be A Part Of Your Home Happiness For A Long Lorem Ipsum Dolor Sit Amet, Consectetur Adipisicing Elit Sed Eiusmod.', 'Contact Us', 'http://bizzonit.com/biz-academy/contact-us', 'Why Choose Us From Thousands', 'OUR MISSION', 'Consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore eesdoeit dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation and in ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.<br /><br />Excepteur sint occaecat cupidatat noesn proident sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut peerspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantiuws totam rem aperiam, eaque ipsa quae.', 'vission_img.png', 654, 200, 50, '{\"4\":\"fsghhjjgh\",\"3\":\"fgfhg jjyjy qweqe qewfre ret\",\"1\":\"Consectetur adipiscing elit, sed do eiusmod tempor incididunt uerset labore et dolore magna aliqua. Qesuis ipsum esuspendisse ultriceies gravida Risus commodo viverra andes aecenas accumsan lacus vel facilisis. \",\"2\":\"Consectetur adipiscing elit, sed do eiusmod tempor incididunt uerset labore et dolore magna aliqua. Qesuis ipsum esuspendisse ultriceies gravida Risus commodo viverra andes aecenas accumsan lacus vel facilisis. \"}', 'What Student Says', 'Biz- Academy REVIEWS', 'Our Selections', 'TOPPERS ARE HERE', '{\"2\":\"student\",\"3\":\"student\",\"1\":\"student\"}', 'Qualified Teacher', 'OUR EXPERTS', 6, '', '', '[\"01.png\",\"02.png\",\"03.png\",\"04.png\",\"05.png\",\"06.png\"]');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) NOT NULL,
  `upload` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `title`, `type`, `upload`, `image`, `video_url`, `video`, `status`, `admin_id`) VALUES
(48, 'Anatomy Of Hair Scalp', 'Image', 'File', '01.jpg', '', '', 1, 1),
(49, 'Hair Structure', 'Image', 'File', '02.jpg', '', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `key_text` text NOT NULL,
  `velue_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `title`, `key_text`, `velue_text`) VALUES
(1, 'payment gateway type select 1 = razorpay, 2 paypal', 'payment_type', '1'),
(2, 'razorpay key id ', 'razorpay_key_id', 'rzp_test_SyX2TUG1AuuUiC'),
(3, 'razorpay secret key', 'razorpay_secret_key', 'IXo11AWGgZo7iH0UdrFDODGS'),
(4, 'paypal client id', 'paypal_client_id', 'AQoZsAppdXNlefqgf7DnKi9udy75SL4DmqPqRdP-HUODw7CpJDK3BAXClECVoS31dtTOPuNix_L04JD0'),
(5, 'paypal secret key', 'paypal_secret_key', ''),
(6, 'select language type ', 'language_name', 'english'),
(7, 'select currency code', 'currency_code', 'INR'),
(8, 'select currency decimal code', 'currency_decimal_code', '₹'),
(9, 'currency converter api', 'currency_converter_api', ''),
(10, 'send mails SMTP ', 'smtp_mail', 'info@bizzonit.com'),
(11, 'smtp password mail', 'smtp_pwd', '(I)7A2i!8jzE'),
(12, 'smtp server type mail', 'server_type', 'smtp'),
(13, 'smtp host mail', 'smtp_host', 'mail.bizzonit.com'),
(14, 'smtp host mails', 'smtp_port', '587'),
(15, 'smtp smtp encryption', 'smtp_encryption', 'tlc'),
(16, 'sandbox accounts', 'sandbox_accounts', 'EHDaz3PQlfFzI6EzgrXmqqfEbqp9bLqm593GIBcq36e4V46zusKiF9EmQ5_dVPoqCXSRoAiOreBrkvTF'),
(17, 'Firebase Accounts', 'firebase_key', '#');

-- --------------------------------------------------------

--
-- Table structure for table `homeworks`
--

CREATE TABLE `homeworks` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `subject_id` int(11) NOT NULL,
  `batch_id` text NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `added_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leave_management`
--

CREATE TABLE `leave_management` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `leave_msg` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `total_days` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `live_class_history`
--

CREATE TABLE `live_class_history` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `start_time` varchar(500) NOT NULL,
  `end_time` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `entry_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `admin_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `live_class_setting`
--

CREATE TABLE `live_class_setting` (
  `id` int(11) NOT NULL,
  `batch` int(11) NOT NULL,
  `zoom_api_key` varchar(500) NOT NULL,
  `zoom_api_secret` varchar(500) NOT NULL,
  `meeting_number` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `added_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mock_result`
--

CREATE TABLE `mock_result` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL,
  `paper_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `submit_time` time NOT NULL,
  `total_question` int(11) NOT NULL,
  `time_duration` varchar(255) NOT NULL,
  `attempted_question` int(11) NOT NULL,
  `question_answer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `percentage` double NOT NULL,
  `added_on` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notes_pdf`
--

CREATE TABLE `notes_pdf` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notes_pdf`
--

INSERT INTO `notes_pdf` (`id`, `admin_id`, `title`, `batch`, `topic`, `subject`, `file_name`, `status`, `added_by`, `added_at`) VALUES
(4, 1, 'Hair', '[\"25\"]', '92', '15', '01220702000513.pdf', 1, 1, '2022-07-02 00:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `notice_for` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `date` date NOT NULL,
  `admin_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `added_by` varchar(255) NOT NULL,
  `read_status` int(11) NOT NULL,
  `added_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `notification_type` varchar(255) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `time` datetime DEFAULT NULL,
  `seen_by` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `old_paper_pdf`
--

CREATE TABLE `old_paper_pdf` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `title` varchar(250) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `batch` varchar(250) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `topic` varchar(250) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `subject` varchar(250) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `file_name` varchar(250) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `placement`
--

CREATE TABLE `placement` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `placement_date` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `salary` varchar(255) NOT NULL,
  `contract_month` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `placement`
--

INSERT INTO `placement` (`id`, `student_id`, `placement_date`, `company`, `position`, `salary`, `contract_month`, `description`, `created_at`) VALUES
(1, 91, '2022-11-03', 'Nexus', 'Tester', '45000', '9523452155', 'Aaaaaaaaaaa', '2022-11-03 07:29:37'),
(2, 92, '2022-11-02', 'Quicker', 'Deal', '20000', '6', 'sadsadsad', '2022-11-03 08:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `practice_result`
--

CREATE TABLE `practice_result` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL,
  `paper_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `submit_time` time NOT NULL,
  `total_question` int(11) NOT NULL,
  `time_duration` varchar(255) NOT NULL,
  `attempted_question` int(11) NOT NULL,
  `question_answer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `percentage` double NOT NULL,
  `added_on` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `practice_result`
--

INSERT INTO `practice_result` (`id`, `admin_id`, `student_id`, `paper_id`, `paper_name`, `date`, `start_time`, `submit_time`, `total_question`, `time_duration`, `attempted_question`, `question_answer`, `percentage`, `added_on`) VALUES
(26, 1, 85, 11, 'hgh', '2021-09-30', '17:45:00', '17:45:00', 10, '40', 7, '{\"11\":\"B\",\"13\":\"C\",\"16\":\"D\",\"17\":\"C\",\"19\":\"C\",\"20\":\"C\",\"21\":\"A\"}', 7.5, '2021-09-30 17:45:44'),
(27, 1, 85, 11, 'hgh', '2021-09-30', '18:07:00', '18:08:00', 10, '40', 9, '{\"11\":\"C\",\"12\":\"A\",\"13\":\"A\",\"16\":\"C\",\"17\":\"B\",\"18\":\"B\",\"19\":\"B\",\"20\":\"B\",\"21\":\"A\"}', 2.5, '2021-09-30 18:08:07'),
(28, 1, 85, 11, 'hgh', '2021-10-01', '14:27:00', '14:28:00', 10, '40', 10, '{\"11\":\"A\",\"12\":\"B\",\"13\":\"C\",\"14\":\"B\",\"16\":\"C\",\"17\":\"C\",\"18\":\"C\",\"19\":\"B\",\"20\":\"C\",\"21\":\"A\"}', 25, '2021-10-01 14:28:23'),
(29, 1, 85, 11, 'hgh', '2021-10-01', '15:44:00', '15:45:00', 10, '40', 10, '{\"11\":\"D\",\"12\":\"B\",\"13\":\"C\",\"14\":\"B\",\"16\":\"D\",\"17\":\"D\",\"18\":\"D\",\"19\":\"B\",\"20\":\"D\",\"21\":\"A\"}', 12.5, '2021-10-01 15:45:26'),
(30, 1, 85, 21, 'Pr1', '2021-10-01', '17:42:00', '17:43:00', 2, '2', 2, '{\"22\":\"B\",\"23\":\"A\"}', -25, '2021-10-01 17:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policy_data`
--

CREATE TABLE `privacy_policy_data` (
  `id` int(11) NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `privacy_policy_data`
--

INSERT INTO `privacy_policy_data` (`id`, `description`) VALUES
(1, '&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Suspendisse consectetur metus tellus, nec efficitur metus lobortis in. Fusce dapibus lacus sed sapien tincidunt dictum. Aliquam quis&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Suspendisse consectetur metus tellus, nec efficitur metus lobortis in. Fusce dapibus lacus sed sapien tincidunt dictum. Aliquam quis&lt;/span&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `question` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `options` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer` varchar(255) NOT NULL,
  `added_by` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `admin_id`, `subject_id`, `chapter_id`, `question`, `options`, `answer`, `added_by`, `status`, `category`, `added_on`) VALUES
(24, 1, 15, 95, '<p>An important process of hair coloring, if the client have never colored her hair before.</p>\r\n\r\n<div id=\"gtx-trans\" style=\"position: absolute; left: -79px; top: 38.0667px;\">\r\n<div class=\"gtx-trans-icon\">&nbsp;</div>\r\n</div>\r\n', '[\"\\u003Cp\\u003Eelasticity test\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003Egathers tools\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003Epatch test\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003Epurchase product\\u003C\\/p\\u003E\\r\\n\"]', 'D', 1, 1, 1, '2022-07-01 14:22:00'),
(25, 1, 15, 94, '<p>A hair coloring technique where in the color fade uses your natural hair color at the roots and blends into your chosen color at the ends of your hair.</p>\r\n', '[\"\\u003Cp\\u003Eombr\\u0026eacute; highlights\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003EBalayage\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003Eombr\\u0026eacute;\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003EReverse balayage\\u003C\\/p\\u003E\\r\\n\"]', 'A', 1, 1, 1, '2022-07-01 14:27:55'),
(26, 1, 15, 93, '<p>It is used to distribute color evenly and accurately on the hair.</p>\r\n', '[\"\\u003Cp\\u003EBrushes\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003EBarrier cream\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003ESectioning clips\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003EDisposable vinyl gloves\\u003C\\/p\\u003E\\r\\n\"]', 'A', 1, 1, 2, '2022-07-01 14:29:13'),
(27, 1, 15, 92, '<p>A hair coloring technique which is a subtler option where the faded color technique is applied to only small sections of your hair.</p>\r\n', '[\"\\u003Cp\\u003Eombr\\u0026eacute; highlights\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003EBalayage\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003Eombr\\u0026eacute;\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003Ereverse balayage\\u003C\\/p\\u003E\\r\\n\"]', 'A', 1, 1, 2, '2022-07-01 14:31:10'),
(28, 1, 16, 96, '<p>These are used to section the hair to make application of the color easier.</p>\r\n', '[\"\\u003Cp\\u003EBrushes\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003EBarrier cream\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003ESectioning clips\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003EDisposable vinyl gloves\\u003C\\/p\\u003E\\r\\n\"]', 'C', 1, 1, 2, '2022-07-01 14:32:37'),
(29, 1, 17, 97, '<p>&nbsp;What classification of hair color that are designed to penetrate the hair shaft and deposit their color directly into the cortex of the hair.</p>\r\n', '[\"\\u003Cp\\u003ESemi-permanent color\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003EPermanent colors\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003EDemi-permanent colors\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003ETemporary\\u003C\\/p\\u003E\\r\\n\"]', 'A', 1, 1, 2, '2022-07-01 14:33:39'),
(30, 1, 18, 98, '<p>the first preliminary step in hair coloring</p>\r\n', '[\"\\u003Cp\\u003EPicking of color\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003Egathering materials\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003Epurchasing\\u003C\\/p\\u003E\\r\\n\",\"\\u003Cp\\u003Epatch testing\\u003C\\/p\\u003E\\r\\n\"]', 'A', 1, 1, 2, '2022-07-01 14:35:25');

-- --------------------------------------------------------

--
-- Table structure for table `site_details`
--

CREATE TABLE `site_details` (
  `id` int(11) NOT NULL,
  `site_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site_favicon` varchar(255) NOT NULL,
  `site_logo` varchar(255) NOT NULL,
  `site_minilogo` varchar(255) NOT NULL,
  `site_loader` varchar(255) NOT NULL,
  `site_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site_keywords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enrollment_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `copyright_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timezone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_details`
--

INSERT INTO `site_details` (`id`, `site_title`, `site_favicon`, `site_logo`, `site_minilogo`, `site_loader`, `site_author`, `site_keywords`, `site_description`, `enrollment_word`, `copyright_text`, `timezone`) VALUES
(1, 'Academy', 'fav1.png', 'logoq2.svg', 'mini_logo.png', 'biz-academy.gif', 'Versasoft', 'education academy', 'Description', 'ACAD', 'Copyright © 2022 Academy. All Right Reserved.', 'Asia/Kolkata');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enrollment_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `father_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `father_designtn` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch_id` text NOT NULL,
  `login_status` int(11) NOT NULL,
  `admission_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL COMMENT '(0 unpaid ) (1 paid)',
  `brewers_check` varchar(50) NOT NULL,
  `token` varchar(500) NOT NULL,
  `app_version` varchar(100) NOT NULL,
  `added_by` varchar(50) NOT NULL,
  `last_login_app` datetime NOT NULL,
  `pay_mode` int(11) NOT NULL,
  `multi_batch` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `admin_id`, `name`, `enrollment_id`, `password`, `image`, `email`, `contact_no`, `gender`, `dob`, `father_name`, `father_designtn`, `address`, `batch_id`, `login_status`, `admission_date`, `status`, `payment_status`, `brewers_check`, `token`, `app_version`, `added_by`, `last_login_app`, `pay_mode`, `multi_batch`, `created_at`) VALUES
(44, 1, 'abcde', 'ACAD14349', '202cb962ac59075b964b07152d234b70', 'student_img.png', 'wipoja8072@secbuf.com', '01234567890', '', '0000-00-00', '', '', '', '0', 1, '2021-09-20', 1, 0, 'wUbvLQeVn7', '1', '', 'student', '2021-09-20 18:15:38', 0, '', '2022-11-03 06:42:03'),
(91, 1, 'Sajin', 'ACAD19021', 'e7d6e32260db3c6d20507dbeba451655', 'student_img.png', 'sajin@demo.com', '0987654321', 'male', '1995-01-01', '', '', '', '[\"25\"]', 0, '2022-07-01', 1, 0, '', '', '', '', '0000-00-00 00:00:00', 0, '', '2022-11-03 06:42:03'),
(92, 1, 'Ben', 'ACAD19178', '11979baa1fe80a1fde6cb73e3430cf4f', 'student_img.png', 'ben@demo.com', '1231231231', 'male', '1995-01-01', '', '', '', '[\"25\"]', 0, '2022-07-01', 0, 0, '', '', '', '', '0000-00-00 00:00:00', 0, '', '2022-11-03 06:42:03'),
(93, 1, 'jude', 'ACAD19216', '5a8943ce53a1365751102af42b1bfe64', 'student_img.png', 'jude@demo.com', '1234123412', 'male', '1995-01-01', '', '', '', '[\"25\"]', 0, '2022-07-02', 1, 0, '', '', '', '', '0000-00-00 00:00:00', 0, '', '2022-11-03 06:42:03'),
(94, 1, 'samuel', 'ACAD19377', '7e7014872fb54f9401089feb62fa23e7', 'student_img.png', 'samuel@demo.com', '1234512345', 'male', '1995-01-01', '', '', '', '[\"26\"]', 1, '2022-07-02', 0, 0, '', '', '', '', '0000-00-00 00:00:00', 0, '', '2022-11-03 06:42:03'),
(95, 1, 'aa', 'ACAD19433', '4513f6220dc457ec90976c5ddbbe4302', 'Chrysanthemum_221019103008.jpg', 'aa@aa.com', '0215342518', 'female', '2022-10-19', 'aa', 'aa', 'aaaa', '[\"26\"]', 0, '2022-10-19', 1, 0, '', '', '', '', '0000-00-00 00:00:00', 0, '', '2022-11-03 06:42:03');

-- --------------------------------------------------------

--
-- Table structure for table `student_doubts_class`
--

CREATE TABLE `student_doubts_class` (
  `doubt_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `subjects_id` varchar(100) NOT NULL,
  `chapters_id` varchar(500) NOT NULL,
  `users_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `teacher_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL COMMENT '0 = pending, 1 = approve, 2 = decline',
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_lead_management`
--

CREATE TABLE `student_lead_management` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` bigint(20) NOT NULL,
  `source` varchar(255) NOT NULL,
  `enquiry_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `enquiry_fromdate` timestamp NULL DEFAULT NULL,
  `enquiry_todate` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_lead_management`
--

INSERT INTO `student_lead_management` (`id`, `student_id`, `name`, `contact`, `source`, `enquiry_date`, `enquiry_fromdate`, `enquiry_todate`, `status`, `created_at`) VALUES
(1, 44, 'abcde', 9852314527, 'Walkin', '2022-10-27 18:30:00', '2022-10-28 18:30:00', '2022-10-28 18:30:00', 0, '2022-10-18 05:16:13'),
(4, 92, 'Test1', 9852314585, 'Website', '2022-10-10 18:30:00', '2022-10-23 18:30:00', '2022-10-19 18:30:00', 1, '2022-10-18 11:22:12'),
(5, 91, 'Test2', 9852314852, 'Google Ads', '2022-10-23 18:30:00', '2022-10-23 18:30:00', '2022-10-23 18:30:00', 0, '2022-10-19 05:07:03'),
(7, 93, 'Test3', 9852318524, 'Facebook Ads', '2022-10-17 18:30:00', '2022-10-17 18:30:00', '2022-10-17 18:30:00', 1, '2022-10-19 05:07:50'),
(8, 90, 'Test4', 9852318745, 'Facebook Ads', '2022-10-25 18:30:00', '2022-10-25 18:30:00', '2022-10-25 18:30:00', 0, '2022-10-19 05:47:29');

-- --------------------------------------------------------

--
-- Table structure for table `student_payment_history`
--

CREATE TABLE `student_payment_history` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `transaction_id` longtext NOT NULL,
  `mode` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_payment_history`
--

INSERT INTO `student_payment_history` (`id`, `student_id`, `batch_id`, `transaction_id`, `mode`, `amount`, `create_at`, `admin_id`) VALUES
(48, 90, 25, 'Cash', 'offline', 12500, '2022-07-01 14:11:07', 1),
(49, 91, 25, 'Cash', 'offline', 12500, '2022-07-01 14:13:41', 1),
(50, 92, 25, 'Cash', 'offline', 12500, '2022-07-01 18:25:05', 1),
(51, 93, 25, 'Cash', 'offline', 12500, '2022-07-01 18:41:52', 1),
(53, 95, 26, 'Cash', 'offline', 1000, '2022-10-19 10:30:08', 1),
(54, 90, 26, 'Cash', 'offline', 1000, '2022-10-19 10:30:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `no_of_questions` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`, `status`, `no_of_questions`, `admin_id`) VALUES
(15, 'Basic Hair Colour Theory', 1, 4, 1),
(16, 'Grey Hair Coverage', 1, 1, 1),
(17, 'Highlights Application Techniques', 1, 1, 1),
(18, 'Global Application Techniques', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sudent_batchs`
--

CREATE TABLE `sudent_batchs` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `added_by` varchar(100) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sudent_batchs`
--

INSERT INTO `sudent_batchs` (`id`, `student_id`, `batch_id`, `status`, `create_at`, `added_by`, `admin_id`) VALUES
(48, 35, 17, 0, '2021-09-20 11:37:01', 'student', 1),
(49, 42, 5, 0, '2021-09-20 17:56:58', 'student', 1),
(50, 43, 5, 0, '2021-09-20 18:00:06', 'student', 1),
(51, 43, 15, 0, '2021-09-20 18:00:53', 'student', 1),
(52, 15, 20, 0, '2021-09-20 18:15:00', 'student', 1),
(53, 15, 17, 0, '2021-09-20 18:15:34', 'student', 1),
(54, 35, 19, 0, '2021-09-20 18:16:33', 'student', 1),
(56, 35, 18, 0, '2021-09-20 18:19:09', 'student', 1),
(57, 35, 13, 0, '2021-09-20 18:30:24', 'student', 1),
(61, 45, 17, 0, '2021-09-21 12:33:44', 'student', 1),
(63, 45, 20, 0, '2021-09-21 12:39:31', 'student', 1),
(65, 45, 16, 0, '2021-09-21 13:06:17', 'student', 1),
(66, 45, 19, 0, '2021-09-21 13:52:31', 'student', 1),
(67, 45, 13, 0, '2021-09-21 13:53:01', 'student', 1),
(68, 15, 15, 0, '2021-09-21 14:16:54', 'student', 1),
(69, 15, 14, 0, '2021-09-21 14:17:11', 'student', 1),
(70, 15, 12, 0, '2021-09-21 14:17:46', 'student', 1),
(71, 60, 15, 0, '2021-09-21 16:26:37', 'student', 1),
(72, 62, 17, 0, '2021-09-21 16:32:04', 'student', 1),
(73, 63, 10, 0, '2021-09-21 16:32:50', 'student', 1),
(74, 63, 17, 0, '2021-09-21 16:33:15', 'student', 1),
(75, 64, 19, 0, '2021-09-21 16:35:03', 'student', 1),
(76, 65, 5, 0, '2021-09-22 12:01:47', 'student', 1),
(77, 65, 18, 0, '2021-09-22 12:10:47', 'student', 1),
(78, 65, 17, 0, '2021-09-22 12:30:47', 'student', 1),
(80, 68, 22, 0, '2021-09-23 18:18:01', 'student', 1),
(81, 69, 22, 0, '2021-09-23 18:34:30', 'student', 1),
(82, 70, 22, 0, '2021-09-23 18:39:24', 'student', 1),
(83, 70, 20, 0, '2021-09-23 18:41:54', 'student', 1),
(84, 70, 18, 0, '2021-09-23 18:43:11', 'student', 1),
(85, 72, 22, 0, '2021-09-23 18:59:29', 'student', 1),
(86, 72, 21, 0, '2021-09-23 19:00:10', 'student', 1),
(87, 74, 14, 0, '2021-09-24 11:56:08', '', 1),
(88, 67, 10, 0, '2021-09-24 12:07:56', 'student', 1),
(89, 67, 18, 0, '2021-09-24 12:09:17', 'student', 1),
(90, 75, 14, 0, '2021-09-24 12:23:01', 'Admin', 1),
(91, 76, 19, 0, '2021-09-24 12:26:07', 'Admin', 1),
(92, 76, 14, 0, '2021-09-24 12:26:07', 'Admin', 1),
(93, 77, 19, 0, '2021-09-24 12:41:37', 'Admin', 1),
(94, 77, 14, 0, '2021-09-24 12:41:37', 'Admin', 1),
(97, 1, 14, 0, '2021-09-24 13:03:16', 'Admin', 1),
(98, 1, 13, 0, '2021-09-24 13:03:16', 'Admin', 1),
(99, 1, 12, 0, '2021-09-24 13:03:16', 'Admin', 1),
(100, 1, 10, 0, '2021-09-24 13:03:16', 'Admin', 1),
(112, 78, 19, 0, '2021-09-24 16:27:34', 'Admin', 1),
(113, 79, 21, 0, '2021-09-24 16:27:47', 'Admin', 1),
(125, 80, 21, 0, '2021-09-27 14:53:43', 'Admin', 1),
(126, 80, 20, 0, '2021-09-27 14:53:43', 'Admin', 1),
(127, 80, 19, 0, '2021-09-27 14:53:43', 'Admin', 1),
(128, 80, 18, 0, '2021-09-27 14:53:43', 'Admin', 1),
(129, 80, 9, 0, '2021-09-27 14:53:43', 'Admin', 1),
(130, 82, 19, 0, '2021-09-28 17:06:51', 'Admin', 1),
(131, 82, 18, 0, '2021-09-28 17:06:51', 'Admin', 1),
(132, 82, 14, 0, '2021-09-28 17:06:52', 'Admin', 1),
(133, 82, 12, 0, '2021-09-28 17:06:52', 'Admin', 1),
(134, 83, 19, 0, '2021-09-28 17:15:40', 'Admin', 1),
(135, 83, 18, 0, '2021-09-28 17:15:40', 'Admin', 1),
(136, 83, 14, 0, '2021-09-28 17:15:40', 'Admin', 1),
(141, 81, 19, 0, '2021-09-29 10:45:50', 'Admin', 1),
(142, 81, 18, 0, '2021-09-29 10:45:50', 'Admin', 1),
(143, 84, 18, 0, '2021-09-29 15:03:59', 'student', 1),
(144, 85, 18, 0, '2021-09-29 15:32:30', 'student', 1),
(145, 85, 15, 0, '2021-09-29 15:52:34', 'student', 1),
(146, 85, 10, 0, '2021-09-29 15:53:46', 'student', 1),
(147, 15, 18, 0, '2021-09-29 16:02:35', 'student', 1),
(148, 85, 22, 0, '2021-09-29 16:30:15', 'student', 1),
(149, 87, 18, 0, '2021-09-29 16:43:13', 'student', 1),
(150, 87, 10, 0, '2021-09-29 16:59:26', 'student', 1),
(152, 13, 20, 0, '2021-10-01 12:55:25', 'Admin', 1),
(153, 13, 19, 0, '2021-10-01 12:55:25', 'Admin', 1),
(154, 13, 10, 0, '2021-10-01 12:55:25', 'Admin', 1),
(155, 13, 9, 0, '2021-10-01 12:55:25', 'Admin', 1),
(156, 13, 8, 0, '2021-10-01 12:55:25', 'Admin', 1),
(157, 13, 5, 0, '2021-10-01 12:55:25', 'Admin', 1),
(158, 88, 5, 0, '2021-10-02 14:35:34', 'student', 1),
(159, 13, 18, 0, '2021-10-02 15:14:26', 'student', 1),
(160, 89, 21, 0, '2021-10-02 18:03:50', 'Admin', 1),
(161, 89, 20, 0, '2021-10-02 18:03:50', 'Admin', 1),
(162, 81, 9, 0, '2021-10-04 17:23:27', 'student', 1),
(163, 90, 25, 0, '2022-07-01 14:11:07', 'Admin', 1),
(164, 91, 25, 0, '2022-07-01 14:13:41', 'Admin', 1),
(165, 92, 25, 0, '2022-07-01 18:25:05', 'Admin', 1),
(166, 93, 25, 0, '2022-07-01 18:41:52', 'Admin', 1),
(167, 94, 26, 0, '2022-07-01 18:42:46', 'Admin', 1),
(168, 95, 26, 0, '2022-10-19 10:30:08', 'Admin', 1),
(169, 90, 26, 0, '2022-10-19 10:30:59', 'Admin', 2);

-- --------------------------------------------------------

--
-- Table structure for table `temp_data`
--

CREATE TABLE `temp_data` (
  `id` int(11) NOT NULL,
  `temp` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_data`
--

INSERT INTO `temp_data` (`id`, `temp`) VALUES
(214, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(215, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(213, '{\"search\":\"\",\"start\":\"2\",\"length\":\"7\",\"limit\":\"3\"}'),
(212, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(211, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(210, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(209, '{\"search\":\"\",\"start\":\"8\",\"length\":\"13\",\"limit\":\"3\"}'),
(208, '{\"search\":\"\",\"start\":\"8\",\"length\":\"13\",\"limit\":\"3\"}'),
(207, '{\"search\":\"\",\"start\":\"8\",\"length\":\"13\",\"limit\":\"3\"}'),
(206, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(203, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(204, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(205, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(202, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(199, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(200, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(201, '{\"search\":\"\",\"start\":\"2\",\"length\":\"7\",\"limit\":\"3\"}'),
(196, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(197, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(198, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(194, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(195, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(190, '[]'),
(191, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(192, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(193, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(189, '[]'),
(26, '{\"batch_id\":\"10\",\"student_id\":\"85\"}'),
(27, '{\"batch_id\":\"10\",\"student_id\":\"85\"}'),
(28, '{\"student_id\":\"85\"}'),
(29, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(30, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(31, '{\"search\":\"\",\"start\":\"2\",\"length\":\"7\",\"limit\":\"3\"}'),
(32, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(33, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(34, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(35, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(36, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(37, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(38, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(39, '{\"search\":\"\",\"start\":\"2\",\"length\":\"7\",\"limit\":\"3\"}'),
(40, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(41, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(42, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(43, '{\"search\":\"\",\"start\":\"2\",\"length\":\"7\",\"limit\":\"3\"}'),
(44, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(45, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(46, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(47, '{\"student_id\":\"85\"}'),
(48, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(49, '{\"student_id\":\"85\"}'),
(50, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(51, '{\"search\":\"\",\"start\":\"2\",\"length\":\"6\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(52, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(53, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(54, '{\"student_id\":\"85\"}'),
(55, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(56, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(57, '{\"search\":\"\",\"start\":\"2\",\"length\":\"6\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(58, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(59, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(60, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(61, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(62, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(63, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(64, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(65, '{\"student_id\":\"85\"}'),
(66, '{\"student_id\":\"85\"}'),
(67, '{\"batch_id\":\"10\",\"student_id\":\"85\"}'),
(68, '{\"student_id\":\"85\"}'),
(69, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(70, '{\"search\":\"\",\"start\":\"2\",\"length\":\"6\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(71, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(72, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(73, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(74, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(75, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(76, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(77, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(78, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(79, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(80, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(81, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(82, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(83, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(84, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(85, '{\"student_id\":\"85\"}'),
(86, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(87, '{\"search\":\"\",\"start\":\"2\",\"length\":\"6\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(88, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(89, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(90, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(91, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(92, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(93, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(94, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(95, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(96, '{\"student_id\":\"85\"}'),
(97, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(98, '{\"search\":\"\",\"start\":\"2\",\"length\":\"6\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(99, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(100, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(101, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(102, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(103, '{\"subcat\":\"\'0\'\",\"start\":\"0\"}'),
(104, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(105, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(106, '[]'),
(107, '{\"start\":\"0\"}'),
(108, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(109, '{\"student_id\":\"85\"}'),
(110, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(111, '{\"search\":\"\",\"start\":\"2\",\"length\":\"6\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(112, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(113, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(114, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(115, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(116, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(117, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(118, '{\"student_id\":\"85\"}'),
(119, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(120, '{\"student_id\":\"85\"}'),
(121, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(122, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(123, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(124, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(125, '{\"student_id\":\"85\"}'),
(126, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(127, '{\"student_id\":\"85\"}'),
(128, '{\"start\":\"0\"}'),
(129, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(130, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(131, '{\"student_id\":\"85\"}'),
(132, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(133, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(134, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(135, '{\"student_id\":\"85\"}'),
(136, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(137, '{\"student_id\":\"85\"}'),
(138, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(139, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(140, '{\"student_id\":\"85\"}'),
(141, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(142, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(143, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(144, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(145, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(146, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(147, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(148, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(149, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(150, '{\"student_id\":\"85\"}'),
(151, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(152, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(153, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(154, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(155, '{\"student_id\":\"85\"}'),
(156, '{\"student_id\":\"85\"}'),
(157, '{\"student_id\":\"85\"}'),
(158, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"85\"}'),
(159, '{\"student_id\":\"85\"}'),
(160, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(161, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(162, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(163, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(164, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(165, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(166, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(167, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(168, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(169, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"15\"}'),
(170, '{\"student_id\":\"15\"}'),
(171, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"15\"}'),
(172, '{\"batch_id\":\"9\",\"student_id\":\"15\"}'),
(173, '{\"student_id\":\"15\"}'),
(174, '{\"batch_id\":\"9\",\"student_id\":\"15\"}'),
(175, '{\"student_id\":\"15\"}'),
(176, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"15\"}'),
(177, '{\"student_id\":\"15\"}'),
(178, '{\"search\":\"\",\"start\":\"3\",\"length\":\"7\",\"limit\":\"3\",\"student_id\":\"15\"}'),
(179, '{\"batch_id\":\"9\",\"student_id\":\"15\"}'),
(180, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(181, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(182, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(183, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(184, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(185, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(186, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(187, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\",\"student_id\":\"15\"}'),
(188, '{\"student_id\":\"15\"}'),
(216, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(217, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(218, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(219, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(220, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(221, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(222, '{\"search\":\"jav\",\"start\":\"0\",\"length\":\"1000\",\"limit\":\"3\"}'),
(223, '{\"search\":\"java\",\"start\":\"0\",\"length\":\"1000\",\"limit\":\"3\"}'),
(224, '{\"search\":\"java\",\"start\":\"0\",\"length\":\"1000\",\"limit\":\"3\"}'),
(225, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(226, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(227, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(228, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}'),
(229, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(230, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(231, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(232, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(233, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(234, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(235, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(236, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(237, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(238, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(239, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(240, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(241, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(242, '{\"search\":\"\",\"start\":\"0\",\"length\":\"3\",\"limit\":\"3\"}'),
(243, '{\"search\":\"\",\"start\":\"4\",\"length\":\"9\",\"limit\":\"3\"}'),
(244, '{\"search\":\"\",\"start\":\"3\",\"length\":\"8\",\"limit\":\"3\"}');

-- --------------------------------------------------------

--
-- Table structure for table `term_condition_data`
--

CREATE TABLE `term_condition_data` (
  `id` int(11) NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `term_condition_data`
--

INSERT INTO `term_condition_data` (`id`, `description`) VALUES
(1, '&lt;p&gt;&lt;span style=&quot;font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Suspendisse consectetur metus tellus, nec efficitur metus lobortis in. Fusce dapibus lacus sed sapien tincidunt dictum. Aliquam quis&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Suspendisse consectetur metus tellus, nec efficitur metus lobortis in. Fusce dapibus lacus sed sapien tincidunt dictum. Aliquam quis&lt;/span&gt;&lt;span style=&quot;font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Suspendisse consectetur metus tellus, nec efficitur metus lobortis in. Fusce dapibus lacus sed sapien tincidunt dictum. Aliquam quisdsfdgf&lt;/span&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `theme_color`
--

CREATE TABLE `theme_color` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `primary_color` varchar(500) NOT NULL,
  `border_color` varchar(500) NOT NULL,
  `font_color` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `theme_color`
--

INSERT INTO `theme_color` (`id`, `admin_id`, `primary_color`, `border_color`, `font_color`) VALUES
(1, 1, '#4d4a81', '#e7e7e9', '#888888'),
(2, 1, '#514D8D', '#7C78CB', '#6C68B3'),
(3, 1, '#C2BC8B', '#091C15', '#3D6657');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `admin_id` text NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL COMMENT '1 - admin, 3 - teacher',
  `teach_education` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `teach_image` varchar(255) NOT NULL,
  `teach_batch` varchar(255) NOT NULL,
  `teach_subject` varchar(255) NOT NULL,
  `teach_gender` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `token` text NOT NULL,
  `brewers_check` varchar(500) NOT NULL,
  `super_admin` text NOT NULL,
  `access` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `admin_id`, `name`, `email`, `password`, `role`, `teach_education`, `teach_image`, `teach_batch`, `teach_subject`, `teach_gender`, `parent_id`, `status`, `token`, `brewers_check`, `super_admin`, `access`) VALUES
(1, '1', 'admin', 'admin@bizacademy.com', '03115e3abf466d693bc3b1b2c32b0c00', 1, '', '', '', '', '', 0, 1, '1', 'FQVm1hsy5q', '1', ''),
(16, '1', 'Branch-Tamil Nadu', 'tamilnadu@demo.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '', 'gol_d_roger_(first)1.jpg', '', '', '', 1, 1, '', '', '', '{\"academics\":\"1\",\"gallary_manage\":\"1\",\"library_manager\":\"1\",\"question_manager\":\"1\",\"video_lecture\":\"1\",\"doubtsask\":\"1\",\"exam\":\"1\",\"teacher_manager\":\"1\",\"student_manage\":\"1\",\"enquiry\":\"1\"}'),
(14, '1', 'Hari', 'hari@demo.com', 'e10adc3949ba59abbe56e057f20f883e', 3, '', 'gol_d_roger_(first)6.jpg', '25,26', '[\"18\",\"17\"]', 'male', 1, 1, '', '', '', '{\"live_class\":\"1\",\"notice\":\"1\",\"assignment\":\"1\",\"extraclasses\":\"1\",\"doubtsask\":\"1\",\"video_lecture\":\"1\",\"course_content\":\"1\",\"question_manager\":\"1\",\"student_leave\":\"1\",\"student_manage\":\"1\",\"exam\":\"1\"}'),
(15, '1', 'Guru', 'guru@demo.com', 'e10adc3949ba59abbe56e057f20f883e', 3, '', 'gol_d_roger_(first)7.jpg', '25', '[\"16\",\"15\"]', 'male', 1, 1, '', '', '', '{\"live_class\":\"1\",\"notice\":\"1\",\"assignment\":\"1\",\"extraclasses\":\"1\",\"doubtsask\":\"1\",\"video_lecture\":\"1\",\"course_content\":\"1\",\"question_manager\":\"1\",\"student_leave\":\"1\",\"student_manage\":\"1\",\"exam\":\"1\"}'),
(17, '1', 'branch-kerala', 'kerala@demo.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '', 'gol_d_roger_(first)2.jpg', '', '', '', 1, 1, '', '', '', '{\"academics\":\"1\",\"gallary_manage\":\"1\",\"library_manager\":\"1\",\"question_manager\":\"1\",\"video_lecture\":\"1\",\"doubtsask\":\"1\",\"exam\":\"1\",\"teacher_manager\":\"1\",\"student_manage\":\"1\",\"enquiry\":\"1\"}'),
(18, '1', 'branch-karnataka', 'karnataka@demo.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '', 'gol_d_roger_(first)3.jpg', '', '', '', 1, 0, '', '', '', '{\"academics\":\"1\",\"gallary_manage\":\"1\",\"library_manager\":\"1\",\"question_manager\":\"1\",\"video_lecture\":\"1\",\"doubtsask\":\"1\",\"exam\":\"1\",\"teacher_manager\":\"1\",\"student_manage\":\"1\",\"enquiry\":\"1\"}');

-- --------------------------------------------------------

--
-- Table structure for table `vacancy`
--

CREATE TABLE `vacancy` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `last_date` date NOT NULL,
  `mode` varchar(255) NOT NULL,
  `files` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `added_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_lectures`
--

CREATE TABLE `video_lectures` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `url` varchar(255) NOT NULL,
  `video_type` varchar(255) NOT NULL,
  `preview_type` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video_lectures`
--

INSERT INTO `video_lectures` (`id`, `admin_id`, `title`, `batch`, `topic`, `subject`, `description`, `url`, `video_type`, `preview_type`, `status`, `added_by`, `added_at`) VALUES
(16, 1, 'Structure of Hair', '25', 'Structure of the Hair', 'Basic Hair Colour Theory', '', 'https://youtu.be/4vYYyvIo34M', 'youtube', 'preview', 1, 1, '2022-07-01 23:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `views_notification_student`
--

CREATE TABLE `views_notification_student` (
  `n_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `notice_type` varchar(100) NOT NULL,
  `views_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `views_notification_student`
--

INSERT INTO `views_notification_student` (`n_id`, `student_id`, `notice_type`, `views_time`) VALUES
(1, 16, 'book_notes_paper', '2021-09-02 11:53:07'),
(2, 16, 'extraClass', '2021-09-02 11:53:30'),
(3, 16, 'homeWork', '2021-09-02 11:53:37'),
(4, 16, 'videoLecture', '2021-09-02 15:45:40'),
(5, 15, 'mockPaper', '2021-09-02 04:45:17'),
(6, 15, 'book_notes_paper', '2021-09-29 17:07:33'),
(7, 16, 'practicePaper', '2021-09-04 12:02:22'),
(8, 15, 'videoLecture', '2021-09-21 15:38:50'),
(9, 15, 'extraClass', '2021-09-04 18:27:52'),
(10, 27, 'notices', '2021-09-15 18:30:35'),
(11, 65, 'notices', '2021-09-22 18:43:10'),
(12, 65, 'practicePaper', '2021-09-22 06:44:19'),
(13, 65, 'vacancy', '2021-09-22 15:33:37'),
(14, 65, 'videoLecture', '2021-09-22 18:43:06'),
(15, 65, 'homeWork', '2021-09-22 18:43:52'),
(16, 65, 'extraClass', '2021-09-22 12:12:35'),
(17, 65, 'book_notes_paper', '2021-09-22 12:58:32'),
(18, 65, 'mockPaper', '2021-09-22 06:45:19'),
(19, 67, 'book_notes_paper', '2021-09-24 12:08:42'),
(20, 67, 'mockPaper', '2021-09-24 12:12:19'),
(21, 67, 'practicePaper', '2021-09-24 12:13:02'),
(22, 70, 'notices', '2021-09-24 16:58:30'),
(23, 85, 'notices', '2021-09-29 17:07:51'),
(24, 85, 'homeWork', '2021-09-29 17:08:16'),
(25, 85, 'practicePaper', '2021-10-01 05:44:15'),
(26, 85, 'mockPaper', '2021-10-01 05:52:11'),
(27, 85, 'vacancy', '2021-09-30 18:06:13'),
(28, 85, 'videoLecture', '2021-09-29 17:03:11'),
(29, 85, 'extraClass', '2021-09-29 17:08:35'),
(30, 85, 'book_notes_paper', '2021-09-29 17:09:36'),
(31, 87, 'book_notes_paper', '2021-09-29 17:12:46'),
(32, 15, 'homeWork', '2021-09-29 16:51:11'),
(33, 87, 'notices', '2021-09-29 17:21:34'),
(34, 87, 'mockPaper', '2021-09-29 05:42:47'),
(35, 87, 'extraClass', '2021-09-29 17:26:47'),
(36, 87, 'vacancy', '2021-09-29 18:06:32'),
(37, 87, 'practicePaper', '2021-09-29 05:59:20'),
(38, 87, 'videoLecture', '2021-09-29 17:13:18'),
(39, 15, 'practicePaper', '2021-09-29 05:28:16');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `v_name` varchar(255) NOT NULL,
  `v_contact` bigint(20) NOT NULL,
  `id_card` text NOT NULL,
  `num_of_person` int(13) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `in_time` time NOT NULL,
  `out_time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `purpose`, `v_name`, `v_contact`, `id_card`, `num_of_person`, `date`, `in_time`, `out_time`, `created_at`) VALUES
(1, 'Student Meeting', 'aa', 985214522, '95627855', 8, '2022-10-25 18:30:00', '01:30:00', '08:00:00', '2022-10-20 10:55:45'),
(3, 'Parent Teacher Meeting', 'demo', 9856242514, '85265647', 6, '2022-10-17 18:30:00', '01:00:00', '01:30:00', '2022-10-21 04:30:06');

-- --------------------------------------------------------

--
-- Table structure for table `zoom_api_credentials`
--

CREATE TABLE `zoom_api_credentials` (
  `id` int(11) NOT NULL,
  `android_api_key` varchar(250) NOT NULL,
  `android_api_secret` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zoom_api_credentials`
--

INSERT INTO `zoom_api_credentials` (`id`, `android_api_key`, `android_api_secret`) VALUES
(1, 'CpVBurIP1Qw9w8wJ9vfXDO08ohbLTxA1cWTX', 'OfOROAaUckcPviaGYhRj0Kf2MS94k003Y4Yr');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_versions`
--
ALTER TABLE `app_versions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `batch_category`
--
ALTER TABLE `batch_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `batch_fecherd`
--
ALTER TABLE `batch_fecherd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batch_subcategory`
--
ALTER TABLE `batch_subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `batch_subjects`
--
ALTER TABLE `batch_subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `batch_id` (`batch_id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments_reply`
--
ALTER TABLE `blog_comments_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_pdf`
--
ALTER TABLE `book_pdf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `call_log`
--
ALTER TABLE `call_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `certificate`
--
ALTER TABLE `certificate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificate_setting`
--
ALTER TABLE `certificate_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `extra_classes`
--
ALTER TABLE `extra_classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `extra_class_attendance`
--
ALTER TABLE `extra_class_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `frontend_details`
--
ALTER TABLE `frontend_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homeworks`
--
ALTER TABLE `homeworks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `leave_management`
--
ALTER TABLE `leave_management`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`teacher_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `live_class_history`
--
ALTER TABLE `live_class_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `live_class_setting`
--
ALTER TABLE `live_class_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mock_result`
--
ALTER TABLE `mock_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `notes_pdf`
--
ALTER TABLE `notes_pdf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `old_paper_pdf`
--
ALTER TABLE `old_paper_pdf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `placement`
--
ALTER TABLE `placement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `practice_result`
--
ALTER TABLE `practice_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `privacy_policy_data`
--
ALTER TABLE `privacy_policy_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `site_details`
--
ALTER TABLE `site_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `student_doubts_class`
--
ALTER TABLE `student_doubts_class`
  ADD PRIMARY KEY (`doubt_id`);

--
-- Indexes for table `student_lead_management`
--
ALTER TABLE `student_lead_management`
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `student_payment_history`
--
ALTER TABLE `student_payment_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sudent_batchs`
--
ALTER TABLE `sudent_batchs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_data`
--
ALTER TABLE `temp_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `term_condition_data`
--
ALTER TABLE `term_condition_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_color`
--
ALTER TABLE `theme_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `vacancy`
--
ALTER TABLE `vacancy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `video_lectures`
--
ALTER TABLE `video_lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `views_notification_student`
--
ALTER TABLE `views_notification_student`
  ADD PRIMARY KEY (`n_id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `zoom_api_credentials`
--
ALTER TABLE `zoom_api_credentials`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_versions`
--
ALTER TABLE `app_versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `batch_category`
--
ALTER TABLE `batch_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `batch_fecherd`
--
ALTER TABLE `batch_fecherd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `batch_subcategory`
--
ALTER TABLE `batch_subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `batch_subjects`
--
ALTER TABLE `batch_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_comments_reply`
--
ALTER TABLE `blog_comments_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_pdf`
--
ALTER TABLE `book_pdf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `call_log`
--
ALTER TABLE `call_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `certificate`
--
ALTER TABLE `certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificate_setting`
--
ALTER TABLE `certificate_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `extra_classes`
--
ALTER TABLE `extra_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `extra_class_attendance`
--
ALTER TABLE `extra_class_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `frontend_details`
--
ALTER TABLE `frontend_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `homeworks`
--
ALTER TABLE `homeworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leave_management`
--
ALTER TABLE `leave_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `live_class_history`
--
ALTER TABLE `live_class_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `live_class_setting`
--
ALTER TABLE `live_class_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mock_result`
--
ALTER TABLE `mock_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notes_pdf`
--
ALTER TABLE `notes_pdf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `old_paper_pdf`
--
ALTER TABLE `old_paper_pdf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `placement`
--
ALTER TABLE `placement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `practice_result`
--
ALTER TABLE `practice_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `privacy_policy_data`
--
ALTER TABLE `privacy_policy_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `site_details`
--
ALTER TABLE `site_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `student_doubts_class`
--
ALTER TABLE `student_doubts_class`
  MODIFY `doubt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `student_lead_management`
--
ALTER TABLE `student_lead_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student_payment_history`
--
ALTER TABLE `student_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sudent_batchs`
--
ALTER TABLE `sudent_batchs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `temp_data`
--
ALTER TABLE `temp_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `term_condition_data`
--
ALTER TABLE `term_condition_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `theme_color`
--
ALTER TABLE `theme_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `vacancy`
--
ALTER TABLE `vacancy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `video_lectures`
--
ALTER TABLE `video_lectures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `views_notification_student`
--
ALTER TABLE `views_notification_student`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `zoom_api_credentials`
--
ALTER TABLE `zoom_api_credentials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
