-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2026 at 03:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_lab`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `AuthorID` int(11) NOT NULL,
  `AuthorName` varchar(60) NOT NULL,
  `Country` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`AuthorID`, `AuthorName`, `Country`) VALUES
(1, 'Jane Austen', 'UK'),
(2, 'Chinua Achebe', 'Nigeria'),
(3, 'Haruki Murakami', 'Japan'),
(4, 'Bapsi Sidhwa', 'Pakistan'),
(5, 'Mohsin Hamid', 'Pakistan'),
(6, 'Anonymous Writer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `BookID` int(11) NOT NULL,
  `Title` varchar(80) NOT NULL,
  `Genre` varchar(30) DEFAULT NULL,
  `Price` decimal(8,2) DEFAULT NULL,
  `AuthorID` int(11) DEFAULT NULL,
  `PublishedYear` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BookID`, `Title`, `Genre`, `Price`, `AuthorID`, `PublishedYear`) VALUES
(101, 'Pride and Prejudice', 'Fiction', 850.00, 1, 1813),
(102, 'Emma', 'Fiction', 900.00, 1, 1815),
(103, 'Things Fall Apart', 'Fiction', 1100.00, 2, 1958),
(104, 'Norwegian Wood', 'Fiction', 1500.00, 3, 1987),
(105, 'Kafka on the Shore', 'Fiction', 1700.00, 3, 2002),
(106, 'Ice-Candy-Man', 'Fiction', 1200.00, 4, 1988),
(107, 'The Reluctant Fundamentalist', 'Fiction', 1300.00, 5, 2007),
(108, 'Exit West', 'Fiction', 1450.00, 5, 2017),
(109, 'Mystery Title', 'Mystery', 950.00, NULL, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `LoanID` int(11) NOT NULL,
  `MemberID` int(11) DEFAULT NULL,
  `BookID` int(11) DEFAULT NULL,
  `LoanDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`LoanID`, `MemberID`, `BookID`, `LoanDate`, `ReturnDate`) VALUES
(1, 201, 101, '2024-03-01', '2024-03-15'),
(2, 201, 104, '2024-04-10', NULL),
(3, 202, 103, '2024-02-20', '2024-03-05'),
(4, 202, 107, '2024-05-01', NULL),
(5, 203, 105, '2024-04-25', '2024-05-15'),
(6, 204, 102, '2024-01-10', '2024-01-30'),
(7, 204, 108, '2024-06-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `MemberID` int(11) NOT NULL,
  `MemberName` varchar(60) NOT NULL,
  `City` varchar(30) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`MemberID`, `MemberName`, `City`, `JoinDate`) VALUES
(201, 'Ahmad Raza', 'Lahore', '2023-01-15'),
(202, 'Sara Imran', 'Karachi', '2023-03-20'),
(203, 'Bilal Khan', 'Lahore', '2024-02-10'),
(204, 'Fatima Ali', 'Islamabad', '2022-09-05'),
(205, 'Hira Yousaf', NULL, '2024-05-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`AuthorID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `AuthorID` (`AuthorID`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`LoanID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`MemberID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `author` (`AuthorID`);

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`),
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
