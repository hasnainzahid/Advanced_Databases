-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2023 at 06:02 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abc`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateTotalPrice` (`orderID` INT)   BEGIN
    UPDATE Orders
    SET TotalPrice = (
        SELECT SUM(Price * Quantity)
        FROM OrderItems
        WHERE OrderID = orderID
    )
    WHERE Orders.OrderID = orderID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `EmailAddress` varchar(255) DEFAULT NULL,
  `LastLoginTime` datetime DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `TelephoneNumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `FullName`, `EmailAddress`, `LastLoginTime`, `Password`, `Address`, `TelephoneNumber`) VALUES
(1, 'John Smith', 'john.smith@example.com', '2023-09-19 14:30:00', 'password123', '123 Elm St, Some City, Country', '9876543210'),
(2, 'Sarah Johnson', 'sarah.johnson@example.com', '2023-09-19 15:45:00', 'letmein456', '456 Oak Ave, Another City, Country', '1234567890'),
(3, 'David Davis', 'david.davis@example.com', '2023-09-20 09:20:00', 'mypassword123', '789 Pine Rd, New City, Country', '9999999999'),
(4, 'Jennifer Brown', 'jennifer.brown@example.com', '2023-09-21 10:30:00', 'password987', '123 Cedar Ln, Another City, Country', '5555555555'),
(5, 'Michaela Wilson', 'michaela.wilson@example.com', '2023-09-22 11:45:00', 'password456', '456 Maple Ave, Yet Another City, Country', '1111111111'),
(6, 'Chris Thompson', 'chris.thompson@example.com', '2023-09-23 08:30:00', 'mypassword567', '789 Birch Rd, Another City, Country', '2222222222'),
(7, 'Andrew Jackson', 'andrew.jackson@example.com', '2023-09-24 14:20:00', 'letmein567', '890 Cedar Ln, Another City, Country', '3333333333'),
(8, 'Emma Lee', 'emma.lee@example.com', '2023-09-25 15:30:00', 'password789', '123 Pine Rd, Another City, Country', '4444444444'),
(9, 'Matthew Davis', 'matthew.davis@example.com', '2023-09-26 16:00:00', 'password999', '456 Birch Rd, Another City, Country', '5555555555'),
(10, 'Sophia Johnson', 'sophia.johnson@example.com', '2023-09-27 17:15:00', 'letmein789', '789 Cedar Ln, Another City, Country', '6666666666'),
(11, 'Oliver Smith', 'oliver.smith@example.com', '2023-09-28 18:30:00', 'password111', '890 Elm St, Another City, Country', '7777777777'),
(12, 'Ava Martin', 'ava.martin@example.com', '2023-09-29 19:45:00', 'letmein111', '123 Birch Rd, Another City, Country', '8888888888'),
(13, 'Benjamin Davis', 'benjamin.davis@example.com', '2023-09-30 12:20:00', 'password222', '456 Pine Rd, Another City, Country', '9999999999'),
(14, 'Grace Brown', 'grace.brown@example.com', '2023-10-01 13:30:00', 'mypassword111', '789 Elm St, Another City, Country', '0000000000'),
(15, 'Jackson Smith', 'jackson.smith@example.com', '2023-10-02 14:45:00', 'mypassword222', '890 Birch Rd, Another City, Country', '1111111111');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `ProductID` int(11) NOT NULL,
  `StockQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`ProductID`, `StockQuantity`) VALUES
(1, 50),
(2, 30),
(3, 20),
(4, 40),
(5, 60),
(6, 25),
(7, 35),
(8, 45),
(9, 55),
(10, 18),
(11, 29),
(12, 37),
(13, 47),
(14, 61),
(15, 23);

-- --------------------------------------------------------

--
-- Stand-in structure for view `monthlysales`
-- (See below for the actual view)
--
CREATE TABLE `monthlysales` (
`Month` varchar(7)
,`TotalSales` decimal(42,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `OrderItemID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`OrderItemID`, `OrderID`, `ProductID`, `Quantity`, `Price`, `Description`) VALUES
(1, 1, 1, 2, 29.99, 'Product A - Order 1'),
(2, 2, 2, 1, 39.99, 'Product B - Order 2'),
(3, 3, 3, 3, 19.99, 'Product C - Order 3'),
(4, 4, 4, 2, 49.99, 'Product D - Order 4'),
(5, 5, 5, 1, 59.99, 'Product E - Order 5'),
(6, 6, 6, 3, 24.99, 'Product F - Order 6'),
(7, 7, 7, 2, 34.99, 'Product G - Order 7'),
(8, 8, 8, 1, 44.99, 'Product H - Order 8'),
(9, 9, 9, 1, 54.99, 'Product I - Order 9'),
(10, 10, 10, 2, 19.99, 'Product J - Order 10'),
(11, 11, 11, 1, 29.99, 'Product K - Order 11'),
(12, 12, 12, 1, 39.99, 'Product L - Order 12'),
(13, 13, 13, 2, 49.99, 'Product M - Order 13'),
(14, 14, 14, 1, 59.99, 'Product N - Order 14'),
(15, 15, 15, 3, 24.99, 'Product O - Order 15'),
(22, 1, 1, 3, 10.99, 'Product A - Order 1');

--
-- Triggers `orderitems`
--
DELIMITER $$
CREATE TRIGGER `CalculateTotalPriceDelete` AFTER DELETE ON `orderitems` FOR EACH ROW BEGIN
    CALL CalculateTotalPrice(OLD.OrderID);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `CalculateTotalPriceInsert` AFTER INSERT ON `orderitems` FOR EACH ROW BEGIN
    CALL CalculateTotalPrice(NEW.OrderID);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `CalculateTotalPriceUpdate` AFTER UPDATE ON `orderitems` FOR EACH ROW BEGIN
    CALL CalculateTotalPrice(NEW.OrderID);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `OrderDate`, `StatusID`, `TotalPrice`) VALUES
(1, 1, '2023-09-19 14:35:00', 1, 942.71),
(2, 2, '2023-09-19 15:45:00', 2, NULL),
(3, 3, '2023-09-20 09:20:00', 3, NULL),
(4, 4, '2023-09-21 10:30:00', 4, NULL),
(5, 5, '2023-09-22 11:45:00', 5, NULL),
(6, 6, '2023-09-23 08:30:00', 6, NULL),
(7, 7, '2023-09-24 14:20:00', 7, NULL),
(8, 8, '2023-09-25 15:30:00', 8, NULL),
(9, 9, '2023-09-26 16:00:00', 9, NULL),
(10, 10, '2023-09-27 17:15:00', 10, NULL),
(11, 11, '2023-09-28 18:30:00', 11, NULL),
(12, 12, '2023-09-29 19:45:00', 12, NULL),
(13, 13, '2023-09-30 12:20:00', 13, NULL),
(14, 14, '2023-10-01 13:30:00', 14, NULL),
(15, 15, '2023-10-02 14:45:00', 15, NULL);

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `UpdateOrderStatus` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
    INSERT INTO OrderStatusHistory (OrderID, NewStatus, Timestamp)
    VALUES (NEW.OrderID, NEW.StatusID, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orderstatus`
--

CREATE TABLE `orderstatus` (
  `StatusID` int(11) NOT NULL,
  `StatusName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderstatus`
--

INSERT INTO `orderstatus` (`StatusID`, `StatusName`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Delivered'),
(5, 'Canceled'),
(6, 'Returned'),
(7, 'On Hold'),
(8, 'Completed'),
(9, 'Pending Payment'),
(10, 'Refunded'),
(11, 'Partially Shipped'),
(12, 'Shipped Incomplete'),
(13, 'Shipped Complete'),
(14, 'Disputed'),
(15, 'Manual Verification Required');

-- --------------------------------------------------------

--
-- Table structure for table `orderstatushistory`
--

CREATE TABLE `orderstatushistory` (
  `HistoryID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `NewStatus` int(11) DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderstatushistory`
--

INSERT INTO `orderstatushistory` (`HistoryID`, `OrderID`, `NewStatus`, `Timestamp`) VALUES
(1, 1, 1, '2023-09-19 04:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `ProductDescription` text DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `ProductCategory` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `Name`, `SupplierID`, `ProductDescription`, `Price`, `ProductCategory`) VALUES
(1, 'Product A', 1, 'Description of Product A', 29.99, 'Category A'),
(2, 'Product B', 2, 'Description of Product B', 39.99, 'Category B'),
(3, 'Product C', 3, 'Description of Product C', 19.99, 'Category A'),
(4, 'Product D', 4, 'Description of Product D', 49.99, 'Category C'),
(5, 'Product E', 5, 'Description of Product E', 59.99, 'Category D'),
(6, 'Product F', 6, 'Description of Product F', 24.99, 'Category A'),
(7, 'Product G', 7, 'Description of Product G', 34.99, 'Category B'),
(8, 'Product H', 8, 'Description of Product H', 44.99, 'Category C'),
(9, 'Product I', 9, 'Description of Product I', 54.99, 'Category D'),
(10, 'Product J', 10, 'Description of Product J', 19.99, 'Category A'),
(11, 'Product K', 11, 'Description of Product K', 29.99, 'Category B'),
(12, 'Product L', 12, 'Description of Product L', 39.99, 'Category C'),
(13, 'Product M', 13, 'Description of Product M', 49.99, 'Category D'),
(14, 'Product N', 14, 'Description of Product N', 59.99, 'Category A'),
(15, 'Product O', 15, 'Description of Product O', 24.99, 'Category B');

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `ReturnID` int(11) NOT NULL,
  `OrderItemID` int(11) DEFAULT NULL,
  `ReturnDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`ReturnID`, `OrderItemID`, `ReturnDate`) VALUES
(1, 1, '2023-09-20 09:00:00'),
(2, 2, '2023-09-21 11:15:00'),
(3, 3, '2023-09-22 14:00:00'),
(4, 4, '2023-09-23 10:30:00'),
(5, 5, '2023-09-24 12:45:00'),
(6, 6, '2023-09-25 13:30:00'),
(7, 7, '2023-09-26 15:20:00'),
(8, 8, '2023-09-27 18:00:00'),
(9, 9, '2023-09-28 11:45:00'),
(10, 10, '2023-09-29 09:30:00'),
(11, 11, '2023-09-30 14:20:00'),
(12, 12, '2023-10-01 16:15:00'),
(13, 13, '2023-10-02 13:00:00'),
(14, 14, '2023-10-03 10:45:00'),
(15, 15, '2023-10-04 11:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`SupplierID`, `SupplierName`) VALUES
(1, 'Supplier X'),
(2, 'Supplier Y'),
(3, 'Supplier Z'),
(4, 'Supplier A'),
(5, 'Supplier B'),
(6, 'Supplier C'),
(7, 'Supplier D'),
(8, 'Supplier E'),
(9, 'Supplier F'),
(10, 'Supplier G'),
(11, 'Supplier H'),
(12, 'Supplier I'),
(13, 'Supplier J'),
(14, 'Supplier K'),
(15, 'Supplier L');

-- --------------------------------------------------------

--
-- Structure for view `monthlysales`
--
DROP TABLE IF EXISTS `monthlysales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `monthlysales`  AS SELECT date_format(`orders`.`OrderDate`,'%Y-%m') AS `Month`, sum(`orderitems`.`Price` * `orderitems`.`Quantity`) AS `TotalSales` FROM (`orders` join `orderitems` on(`orders`.`OrderID` = `orderitems`.`OrderID`)) GROUP BY date_format(`orders`.`OrderDate`,'%Y-%m') ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `idx_EmailAddress` (`EmailAddress`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`OrderItemID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `StatusID` (`StatusID`);

--
-- Indexes for table `orderstatus`
--
ALTER TABLE `orderstatus`
  ADD PRIMARY KEY (`StatusID`);

--
-- Indexes for table `orderstatushistory`
--
ALTER TABLE `orderstatushistory`
  ADD PRIMARY KEY (`HistoryID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `SupplierID` (`SupplierID`),
  ADD KEY `idx_ProductCategory` (`ProductCategory`),
  ADD KEY `idx_Price` (`Price`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`ReturnID`),
  ADD KEY `OrderItemID` (`OrderItemID`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `OrderItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orderstatus`
--
ALTER TABLE `orderstatus`
  MODIFY `StatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orderstatushistory`
--
ALTER TABLE `orderstatushistory`
  MODIFY `HistoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `ReturnID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`StatusID`) REFERENCES `orderstatus` (`StatusID`);

--
-- Constraints for table `orderstatushistory`
--
ALTER TABLE `orderstatushistory`
  ADD CONSTRAINT `orderstatushistory_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`);

--
-- Constraints for table `returns`
--
ALTER TABLE `returns`
  ADD CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`OrderItemID`) REFERENCES `orderitems` (`OrderItemID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
