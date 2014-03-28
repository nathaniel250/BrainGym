-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2014 at 10:59 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `category`) VALUES
(1, 'General Knowledge'),
(2, 'Physics'),
(3, 'Integrated Science k'),
(4, 'Biology'),
(5, 'Chemistry'),
(6, 'Mathematics'),
(7, 'Technology'),
(8, 'Social Science and Philosophy'),
(9, 'Earth Science'),
(10, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `comid` int(11) NOT NULL AUTO_INCREMENT,
  `qzid` int(11) NOT NULL,
  `comment` varchar(1024) NOT NULL,
  PRIMARY KEY (`comid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`comid`, `qzid`, `comment`) VALUES
(1, 4, 'pogi ni nathan'),
(2, 4, 'thank you!');

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE IF NOT EXISTS `forum` (
  `forumid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `topic` varchar(64) NOT NULL,
  `subtopic` varchar(64) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`forumid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `forum`
--

INSERT INTO `forum` (`forumid`, `categoryid`, `topic`, `subtopic`, `dateCreated`) VALUES
(2, 4, 'Life life life life life', 'livelivelive', '2014-03-18 12:49:08'),
(3, 1, 'lalalaalalululul', 'k', '2014-03-18 13:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `forumcomment`
--

CREATE TABLE IF NOT EXISTS `forumcomment` (
  `forumCommentid` int(11) NOT NULL AUTO_INCREMENT,
  `forumid` int(11) NOT NULL,
  `forumComment` varchar(128) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`forumCommentid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `forumcomment`
--

INSERT INTO `forumcomment` (`forumCommentid`, `forumid`, `forumComment`, `dateCreated`) VALUES
(2, 2, 'hahahah', '2014-03-18 13:31:09'),
(4, 2, 'uhuhuhuhu', '2014-03-18 13:46:42'),
(6, 3, 'hihihihi biiiii', '2014-03-18 14:08:14');

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
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`qid`, `qzid`, `question`, `answer`, `choiceA`, `choiceB`, `choiceC`, `choiceD`, `choiceE`, `image`) VALUES
(2, 5, 'is this a triangle', 'yes', ' no', 'maybe', 'kk', 'yes', NULL, 'C:/BrainGym/Quizzes/5/triangle.png'),
(3, 5, 'asda', 'kjghkj', 'kjkl', 'lkj', 'ytyty', 'fdxf', NULL, 'C:/BrainGym/Quizzes/5/spongebob-nobodycares.jpg'),
(4, 5, 'kjhk', 'jkjhkj', 'hcgf', 'crt', 'dtr', 'fdg', NULL, 'C:/BrainGym/Quizzes/5/meme.jpg'),
(5, 6, 'Best Dota Team', 'BHF', 'ABC', 'BHF', 'Alliance', 'NAVI', NULL, NULL),
(6, 11, 'abc', 'def', 'ghi', 'jkl', 'mno', 'def', NULL, NULL),
(7, 6, 'such', 'wow', 'doge', 'doge', 'doge', 'wow', NULL, NULL),
(8, 4, 'Pogi ba talaga ako?', 'oo', 'oo', 'false', 'oo naman', 'di ba halata?', NULL, 'C:/BrainGym/Quizzes/4/meme.jpg'),
(9, 4, 'Is this a triangle?', 'yes', 'yes', 'no', 'maybe', 'maybe not', NULL, 'C:/BrainGym/Quizzes/4/triangle.png'),
(10, 4, 'JJ adik sa dota 2', 'tinatanong pa ba yan?', 'nigga malamang', 'hello? duh?', 'tinatanong pa ba yan?', 'oo', NULL, 'C:/BrainGym/Quizzes/4/BHFLogo.jpg'),
(11, 49, 'maganda ba si jen', 'opcors', 'oo naman', 'tinatanong pa ba yan?', 'nigga malamang', 'opcors', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `qzid` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  PRIMARY KEY (`qzid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`qzid`, `catid`, `title`) VALUES
(4, 1, '1st of all'),
(5, 0, 'Triangles'),
(6, 0, 'magnets'),
(7, 0, 'Linear Equation'),
(8, 0, 'linear motion'),
(9, 0, 'likli'),
(10, 0, 'Natnat'),
(11, 0, 'buhuhuhu'),
(12, 0, 'potek'),
(14, 2, 'WOOOOOHOOOOOOO'),
(15, 1, 'La lang'),
(16, 2, 'Nat pogi'),
(17, 1, 'Muhahaha'),
(18, 1, 'yeah!'),
(19, 2, 'rocknroll'),
(20, 1, 'una'),
(21, 1, '2nd'),
(22, 2, 'huhu'),
(23, 4, 'Life as it is, buhuhuhu'),
(24, 8, 'Philosophy of Life'),
(25, 7, ''),
(26, 7, 'Life with technology'),
(27, 10, 'hahahhaha'),
(28, 1, 'Life Science'),
(29, 4, 'yxxxxxxxxy'),
(30, 4, 'z'),
(31, 1, 'fishes'),
(32, 1, 'abcd'),
(33, 6, 'Algebra'),
(34, 1, 'Anung problema? T_T'),
(35, 7, 'Lintech'),
(36, 7, 'Lintech'),
(37, 1, 'Lintech'),
(38, 4, 'bio'),
(39, 2, 'La'),
(40, 2, 'k,l'),
(41, 2, 'huhuhuhu'),
(42, 1, 'Huhuhuhu'),
(43, 8, 'Hi maam'),
(44, 1, 'K'),
(45, 9, 'Bow'),
(46, 1, 'buhuhuhuhu'),
(47, 9, 'hjkl'),
(48, 6, 'Ang pogi ko thanks'),
(49, 9, 'woooooooooo'),
(50, 1, 'k'),
(51, 6, 'awaw');

-- --------------------------------------------------------

--
-- Table structure for table `quiztag`
--

CREATE TABLE IF NOT EXISTS `quiztag` (
  `qztagid` int(11) NOT NULL AUTO_INCREMENT,
  `qzid` int(11) NOT NULL,
  `tagid` int(11) NOT NULL,
  PRIMARY KEY (`qztagid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `quiztag`
--

INSERT INTO `quiztag` (`qztagid`, `qzid`, `tagid`) VALUES
(1, 37, 3),
(2, 37, 4),
(3, 38, 5),
(4, 38, 6),
(5, 38, 7),
(6, 39, 8),
(7, 39, 9),
(8, 41, 10),
(9, 41, 11),
(10, 43, 15),
(11, 44, 5),
(12, 45, 17),
(13, 45, 5),
(14, 45, 6),
(16, 47, 22),
(20, 48, 27),
(21, 48, 5),
(22, 48, 6),
(23, 48, 28),
(24, 49, 29),
(25, 50, 30),
(26, 51, 31),
(38, 4, 42),
(39, 4, 43),
(40, 4, 44);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `tagid` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(32) NOT NULL,
  PRIMARY KEY (`tagid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tagid`, `tag`) VALUES
(3, 'computerscience'),
(4, 'technology'),
(5, 'k'),
(6, 'l'),
(7, 'm'),
(15, 'ssp'),
(16, 'jem'),
(17, 'j'),
(18, ''),
(19, 'tears'),
(20, 'asdfg'),
(21, 'qwer'),
(23, ' pogitalagaako'),
(24, 'a'),
(25, 'b'),
(26, 'c'),
(27, 'aw'),
(28, 'bhuhuhuhu'),
(29, 'jenmaganda'),
(30, 'niggaarah'),
(31, 'kklklklk'),
(32, 'lala'),
(33, 'mwa mwa'),
(34, ' lala  mwa mwa '),
(35, ' yeea'),
(36, '  lala  mwa mwa '),
(37, '   yeea'),
(38, 'hahahha'),
(39, '   lala  mwa mwa '),
(40, '     yeea'),
(41, '  hahahha'),
(42, '    lala  mwa mwa '),
(43, '       yeea'),
(44, '    hahahha');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
