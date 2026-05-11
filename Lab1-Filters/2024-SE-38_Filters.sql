-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2026 at 07:54 AM
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
-- Database: `bookstore_lab`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `BookID` int(11) NOT NULL,
  `Title` varchar(80) NOT NULL,
  `Author` varchar(60) DEFAULT NULL,
  `Genre` varchar(30) DEFAULT NULL,
  `Price` decimal(8,2) DEFAULT NULL,
  `StockQty` int(11) DEFAULT NULL,
  `PublishedYear` int(11) DEFAULT NULL,
  `Publisher` varchar(40) DEFAULT NULL,
  `Language` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BookID`, `Title`, `Author`, `Genre`, `Price`, `StockQty`, `PublishedYear`, `Publisher`, `Language`) VALUES
(1, 'Pride and Prejudice', 'Jane Austen', 'Fiction', 850.00, 12, 1813, 'Penguin', 'English'),
(2, 'Emma', 'Jane Austen', 'Fiction', 900.00, 8, 1815, 'Penguin', 'English'),
(3, 'Things Fall Apart', 'Chinua Achebe', 'Fiction', 1100.00, 5, 1958, 'Heinemann', 'English'),
(4, 'Norwegian Wood', 'Haruki Murakami', 'Fiction', 1500.00, 3, 1987, 'Vintage', 'English'),
(5, 'Kafka on the Shore', 'Haruki Murakami', 'Fiction', 1700.00, 0, 2002, 'Vintage', 'English'),
(6, 'Ice-Candy-Man', 'Bapsi Sidhwa', 'Fiction', 1200.00, 15, 1988, 'Penguin', 'English'),
(7, 'The Reluctant Fundamentalist', 'Mohsin Hamid', 'Fiction', 1300.00, 9, 2007, 'Penguin', 'English'),
(8, 'Exit West', 'Mohsin Hamid', 'Fiction', 1450.00, 6, 2017, 'Riverhead', 'English'),
(9, 'Atomic Habits', 'James Clear', 'Self-help', 1800.00, 20, 2018, 'Avery', 'English'),
(10, 'The Power of Habit', 'Charles Duhigg', 'Self-help', 1600.00, 11, 2012, 'Random\r\nHouse', 'English'),
(11, 'Sapiens', 'Yuval Harari', 'History', 2200.00, 7, 2011, 'Harper', 'English'),
(12, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 1100.00, 25, 1997, 'Plata', 'English'),
(13, 'Aab-e-Hayat', 'Ibn-e-Safi', 'Mystery', 650.00, 18, 1955, 'Asrar', 'Urdu'),
(14, 'Raja Gidh', 'Bano Qudsia', 'Fiction', 900.00, 14, 1981, 'Sang-e-Meel', 'Urdu'),
(15, 'Mystery Title', NULL, 'Mystery', 950.00, 4, 2020, NULL, 'English');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BookID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
