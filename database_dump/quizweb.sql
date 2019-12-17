-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2019 at 06:06 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `ques` text NOT NULL,
  `option 1` varchar(222) NOT NULL,
  `option 2` varchar(222) NOT NULL,
  `option 3` varchar(222) NOT NULL,
  `option 4` varchar(222) NOT NULL,
  `ans` varchar(222) NOT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  `createdby` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `category_id`, `ques`, `option 1`, `option 2`, `option 3`, `option 4`, `ans`, `isactive`, `createdby`, `updated_by`, `created_date`) VALUES
(1, 1, 'Which of the following feature is a part of HTML 5?', 'Persistent Local Storage', 'Web Socket', 'Server-Sent Events', 'All of the above', 'All of the above', 'Y', 0, NULL, '2019-12-15 06:15:15'),
(2, 1, 'Which of the following tag represents the footer of a section in HTML5?', 'Footer', 'Nav', 'Section', 'Dialog', 'Footer', 'Y', 0, NULL, '2019-12-15 06:15:15'),
(3, 1, 'Which of the following input control accepts only numerical value in Web Form 2.0?', 'Week', 'Time', 'Number', 'Range', 'Number', 'Y', 0, NULL, '2019-12-15 06:22:15'),
(4, 1, 'Which of the following is true about Local Storage in HTML5?', 'HTML5 introduces the localStorage attribute which would be used to access a page local storage area without no time limit', 'this local storage will be available whenever you would use that page', 'Both of the above', 'None of the above', 'Both of the above', 'Y', 0, NULL, '2019-12-15 06:22:15'),
(5, 1, 'Which of the following attribute triggers event when the document goes offline?', 'Offline', 'Off', 'Out', 'Onbeforeonload', 'Offline', 'Y', 0, NULL, '2019-12-15 06:22:15'),
(6, 2, 'Which of the following is true about typeof operator in JavaScript?', 'The typeof is a unary operator that is placed before its single operand, which can be of any type', 'Its value is a string indicating the data type of the operand', 'Both of the above', 'None of the above', 'Both of the above', 'Y', 0, NULL, '2019-12-15 06:33:24'),
(7, 2, 'Which built-in method adds one or more elements to the end of an array and returns the new length of the array?', 'last()', 'put()', 'push()', 'None of the Above', 'push()', 'Y', 0, NULL, '2019-12-15 06:33:24'),
(8, 2, 'Which built-in method returns the calling string value converted to lower case?', 'toLowerCase()', 'toLower()', 'changeCase(case)', 'None of the above', 'toLowerCase()', 'Y', 0, NULL, '2019-12-15 06:33:24'),
(9, 2, 'Which of the following function of Number object returns a string value version of the current number in a format that may vary according to a browser\'s locale settings.?', 'toExponential()', 'toFixed()', 'toLocaleString()', 'toString()', 'toLocaleString()', 'Y', 0, NULL, '2019-12-15 06:33:24'),
(10, 2, 'Which of the following function of String object splits a String object into an array of strings by separating the string into substrings?', 'slice()', 'split()', 'replace()', 'search()', 'split()', 'Y', 0, NULL, '2019-12-15 06:33:24');

-- --------------------------------------------------------

--
-- Table structure for table `quizcategory`
--

CREATE TABLE `quizcategory` (
  `id` int(11) NOT NULL,
  `category_name` varchar(150) NOT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quizcategory`
--

INSERT INTO `quizcategory` (`id`, `category_name`, `isactive`) VALUES
(1, 'HTML5', 'Y'),
(2, 'Javascript', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `submittedans`
--

CREATE TABLE `submittedans` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `score` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `submittedans`
--

INSERT INTO `submittedans` (`id`, `userid`, `score`) VALUES
(1, 2, '3/5'),
(2, 2, '4/5'),
(3, 5, '4/5');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  `isadmin` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `isactive`, `isadmin`) VALUES
(1, 'royal', '123@gmail.com', 'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=', 'Y', 'N'),
(2, 'sid', 'sid@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Y', 'N'),
(3, 'admin', 'admin@admin.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Y', 'Y'),
(4, 'royal', 'royal@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Y', 'N'),
(5, 'nauman', 'nauman@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Y', 'N'),
(7, 'admin', 'admin1@admin.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'Y', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizcategory`
--
ALTER TABLE `quizcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submittedans`
--
ALTER TABLE `submittedans`
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
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `quizcategory`
--
ALTER TABLE `quizcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `submittedans`
--
ALTER TABLE `submittedans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
