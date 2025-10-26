- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: HARSHA M
-- USN: 1RUA24BCA0030
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- root@localhost	RVU-PC-033	8.4.6	2025-09-08 06:03:50


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate
Create database Lab004 ;
use Lab004   ;

Create table Employee 
( EmpID varchar(20) primary key,
  FirstName varchar(20) ,
  LastName varchar(25) ,
  Salary varchar(20) ,
  BirthDate date ,
  HireDate date ) ;
  
   DESC Employee ;
   Alter table Employee add HireDate varchar(20)  ;
   Alter table Employee modify BirthDate varchar(20)  ;
   Alter table Employee modify HireDate varchar(20) ;
   Alter table Employee modify EmpID varchar(20) PRIMARY KEY  ;
   DESC Employee ;
-- 2. Insert 10 records to employee;

insert into Employee (EmpID ,FirstName,LastName, Salary, BirthDate, HireDate) 
values (100, 'John', 'Doe', 60000.00, '1985-01-15', '2010-06-01'),
(102, 'Jane', 'Smith', 65000.00, '1987-03-22', '2012-09-15'),
(103, 'Michael', 'Brown', 70000.00, '1990-07-30', '2015-01-20'),
(104, 'Emily', 'Davis', 62000.00, '1988-11-10', '2013-05-12'),
(105, 'David', 'Wilson', 58000.00, '1984-02-27', '2009-11-08'),
(106, 'Sarah', 'Johnson', 72000.00, '1992-06-18', '2016-08-25'),
(107, 'Chris', 'Lee', 67000.00, '1989-12-05', '2014-03-30'),
(108, 'Amanda', 'Taylor', 64000.00, '1986-09-14', '2011-07-19'),
(109, 'James', 'Martin', 59000.00, '1983-04-01', '2008-12-10'),
(110, 'Jessica', 'Moore', 71000.00, '1991-10-21', '2017-02-28');
select * from Employee ;

-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    EmpID varchar (20),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

 

-- 4. Insert 10 records to Orders

insert into Orders (OrderID, OrderDate, TotalAmount, EmpID) 
values(1, '2023-01-15', 1500.00, 100),
(2, '2023-02-10', 2300.00, 102),
(3, '2023-03-05', 1800.00, 103),
(4, '2023-04-18', 2200.00,104),
(5, '2023-05-22', 1950.00, 105),
(6, '2023-06-30', 2500.00, 106),
(7, '2023-07-12', 2100.00, 107),
(8, '2023-08-09', 1700.00, 108),
(9, '2023-09-15', 1600.00, 109),
(10, '2023-10-01', 2400.00, 110);

select * from Orders ;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
select * from Employee ;

select * from Orders ;


-- Output: 
select * from Employee ;
# EmpID	FirstName	LastName	Salary	BirthDate	HireDate
# EmpID	FirstName	LastName	Salary	BirthDate	HireDate
-- 100	John	Doe	60000.00	1985-01-15	2010-06-01
-- 102	Jane	Smith	65000.00	1987-03-22	2012-09-15
-- 103	Michael	Brown	70000.00	1990-07-30	2015-01-20
-- 104	Emily	Davis	62000.00	1988-11-10	2013-05-12
-- 105	David	Wilson	58000.00	1984-02-27	2009-11-08
-- 106	Sarah	Johnson	72000.00	1992-06-18	2016-08-25
-- 107	Chris	Lee	67000.00	1989-12-05	2014-03-30
-- 108	Amanda	Taylor	64000.00	1986-09-14	2011-07-19
-- 109	James	Martin	59000.00	1983-04-01	2008-12-10
-- 110	Jessica	Moore	71000.00	1991-10-21	2017-02-28

select * from Orders ;
# OrderID	OrderDate	TotalAmount	EmpID
-- 1	2023-01-15	1500.00	100
-- 2	2023-02-10	2300.00	102
-- 3	2023-03-05	1800.00	103
-- 4	2023-04-18	2200.00	104
-- 5	2023-05-22	1950.00	105
-- 6	2023-06-30	2500.00	106
-- 7	2023-07-12	2100.00	107
-- 8	2023-08-09	1700.00	108
-- 9	2023-09-15	1600.00	109
-- 10	2023-10-01	2400.00	110


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
select round(salary) As "Roundsalary" from Employee ;


-- Output: 
# Roundsalary
/*60000
65000
70000
62000
58000
72000
67000
64000
59000
71000*/

/* b. Absolute Values: Show absolute values of salaries */
select ABS(salary) As "Absolutesalary" From Employee;
-- Output: 
# Absolutesalary
/*60000
65000
70000
62000
58000
72000
67000
64000
59000
71000*/

/* c. Ceiling Values: Get ceiling values of order amounts */
select ceil(TotalAmount) As "newAmount" from Orders ;
-- Output: 
# newAmount
/*1500
2300
1800
2200
1950
2500
2100
1700
1600
2400*/

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
select count(*) As "Number_of_Employee" from Employee ;
-- Output: 
# Number_of_Employee
/* 10 */

/* b. Sum of Salaries: Calculate total salary expense */
select sum(salary) As "Totalsalary" from Employee ;
-- Output: 
# Totalsalary
/* 648000 */

/* c. Average Order Amount: Find average order value */
select avg(Totalamount) As "avgOrder" from Orders ;
-- Output: 
# avgOrder
/* 2005.000000 */

/* d. Max/Min Salary: Find highest and lowest salaries */
select max(salary) As "Higestsalary" ,  min(salary) As "lowestsalary" from Employee ; 
-- Output: 
# Higestsalary	lowestsalary
/* 72000.00	,58000.00 */

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */

SELECT EmpID, 
       FIRSTNAME, 
       UPPER(FirstName) AS FIRSTNAME_UPPER, 
       LOWER(LastName) AS FIRSTNAME_LOWER,
       LASTNAME,
       UPPER(FirstName) AS LASTNAME_UPPER,
       LOWER(LastName) AS LASTNAME_LOWER
FROM Employee;

-- Output: 
# EmpID	FIRSTNAME	FIRSTNAME_UPPER	FIRSTNAME_LOWER	LASTNAME	LASTNAME_UPPER	LASTNAME_LOWER
/*100	John	JOHN	doe	Doe	JOHN	doe
102	Jane	JANE	smith	Smith	JANE	smith
103	Michael	MICHAEL	brown	Brown	MICHAEL	brown
104	Emily	EMILY	davis	Davis	EMILY	davis
105	David	DAVID	wilson	Wilson	DAVID	wilson
106	Sarah	SARAH	johnson	Johnson	SARAH	johnson
107	Chris	CHRIS	lee	Lee	CHRIS	lee
108	Amanda	AMANDA	taylor	Taylor	AMANDA	taylor
109	James	JAMES	martin	Martin	JAMES	martin
110	Jessica	JESSICA	moore	Moore	JESSICA	moore */




/* b. Concatenate Names: Create full names */
SELECT EmpID, 
       FirstName, 
       LastName,
       CONCAT(FirstName, ' ', LastName) AS FULL_NAME
FROM Employee;
-- Output: 
# EmpID	FirstName	LastName	FULL_NAME
/*100	John	Doe	John Doe
102	Jane	Smith	Jane Smith
103	Michael	Brown	Michael Brown
104	Emily	Davis	Emily Davis
105	David	Wilson	David Wilson
106	Sarah	Johnson	Sarah Johnson
107	Chris	Lee	Chris Lee
108	Amanda	Taylor	Amanda Taylor
109	James	Martin	James Martin
110	Jessica	Moore	Jessica Moore*/

/* c. Extract Substring: Get first 3 characters of first names */
SELECT EmpID, 
       FistName, 
       SUBSTRING(FirstName, 1, 3) AS "FIRSTNAME_SUBSTR"
FROM Employee;

-- Output: 

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
SELECT 
    STR_TO_DATE('2025-09-11', '%Y-%m-%d') AS Converted_Date;
-- Output: 

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */

    
      SELECT DATE_FORMAT(HireDate, '%d-%m-%Y') AS Date_As_String
FROM Employee;
-- Output: 

/* b. Extract Year: Get year from order dates */
SELECT ORDERID, ORDERDATE, YEAR(ORDERDATE) AS Order_Year
FROM ORDERS;
-- Output: 

/* c. Add Months: Add 3 months to order dates */
SELECT ORDERID, ORDERDATE, DATE_ADD(ORDERDATE, INTERVAL 3 MONTH) AS OrderDate_Plus_3Months
FROM ORDERS;

-- Output: 

/* d. Days Since Order: Calculate days between order date and now */
-- Output: 
SELECT ORDERID, ORDERDATE, DATEDIFF(NOW(), ORDERDATE) AS Days_Since_Order
FROM ORDERS;
-- END of the Task -- 
Lab Exp03.sql
Displaying Lab Exp03.sql.
Lab Exp 3
B.R Sharath Shetty
•
Sep 8
Due Sep 8
Dear Students 
    Complete the assignment and upload the sql file in GCR by the end of the day. All the tasks have to be completed.

Lab 03StdCopy.sql
SQL
Class comments
