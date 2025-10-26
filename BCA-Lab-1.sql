-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: Shivaraj
-- USN: 1RVU24BCA0083
-- SECTION: A

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- 06:28:30	SELECT USER(),         @@hostname AS Host_Name,         VERSION() AS MySQL_Version,         NOW() AS Current_Date_Time LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec


-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespa

Create database DBLab001;
use DBLab001;

-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:

Create table students
( StudentID  varchar(50) Primary Key,
  Firstname varchar (15),
  Lastname varchar (15),
  Email varchar (20) Unique,
  DateofBirth varchar (25) 
  );

DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code
-- 06:26:35	DESC STUDENTS	5 row(s) returned	0.031 sec / 0.000 sec


-- Alter the table and 2 new columns
Alter table students add(gender varchar(20) , age int );
DESC students;

-- Modify a column data type
Alter  table students modify Email varchar(20) ;
DESC students;

-- Rename a column
Alter table students Rename column gender to sex;
DESC students;

-- Drop a column
Alter table students Drop column Email ;

-- Rename the table
Alter table students RENAME TO studentsDetails;
DESC studentsDetails;


-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:

Create table Courses
(CoursesID varchar (20),
CoursesName varchar (25),
Cridits int );

DESC Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :07:03:28	DESC Courses	3 row(s) returned	0.000 sec / 0.000 sec


-- Alter the table and 2 new columns
Alter table Courses add( semster varchar(20), Duration varchar(15) );
desc Courses;

-- Modify a column data type
Alter table Courses modify Duration varchar(10);
desc Courses;

-- Rename a column
Alter table Courses RENAME Column Duration to DepartmentId ;
desc Courses;

-- Drop a column
Alter table Courses Drop column DepartmentId ;
desc Courses;

-- Rename the table
Alter table Courses RENAME TO CoursesDetails;
desc Courses;

-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
create table Enrollments
( EnrollmentID varchar(20) Primary Key,
StudentId varchar(20) ,
CoursesID varchar(20),
date date); 
DESC Enrollments; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :

-- Alter the table and 2 new columns
Alter table Enrollments add(teacherID  varchar(20), teachername varchar(15) );
desc Enrollments;

-- Modify a column data type
Alter table Enrollments  modify Date varchar(10);
desc Enrollments;

-- Rename a column
Alter table Enrollments  RENAME Column date to CollageID ;
desc Enrollments;


-- Drop a column
Alter table Enrollments  Drop Column  CollageID ;
desc Enrollments;

-- Rename the table
Alter table Enrollments  RENAME TO EnrollmentsDetails;
desc Enrollments;

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:
create table students
(Name varchar(15),
Age int,
email varchar(15),
address varchar(15)
);

Alter table students
add Phonenumber varchar(15);

desc students;
DESC STUDENTS; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]

-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:
CREATE TABLE courses (
  courseID VARCHAR(15)  PRIMARY KEY,
  coursename VARCHAR(50),
  credits INT
);

desc courses;

alter table courses
modify credits decimal(8,2);

desc courses;
-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table if exists Enrollements;
drop table if exists courses; 

drop table Enrollements;

SHOW TABLES; -- After dropping the table Enrollement and Course

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
