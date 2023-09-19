-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255),
    EmailAddress VARCHAR(255),
    LastLoginTime DATETIME,
    Password VARCHAR(255),
    Address TEXT,
    TelephoneNumber VARCHAR(20)
);

-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(255)
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    SupplierID INT,
    ProductDescription TEXT,
    Price DECIMAL(10, 2),
    ProductCategory VARCHAR(255),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);


-- Create OrderStatus table
CREATE TABLE OrderStatus (
    StatusID INT AUTO_INCREMENT PRIMARY KEY,
    StatusName VARCHAR(50)
);

-- Create OrderStatusHistory table
CREATE TABLE OrderStatusHistory (
    HistoryID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    NewStatus INT,
    Timestamp DATETIME,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    StatusID INT,
    TotalPrice DECIMAL(10, 2),  -- New column for TotalPrice
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StatusID) REFERENCES OrderStatus(StatusID)
);


-- Create OrderItems table
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    Description TEXT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Returns table
CREATE TABLE Returns (
    ReturnID INT AUTO_INCREMENT PRIMARY KEY,
    OrderItemID INT,
    ReturnDate DATETIME,
    FOREIGN KEY (OrderItemID) REFERENCES OrderItems(OrderItemID)
);

-- Create Inventory table
CREATE TABLE Inventory (
    ProductID INT PRIMARY KEY,
    StockQuantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- sample data for Customers table
INSERT INTO Customers (FullName, EmailAddress, LastLoginTime, Password, Address, TelephoneNumber)
VALUES
    ('John Smith', 'john.smith@example.com', '2023-09-19 14:30:00', 'password123', '123 Elm St, Some City, Country', '9876543210'),
    ('Sarah Johnson', 'sarah.johnson@example.com', '2023-09-19 15:45:00', 'letmein456', '456 Oak Ave, Another City, Country', '1234567890'),
    ('David Davis', 'david.davis@example.com', '2023-09-20 09:20:00', 'mypassword123', '789 Pine Rd, New City, Country', '9999999999'),
    ('Jennifer Brown', 'jennifer.brown@example.com', '2023-09-21 10:30:00', 'password987', '123 Cedar Ln, Another City, Country', '5555555555'),
    ('Michaela Wilson', 'michaela.wilson@example.com', '2023-09-22 11:45:00', 'password456', '456 Maple Ave, Yet Another City, Country', '1111111111'),
    ('Chris Thompson', 'chris.thompson@example.com', '2023-09-23 08:30:00', 'mypassword567', '789 Birch Rd, Another City, Country', '2222222222'),
    ('Andrew Jackson', 'andrew.jackson@example.com', '2023-09-24 14:20:00', 'letmein567', '890 Cedar Ln, Another City, Country', '3333333333'),
    ('Emma Lee', 'emma.lee@example.com', '2023-09-25 15:30:00', 'password789', '123 Pine Rd, Another City, Country', '4444444444'),
    ('Matthew Davis', 'matthew.davis@example.com', '2023-09-26 16:00:00', 'password999', '456 Birch Rd, Another City, Country', '5555555555'),
    ('Sophia Johnson', 'sophia.johnson@example.com', '2023-09-27 17:15:00', 'letmein789', '789 Cedar Ln, Another City, Country', '6666666666'),
    ('Oliver Smith', 'oliver.smith@example.com', '2023-09-28 18:30:00', 'password111', '890 Elm St, Another City, Country', '7777777777'),
    ('Ava Martin', 'ava.martin@example.com', '2023-09-29 19:45:00', 'letmein111', '123 Birch Rd, Another City, Country', '8888888888'),
    ('Benjamin Davis', 'benjamin.davis@example.com', '2023-09-30 12:20:00', 'password222', '456 Pine Rd, Another City, Country', '9999999999'),
    ('Grace Brown', 'grace.brown@example.com', '2023-10-01 13:30:00', 'mypassword111', '789 Elm St, Another City, Country', '0000000000'),
    ('Jackson Smith', 'jackson.smith@example.com', '2023-10-02 14:45:00', 'mypassword222', '890 Birch Rd, Another City, Country', '1111111111');

-- sample data for Suppliers table
INSERT INTO Suppliers (SupplierName)
VALUES
    ('Supplier X'),
    ('Supplier Y'),
    ('Supplier Z'),
    ('Supplier A'),
    ('Supplier B'),
    ('Supplier C'),
    ('Supplier D'),
    ('Supplier E'),
    ('Supplier F'),
    ('Supplier G'),
    ('Supplier H'),
    ('Supplier I'),
    ('Supplier J'),
    ('Supplier K'),
    ('Supplier L');

-- sample data for Products table
INSERT INTO Products (Name, SupplierID, ProductDescription, Price, ProductCategory)
VALUES
    ('Product A', 1, 'Description of Product A', 29.99, 'Category A'),
    ('Product B', 2, 'Description of Product B', 39.99, 'Category B'),
    ('Product C', 3, 'Description of Product C', 19.99, 'Category A'),
    ('Product D', 4, 'Description of Product D', 49.99, 'Category C'),
    ('Product E', 5, 'Description of Product E', 59.99, 'Category D'),
    ('Product F', 6, 'Description of Product F', 24.99, 'Category A'),
    ('Product G', 7, 'Description of Product G', 34.99, 'Category B'),
    ('Product H', 8, 'Description of Product H', 44.99, 'Category C'),
    ('Product I', 9, 'Description of Product I', 54.99, 'Category D'),
    ('Product J', 10, 'Description of Product J', 19.99, 'Category A'),
    ('Product K', 11, 'Description of Product K', 29.99, 'Category B'),
    ('Product L', 12, 'Description of Product L', 39.99, 'Category C'),
    ('Product M', 13, 'Description of Product M', 49.99, 'Category D'),
    ('Product N', 14, 'Description of Product N', 59.99, 'Category A'),
    ('Product O', 15, 'Description of Product O', 24.99, 'Category B');

-- sample data for OrderStatus table
INSERT INTO OrderStatus (StatusName)
VALUES
    ('Pending'),
    ('Processing'),
    ('Shipped'),
    ('Delivered'),
    ('Canceled'),
    ('Returned'),
    ('On Hold'),
    ('Completed'),
    ('Pending Payment'),
    ('Refunded'),
    ('Partially Shipped'),
    ('Shipped Incomplete'),
    ('Shipped Complete'),
    ('Disputed'),
    ('Manual Verification Required');

-- sample data for Orders table
INSERT INTO Orders (CustomerID, OrderDate, StatusID)
VALUES
    (1, '2023-09-19 14:35:00', 1), -- Status: Pending
    (2, '2023-09-19 15:45:00', 2),
    (3, '2023-09-20 09:20:00', 3),
    (4, '2023-09-21 10:30:00', 4),
    (5, '2023-09-22 11:45:00', 5),
    (6, '2023-09-23 08:30:00', 6),
    (7, '2023-09-24 14:20:00', 7),
    (8, '2023-09-25 15:30:00', 8),
    (9, '2023-09-26 16:00:00', 9),
    (10, '2023-09-27 17:15:00', 10),
    (11, '2023-09-28 18:30:00', 11),
    (12, '2023-09-29 19:45:00', 12),
    (13, '2023-09-30 12:20:00', 13),
    (14, '2023-10-01 13:30:00', 14),
    (15, '2023-10-02 14:45:00', 15);

-- sample data for OrderItems table
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price, Description)
VALUES
    (1, 1, 2, 29.99, 'Product A - Order 1'),
    (2, 2, 1, 39.99, 'Product B - Order 2'),
    (3, 3, 3, 19.99, 'Product C - Order 3'),
    (4, 4, 2, 49.99, 'Product D - Order 4'),
    (5, 5, 1, 59.99, 'Product E - Order 5'),
    (6, 6, 3, 24.99, 'Product F - Order 6'),
    (7, 7, 2, 34.99, 'Product G - Order 7'),
    (8, 8, 1, 44.99, 'Product H - Order 8'),
    (9, 9, 1, 54.99, 'Product I - Order 9'),
    (10, 10, 2, 19.99, 'Product J - Order 10'),
    (11, 11, 1, 29.99, 'Product K - Order 11'),
    (12, 12, 1, 39.99, 'Product L - Order 12'),
    (13, 13, 2, 49.99, 'Product M - Order 13'),
    (14, 14, 1, 59.99, 'Product N - Order 14'),
    (15, 15, 3, 24.99, 'Product O - Order 15');

-- sample data for Returns table
INSERT INTO Returns (OrderItemID, ReturnDate)
VALUES
    (1, '2023-09-20 09:00:00'),
    (2, '2023-09-21 11:15:00'),
    (3, '2023-09-22 14:00:00'),
    (4, '2023-09-23 10:30:00'),
    (5, '2023-09-24 12:45:00'),
    (6, '2023-09-25 13:30:00'),
    (7, '2023-09-26 15:20:00'),
    (8, '2023-09-27 18:00:00'),
    (9, '2023-09-28 11:45:00'),
    (10, '2023-09-29 09:30:00'),
    (11, '2023-09-30 14:20:00'),
    (12, '2023-10-01 16:15:00'),
    (13, '2023-10-02 13:00:00'),
    (14, '2023-10-03 10:45:00'),
    (15, '2023-10-04 11:30:00');

-- sample data for Inventory table
INSERT INTO Inventory (ProductID, StockQuantity)
VALUES
    (1, 50), -- Product with ID 1 has 50 in stock
    (2, 30), -- Product with ID 2 has 30 in stock;
    (3, 20), -- Product with ID 3 has 20 in stock;
    (4, 40), -- Product with ID 4 has 40 in stock;
    (5, 60), -- Product with ID 5 has 60 in stock;
    (6, 25), -- Product with ID 6 has 25 in stock;
    (7, 35), -- Product with ID 7 has 35 in stock;
    (8, 45), -- Product with ID 8 has 45 in stock;
    (9, 55), -- Product with ID 9 has 55 in stock;
    (10, 18), -- Product with ID 10 has 18 in stock;
    (11, 29), -- Product with ID 11 has 29 in stock;
    (12, 37), -- Product with ID 12 has 37 in stock;
    (13, 47), -- Product with ID 13 has 47 in stock;
    (14, 61), -- Product with ID 14 has 61 in stock;
    (15, 23); -- Product with ID 15 has 23 in stock;


-- Detail information about suppliers and the number of products they provide:

SELECT Suppliers.SupplierID, SupplierName, COUNT(Products.ProductID) AS NumberOfProducts
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.SupplierID, SupplierName;



-- 10 best-selling products with the total amount and their supplier:

SELECT Products.ProductID, Products.Name AS ProductName, Suppliers.SupplierName, SUM(OrderItems.Quantity) AS TotalQuantity
FROM OrderItems
JOIN Products ON OrderItems.ProductID = Products.ProductID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
GROUP BY Products.ProductID, Products.Name, Suppliers.SupplierName
ORDER BY TotalQuantity DESC
LIMIT 10;



-- List of customers and their total purchases:

SELECT Customers.CustomerID, FullName, EmailAddress, SUM(OrderItems.Quantity) AS TotalPurchases
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
LEFT JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
GROUP BY Customers.CustomerID, FullName, EmailAddress;



-- List of returned items:

SELECT Returns.ReturnID, OrderItems.OrderItemID, Products.Name AS ProductName, Returns.ReturnDate
FROM Returns
JOIN OrderItems ON Returns.OrderItemID = OrderItems.OrderItemID
JOIN Products ON OrderItems.ProductID = Products.ProductID;


-- List of products in the Category A category sold last month:

SELECT Products.ProductID, Products.Name AS ProductName, Orders.OrderDate
FROM Products
JOIN OrderItems ON Products.ProductID = OrderItems.ProductID
JOIN Orders ON OrderItems.OrderID = Orders.OrderID
WHERE Products.ProductCategory = 'Category A'
  AND Orders.OrderDate >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
  
  
  
-- Indexes:
-- Customers Table:
-- Index on EmailAddress for quick email-based searches.

CREATE INDEX idx_EmailAddress ON Customers (EmailAddress);

SHOW INDEX FROM Customers;


-- Products Table:
-- Index on ProductCategory for faster category-based queries.
-- Index on Price for efficient price-based filtering.

CREATE INDEX idx_ProductCategory ON Products (ProductCategory);
CREATE INDEX idx_Price ON Products (Price);
  
  
SHOW INDEX FROM products;



-- Triggers:
-- UpdateOrderStatus Trigger:
--- Purpose: Automatically updates the order history table whenever the order status is updated.
-- Event: ON UPDATE of OrderStatus in the Orders table.
-- Action: Inserts a new record into the OrderStatusHistory table with the updated status and timestamp.

DELIMITER //
CREATE TRIGGER UpdateOrderStatus
AFTER UPDATE ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO OrderStatusHistory (OrderID, NewStatus, Timestamp)
    VALUES (NEW.OrderID, NEW.StatusID, NOW());
END;
//
DELIMITER ;


SELECT * FROM OrderStatusHistory;



-- CalculateTotalPrice Trigger:
-- Purpose: Automatically updates the total price of an order whenever an order item is added, updated, or deleted.
-- Events: AFTER INSERT, AFTER UPDATE, and AFTER DELETE on OrderItems table.
-- Action: Recalculates the total price for the corresponding order and updates the Orders table.


DELIMITER //

-- Main trigger to calculate total price
DELIMITER //
CREATE PROCEDURE CalculateTotalPrice(orderID INT)
BEGIN
    UPDATE Orders
    SET TotalPrice = (
        SELECT SUM(Price * Quantity)
        FROM OrderItems
        WHERE OrderID = orderID
    )
    WHERE Orders.OrderID = orderID;
END;
//

-- Sub-trigger for INSERT
DELIMITER //
CREATE TRIGGER CalculateTotalPriceInsert
AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    CALL CalculateTotalPrice(NEW.OrderID);
END;
//

-- Sub-trigger for UPDATE
DELIMITER //
CREATE TRIGGER CalculateTotalPriceUpdate
AFTER UPDATE ON OrderItems
FOR EACH ROW
BEGIN
    CALL CalculateTotalPrice(NEW.OrderID);
END;
//

-- Sub-trigger for DELETE
DELIMITER //
CREATE TRIGGER CalculateTotalPriceDelete
AFTER DELETE ON OrderItems
FOR EACH ROW
BEGIN
    CALL CalculateTotalPrice(OLD.OrderID);
END;
//

DELIMITER ;


INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price, Description)
VALUES (1, 1, 3, 10.99, 'Product A - Order 1');


SELECT * FROM Orders WHERE OrderID = 1;




-- Views:
-- MonthlySales View:
-- Purpose: Provides a view of monthly sales for reporting purposes.

CREATE VIEW MonthlySales AS
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS Month, SUM(Price * Quantity) AS TotalSales
FROM Orders
JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m');


SELECT * FROM MonthlySales


