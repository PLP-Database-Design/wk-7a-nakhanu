-- QUESTION 1:
-- Transform into 1NF where each row represents a single product
USE salesdb;

CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(50),
    Product VARCHAR(50)
);

INSERT INTO ProductDetail (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');



-- QUESTION 2:
-- Transform this table into **2NF** by removing partial dependencies
USE salesdb;

-- Drop existing tables if they exist
DROP TABLE orderdetails;
DROP TABLE orders;

-- Create table Orders and OrderItems
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert data into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
