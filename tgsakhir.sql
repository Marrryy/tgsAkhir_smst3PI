-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2020 at 05:24 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tgsakhir`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`comment_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `commentText` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `commentText`, `created_at`, `updated_at`) VALUES
(1, 10, 15, '<p>Comment 1</p>\r\n', '2020-06-07 04:33:32', '2020-06-07 11:33:32'),
(2, 10, 16, '<p>Comment 2</p>\r\n', '2020-06-07 04:34:39', '2020-06-07 11:34:39'),
(3, 11, 16, '<p><em>Comment 3</em></p>\r\n', '2020-06-07 04:35:07', '2020-06-07 11:35:07'),
(4, 11, 18, '<p>Halo, comment pertama dari Coba</p>\r\n', '2020-06-26 04:36:34', '2020-06-26 11:36:34'),
(5, 12, 19, '<p>Comment ke 1 dari marrryyy</p>\r\n', '2020-06-26 04:40:52', '2020-06-26 11:40:52'),
(6, 10, 19, '<p>Halo</p>\r\n', '2020-06-26 04:41:18', '2020-06-26 11:41:18'),
(8, 10, 20, '<p>Halo mary</p>\r\n', '2020-06-26 05:02:18', '2020-06-26 12:02:18');

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE IF NOT EXISTS `pendidikan` (
`id_pendidikan` int(11) NOT NULL,
  `tahun_masuk` int(4) DEFAULT NULL,
  `tahun_lulus` int(4) DEFAULT NULL,
  `tingkat_pendidikan` varchar(20) DEFAULT NULL,
  `nama_pendidikan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pendidikan`
--

INSERT INTO `pendidikan` (`id_pendidikan`, `tahun_masuk`, `tahun_lulus`, `tingkat_pendidikan`, `nama_pendidikan`) VALUES
(1, 2005, 2006, 'TK', 'TK Budi Setya'),
(2, 2006, 2012, 'SD', 'SD Harapan Bunda'),
(3, 2012, 2015, 'SMP', 'SMPN 193 Jakarta Timur'),
(4, 2015, 2018, 'SMK', 'SMKN 48 Jakarta'),
(5, 2018, 2021, 'Strata-1', 'Universitas Darma Persada');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
`post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `headline` text,
  `postText` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `headline`, `postText`, `created_at`, `updated_at`) VALUES
(10, 15, 'Post1', '<p>This is post 1</p>\r\n', '2020-06-07 04:33:04', '2020-06-07 11:33:04'),
(11, 15, 'Post 2', '<p>This is <strong>Post 2</strong></p>\r\n', '2020-06-07 04:33:21', '2020-06-07 11:33:21'),
(12, 19, 'Post dari Marrryyy', '<p>Halo semua</p>\r\n', '2020-06-26 04:39:45', '2020-06-26 11:39:45'),
(14, 20, 'post kedua', '<p>halo</p>\r\n', '2020-06-26 05:01:19', '2020-06-26 12:01:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `created_at`) VALUES
(15, 'Mary', 'unsada@u.com', '1a52e17fa899cf40fb04cfc42e6352f1', '2020-06-07 04:27:57'),
(16, 'Franklin', 'unsada1@u.com', '88df53b10f47dc5824e15956e172d6b8', '2020-06-07 04:34:24'),
(18, 'Coba', 'cb@a.c', 'dc0da728ff8593cfd465f2b17a949308', '2020-06-26 04:25:21'),
(19, 'maryyy', 'mary@gmail.com', '4ed5c34118a32ebe2e389dc7edbdd69b', '2020-06-26 04:39:10'),
(20, 'unsada', 'unsada@u.com', '88df53b10f47dc5824e15956e172d6b8', '2020-06-26 04:59:20'),
(21, 'admin', 'admin@a.d', '7f0b72074ebb9c0bcd92f491248573e9', '2020-07-09 01:29:29');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE IF NOT EXISTS `visitors` (
`visitor_id` int(11) NOT NULL,
  `dateVisit` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `idsession` varchar(50) DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `page` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`visitor_id`, `dateVisit`, `idsession`, `ipaddress`, `page`) VALUES
(1, '2020-06-07 04:27:20.992250', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(2, '2020-06-07 04:27:30.908394', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(3, '2020-06-07 04:27:57.327214', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(4, '2020-06-07 04:28:01.240649', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(5, '2020-06-07 04:28:03.254969', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(6, '2020-06-07 04:28:07.738946', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(7, '2020-06-07 04:28:07.960846', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(8, '2020-06-07 04:28:15.803913', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(9, '2020-06-07 04:28:28.065837', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(10, '2020-06-07 04:32:11.004866', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(11, '2020-06-07 04:32:19.053275', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(12, '2020-06-07 04:32:31.031661', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(13, '2020-06-07 04:32:32.701145', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(14, '2020-06-07 04:32:37.085011', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(15, '2020-06-07 04:33:04.543811', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(16, '2020-06-07 04:33:09.144666', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(17, '2020-06-07 04:33:21.255995', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(18, '2020-06-07 04:33:24.634007', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(19, '2020-06-07 04:33:27.917541', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(20, '2020-06-07 04:33:33.001590', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(21, '2020-06-07 04:33:38.668508', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(22, '2020-06-07 04:33:40.556387', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(23, '2020-06-07 04:33:48.925283', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(24, '2020-06-07 04:34:25.413240', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(25, '2020-06-07 04:34:28.168349', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(26, '2020-06-07 04:34:30.782014', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(27, '2020-06-07 04:34:40.453078', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(28, '2020-06-07 04:34:47.037198', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(29, '2020-06-07 04:34:50.483745', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(30, '2020-06-07 04:34:53.349353', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(31, '2020-06-07 04:34:55.070658', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(32, '2020-06-07 04:34:56.545774', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(33, '2020-06-07 04:34:58.440462', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(34, '2020-06-07 04:35:07.446001', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(35, '2020-06-07 04:35:12.129430', '1do9ujp8u85t15519orh2953o4', '::1', ''),
(36, '2020-06-07 04:53:54.885964', '4c40sfsktk72ds0m7t7t1pb872', '::1', ''),
(37, '2020-06-26 03:38:16.871241', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(38, '2020-06-26 03:38:21.209049', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(39, '2020-06-26 03:38:24.708383', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(40, '2020-06-26 03:43:12.544974', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(41, '2020-06-26 03:43:17.102981', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(42, '2020-06-26 03:50:09.147847', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(43, '2020-06-26 03:50:52.014936', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(44, '2020-06-26 03:51:02.721391', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(45, '2020-06-26 03:51:42.216036', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(46, '2020-06-26 03:53:23.370769', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(47, '2020-06-26 03:53:53.471665', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(48, '2020-06-26 03:55:43.686763', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(49, '2020-06-26 03:55:54.238433', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(50, '2020-06-26 03:57:18.672197', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(51, '2020-06-26 04:04:00.424369', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(52, '2020-06-26 04:04:37.179567', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(53, '2020-06-26 04:05:12.766765', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(54, '2020-06-26 04:05:45.655261', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(55, '2020-06-26 04:05:51.762642', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(56, '2020-06-26 04:06:31.153476', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(57, '2020-06-26 04:09:34.449974', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(58, '2020-06-26 04:09:56.380700', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(59, '2020-06-26 04:11:10.967140', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(60, '2020-06-26 04:14:17.714971', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(61, '2020-06-26 04:21:18.862888', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(62, '2020-06-26 04:21:34.479351', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(63, '2020-06-26 04:21:50.143602', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(64, '2020-06-26 04:21:53.693085', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(65, '2020-06-26 04:21:58.792668', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(66, '2020-06-26 04:22:45.748778', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(67, '2020-06-26 04:22:47.956874', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(68, '2020-06-26 04:23:04.109410', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(69, '2020-06-26 04:23:12.927968', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(70, '2020-06-26 04:23:17.826294', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(71, '2020-06-26 04:23:22.190769', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(72, '2020-06-26 04:25:04.090799', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(73, '2020-06-26 04:25:22.565527', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(74, '2020-06-26 04:25:26.639084', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(75, '2020-06-26 04:25:27.705186', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(76, '2020-06-26 04:25:32.811426', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(77, '2020-06-26 04:25:44.043959', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(78, '2020-06-26 04:25:47.186387', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(79, '2020-06-26 04:26:09.374876', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(80, '2020-06-26 04:30:28.940062', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(81, '2020-06-26 04:30:38.596821', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(82, '2020-06-26 04:34:21.318316', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(83, '2020-06-26 04:34:22.302886', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(84, '2020-06-26 04:34:27.483251', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(85, '2020-06-26 04:36:12.640322', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(86, '2020-06-26 04:36:17.990108', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(87, '2020-06-26 04:36:34.080270', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(88, '2020-06-26 04:37:33.784904', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(89, '2020-06-26 04:38:35.749004', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(90, '2020-06-26 04:38:40.468627', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(91, '2020-06-26 04:38:46.023856', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(92, '2020-06-26 04:39:10.547424', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(93, '2020-06-26 04:39:27.722036', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(94, '2020-06-26 04:39:31.026330', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(95, '2020-06-26 04:39:45.198701', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(96, '2020-06-26 04:39:54.196359', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(97, '2020-06-26 04:40:01.761089', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(98, '2020-06-26 04:40:27.453151', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(99, '2020-06-26 04:40:29.447973', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(100, '2020-06-26 04:40:37.526484', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(101, '2020-06-26 04:40:38.345286', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(102, '2020-06-26 04:40:40.025763', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(103, '2020-06-26 04:40:52.734218', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(104, '2020-06-26 04:41:08.084186', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(105, '2020-06-26 04:41:09.884733', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(106, '2020-06-26 04:41:14.329313', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(107, '2020-06-26 04:41:18.132682', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(108, '2020-06-26 04:41:28.744666', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(109, '2020-06-26 04:41:48.527684', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(110, '2020-06-26 04:41:59.345560', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(111, '2020-06-26 04:42:09.407166', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(112, '2020-06-26 04:42:13.416821', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(113, '2020-06-26 04:42:15.192074', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(114, '2020-06-26 04:46:55.078057', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(115, '2020-06-26 04:47:42.943620', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(116, '2020-06-26 04:47:44.003796', 'kljktadjo7fif7n92c0090l4v5', '::1', ''),
(117, '2020-06-26 04:57:38.846993', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(118, '2020-06-26 04:58:46.123949', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(119, '2020-06-26 04:58:50.319895', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(120, '2020-06-26 04:58:59.306772', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(121, '2020-06-26 04:59:03.360652', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(122, '2020-06-26 04:59:20.831578', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(123, '2020-06-26 04:59:38.803157', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(124, '2020-06-26 05:00:09.774168', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(125, '2020-06-26 05:00:31.878723', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(126, '2020-06-26 05:00:54.185371', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(127, '2020-06-26 05:00:58.918080', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(128, '2020-06-26 05:01:03.123238', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(129, '2020-06-26 05:01:10.660693', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(130, '2020-06-26 05:01:20.055060', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(131, '2020-06-26 05:01:22.796928', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(132, '2020-06-26 05:01:27.174370', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(133, '2020-06-26 05:01:31.920868', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(134, '2020-06-26 05:01:50.667594', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(135, '2020-06-26 05:01:54.884748', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(136, '2020-06-26 05:01:57.501715', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(137, '2020-06-26 05:02:00.755417', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(138, '2020-06-26 05:02:11.031769', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(139, '2020-06-26 05:02:18.966001', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(140, '2020-06-26 05:02:38.145436', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(141, '2020-06-26 05:02:42.147790', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(142, '2020-06-26 05:02:45.064433', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(143, '2020-06-26 05:02:53.187319', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(144, '2020-06-26 05:12:35.856078', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(145, '2020-06-26 05:12:39.108727', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(146, '2020-06-26 05:12:43.304873', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(147, '2020-06-26 05:12:46.851142', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(148, '2020-06-26 05:15:35.403304', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(149, '2020-06-26 05:15:39.295321', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(150, '2020-06-26 05:15:52.383151', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(151, '2020-06-26 05:16:39.476848', 'a6ft85qn8v7699cldoeqmlcfv1', '::1', ''),
(152, '2020-07-09 00:57:14.823435', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(153, '2020-07-09 01:28:17.850240', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(154, '2020-07-09 01:28:57.750686', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(155, '2020-07-09 01:29:11.232362', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(156, '2020-07-09 01:29:15.016741', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(157, '2020-07-09 01:29:31.054931', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(158, '2020-07-09 01:29:42.392290', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(159, '2020-07-09 01:29:47.616637', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(160, '2020-07-09 01:29:54.148926', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(161, '2020-07-09 01:30:01.953412', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(162, '2020-07-09 01:31:56.555955', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(163, '2020-07-09 01:31:59.178780', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(164, '2020-07-09 01:32:01.243626', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(165, '2020-07-09 01:32:01.902548', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(166, '2020-07-09 01:32:06.563040', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(167, '2020-07-09 01:32:15.774805', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(168, '2020-07-09 01:32:17.296987', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(169, '2020-07-09 01:32:24.068271', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(170, '2020-07-09 01:32:28.277545', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(171, '2020-07-09 01:32:29.086935', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(172, '2020-07-09 01:33:27.478546', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(173, '2020-07-09 01:34:38.800725', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(174, '2020-07-09 01:34:54.313036', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(175, '2020-07-09 01:36:22.849115', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(176, '2020-07-09 01:36:26.023326', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(177, '2020-07-09 01:36:27.928513', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(178, '2020-07-09 01:36:29.047616', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(179, '2020-07-09 01:36:38.640031', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(180, '2020-07-09 02:00:17.706732', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(181, '2020-07-09 02:00:18.862079', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(182, '2020-07-09 02:00:20.601461', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(183, '2020-07-09 02:00:21.854878', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(184, '2020-07-09 02:00:23.016836', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(185, '2020-07-09 02:00:23.817066', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(186, '2020-07-09 02:00:24.684498', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(187, '2020-07-09 02:02:42.209301', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(188, '2020-07-09 02:02:44.322506', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(189, '2020-07-09 02:03:00.394660', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(190, '2020-07-09 02:03:11.091214', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(191, '2020-07-09 02:07:22.130366', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(192, '2020-07-09 02:07:27.678364', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(193, '2020-07-09 02:07:28.660710', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(194, '2020-07-09 02:07:29.714782', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(195, '2020-07-09 02:07:30.914049', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(196, '2020-07-09 02:07:31.796844', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(197, '2020-07-09 02:07:33.778456', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(198, '2020-07-09 02:07:35.652187', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(199, '2020-07-09 02:09:51.126397', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(200, '2020-07-09 02:09:58.135116', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(201, '2020-07-09 02:10:00.414060', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(202, '2020-07-09 02:10:04.028198', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(203, '2020-07-09 02:10:04.993364', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(204, '2020-07-09 02:10:06.441804', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(205, '2020-07-09 02:10:16.532571', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(206, '2020-07-09 02:10:19.600318', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(207, '2020-07-09 02:10:26.191829', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(208, '2020-07-09 02:14:05.886681', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(209, '2020-07-09 02:14:07.753446', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(210, '2020-07-09 02:14:21.032571', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(211, '2020-07-09 02:14:42.019866', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(212, '2020-07-09 02:14:46.359200', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(213, '2020-07-09 02:14:50.046973', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(214, '2020-07-09 02:14:54.882918', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(215, '2020-07-09 02:14:58.398099', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(216, '2020-07-09 02:15:01.297456', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(217, '2020-07-09 02:15:05.657730', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(218, '2020-07-09 02:15:19.594509', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(219, '2020-07-09 02:15:32.735276', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(220, '2020-07-09 03:01:19.768939', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(221, '2020-07-09 03:04:30.344551', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(222, '2020-07-09 03:04:35.786912', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(223, '2020-07-09 03:04:37.406819', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(224, '2020-07-09 03:04:38.350620', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(225, '2020-07-09 03:04:38.726040', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(226, '2020-07-09 03:04:39.854436', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(227, '2020-07-09 03:04:40.910542', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(228, '2020-07-09 03:04:41.614520', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(229, '2020-07-09 03:04:46.603296', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(230, '2020-07-09 03:04:47.322812', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(231, '2020-07-09 03:14:23.389665', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(232, '2020-07-09 03:17:36.563420', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(233, '2020-07-09 03:17:44.803710', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(234, '2020-07-09 03:17:52.839140', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(235, '2020-07-09 03:18:07.772743', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(236, '2020-07-09 03:18:33.623857', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(237, '2020-07-09 03:18:44.086412', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(238, '2020-07-09 03:18:45.474665', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(239, '2020-07-09 03:18:50.438352', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(240, '2020-07-09 03:18:58.211306', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(241, '2020-07-09 03:18:59.345275', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(242, '2020-07-09 03:19:12.249560', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(243, '2020-07-09 03:19:13.781711', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(244, '2020-07-09 03:19:17.002140', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(245, '2020-07-09 03:19:18.246048', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(246, '2020-07-09 03:19:20.349657', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(247, '2020-07-09 03:19:21.584713', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', ''),
(248, '2020-07-09 03:19:24.567562', '5ihgtuq6a9tdf4jl5iqm8c1772', '::1', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`comment_id`), ADD KEY `post_idfk_1` (`post_id`), ADD KEY `user_idfk_1` (`user_id`);

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
 ADD PRIMARY KEY (`id_pendidikan`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`post_id`), ADD KEY `post_idfk_2` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
 ADD PRIMARY KEY (`visitor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `pendidikan`
--
ALTER TABLE `pendidikan`
MODIFY `id_pendidikan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
MODIFY `visitor_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=249;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `post_idfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `user_idfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
ADD CONSTRAINT `post_idfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
