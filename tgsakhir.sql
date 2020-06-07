-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2020 at 06:35 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `commentText`, `created_at`, `updated_at`) VALUES
(1, 10, 15, '<p>Comment 1</p>\r\n', '2020-06-07 04:33:32', '2020-06-07 11:33:32'),
(2, 10, 16, '<p>Comment 2</p>\r\n', '2020-06-07 04:34:39', '2020-06-07 11:34:39'),
(3, 11, 16, '<p><em>Comment 3</em></p>\r\n', '2020-06-07 04:35:07', '2020-06-07 11:35:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `headline`, `postText`, `created_at`, `updated_at`) VALUES
(10, 15, 'Post1', '<p>This is post 1</p>\r\n', '2020-06-07 04:33:04', '2020-06-07 11:33:04'),
(11, 15, 'Post 2', '<p>This is <strong>Post 2</strong></p>\r\n', '2020-06-07 04:33:21', '2020-06-07 11:33:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `created_at`) VALUES
(15, 'Mary', 'unsada@u.com', '1a52e17fa899cf40fb04cfc42e6352f1', '2020-06-07 04:27:57'),
(16, 'Franklin', 'unsada1@u.com', '88df53b10f47dc5824e15956e172d6b8', '2020-06-07 04:34:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

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
(35, '2020-06-07 04:35:12.129430', '1do9ujp8u85t15519orh2953o4', '::1', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`comment_id`), ADD KEY `post_idfk_1` (`post_id`), ADD KEY `user_idfk_1` (`user_id`);

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
MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
MODIFY `visitor_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
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
