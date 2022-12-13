-- khushali : 2022_09_21 11:25 AM

CREATE TABLE `company_faq` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL COMMENT '`id` of `company_details`',
  `question` text DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No;1=Yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `company_faq`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `company_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Khushali : 2022_09_22 4:40 PM
RENAME TABLE `company_deposit_options` TO `broker_deposit_options`;
ALTER TABLE `broker_deposit_options` CHANGE `company_id` `broker_id` INT(11) NULL DEFAULT NULL COMMENT '`id` of `broker_details`';
RENAME TABLE `company_details` TO `broker_details`;

RENAME TABLE `company_faq` TO `broker_faq`;
ALTER TABLE `broker_faq` CHANGE `company_id` `broker_id` INT(11) NULL DEFAULT NULL COMMENT '`id` of `broker_details`';

RENAME TABLE `company_licenses` TO `broker_licenses`;
ALTER TABLE `broker_licenses` CHANGE `company_id` `broker_id` INT(11) NULL DEFAULT NULL COMMENT '`id` of `broker_details`';

RENAME TABLE `company_local_offices` TO `broker_local_offices`;
ALTER TABLE `broker_local_offices` CHANGE `company_id` `broker_id` INT(11) NULL DEFAULT NULL COMMENT '`id` of `broker_details`';

RENAME TABLE `company_trading_assets` TO `broker_trading_assets`;
ALTER TABLE `broker_trading_assets` CHANGE `company_id` `broker_id` INT(11) NULL DEFAULT NULL COMMENT '`id` of `broker_details`';

RENAME TABLE `company_trading_platforms` TO `broker_trading_platforms`;
ALTER TABLE `broker_trading_platforms` CHANGE `company_id` `broker_id` INT(11) NULL DEFAULT NULL COMMENT '`id` of `broker_details`';

RENAME TABLE `company_withdrawal_options` TO `broker_withdrawal_options`;
ALTER TABLE `broker_withdrawal_options` CHANGE `company_id` `broker_id` INT(11) NULL DEFAULT NULL COMMENT '`id` of `broker_details`';

-- khushali : 2022_09_23 10:34 AM
ALTER TABLE `broker_details` ADD `meta_title` VARCHAR(255) NULL AFTER `year_founded`, ADD `meta_keyword` VARCHAR(255) NULL AFTER `meta_title`, ADD `meta_description` TEXT NULL AFTER `meta_keyword`, ADD `focus_keyphrase` VARCHAR(255) NULL AFTER `meta_description`, ADD `bonus_amount` VARCHAR(255) NULL AFTER `focus_keyphrase`, ADD `bonus_end_date` DATE NULL AFTER `bonus_amount`, ADD `offer` VARCHAR(255) NULL AFTER `bonus_end_date`, ADD `bonus_url` VARCHAR(255) NULL AFTER `offer`;

ALTER TABLE `trading_platform` ADD `image` VARCHAR(255) NULL AFTER `slug`;
ALTER TABLE `trading_asset` ADD `image` VARCHAR(255) NULL AFTER `slug`;
ALTER TABLE `licenses` ADD `image` VARCHAR(255) NULL AFTER `slug`;
ALTER TABLE `payment_options` ADD `image` VARCHAR(255) NULL AFTER `slug`;

-- Payal : 2022_09_30 4:05 PM
--
-- Table structure for table `bonus`
--

CREATE TABLE `bonus` (
  `id` int(11) NOT NULL,
  `bonus_amount` varchar(255) DEFAULT NULL,
  `bonus_end_date` date DEFAULT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `bonus_url` varchar(255) NOT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No;1=Yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `bonus`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

  CREATE TABLE `broker_bonus` (
  `id` int(11) NOT NULL,
  `broker_id` int(11) DEFAULT NULL COMMENT '`id` of `broker_details`',
  `bonus_id` int(11) DEFAULT NULL COMMENT '`id` of `bonus`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `broker_bonus`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `broker_bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Khushali : 2022_10_17 10:47 AM
--
-- Table structure for table `bonus`
--

DROP TABLE `bonus`;

CREATE TABLE `bonus` (
  `id` int(11) NOT NULL,
  `slug` text DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `bonus_url` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `available_for` text DEFAULT NULL,
  `how_to_apply` text DEFAULT NULL,
  `max_leverage` text DEFAULT NULL,
  `verification` tinyint(1) DEFAULT 0 COMMENT '0=yes;1=no',
  `withdrawal` text DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No;1=Yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `bonus`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bonus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Table structure for table `account_type`
--

CREATE TABLE `account_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No,1=Yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `account_type`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `account_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


--
-- Table structure for table `bonus_type`
--

CREATE TABLE `bonus_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No,1=Yes',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `bonus_type`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bonus_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Table structure for table `bonus_account_type_options`
--
CREATE TABLE `bonus_account_type_options` (
  `id` int(11) NOT NULL,
  `bonus_id` int(11) DEFAULT NULL COMMENT '`id` of `bonus`',
  `account_type_id` int(11) DEFAULT NULL COMMENT '`id` of `account_type`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `bonus_account_type_options`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bonus_account_type_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Table structure for table `bonus_deposit_options`
--

CREATE TABLE `bonus_deposit_options` (
  `id` int(11) NOT NULL,
  `bonus_id` int(11) DEFAULT NULL COMMENT '`id` of `bonus`',
  `payment_option_id` int(11) DEFAULT NULL COMMENT '`id` of `payment_options`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `bonus_deposit_options`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bonus_deposit_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Table structure for table `bonus_licenses`
--

CREATE TABLE `bonus_licenses` (
  `id` int(11) NOT NULL,
  `bonus_id` int(11) DEFAULT NULL COMMENT '`id` of `bonus`',
  `license_id` int(11) DEFAULT NULL COMMENT '`id` of `licenses`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `bonus_licenses`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bonus_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Table structure for table `bonus_trading_platforms`
--

CREATE TABLE `bonus_trading_platforms` (
  `id` int(11) NOT NULL,
  `bonus_id` int(11) DEFAULT NULL COMMENT '`id` of `bonus`',
  `trading_platform_id` int(11) DEFAULT NULL COMMENT '`id` of `trading_platform`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `bonus_trading_platforms`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bonus_trading_platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Table structure for table `bonus_type_options`
--

CREATE TABLE `bonus_type_options` (
  `id` int(11) NOT NULL,
  `bonus_id` int(11) DEFAULT NULL COMMENT '`id` of `bonus`',
  `bonus_type_id` int(11) DEFAULT NULL COMMENT '`id` of `bonus_type`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `bonus_type_options`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bonus_type_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Table structure for table `bonus_withdrawal_options`
--

CREATE TABLE `bonus_withdrawal_options` (
  `id` int(11) NOT NULL,
  `bonus_id` int(11) DEFAULT NULL COMMENT '`id` of `bonus`',
  `payment_option_id` int(11) DEFAULT NULL COMMENT '`id` of `payment_options`',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `bonus_withdrawal_options`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `bonus_withdrawal_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Khushali : 2022_11_03 2:38 PM
--
-- Table structure for table `broker_reviews`
--

CREATE TABLE `broker_reviews` (
  `id` int(11) NOT NULL,
  `broker_id` int(11) DEFAULT NULL COMMENT '`id` of `broker_details`',
  `review` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `broker_reviews`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `broker_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Khushali : 2022_04_11 4:43 PM
ALTER TABLE `trading_platform` ADD `description` TEXT NULL AFTER `name`;

ALTER TABLE `broker_details` ADD `min_spread` VARCHAR(255) NULL AFTER `bonus_url`, ADD `max_leverage` VARCHAR(255) NULL AFTER `min_spread`, ADD `currency_pass` VARCHAR(255) NULL AFTER `max_leverage`, ADD `customer_support` VARCHAR(255) NULL AFTER `currency_pass`, ADD `type_of_broker` VARCHAR(255) NULL AFTER `customer_support`, ADD `trading_instruments` VARCHAR(255) NULL AFTER `type_of_broker`, ADD `used_by` VARCHAR(255) NULL AFTER `trading_instruments`, ADD `scores` VARCHAR(255) NULL AFTER `used_by`;

ALTER TABLE `broker_details` ADD `broker_url` VARCHAR(255) NULL AFTER `scores`;

-- Khushali : 2022_07_11 11:12 PM
UPDATE `settings` SET `name` = 'Twitter' WHERE `settings`.`id` = 6;
UPDATE `settings` SET `label` = 'twitter' WHERE `settings`.`id` = 6;

-- Khushali : 2022_07_11 3:25 PM
CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Khushali : 2022_09_11 4:45 PM
ALTER TABLE `broker_details` ADD `is_show_in_front` TINYINT(1) NULL DEFAULT '0' COMMENT '0=No;1=Yes' AFTER `broker_url`;

--
-- Table structure for table `trade_users`
--

CREATE TABLE `trade_users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `investment_capital` varchar(255) DEFAULT NULL,
  `is_archive` tinyint(1) DEFAULT 0 COMMENT '0=No;1=Yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `trade_users`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `trade_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Khushali : 2022_11_10 5:06 PM
--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL,
  `image` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `image`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, NULL, NULL, '2022-11-10 11:25:16', NULL, '2022-11-10 11:25:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- Khushali : 2022_11_15 11:06 AM
ALTER TABLE `advertisements` ADD `add_url` VARCHAR(255) NULL AFTER `image`;