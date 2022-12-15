-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2022 at 01:03 PM
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
-- Database: `auth-sys`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(3) NOT NULL,
  `username` varchar(200) NOT NULL,
  `post_id` int(3) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `username`, `post_id`, `comment`, `created_at`) VALUES
(8, 'user1@user.com', 1, 'comment for first post', '2022-10-18 13:31:56'),
(10, 'user1@user.com', 3, 'insert this', '2022-10-18 15:54:19'),
(36, 'user1@user.com', 1, 'comment here', '2022-10-22 13:48:16'),
(37, 'user1@user.com', 1, 'comment', '2022-10-22 14:07:21');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(3) NOT NULL,
  `title` varchar(200) NOT NULL,
  `body` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `username`, `created_at`) VALUES
(1, 'first post', 'first post', 'user1@user.com', '2022-10-18 11:14:35'),
(2, 'second post', 'second post', 'user1@user.com', '2022-10-18 11:24:19'),
(3, 'third post', 'Professionally whiteboard intuitive e-tailers for turnkey communities. Rapidiously repurpose long-term high-impact niche markets before interactive imperatives. Continually drive adaptive vortals after mission-critical applications. Continually mainta', 'user1@user.com', '2022-10-18 11:25:52');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` int(3) NOT NULL,
  `post_id` int(3) NOT NULL,
  `rating` int(3) NOT NULL,
  `user_id` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `post_id`, `rating`, `user_id`, `created_at`) VALUES
(33, 2, 4, 5, '2022-10-19 18:03:54'),
(40, 2, 5, 8, '2022-10-19 18:08:35'),
(44, 1, 1, 8, '2022-10-19 18:14:24'),
(61, 2, 4, 0, '2022-10-22 10:00:08'),
(62, 1, 4, 5, '2022-10-22 13:48:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `mypassword` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `mypassword`, `created_at`) VALUES
(1, 'user.x@email.com', 'user.x', '$2y$10$EZPiLRIYHMizrftBjXyiDe6xKx3KBxsk5UomZQ5S8HtNUilk3Ntm.', '2022-09-20 21:59:15'),
(2, 'user3@user.com', 'user.user_m', '$2y$10$MiBwsjvG/6BQEfNoNtQAKO7bhna1LMA4kaZ8bqXcI/RV3MAVteEVu', '2022-09-22 20:18:04'),
(3, 'moha@123.com', 'O@O.com', '$2y$10$JlV97iZcusenNIpnHMikg.ypmodWeR05tFxgBY.HFxgG3J3ERSCwC', '2022-10-10 08:19:34'),
(4, 'user7@user7.com', 'user7@user7.com', '$2y$10$O2xgDDgMM07MwFKsu4./BeH64oaTi/nJUSTeqvQRKQs8Ke40npLhq', '2022-10-10 08:23:16'),
(5, 'user1@user.com', 'user1@user.com', '$2y$10$AKCjnTyjHpzjySZDkc2Lv.ENNhZNENOpi2Q.Gv4LkIP1yFWY2OIHK', '2022-10-10 08:32:51'),
(6, 'user@user.com', 'user@user.com', '$2y$10$zuOW7ExwgpHgxcE6GeADy.CJAJuZ5wCljAR314uZuFKbWo2MYVNae', '2022-10-10 08:34:54'),
(7, 'user@user.com', 'user@user.com', '$2y$10$cX8Ow0Iu8unz0F2e5pGZmuQTCPbEXasz4qVmYG./Ib5Xhkf81mRhy', '2022-10-10 08:34:58'),
(8, 'moha@yahoo.com', 'moha@yahoo.com', '$2y$10$1xLi5o8plEZPLKl4RpTfie2VhNmyTrY1exAhWPl0.Up5A6rphVmaq', '2022-10-19 17:38:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
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
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
