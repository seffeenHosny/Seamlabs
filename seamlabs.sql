-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 14, 2023 at 03:36 PM
-- Server version: 8.0.33-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seamlabs`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'product 1', '10.00', '2023-05-14 07:26:06', '2023-05-14 07:26:06'),
(2, 'product 2', '10.00', '2023-05-14 07:26:58', '2023-05-14 07:26:58'),
(3, 'product 3', '10.00', '2023-05-14 07:27:03', '2023-05-14 07:27:03'),
(4, 'product 4', '10.00', '2023-05-14 07:27:07', '2023-05-14 07:27:07'),
(5, 'product 5', '15.00', '2023-05-14 07:27:17', '2023-05-14 07:27:17'),
(6, 'product 6', '15.00', '2023-05-14 07:27:21', '2023-05-14 07:27:21'),
(7, 'product 7', '15.00', '2023-05-14 07:27:25', '2023-05-14 07:27:25'),
(8, 'product 8', '15.00', '2023-05-14 07:27:29', '2023-05-14 07:27:29'),
(9, 'product 9', '20.00', '2023-05-14 07:27:35', '2023-05-14 07:27:35'),
(10, 'product 10', '20.00', '2023-05-14 07:27:39', '2023-05-14 07:27:39'),
(11, 'product 11', '20.00', '2023-05-14 07:27:43', '2023-05-14 07:27:43'),
(12, 'product 12', '20.00', '2023-05-14 07:27:47', '2023-05-14 07:27:47'),
(13, 'product 12', '20.00', '2023-05-14 08:20:20', '2023-05-14 08:20:20'),
(14, 'product 12', '20.00', '2023-05-14 08:29:17', '2023-05-14 08:29:17'),
(15, 'product 12', '20.00', '2023-05-14 08:46:40', '2023-05-14 08:46:40'),
(16, 'product 12', '20.00', '2023-05-14 08:47:31', '2023-05-14 08:47:31'),
(17, 'product 12', '20.00', '2023-05-14 09:35:34', '2023-05-14 09:35:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_14_090752_create_menu_items_table', 1),
(6, '2023_05_14_090827_create_orders_table', 1),
(7, '2023_05_14_091009_create_order_items_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_type` enum('dine-in','delivery','takeaway') COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_number` int DEFAULT NULL,
  `waiter_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_fees` decimal(10,2) DEFAULT NULL,
  `service_charge` decimal(10,2) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_type`, `customer_name`, `customer_phone`, `table_number`, `waiter_name`, `delivery_fees`, `service_charge`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 'takeaway', NULL, NULL, NULL, NULL, NULL, NULL, '45.00', '2023-05-14 07:44:34', '2023-05-14 07:44:34'),
(2, 'takeaway', NULL, NULL, NULL, NULL, NULL, NULL, '90.00', '2023-05-14 07:45:23', '2023-05-14 07:45:23'),
(3, 'takeaway', NULL, NULL, NULL, NULL, NULL, NULL, '90.00', '2023-05-14 07:58:52', '2023-05-14 07:58:52'),
(4, 'dine-in', NULL, NULL, 10, 'seffeen', NULL, '10.00', '100.00', '2023-05-14 07:59:42', '2023-05-14 07:59:42'),
(5, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:00:19', '2023-05-14 08:00:19'),
(6, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:00:59', '2023-05-14 08:00:59'),
(7, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:27', '2023-05-14 08:02:27'),
(8, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:30', '2023-05-14 08:02:30'),
(9, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:31', '2023-05-14 08:02:31'),
(10, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:32', '2023-05-14 08:02:32'),
(11, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:32', '2023-05-14 08:02:32'),
(12, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:33', '2023-05-14 08:02:33'),
(13, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:34', '2023-05-14 08:02:34'),
(14, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:34', '2023-05-14 08:02:34'),
(15, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:35', '2023-05-14 08:02:35'),
(16, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:35', '2023-05-14 08:02:35'),
(17, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:36', '2023-05-14 08:02:36'),
(18, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:36', '2023-05-14 08:02:36'),
(19, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:37', '2023-05-14 08:02:37'),
(20, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:02:37', '2023-05-14 08:02:37'),
(21, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:29:25', '2023-05-14 08:29:25'),
(22, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:29:46', '2023-05-14 08:29:46'),
(23, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:31:13', '2023-05-14 08:31:14'),
(24, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:33:52', '2023-05-14 08:33:52'),
(25, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '90.00', '2023-05-14 08:39:08', '2023-05-14 08:39:08'),
(26, 'delivery', 'seffeen hosny', '01127276165', 10, 'seffeen', '5.00', NULL, '95.00', '2023-05-14 08:39:39', '2023-05-14 08:39:39'),
(27, 'delivery', 'seffeen hosny', '01127276165', NULL, NULL, '5.00', NULL, '95.00', '2023-05-14 08:39:57', '2023-05-14 08:39:58'),
(28, 'delivery', 'seffeen hosny', '01127276165', NULL, NULL, '5.00', NULL, '95.00', '2023-05-14 08:43:50', '2023-05-14 08:43:50'),
(29, 'delivery', 'seffeen hosny', '01127276165', NULL, NULL, '5.00', NULL, '95.00', '2023-05-14 08:48:41', '2023-05-14 08:48:41'),
(30, 'delivery', 'seffeen hosny', '01127276165', NULL, NULL, '5.00', NULL, '95.00', '2023-05-14 09:35:40', '2023-05-14 09:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `menu_item_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `menu_item_id`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '10.00', '2023-05-14 07:44:34', '2023-05-14 07:44:34'),
(2, 1, 5, 1, '15.00', '2023-05-14 07:44:34', '2023-05-14 07:44:34'),
(3, 1, 9, 1, '20.00', '2023-05-14 07:44:34', '2023-05-14 07:44:34'),
(4, 2, 1, 2, '10.00', '2023-05-14 07:45:23', '2023-05-14 07:45:23'),
(5, 2, 5, 2, '15.00', '2023-05-14 07:45:23', '2023-05-14 07:45:23'),
(6, 2, 9, 2, '20.00', '2023-05-14 07:45:23', '2023-05-14 07:45:23'),
(7, 3, 1, 2, '10.00', '2023-05-14 07:58:52', '2023-05-14 07:58:52'),
(8, 3, 5, 2, '15.00', '2023-05-14 07:58:52', '2023-05-14 07:58:52'),
(9, 3, 9, 2, '20.00', '2023-05-14 07:58:52', '2023-05-14 07:58:52'),
(10, 4, 1, 2, '10.00', '2023-05-14 07:59:42', '2023-05-14 07:59:42'),
(11, 4, 5, 2, '15.00', '2023-05-14 07:59:42', '2023-05-14 07:59:42'),
(12, 4, 9, 2, '20.00', '2023-05-14 07:59:42', '2023-05-14 07:59:42'),
(13, 5, 1, 2, '10.00', '2023-05-14 08:00:19', '2023-05-14 08:00:19'),
(14, 5, 5, 2, '15.00', '2023-05-14 08:00:19', '2023-05-14 08:00:19'),
(15, 5, 9, 2, '20.00', '2023-05-14 08:00:19', '2023-05-14 08:00:19'),
(16, 6, 1, 2, '10.00', '2023-05-14 08:00:59', '2023-05-14 08:00:59'),
(17, 6, 5, 2, '15.00', '2023-05-14 08:00:59', '2023-05-14 08:00:59'),
(18, 6, 9, 2, '20.00', '2023-05-14 08:00:59', '2023-05-14 08:00:59'),
(19, 7, 1, 2, '10.00', '2023-05-14 08:02:27', '2023-05-14 08:02:27'),
(20, 7, 5, 2, '15.00', '2023-05-14 08:02:27', '2023-05-14 08:02:27'),
(21, 7, 9, 2, '20.00', '2023-05-14 08:02:27', '2023-05-14 08:02:27'),
(22, 8, 1, 2, '10.00', '2023-05-14 08:02:30', '2023-05-14 08:02:30'),
(23, 8, 5, 2, '15.00', '2023-05-14 08:02:30', '2023-05-14 08:02:30'),
(24, 8, 9, 2, '20.00', '2023-05-14 08:02:30', '2023-05-14 08:02:30'),
(25, 9, 1, 2, '10.00', '2023-05-14 08:02:31', '2023-05-14 08:02:31'),
(26, 9, 5, 2, '15.00', '2023-05-14 08:02:31', '2023-05-14 08:02:31'),
(27, 9, 9, 2, '20.00', '2023-05-14 08:02:31', '2023-05-14 08:02:31'),
(28, 10, 1, 2, '10.00', '2023-05-14 08:02:32', '2023-05-14 08:02:32'),
(29, 10, 5, 2, '15.00', '2023-05-14 08:02:32', '2023-05-14 08:02:32'),
(30, 10, 9, 2, '20.00', '2023-05-14 08:02:32', '2023-05-14 08:02:32'),
(31, 11, 1, 2, '10.00', '2023-05-14 08:02:32', '2023-05-14 08:02:32'),
(32, 11, 5, 2, '15.00', '2023-05-14 08:02:32', '2023-05-14 08:02:32'),
(33, 11, 9, 2, '20.00', '2023-05-14 08:02:32', '2023-05-14 08:02:32'),
(34, 12, 1, 2, '10.00', '2023-05-14 08:02:33', '2023-05-14 08:02:33'),
(35, 12, 5, 2, '15.00', '2023-05-14 08:02:33', '2023-05-14 08:02:33'),
(36, 12, 9, 2, '20.00', '2023-05-14 08:02:33', '2023-05-14 08:02:33'),
(37, 13, 1, 2, '10.00', '2023-05-14 08:02:34', '2023-05-14 08:02:34'),
(38, 13, 5, 2, '15.00', '2023-05-14 08:02:34', '2023-05-14 08:02:34'),
(39, 13, 9, 2, '20.00', '2023-05-14 08:02:34', '2023-05-14 08:02:34'),
(40, 14, 1, 2, '10.00', '2023-05-14 08:02:34', '2023-05-14 08:02:34'),
(41, 14, 5, 2, '15.00', '2023-05-14 08:02:34', '2023-05-14 08:02:34'),
(42, 14, 9, 2, '20.00', '2023-05-14 08:02:34', '2023-05-14 08:02:34'),
(43, 15, 1, 2, '10.00', '2023-05-14 08:02:35', '2023-05-14 08:02:35'),
(44, 15, 5, 2, '15.00', '2023-05-14 08:02:35', '2023-05-14 08:02:35'),
(45, 15, 9, 2, '20.00', '2023-05-14 08:02:35', '2023-05-14 08:02:35'),
(46, 16, 1, 2, '10.00', '2023-05-14 08:02:35', '2023-05-14 08:02:35'),
(47, 16, 5, 2, '15.00', '2023-05-14 08:02:35', '2023-05-14 08:02:35'),
(48, 16, 9, 2, '20.00', '2023-05-14 08:02:35', '2023-05-14 08:02:35'),
(49, 17, 1, 2, '10.00', '2023-05-14 08:02:36', '2023-05-14 08:02:36'),
(50, 17, 5, 2, '15.00', '2023-05-14 08:02:36', '2023-05-14 08:02:36'),
(51, 17, 9, 2, '20.00', '2023-05-14 08:02:36', '2023-05-14 08:02:36'),
(52, 18, 1, 2, '10.00', '2023-05-14 08:02:36', '2023-05-14 08:02:36'),
(53, 18, 5, 2, '15.00', '2023-05-14 08:02:36', '2023-05-14 08:02:36'),
(54, 18, 9, 2, '20.00', '2023-05-14 08:02:36', '2023-05-14 08:02:36'),
(55, 19, 1, 2, '10.00', '2023-05-14 08:02:37', '2023-05-14 08:02:37'),
(56, 19, 5, 2, '15.00', '2023-05-14 08:02:37', '2023-05-14 08:02:37'),
(57, 19, 9, 2, '20.00', '2023-05-14 08:02:37', '2023-05-14 08:02:37'),
(58, 20, 1, 2, '10.00', '2023-05-14 08:02:37', '2023-05-14 08:02:37'),
(59, 20, 5, 2, '15.00', '2023-05-14 08:02:37', '2023-05-14 08:02:37'),
(60, 20, 9, 2, '20.00', '2023-05-14 08:02:37', '2023-05-14 08:02:37'),
(61, 21, 1, 2, '10.00', '2023-05-14 08:29:25', '2023-05-14 08:29:25'),
(62, 21, 5, 2, '15.00', '2023-05-14 08:29:25', '2023-05-14 08:29:25'),
(63, 21, 9, 2, '20.00', '2023-05-14 08:29:25', '2023-05-14 08:29:25'),
(64, 22, 1, 2, '10.00', '2023-05-14 08:29:46', '2023-05-14 08:29:46'),
(65, 22, 5, 2, '15.00', '2023-05-14 08:29:46', '2023-05-14 08:29:46'),
(66, 22, 9, 2, '20.00', '2023-05-14 08:29:46', '2023-05-14 08:29:46'),
(67, 23, 1, 2, '10.00', '2023-05-14 08:31:13', '2023-05-14 08:31:13'),
(68, 23, 5, 2, '15.00', '2023-05-14 08:31:13', '2023-05-14 08:31:13'),
(69, 23, 9, 2, '20.00', '2023-05-14 08:31:13', '2023-05-14 08:31:13'),
(70, 24, 1, 2, '10.00', '2023-05-14 08:33:52', '2023-05-14 08:33:52'),
(71, 24, 5, 2, '15.00', '2023-05-14 08:33:52', '2023-05-14 08:33:52'),
(72, 24, 9, 2, '20.00', '2023-05-14 08:33:52', '2023-05-14 08:33:52'),
(73, 25, 1, 2, '10.00', '2023-05-14 08:39:08', '2023-05-14 08:39:08'),
(74, 25, 5, 2, '15.00', '2023-05-14 08:39:08', '2023-05-14 08:39:08'),
(75, 25, 9, 2, '20.00', '2023-05-14 08:39:08', '2023-05-14 08:39:08'),
(76, 26, 1, 2, '10.00', '2023-05-14 08:39:39', '2023-05-14 08:39:39'),
(77, 26, 5, 2, '15.00', '2023-05-14 08:39:39', '2023-05-14 08:39:39'),
(78, 26, 9, 2, '20.00', '2023-05-14 08:39:39', '2023-05-14 08:39:39'),
(79, 27, 1, 2, '10.00', '2023-05-14 08:39:58', '2023-05-14 08:39:58'),
(80, 27, 5, 2, '15.00', '2023-05-14 08:39:58', '2023-05-14 08:39:58'),
(81, 27, 9, 2, '20.00', '2023-05-14 08:39:58', '2023-05-14 08:39:58'),
(82, 28, 1, 2, '10.00', '2023-05-14 08:43:50', '2023-05-14 08:43:50'),
(83, 28, 5, 2, '15.00', '2023-05-14 08:43:50', '2023-05-14 08:43:50'),
(84, 28, 9, 2, '20.00', '2023-05-14 08:43:50', '2023-05-14 08:43:50'),
(85, 29, 1, 2, '10.00', '2023-05-14 08:48:41', '2023-05-14 08:48:41'),
(86, 29, 5, 2, '15.00', '2023-05-14 08:48:41', '2023-05-14 08:48:41'),
(87, 29, 9, 2, '20.00', '2023-05-14 08:48:41', '2023-05-14 08:48:41'),
(88, 30, 1, 2, '10.00', '2023-05-14 09:35:40', '2023-05-14 09:35:40'),
(89, 30, 5, 2, '15.00', '2023-05-14 09:35:40', '2023-05-14 09:35:40'),
(90, 30, 9, 2, '20.00', '2023-05-14 09:35:40', '2023-05-14 09:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_menu_item_id_foreign` (`menu_item_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
