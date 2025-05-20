-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2025 at 05:20 AM
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
-- Database: `warehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` varchar(255) NOT NULL,
  `Fullname` varchar(255) NOT NULL,
  `Date` date DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone_Number` varchar(255) DEFAULT NULL,
  `Active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Fullname`, `Date`, `Password`, `Email`, `Phone_Number`, `Active`) VALUES
('A02', 'SYLVESTER ONG LI DE', '2024-06-20', '$2y$10$DJzfU0ZbjY4704Zm1LMf7.dwTAJzkNjEVCxd/DSglu8Z2AILsDJ5C', 'Samuelonglikang101@gmail.com', '01173763726', 1),
('A1', 'SAMUEL ONG LI KANG ', NULL, '$2y$10$5yVoywtksHqG/06644nh4Onvpvhx.R3t.1aA4RNLIazRFPNXA5nve', 'samuelonglikang808@gmail.com', '01173763726', 1);

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `BlockID` int(100) NOT NULL,
  `Block_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `block`
--

INSERT INTO `block` (`BlockID`, `Block_Name`) VALUES
(1, 'A'),
(2, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `ManagerID` varchar(255) NOT NULL,
  `Fullname` varchar(255) NOT NULL,
  `Date` date DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone_Number` varchar(255) DEFAULT NULL,
  `Active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`ManagerID`, `Fullname`, `Date`, `Password`, `Email`, `Phone_Number`, `Active`) VALUES
('M1', 'Sylvester Ong Li De ', NULL, '$2y$10$RcaxZ/ihW4DvR/..XL4Vh.RbPP0wd2B4JzwySVT454xZV8qQDXm/.', 'sylvesteronglide808@gmail.com', '01173763726', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pallet`
--

CREATE TABLE `pallet` (
  `Sku` varchar(100) NOT NULL,
  `Inbound_date` date DEFAULT NULL,
  `Outbound_date` date DEFAULT NULL,
  `Pallet_weight` float NOT NULL,
  `Current_row` varchar(100) NOT NULL,
  `Current_col` varchar(100) NOT NULL,
  `Current_height` float DEFAULT NULL,
  `ProductID` int(100) NOT NULL,
  `BlockID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pallet`
--

INSERT INTO `pallet` (`Sku`, `Inbound_date`, `Outbound_date`, `Pallet_weight`, `Current_row`, `Current_col`, `Current_height`, `ProductID`, `BlockID`) VALUES
('PLT-1', '2024-06-01', '2024-06-20', 1000, '0', '20', 10, 19, 1),
('PLT-2', '2024-06-01', '2024-06-20', 1000, '0', '20', 10, 21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `Time` time DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Flag` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Total` double DEFAULT NULL,
  `Totaltax` double DEFAULT NULL,
  `UserID` varchar(255) DEFAULT NULL,
  `Sku` varchar(100) DEFAULT NULL,
  `ProductID` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `Time`, `Date`, `Flag`, `Total`, `Totaltax`, `UserID`, `Sku`, `ProductID`) VALUES
(0, '09:55:44', '2024-06-20', 1, 1000, 1166, 'U1', 'PLT-1', 19),
(0, '11:28:44', '2024-06-20', 1, 1000, 1166, 'U2', 'PLT-2', 21);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(100) NOT NULL,
  `Product_Name` varchar(255) NOT NULL,
  `UserID` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `Product_Name`, `UserID`, `Date`, `Active`) VALUES
(18, 'Wireless Charging ICs', 'U1', '2024-06-01', 0),
(19, 'Smart Power Switches', 'U1', '2024-06-01', 0),
(20, 'Type-C Wire 2m', 'U1', '2024-06-20', 0),
(21, 'Smart Power Switches', 'U2', '2024-06-20', 0),
(22, 'testz', 'U1', '2024-06-20', 0);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `TaskID` int(100) NOT NULL,
  `Action` varchar(100) NOT NULL,
  `ProductID` int(100) NOT NULL,
  `Forklift_check` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `PS_check` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `AGV_check` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `SC_check` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Sku` varchar(100) DEFAULT NULL,
  `Lane` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`TaskID`, `Action`, `ProductID`, `Forklift_check`, `PS_check`, `AGV_check`, `SC_check`, `Date`, `Time`, `Sku`, `Lane`) VALUES
(70, 'Store', 19, 1, 1, 1, 1, '2024-06-01', '09:51:36', 'PLT-1', 1),
(74, 'Retrieve', 19, 1, 1, 1, 1, '2024-06-20', '10:19:43', 'PLT-1', 1),
(76, 'Store', 21, 1, 1, 1, 1, '2024-06-20', '11:26:07', 'PLT-2', 1),
(77, 'Retrieve', 21, 1, 1, 1, 1, '2024-06-20', '11:27:48', 'PLT-2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` varchar(255) NOT NULL,
  `Fullname` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phone_Number` varchar(255) NOT NULL,
  `Company_Name` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Fullname`, `Address`, `Phone_Number`, `Company_Name`, `Date`, `Password`, `Email`, `Active`) VALUES
('U1', 'ONG MOK KEYS', 'FREE TRADE ZONE BATU BERENDAM, BATU BERENDAM, 75350 MALACCA', '01111811708', 'ABC SDN BHD', '0000-00-00', '$2y$10$RcaxZ/ihW4DvR/..XL4Vh.RbPP0wd2B4JzwySVT454xZV8qQDXm/.', 'mokey9257@gmail.com', 3),
('U2', 'SYLVESTER ONG LI DEO', 'KRUBONG JAYA', '01130991764', 'INFINEON', '2024-06-20', '$2y$10$m8RpwBy7kP2Ees3REW7MROD4R8r4gYYkx8pbUpy4QN0CppMMc8/Xi', 'Samuelonglikang202@gmail.com', 1),
('U3', 'SAMUEL ONG LI KANG', 'asd', '01173763726', 'mmu', '2025-05-19', '$2y$10$5yVoywtksHqG/06644nh4Onvpvhx.R3t.1aA4RNLIazRFPNXA5nve', 'SAMUEL.ONG.LI@student.mmu.edu.my', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`BlockID`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`ManagerID`);

--
-- Indexes for table `pallet`
--
ALTER TABLE `pallet`
  ADD PRIMARY KEY (`Sku`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `BlockID` (`BlockID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`TaskID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `Sku` (`Sku`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `block`
--
ALTER TABLE `block`
  MODIFY `BlockID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `TaskID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pallet`
--
ALTER TABLE `pallet`
  ADD CONSTRAINT `pallet_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `pallet_ibfk_2` FOREIGN KEY (`BlockID`) REFERENCES `block` (`BlockID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`Sku`) REFERENCES `pallet` (`Sku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
