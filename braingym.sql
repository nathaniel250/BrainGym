-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2014 at 07:22 AM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `braingym`
--
CREATE DATABASE IF NOT EXISTS `braingym` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `braingym`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `category`) VALUES
(1, 'General Knowledge'),
(2, 'Integrated Science'),
(3, 'Mathematics'),
(4, 'Biology'),
(5, 'Physics'),
(6, 'Chemistry'),
(7, 'History'),
(8, 'Social Science and Philosophy'),
(9, 'Technology'),
(10, 'Language Proficiency'),
(11, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comid` int(11) NOT NULL AUTO_INCREMENT,
  `qzid` int(11) NOT NULL,
  `userid` int(32) NOT NULL DEFAULT '0',
  `comment` varchar(1024) NOT NULL,
  PRIMARY KEY (`comid`),
  KEY `userid` (`userid`),
  KEY `qzid` (`qzid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comid`, `qzid`, `userid`, `comment`) VALUES
(3, 1, 0, 'Such WOW!'),
(4, 1, 0, 'Doge'),
(5, 1, 0, 'lalala'),
(6, 10, 0, 'Masaya ang 192');

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE IF NOT EXISTS `forum` (
  `forumid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `userid` int(32) NOT NULL DEFAULT '0',
  `topic` varchar(64) NOT NULL,
  `subtopic` varchar(64) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`forumid`),
  KEY `userid` (`userid`),
  KEY `categoryid` (`categoryid`),
  KEY `userid_2` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `forum`
--

INSERT INTO `forum` (`forumid`, `categoryid`, `userid`, `topic`, `subtopic`, `dateCreated`) VALUES
(2, 1, 0, 'The Awesomeness of Nathaniel', 'YEAH!', '2014-03-28 22:15:08');

-- --------------------------------------------------------

--
-- Table structure for table `forumcomment`
--

CREATE TABLE IF NOT EXISTS `forumcomment` (
  `forumCommentid` int(11) NOT NULL AUTO_INCREMENT,
  `forumid` int(11) NOT NULL,
  `userid` int(32) NOT NULL DEFAULT '0',
  `forumComment` varchar(128) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`forumCommentid`),
  KEY `userid` (`userid`),
  KEY `forumid` (`forumid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `forumcomment`
--

INSERT INTO `forumcomment` (`forumCommentid`, `forumid`, `userid`, `forumComment`, `dateCreated`) VALUES
(2, 2, 0, 'Pogi ko! ', '2014-03-28 22:18:54'),
(3, 2, 0, 'Ako din!', '2014-03-28 23:29:02'),
(4, 2, 0, '"', '2014-03-28 23:29:16');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `qzid` int(11) NOT NULL,
  `question` varchar(50) NOT NULL,
  `answer` varchar(50) NOT NULL,
  `choiceA` varchar(128) NOT NULL,
  `choiceB` varchar(128) NOT NULL,
  `choiceC` varchar(128) DEFAULT NULL,
  `choiceD` varchar(128) DEFAULT NULL,
  `choiceE` varchar(128) DEFAULT NULL,
  `image` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`qid`),
  KEY `qzid` (`qzid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`qid`, `qzid`, `question`, `answer`, `choiceA`, `choiceB`, `choiceC`, `choiceD`, `choiceE`, `image`) VALUES
(1, 1, '1 kilometer = ? meters', '1000', '2', '3', '1000', '', '5', NULL),
(2, 1, 'lkj', 'klj', 'lkj', 'klj', 'lklk', '', '', 'C:/BrainGym/Quizzes/1/triangle.png'),
(3, 1, 'lk', 'jkl', 'j', 'jkl', '', '', '', 'C:/BrainGym/Quizzes/1/PassButton.png'),
(4, 1, '.', 'nlk', 'jkl', 'j', 'klj', 'kl', '', NULL),
(5, 1, 'lkjlk', 'jlk', 'jkl', 'jl', 'kj', 'lkj', '', NULL),
(6, 1, '.k', 'jkl', 'jkl', 'jlk', 'jkl', 'j', 'kljlk', NULL),
(7, 1, 'uy', 'iuy', 'iuy', 'iu', 'yiu', 'yi', '', NULL),
(8, 1, 'lala', 'll', 'l', 'al', 'la', 'lal', 'a', NULL),
(11, 2, 'pogi ako?', 'oo', 'oo', 'hindi', 'kk', '', '', NULL),
(13, 2, 'lalala?', 'lalala', 'lalala', 'llilili', 'lololo', 'lulul', '', 'C:/BrainGym/Quizzes/2/meme.jpg'),
(14, 2, 'K', 'DOT', 'dot', 'DOT', '', '', '', NULL),
(15, 2, 'YEAH!', 'ROCK!', 'Paper', 'ROCK!', '', '', '', NULL),
(19, 2, 'lala', 'kk', 'kk', 'lala', '', '', '', NULL),
(20, 3, 'Eto ba grade mo sa 192?', 'No', 'Yes', 'OO', 'lol oo sadly', 'i crey much tears', 'No', 'C:/BrainGym/Quizzes/3/11.png'),
(21, 3, 'Will you pass?', 'sure na sure', 'sure na sure', 'oo kaya wla na ako pake', 'weeeee malapit na summer', 'pogi ng button ko noh', '', 'C:/BrainGym/Quizzes/3/PassButton.png'),
(22, 3, 'papalpak kaya ang question na to?', 'cge nga', 'cge nga', 'eto na', '', '', 'hahaha palpak', 'C:/BrainGym/Quizzes/3/n.png'),
(23, 11, 'Tree', 'Tree', 'One', 'Two', 'Three', 'Tree', '', 'images/Quizzes/11/spongebob-nobodycares.jpg'),
(24, 12, 'jj', 'nigga', 'nigga', 'k', 'l', '', '', 'images/Quizzes/12/meme.jpg'),
(25, 12, 'Lalala', 'lala', 'lala', 'kaka', '', '', '', '/images/Quizzes/12/triangle.png'),
(26, 12, 'such wow', 'doge', 'doge', 'gedo', '', '', '', 'images/Quizzes/12/meme.jpg'),
(27, 12, 'yeye', 'yaya', 'yeye', 'yaya', '', '', '', 'images/Quizzes/12/11.png'),
(28, 12, 'haha', 'waha', 'waha', 'yolo', '', '', '', 'views/images/Quizzes/12/-10.png'),
(29, 12, 'laslad', 'lk', ';lk', 'lk', '', '', '', 'images/Quizzes//11.png'),
(30, 12, 'kalala', 'abc', 'abc', 'def', '', '', '', 'C:/BrainGym/Quizzes/12/meme.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `qzid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(32) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`qzid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`qzid`, `userid`, `catid`, `title`) VALUES
(1, 0, 3, 'Nathan Pogi!'),
(2, 0, 1, 'lalala'),
(3, 0, 1, 'CS 192'),
(4, 0, 1, 'tag test'),
(5, 0, 1, 'lala'),
(6, 0, 2, 'buhuhu'),
(7, 0, 4, 'YEAH'),
(8, 0, 1, 'try many tags'),
(9, 0, 1, 'huhu'),
(10, 0, 1, 'YEAH!'),
(11, 0, 4, 'YEAH!'),
(12, 0, 1, 'jj nigga');

-- --------------------------------------------------------

--
-- Table structure for table `quizhistory`
--

CREATE TABLE IF NOT EXISTS `quizhistory` (
  `quizhistoryid` int(11) NOT NULL AUTO_INCREMENT,
  `quizid` int(11) NOT NULL,
  `quiztitle` varchar(64) NOT NULL,
  `userid` int(32) NOT NULL,
  `grade` float NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`quizhistoryid`),
  KEY `quizid` (`quizid`,`userid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `quiztag`
--

CREATE TABLE IF NOT EXISTS `quiztag` (
  `qztagid` int(11) NOT NULL AUTO_INCREMENT,
  `qzid` int(11) NOT NULL,
  `tagid` int(11) NOT NULL,
  PRIMARY KEY (`qztagid`),
  KEY `qzid` (`qzid`),
  KEY `tagid` (`tagid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `quiztag`
--

INSERT INTO `quiztag` (`qztagid`, `qzid`, `tagid`) VALUES
(6, 2, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 5, 13),
(15, 7, 10),
(27, 9, 25),
(28, 10, 26),
(29, 11, 27),
(30, 12, 28);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `tagid` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(32) NOT NULL,
  PRIMARY KEY (`tagid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tagid`, `tag`) VALUES
(2, ' Algebra'),
(3, 'lalala'),
(6, '  lala'),
(7, '  Algebra'),
(8, '  lalala'),
(9, 'swaggity'),
(10, 'yolo'),
(11, 'swagcannon'),
(12, 'swag5ever'),
(13, ''),
(25, 'abc'),
(26, 'abakada'),
(27, 'tree'),
(28, 'k');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `collegeid` int(11) DEFAULT NULL,
  `departmentid` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `firstname`, `lastname`, `email`, `username`, `password`, `enabled`, `collegeid`, `departmentid`, `courseid`, `grade`) VALUES
(0, 'Nathaniel', 'Martinez', 'nathaniel_250@yahoo.com', 'Nathan', 'Pogi', 1, NULL, NULL, NULL, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`qzid`) REFERENCES `quiz` (`qzid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forum`
--
ALTER TABLE `forum`
  ADD CONSTRAINT `forum_ibfk_2` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forum_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forumcomment`
--
ALTER TABLE `forumcomment`
  ADD CONSTRAINT `forumcomment_ibfk_2` FOREIGN KEY (`forumid`) REFERENCES `forum` (`forumid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forumcomment_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`qzid`) REFERENCES `quiz` (`qzid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quizhistory`
--
ALTER TABLE `quizhistory`
  ADD CONSTRAINT `quizhistory_ibfk_1` FOREIGN KEY (`quizid`) REFERENCES `quiz` (`qzid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quizhistory_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiztag`
--
ALTER TABLE `quiztag`
  ADD CONSTRAINT `quiztag_ibfk_2` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quiztag_ibfk_1` FOREIGN KEY (`qzid`) REFERENCES `quiz` (`qzid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
