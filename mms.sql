-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2022 at 12:00 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mms`
--

-- --------------------------------------------------------

--
-- Table structure for table `cover_image`
--

CREATE TABLE `cover_image` (
  `image_id` int(11) NOT NULL,
  `img_path` varchar(225) NOT NULL,
  `img_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cover_image`
--

INSERT INTO `cover_image` (`image_id`, `img_path`, `img_movie`) VALUES
(5, '../images/covers/8867408093919.jpg', 5),
(6, '../images/covers/10126085410092.jpg', 6),
(7, '../images/covers/12843491501592.jpg', 7),
(8, '../images/covers/1740473412588.jpg', 8),
(9, '../images/covers/5536506087891.jpg', 9),
(21, '../images/covers/13785558540425.jpg', 21),
(22, '../images/covers/8534076263577.jpg', 22),
(29, '../images/covers/6765244656744.jpg', 29),
(30, '../images/covers/7890563003881.jpg', 30),
(31, '../images/covers/12965330717262.jpg', 31),
(32, '../images/covers/3558231520627552308.jpg', 32),
(33, '../images/covers/2352542347847.jpg', 33);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_name`) VALUES
(1, 'Horror'),
(2, 'Thriller'),
(3, 'Action'),
(4, 'Romance'),
(5, 'Drama');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL,
  `movie_title` varchar(225) NOT NULL,
  `movie_released` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `movie_title`, `movie_released`) VALUES
(5, 'cloned', '2022-10-13'),
(6, 'girl boy thing', '2022-10-20'),
(7, 'girl from nowhere', '2022-10-12'),
(8, 'love all you have left', '2022-10-03'),
(9, 'The sand', '2022-10-15'),
(21, 'Girl boy', '2022-10-12'),
(22, 'how to murder a millionaire', '2022-10-13'),
(29, 'cloned', '2022-10-26'),
(30, 'last word', '2022-10-14'),
(31, 'love by design', '2022-10-20'),
(32, 'Things To Do', '2022-10-13'),
(33, 'sister street fighter', '2022-11-24');

-- --------------------------------------------------------

--
-- Table structure for table `movie_genre`
--

CREATE TABLE `movie_genre` (
  `id` int(11) NOT NULL,
  `mv_movie` int(11) NOT NULL,
  `mv_genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie_genre`
--

INSERT INTO `movie_genre` (`id`, `mv_movie`, `mv_genre`) VALUES
(5, 5, 4),
(6, 6, 3),
(7, 7, 1),
(8, 8, 5),
(9, 9, 2),
(21, 21, 4),
(22, 22, 5),
(29, 29, 1),
(30, 30, 4),
(31, 31, 4),
(32, 32, 3),
(33, 33, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cover_image`
--
ALTER TABLE `cover_image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `movie_genre`
--
ALTER TABLE `movie_genre`
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
-- AUTO_INCREMENT for table `cover_image`
--
ALTER TABLE `cover_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `movie_genre`
--
ALTER TABLE `movie_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
