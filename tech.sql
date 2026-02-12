-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 03, 2026 at 07:23 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tech`
--
CREATE DATABASE IF NOT EXISTS `tech` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tech`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `pwd` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `pwd`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `u_ans` varchar(5) NOT NULL,
  `correct_ans` varchar(5) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `uid`, `qid`, `u_ans`, `correct_ans`, `status`) VALUES
(20, 20, 1, 'C', 'C', 0),
(21, 20, 2, 'D', 'D', 0),
(22, 24, 1, 'A', 'C', 0),
(23, 24, 2, 'A', 'D', 0),
(24, 24, 7, 'A', 'B', 0),
(25, 24, 5, 'none', 'C', 0),
(26, 24, 6, 'B', 'D', 0);

-- --------------------------------------------------------

--
-- Table structure for table `questionslist`
--

CREATE TABLE IF NOT EXISTS `questionslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(100) NOT NULL,
  `question` varchar(200) NOT NULL,
  `option_a` varchar(100) NOT NULL,
  `option_b` varchar(100) NOT NULL,
  `option_c` varchar(100) NOT NULL,
  `option_d` varchar(100) NOT NULL,
  `correct_answer` varchar(10) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `questionslist`
--

INSERT INTO `questionslist` (`id`, `topic`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `status`) VALUES
(1, 'Reasoning', 'what is java', 'language', 'program', 'platform', 'code', 'C', 0),
(2, 'Reasoning', 'what is java', 'language', 'program', 'platform', 'code', 'D', 0),
(5, 'Technical', 'what is c++?', 'It is a Object Oriented programming Language', 'Procedure Oriented Programming Language', 'It is Programming Language', 'none of the above', 'C', 0),
(6, 'Technical', 'what is c++?', 'It is a Object Oriented programming Language', 'Procedure Oriented Programming Language', 'It is Programming Language', 'none of the above', 'D', 0),
(7, 'Reasoning', 'what is c++?', 'It is a Object Oriented programming Language', 'Procedure Oriented Programming Language', 'It is Programming Language', 'none of the above', 'B', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `skills` varchar(100) NOT NULL,
  `password` varchar(10) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `qualification`, `gender`, `email`, `mobile`, `skills`, `password`, `status`) VALUES
(20, 'swamy', 'mca', 'male', 'swamy@gmail.com', '9876543215', 'Verbal', '6556', 0),
(24, 'abhinay', 'b.tech', 'male', 'javaprojects20@gmail.com', '9247136445', 'Aptitude', '123456', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
