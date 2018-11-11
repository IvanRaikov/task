-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 11, 2018 at 01:28 PM
-- Server version: 5.7.23-0ubuntu0.18.04.1
-- PHP Version: 7.0.30-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE book_db;
USE book_db;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id`, `name`) VALUES
(1, 'Стивен Кинг'),
(2, 'Михаил Булгаков'),
(3, 'Братья Стругацкие'),
(4, 'Лев Толстой'),
(5, 'Дарья Донцова');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ISBN` int(15) DEFAULT NULL,
  `page_quantity` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `title`, `ISBN`, `page_quantity`, `genre_id`, `data`) VALUES
(1, 'Война и мир', 978538906, 1274, 1, '2018-11-03'),
(2, 'Мастер и Маргарита', 978569945, 470, 2, '2018-11-01'),
(3, 'Блог проказника домового ', 978504092, 100, 3, '2018-11-06'),
(4, 'Трудно быть богом', 978586542, 210, 2, '2018-11-05'),
(5, 'Пикник на обочине', 966696721, 256, 2, '2018-11-03'),
(6, 'Оно', 978517065, 324, 2, '2018-10-10'),
(7, 'Под куполом', 978527143, 156, 2, '2018-11-05'),
(8, 'Сияние', 97851708, 560, 2, '2018-11-15'),
(9, 'Понедельник начинается в суботу', 97851704, 250, 2, '2018-11-29'),
(10, 'Страна багровых туч', 97809234, 240, 2, '2018-11-26');

-- --------------------------------------------------------

--
-- Table structure for table `book_id_autor_id`
--

CREATE TABLE `book_id_autor_id` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `autor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_id_autor_id`
--

INSERT INTO `book_id_autor_id` (`id`, `book_id`, `autor_id`) VALUES
(1, 1, 4),
(2, 2, 2),
(3, 3, 5),
(4, 4, 3),
(5, 5, 3),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 3),
(10, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `title`) VALUES
(1, 'Классика'),
(2, 'Фантастика'),
(3, 'Детективы');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `book_id_autor_id`
--
ALTER TABLE `book_id_autor_id`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `book_id_autor_id`
--
ALTER TABLE `book_id_autor_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

--
-- Constraints for table `book_id_autor_id`
--
ALTER TABLE `book_id_autor_id`
  ADD CONSTRAINT `book_id_autor_id_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `book_id_autor_id_ibfk_2` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
