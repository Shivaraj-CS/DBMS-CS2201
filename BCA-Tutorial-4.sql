SELECT 
    USER(),
    @@hostname AS Host_Name,
    VERSION() AS MySQL_Version,
    NOW() AS Current_Date_Time;
/*# USER()	Host_Name	MySQL_Version	Current_Date_Time
root@localhost	HARSHA	8.4.6	2025-09-17 21:08:09*/

create database Tutorial_5 ;
use Tutorial_5 ;


CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Price DECIMAL(10, 2),
    PublishDate DATE
);


CREATE TABLE Customers (
    CustID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    JoinDate DATE
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustID INT,
    BookID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustID) REFERENCES Customers(CustID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);



INSERT INTO Books (BookID, Title, Author, Price, PublishDate) VALUES
(101, 'The Alchemist', 'Paulo Coelho', 350, '2010-06-15'),
(102, 'Atomic Habits', 'James Clear', 450, '2018-10-16'),
(103, 'Clean Code', 'Robert Martin', 550, '2008-08-01'),
(104, 'Think Like a Monk', 'Jay Shetty', 400, '2020-09-08'),
(105, 'Python Crash Course', 'Eric Matthes', 500, '2019-05-10');


INSERT INTO Customers (CustID, Name, Email, JoinDate) VALUES
(201, 'Arjun Rao', 'arjun@gmail.com', '2021-02-10'),
(202, 'Priya Nair', 'priya@yahoo.com', '2020-07-25'),
(203, 'John Smith', 'john@gmail.com', '2022-01-14'),
(204, 'Maria Lopez', 'maria@outlook.com', '2019-11-30');


INSERT INTO Orders (OrderID, CustID, BookID, OrderDate, Quantity) VALUES
(301, 201, 102, '2022-03-05', 2),
(302, 202, 101, '2021-09-12', 1),
(303, 203, 105, '2022-05-20', 3),
(304, 204, 104, '2020-12-25', 1),
(305, 201, 103, '2021-11-18', 1);

select * from Customers , Books , Orders ;

select upper(Name) from Customers ;
/*# upper(Name)
ARJUN RAO
PRIYA NAIR
JOHN SMITH
MARIA LOPEZ
*/

select lower(Name) from Customers ;
/*# lower(Name)
arjun rao
priya nair
john smith
maria lopez */

select left(Title , 3) from Books ;
/*# left(Title , 3)
The
Ato
Cle
Thi
Pyt */

select length(Title) from Books ;
/*# length(Title)
13
13
10
17
19
*/

select Replace (Title , 'Book' , 'Text' ) from Books ;
/*# Replace (Title , 'Book' , 'Text' )
The Alchemist
Atomic Habits
Clean Code
Think Like a Monk
Python Crash Course*/

select concat(Author , '' ,Title ) from Books ;
/*# concat(Author , '' ,Title )
Paulo CoelhoThe Alchemist
James ClearAtomic Habits
Robert MartinClean Code
Jay ShettyThink Like a Monk
Eric MatthesPython Crash Course
*/

select Author , Title  from Books where author like '%a%'  ;
/*# Author	Title
Paulo Coelho	The Alchemist
James Clear	Atomic Habits
Robert Martin	Clean Code
Jay Shetty	Think Like a Monk
Eric Matthes	Python Crash Course
*/

select Title , year(PublishDate) from Books   ;
/*# Title	year(PublishDate)
The Alchemist	2010
Atomic Habits	2018
Clean Code	2008
Think Like a Monk	2020
Python Crash Course	2019
*/

select monthName(JoinDate) from Customers ;
/*# monthName(JoinDate)
February
July
January
November
*/

select Name , JoinDate from Customers where year(JoinDate) = 2021 ;
/*# Name	JoinDate
Arjun Rao	2021-02-10
*/

select OrderID, dayname(OrderDate) from Orders ;
/*# OrderID	dayname(OrderDate)
301	Saturday
302	Sunday
303	Friday
304	Friday
305	Thursday
*/

select Title ,PublishDate,  year(curdate()) - year(PublishDate)  from Books ;
/*# Title	year(curdate()) - year(PublishDate)
The Alchemist	15
Atomic Habits	7
Clean Code	17
Think Like a Monk	5
Python Crash Course	6
*/

select Name ,JoinDate, datediff(curdate() , JoinDate) from Customers ;
/*# Name	JoinDate	datediff(curdate() , JoinDate)
Arjun Rao	2021-02-10	1680
Priya Nair	2020-07-25	1880
John Smith	2022-01-14	1342
Maria Lopez	2019-11-30	2118
*/

SELECT * FROM Orders WHERE MONTH(OrderDate) = 12;
/*# OrderID	CustID	BookID	OrderDate	Quantity
304	204	104	2020-12-25	1*/


select count(BookID) as 'numberofbook' from Books ;
/*# numberofbook
5
*/

select avg(Price) as 'AveragePrice' from Books ;
/*# AveragePrice
450.000000
*/

select max(Price) as 'maxprice', min(Price) as 'minprice' from Books ;
/*# maxprice	minprice
550.00	350.00
*/

-- 19. Count how many customers joined after 2020.
select Name ,JoinDate  from Customers where year(JoinDate) = 2020 ;
/*# Name	JoinDate
Priya Nair	2020-07-25
*/

-- 20. Find the total number of books ordered (all orders combined).
select count(BookID) as 'numorder' from Orders ;
/*# numorder
5
*/

-- 21. Show the total quantity of books ordered per customer.
SELECT 
    CustID,
    SUM(Quantity) AS TotalQuantityOrdered
FROM Orders
GROUP BY CustID;
/*# CustID	TotalQuantityOrdered
201	3
202	1
203	3
204	1
*/

SELECT BookID, AVG(Quantity) AS AverageQuantity
FROM Orders
GROUP BY BookID;
/*# BookID	AverageQuantity
101	1.0000
102	2.0000
103	1.0000
104	1.0000
105	3.0000
*/


SELECT BookID, SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY BookID
ORDER BY TotalQuantity DESC
LIMIT 1;
/*# BookID	TotalQuantity
105	3
*/


-- . Show the total revenue generated per book (Price × Quantity).

SELECT 
    B.BookID,
    B.Title,
    SUM(B.Price * O.Quantity) AS TotalRevenue
FROM Orders O
JOIN Books B ON O.BookID = B.BookID
GROUP BY B.BookID, B.Title;
/*# BookID	Title	TotalRevenue
102	Atomic Habits	900.00
101	The Alchemist	350.00
105	Python Crash Course	1500.00
104	Think Like a Monk	400.00
103	Clean Code	550.00
*/

SELECT 
    YEAR(OrderDate) AS OrderYear,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;
/*# OrderYear	TotalOrders
2020	1
2021	2
2022	2*/
Tutorial_4.sql
Displaying Tutorial_4.sql.
tutorial 4
B.R Sharath Shetty
•
Sep 17
100 points
Dear students
    implement the SQL functions on the given database and submit the tutorial by en

tut4.docx
Microsoft Word
Class comments
Your
