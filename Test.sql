-- phpMyAdmin SQL Dump
-- version 3.2.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 17, 2014 at 02:31 PM
-- Server version: 5.1.40
-- PHP Version: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Test`
--

-- --------------------------------------------------------

--
-- Table structure for table `Actors`
--

CREATE TABLE IF NOT EXISTS `Actors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id_3` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Actors`
--

INSERT INTO `Actors` (`id`, `name`, `last_name`, `date_of_birth`) VALUES
(1, 'Ian ', 'McKellen', '1965-05-25'),
(2, 'James ', 'Nesbitt', '1965-01-15'),
(3, 'Aidan ', 'Turner', '1983-06-19'),
(4, 'Elijah ', 'Wood', '1981-01-28'),
(5, 'Shaun ', 'Bean', '1959-04-17'),
(6, 'Joe', 'Morton', '1947-10-18'),
(7, 'Arnold', 'Schwarzenegger', '1947-07-30');

-- --------------------------------------------------------

--
-- Table structure for table `actors_movies`
--

CREATE TABLE IF NOT EXISTS `actors_movies` (
  `actors_movies_id` int(11) NOT NULL AUTO_INCREMENT,
  `actors_id` int(11) NOT NULL,
  `movies_id` int(11) NOT NULL,
  `fee` int(11) NOT NULL,
  PRIMARY KEY (`actors_movies_id`),
  KEY `actors_id` (`actors_id`),
  KEY `movies_id` (`movies_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `actors_movies`
--

INSERT INTO `actors_movies` (`actors_movies_id`, `actors_id`, `movies_id`, `fee`) VALUES
(1, 1, 1, 100000),
(2, 2, 1, 200000),
(3, 3, 1, 300000),
(4, 4, 2, 400000),
(5, 5, 2, 500000),
(6, 6, 3, 150000),
(7, 7, 3, 550000),
(8, 1, 2, 300000);

-- --------------------------------------------------------

--
-- Table structure for table `Movies`
--

CREATE TABLE IF NOT EXISTS `Movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `budget` int(11) NOT NULL,
  `cash` int(11) NOT NULL,
  `duration` time NOT NULL,
  `genre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Movies`
--

INSERT INTO `Movies` (`id`, `title`, `director`, `year`, `budget`, `cash`, `duration`, `genre`) VALUES
(1, 'Hobbit', 'Peter Robert Jackson', 2014, 225000000, 50000000, '02:24:00', 'fantasy'),
(2, 'Lord of the Rings', 'Peter Robert Jackson', 2001, 93000000, 871530324, '02:58:00', 'fantasy'),
(3, 'Terminator 2', 'James Cameron', 1991, 102000000, 519843345, '02:13:00', 'action');

-- --------------------------------------------------------

--
-- Table structure for table `movies_studios`
--

CREATE TABLE IF NOT EXISTS `movies_studios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movies_id` int(11) NOT NULL,
  `studios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movies_id` (`movies_id`),
  KEY `studios_id` (`studios_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `movies_studios`
--

INSERT INTO `movies_studios` (`id`, `movies_id`, `studios_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Studio`
--

CREATE TABLE IF NOT EXISTS `Studio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `year_of_foundation` year(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Studio`
--

INSERT INTO `Studio` (`id`, `title`, `year_of_foundation`) VALUES
(1, ' Warner Brothers', 1918),
(2, 'New Line Cinema', 1967),
(3, 'Carolco Pictures', 1982);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actors_movies`
--
ALTER TABLE `actors_movies`
  ADD CONSTRAINT `actors_movies_ibfk_1` FOREIGN KEY (`actors_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actors_movies_ibfk_2` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movies_studios`
--
ALTER TABLE `movies_studios`
  ADD CONSTRAINT `movies_studios_ibfk_1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movies_studios_ibfk_2` FOREIGN KEY (`studios_id`) REFERENCES `studio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
