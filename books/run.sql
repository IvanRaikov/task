-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 15, 2018 at 01:35 AM
-- Server version: 5.7.23-0ubuntu0.18.04.1
-- PHP Version: 7.0.30-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_db`
--
CREATE DATABASE book_db;
USE book_db;
-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id`, `name`) VALUES
(1, 'Лев Толстой'),
(2, 'Михаил Булгаков'),
(3, 'Стивен Кинг'),
(4, 'Дэниел Киз'),
(5, 'Агата Кристи');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ISBN` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `page_quantity` int(11) DEFAULT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `title`, `ISBN`, `page_quantity`, `data`) VALUES
(1, 'Война и мир', '978-5-389-06256-6', 1504, '2018-11-01'),
(2, 'Мастер и Маргарита', '978-5-699-45351-1', 470, '2018-11-02'),
(3, 'Собачье сердце', '978-5-699-48248-1', 110, '2018-11-04'),
(4, 'Анна Каренина', '978-5-699-14342-9', 960, '2018-11-05'),
(5, 'Оно', '978-5-17-065495-6', 1090, '2018-11-06'),
(6, 'Под куполом', '978-5-271-40678-2', 269, '2018-11-08'),
(7, 'Зеленая миля', '978-5-271-42125-9', 420, '2018-11-09'),
(8, 'Сияние', '978-5-17-085028-0', 560, '2018-11-10'),
(9, 'Цветы для Элджернона', '978-966-14-8449-7', 290, '2018-11-11'),
(10, 'Таинственная история Билли Миллигана', '978-617-12-1596-2', 600, '2018-11-12'),
(11, 'Убийство в восточном экспрессе', '978-617-12-3996-8', 200, '2018-11-15'),
(12, 'Убийство по алфавиту', '978-5-699-84126-4', 230, '2018-11-16'),
(13, 'Роковые яйца', '978-5-17-028623-2', 90, '2018-11-30'),
(14, 'Записки юного врача', '978-5-17-028623-2', 90, '2018-11-29'),
(15, 'Белая гвардия', '978-5-17-015928-4', 300, '2018-11-28');

-- --------------------------------------------------------

--
-- Table structure for table `book_id_autor_id`
--

CREATE TABLE `book_id_autor_id` (
  `book_id` int(11) DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_id_autor_id`
--

INSERT INTO `book_id_autor_id` (`book_id`, `autor_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 1),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 4),
(10, 4),
(11, 5),
(12, 5),
(13, 2),
(14, 2),
(15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `book_id_genre_id`
--

CREATE TABLE `book_id_genre_id` (
  `book_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_id_genre_id`
--

INSERT INTO `book_id_genre_id` (`book_id`, `genre_id`) VALUES
(2, 1),
(1, 2),
(3, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 3),
(12, 3),
(13, 1),
(14, 2),
(15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `title`) VALUES
(1, 'Фантастика'),
(2, 'Классика'),
(3, 'Детектив');

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_id_autor_id`
--
ALTER TABLE `book_id_autor_id`
  ADD KEY `book_id` (`book_id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Indexes for table `book_id_genre_id`
--
ALTER TABLE `book_id_genre_id`
  ADD KEY `book_id` (`book_id`),
  ADD KEY `genre_id` (`genre_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_id_autor_id`
--
ALTER TABLE `book_id_autor_id`
  ADD CONSTRAINT `book_id_autor_id_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `book_id_autor_id_ibfk_2` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`);

--
-- Constraints for table `book_id_genre_id`
--
ALTER TABLE `book_id_genre_id`
  ADD CONSTRAINT `book_id_genre_id_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `book_id_genre_id_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
