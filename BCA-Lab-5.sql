-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Shivaraj
-- USN: 1RUA24BCA0083
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- root@localhost	RVU-PC-033	8.4.6	2025-09-22 06:24:05
-- Write your code below this line along with the output 

-- Create Customers table
create database lab06 ;
use lab06 ;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert data into Customers
INSERT INTO Customers VALUES
(1, 'Alice', 'Bangalore'),
(2, 'Bob', 'Mumbai'),
(3, 'Charlie', 'Bangalore'),
(4, 'David', 'Delhi'),
(5, 'Eve', 'Hyderabad');

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert data into Orders
INSERT INTO Orders VALUES
(101, 1, 'Laptop', '2024-01-15'),
(102, 3, 'Mobile', '2024-02-20'),
(103, 2, 'Tablet', '2024-03-10'),
(104, NULL, 'Desktop', '2024-04-01'),   -- Order without customer (to test outer joins)
(105, 1, 'Keyboard', '2024-05-05');

---------------------------------------------------
-- 1. INNER JOIN Queries
---------------------------------------------------

-- a) Find all orders placed by customers from the city "Bangalore."
SELECT c.customer_name, o.product_name, o.order_date
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.city = 'Bangalore';

-- b) List all customers with the products they ordered.
SELECT c.customer_name, o.product_name
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- c) Show customer names and their order dates.
SELECT c.customer_name, o.order_date
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- d) Display order IDs with the corresponding customer names.
SELECT o.order_id, c.customer_name
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

-- e) Find the number of orders placed by each customer.
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- f) Show city names along with the products ordered by customers.
SELECT c.city, o.product_name
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

---------------------------------------------------
-- 2. LEFT OUTER JOIN Queries
---------------------------------------------------

-- a) Find all customers and their orders, even if a customer has no orders.
SELECT c.customer_name, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- b) List all customers and the products they ordered.
-- (Same as above, including NULL for customers without orders)

-- c) Show customer IDs, names, and their order IDs.
SELECT c.customer_id, c.customer_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- d) Find the total number of orders (if any) placed by each customer.
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- e) Retrieve customers who have not placed any orders.
SELECT c.customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- f) Display customer names with their order dates.
SELECT c.customer_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

---------------------------------------------------
-- 3. RIGHT OUTER JOIN Queries
---------------------------------------------------

-- a) Find all orders and their corresponding customers, even if an order doesn't have a customer.
SELECT o.order_id, c.customer_name, o.product_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;

-- b) Show all orders with the customer names.
-- This is same as above.

-- c) Display product names with the customers who ordered them.
SELECT o.product_name, c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;

-- d) List order IDs with customer cities.
SELECT o.order_id, c.city
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;

-- e) Find the number of orders per customer (include those without orders).
-- Same as LEFT JOIN from customer perspective, RIGHT JOIN here will be less useful.

SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id;

-- f) Retrieve customers who do not have any matching orders.
SELECT c.customer_name
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

---------------------------------------------------
-- 4. FULL OUTER JOIN Queries
---------------------------------------------------

-- Note: MySQL does not support FULL OUTER JOIN directly.
-- Workaround with UNION of LEFT and RIGHT JOINs excluding duplicates.

-- a) Find all customers and their orders, including those with no orders and orders without customers.
SELECT c.customer_id, c.customer_name, o.order_id, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_id, c.customer_name, o.order_id, o.product_name
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- b) List all customers and products, whether they placed an order or not.
-- Same as above.

-- c) Show customer IDs with order IDs (include unmatched ones).
-- Same as above.

-- d) Display customer names with order dates.
-- Same as above but show order_date instead of product_name

SELECT c.customer_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.customer_name, o.order_date
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- e) Find all unmatched records (customers without orders and orders without customers).
SELECT c.customer_id, c.customer_name, o.order_id, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL

UNION

SELECT c.customer_id, c.customer_name, o.order_id, o.product_name
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

-- f) Show customer cities with products.
SELECT c.city, o.product_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
UNION
SELECT c.city, o.product_name
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

---------------------------------------------------
-- 5. NATURAL JOIN Queries
---------------------------------------------------

-- a) Find all orders placed by customers.
SELECT *
FROM Customers NATURAL JOIN Orders;

-- b) List all customers with the products they ordered using NATURAL JOIN.
SELECT customer_name, product_name
FROM Customers NATURAL JOIN Orders;

-- c) Show customer names along with their order dates using NATURAL JOIN.
SELECT customer_name, order_date
FROM Customers NATURAL JOIN Orders;

-- d) Find all customer cities and the products ordered by those customers using NATURAL JOIN.
SELECT city, product_name
FROM Customers NATURAL JOIN Orders;
Lab_6.sql
Displaying Lab_6.sql.
Lab 05 JOIN
B.R Sharath Shetty
•
Sep 22
Due Sep 22
Dear Students
   Complete the assignment uploaded and submit by the end of day.

Lab Experiment 05 (1).sql
SQL
Class comments
