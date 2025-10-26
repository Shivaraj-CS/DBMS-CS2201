-- Lab Experiment 01: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: Shivaraj
-- USN: 1RUA24BCA0083
-- SECTION: BCA

SELECT USER(),
       @@hostname AS Host_Name,
       VERSION() AS MySQL_Version,
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- 'root@localhost', 'RVU-PC-033', '8.4.6', '2025-08-25 07:13:44'

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:
create database College_Student_Management_System;
use College_Student_Management_System;

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty (FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:

create table Departments (
DepartmentID varchar(10) Primary Key,
DepartmentName varchar(10) ,
HOD varchar(10),
ContactEmail varchar(15) UNIQUE,
PhoneNumber int,
Location varchar(25)
);

DESC Departments;
-- OUTPUT :
/* 'DepartmentID', 'varchar(10)', 'NO', 'PRI', NULL, ''
'DepartmentName', 'varchar(10)', 'YES', '', NULL, ''
'HOD', 'varchar(10)', 'YES', '', NULL, ''
'ContactEmail', 'varchar(15)', 'YES', 'UNI', NULL, ''
'PhoneNumber', 'int', 'YES', '', NULL, ''
'Location', 'varchar(25)', 'YES', '', NULL, ''
*/

-- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
create table Course (
CourseID int Primary Key,
CourseName varchar(10),
Credits int,
DepartmentID varchar(10),
Duration int,
Fee int,
Foreign Key (DepartmentID) references Departments(DepartmentID)
);

DESC Course;
-- OUTPUT :
/*  'CourseID', 'int', 'NO', 'PRI', NULL, ''
'CourseName', 'varchar(10)', 'YES', '', NULL, ''
'Credits', 'int', 'YES', '', NULL, ''
'DepartmentID', 'varchar(10)', 'YES', 'MUL', NULL, ''
'Duration', 'int', 'YES', '', NULL, ''
'Fee', 'int', 'YES', '', NULL, ''
*/

-- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
create table Students (
StudentID int Primary Key,
FirstName varchar(15),
LastName varchar(15),
Email varchar(15) UNIQUE,
DateOfBirth date,
CourseID int,
Foreign Key (CourseID) references Course(CourseID)
);

DESC Students;
-- OUTPUT :
/*  'StudentID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(15)', 'YES', '', NULL, ''
'LastName', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(15)', 'YES', 'UNI', NULL, ''
'DateOfBirth', 'date', 'YES', '', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
*/

-- Table 04: Faculty (FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
create table Faculty (
FacultyID int Primary Key,
FacultyName varchar(15),
DepartmentID varchar(10),
Qualification varchar(15),
Email varchar(15) UNIQUE,
PhoneNumber int,
Foreign Key (DepartmentID) references Departments(DepartmentID)
);

DESC Faculty;
-- OUTPUT :
/*  'FacultyID', 'int', 'NO', 'PRI', NULL, ''
'FacultyName', 'varchar(15)', 'YES', '', NULL, ''
'DepartmentID', 'varchar(10)', 'YES', 'MUL', NULL, ''
'Qualification', 'varchar(15)', 'YES', '', NULL, ''
'Email', 'varchar(15)', 'YES', 'UNI', NULL, ''
'PhoneNumber', 'int', 'YES', '', NULL, ''
*/

-- Table 05: Enrollments (EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
create table Enrollments (
EnrollmentID INT PRIMARY KEY,
StudentID INT,
CourseID INT,
Semester VARCHAR(10),
Year INT,
Grade CHAR(2),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
DESC Enrollments;
-- OUTPUT :
/*  'EnrollmentID', 'int', 'NO', 'PRI', NULL, ''
'StudentID', 'int', 'YES', 'MUL', NULL, ''
'CourseID', 'int', 'YES', 'MUL', NULL, ''
'Semester', 'varchar(10)', 'YES', '', NULL, ''
'Year', 'int', 'YES', '', NULL, ''
'Grade', 'char(2)', 'YES', '', NULL, ''
*/
 
-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code


--  describe the structure of each table and copy paste the Output

DESCRIBE Departments;
DESCRIBE Course;
DESCRIBE Students;
DESCRIBE Faculty;
DESCRIBE Enrollments;

-- OUTPUT :
/*   Field Type Null Key Default Extra
DepartmentID varchar(10) NO PRI
DepartmentName varchar(10) YES
HOD varchar(10) YES
ContactEmail varchar(15) YES UNI
PhoneNumber int YES
Location varchar(25) YES
   
    Field Type Null Key Default Extra
CourseID int NO PRI
CourseName varchar(10) YES
Credits int YES
DepartmentID varchar(10) YES MUL
Duration int YES
Fee int YES
   
    Field Type Null Key Default Extra
StudentID int NO PRI
FirstName varchar(15) YES
LastName varchar(15) YES
Email varchar(15) YES UNI
DateOfBirth date YES
CourseID int YES MUL
   
    Field Type Null Key Default Extra
FacultyID int NO PRI
FacultyName varchar(15) YES
DepartmentID varchar(10) YES MUL
Qualification varchar(15) YES
Email varchar(15) YES UNI
PhoneNumber int YES
   
    */

-- Perform the following operations on the each of the tables
-- 01: add 2 new columns for each table
-- 02: Modify the existing column from each table
-- 03 change the datatypes
-- 04: Rename a column
-- 05: Drop a column
-- 06: Rename the table
-- 07: describe the structure of the new table

/*  Additional set of questions
--1 Add a new column Address (VARCHAR(100)) to the Students table.
--2 Add a column Gender (CHAR(1)) to the Students table.
--3 Add a column JoiningDate (DATE) to the Faculty table.
--4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
--5 Modify the column Location in the Departments table to VARCHAR(80).
--6 Rename the column Qualification in the Faculty table to Degree.
--7 Rename the table Faculty to Teachers.
--8 Drop the column PhoneNumber from the Departments table.
--9 Drop the column Email from the Students table.
--10 Drop the column Duration from the Courses table.
*/

-- 01: add 2 new columns for each table
ALTER TABLE Departments ADD COLUMN EstablishedYear YEAR, ADD COLUMN Website VARCHAR(15);
ALTER TABLE Course ADD COLUMN CourseType VARCHAR(30), ADD COLUMN Mode VARCHAR(20);
ALTER TABLE Students ADD COLUMN Address VARCHAR(30), ADD COLUMN Gender CHAR(1);
ALTER TABLE Faculty ADD COLUMN JoiningDate DATE, ADD COLUMN Salary DECIMAL(10,2);
ALTER TABLE Enrollments ADD COLUMN Status VARCHAR(20), ADD COLUMN Remarks VARCHAR(100);

-- 02: Modify the existing column from each table
ALTER TABLE Departments MODIFY COLUMN DepartmentName VARCHAR(50);
ALTER TABLE Course MODIFY COLUMN CourseName VARCHAR(50);
ALTER TABLE Students MODIFY COLUMN FirstName VARCHAR(50);
ALTER TABLE Faculty MODIFY COLUMN FacultyName VARCHAR(50);
ALTER TABLE Enrollments MODIFY COLUMN Grade VARCHAR(5);

-- 03 change the datatypes
ALTER TABLE Departments MODIFY COLUMN PhoneNumber VARCHAR(20);
ALTER TABLE Course MODIFY COLUMN Fee DECIMAL(12,2);
ALTER TABLE Students MODIFY COLUMN Email VARCHAR(100);
ALTER TABLE Faculty MODIFY COLUMN Qualification VARCHAR(80);
ALTER TABLE Enrollments MODIFY COLUMN Year YEAR;

-- 04: Rename a column
ALTER TABLE Departments CHANGE COLUMN HOD HeadOfDepartment VARCHAR(50);
ALTER TABLE Course CHANGE COLUMN Duration Course_Duration INT;
ALTER TABLE Students CHANGE COLUMN DateOfBirth DOB DATE;
ALTER TABLE Faculty CHANGE COLUMN Qualification Degree VARCHAR(50);
ALTER TABLE Enrollments CHANGE COLUMN Remarks Notes VARCHAR(50);

-- 05: Drop a column
ALTER TABLE Departments DROP COLUMN PhoneNumber;
ALTER TABLE Course DROP COLUMN Course_Duration;
ALTER TABLE Students DROP COLUMN Email;
ALTER TABLE Faculty DROP COLUMN PhoneNumber;
ALTER TABLE Enrollments DROP COLUMN Status;

-- 06: Rename the table
RENAME TABLE Faculty TO Teachers;

-- 07: describe the structure of the new table
DESCRIBE Departments;
-- OUTPUT:
/*   Field Type Null Key Default Extra
DepartmentID varchar(10) NO PRI
DepartmentName varchar(50) YES
HeadOfDepartment varchar(50) YES
ContactEmail varchar(15) YES UNI
Location varchar(25) YES
EstablishedYear year YES
Website varchar(15) YES
    */
DESCRIBE Course;
-- OUTPUT:
/*   Field Type Null Key Default Extra
CourseID int NO PRI
CourseName varchar(50) YES
Credits int YES
DepartmentID varchar(10) YES MUL
Fee decimal(12,2) YES
CourseType varchar(30) YES
Mode varchar(20) YES
    */
DESCRIBE Students;
-- OUTPUT:
/*   Field Type Null Key Default Extra
StudentID int NO PRI
FirstName varchar(50) YES
LastName varchar(15) YES
DOB date YES
CourseID int YES MUL
Address varchar(30) YES
Gender char(1) YES
    */
DESCRIBE Teachers;
-- OUTPUT:
/*   Field Type Null Key Default Extra
StudentID int NO PRI
FirstName varchar(50) YES
LastName varchar(15) YES
DOB date YES
CourseID int YES MUL
Address varchar(30) YES
Gender char(1) YES
    */
DESCRIBE Enrollments;
-- OUTPUT:
/*   Field Type Null Key Default Extra
EnrollmentID int NO PRI
StudentID int YES MUL
CourseID int YES MUL
Semester varchar(10) YES
Year year YES
Grade varchar(5) YES
Notes varchar(50) YES
    */



SHOW TABLES; -- Before dropping the table
-- OUTPUT:
/*   Tables_in_college_student_management_system
course
departments
enrollments
students
teachers*/


-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
ALTER TABLE students DROP FOREIGN KEY students_ibfk_1;
DROP TABLE Course;
DROP TABLE Enrollments;


SHOW TABLES; -- After dropping the table Enrollement and Course
-- OUTPUT:
/*   Tables_in_college_student_management_system
departments
students
teachers
    */


-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01
