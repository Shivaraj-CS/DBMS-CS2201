*1. School Database (Example Tables) 
(StudentID, FirstName, LastName, DOB, Class, Marks, City)
(TeacherID, FirstName, LastName, Subject, HireDate, Salary)
(CourseID, CourseName, Credits)
(EnrollID, StudentID, CourseID, Grade)
2. Declare the keys as per requirement
3.   Perform the below SQL functions on the Student database. 
      1.Display the details  of all students.
      2. Show the  last 3 characters of course names.
      -- 3. Concatenate FirstName and LastName of teachers as fullname
      -- 4. Find the length of each student’s name.
      -- 5.Replace the word "Maths" with "Mathematics" in the Course table. (use REPLACE function)
      -- 6.Find the absolute difference between maximum and minimum marks.
      -- 7. Round off teachers’ salaries to the nearest thousand.
      -- 8.Show the square root of each course credit.
      -- 9. Display students’ marks along with ceiling and floor values. 
	  -- 10. Find the modulus of total marks divided by 5.
      -- 11. Display the current date and time.
      -- 12.Show the year and month of hire for all teachers. 
      -- 13. List students who were born in January. 
      -- 14. Find the difference in days between today and a teacher’s HireDate. 
      -- 15. Find the total number of students in the school. 
      -- 16. Calculate the average salary of teachers.
      -- 17. Find the highest and lowest marks in the Student table*/
      
Create database School_3 ;
use school_3 ;
      
create table student 
(studentID varchar (20) primary key ,
FirstName varchar (20) ,
LastName varchar (20) ,
 DOB varchar (20) ,
 Class varchar (20) ,
 Marks int ,
 City varchar (20) ) ;
 
 DESC student ;
 
 create table Teacher
 (TeacherID varchar(20) primary key ,
 FirstName varchar (20) ,
 LastName  varchar (20) ,
 Subject   varchar (20) ,
 HireDate  varchar (20) ,
 Salary    varchar (20)  );

DESC Teacher ;


Drop table course ;

create table  course
(CourseID varchar (20) primary key ,
 CourseName varchar (20) ,
 Credits int );
 
 DESC course ;
  
create table Enrollment 
( EnrollID varchar (20) primary key,
studentID varchar (20) ,
courseID varchar(20) ,
Grade varchar (20) ,
foreign key (studentID) References  student(studentID) , 
foreign key ( CourseID ) References course(CourseID) );

DESC Enrollment ;

insert into student (StudentID, FirstName, LastName, DOB, Class, Marks, City)
value('S001', 'Harsha', 'M', '2002-05-10', '10A', 450, 'Hyderabad'),
('S002', 'Anjali', 'R', '2003-07-14', '10B', 480, 'Chennai'),
('S003', 'Rohit', 'K', '2002-11-22', '10A', 430, 'Bangalore'),
('S004', 'Sneha', 'P', '2003-01-18', '10C', 470, 'Mumbai'),
('S005', 'Vikram', 'S', '2002-09-05', '10B', 490, 'Delhi');

select * from student ;


insert into Teacher (TeacherID, FirstName, LastName, Subject, HireDate, Salary)
value ('T001', 'Ramesh', 'Kumar', 'Mathematics', '2018-06-01', '45000'),
('T002', 'Meena', 'Sharma', 'Science', '2019-07-15', '42000'),
('T003', 'Arun', 'Verma', 'English', '2017-03-12', '47000'),
('T004', 'Priya', 'Singh', 'Computer', '2020-11-25', '40000'),
('T005', 'Kiran', 'Nair', 'History', '2016-01-05', '46000');

select * from Teacher ;


insert into Course (CourseID, CourseName, Credits) VALUES
('C101', 'Database Systems', 4),
('C102', 'Computer Networks', 3),
('C103', 'Operating Systems', 4),
('C104', 'Data Structures', 3),
('C105', 'Software Engineering', 4);

select * from course  ;


insert into Enrollment (EnrollID, studentID, courseID, Grade) VALUES
('E001', 'S001', 'C101', 'A'),
('E002', 'S002', 'C103', 'B+'),
('E003', 'S003', 'C102', 'A-'),
('E004', 'S004', 'C105', 'B'),
('E005', 'S005', 'C104', 'A');
 ;

select * from Enrollment ;

-- Show the  last 3 characters of course names.

SELECT CourseName, RIGHT(CourseName, 3) AS Last3Chars FROM Course;
/*# CourseName	Last3Chars
Database Systems	ems
Computer Networks	rks
Operating Systems	ems
Data Structures	res
Software Engineering	ing*/

-- 3. Concatenate FirstName and LastName of teachers as fullname
select concat(FirstName, '' ,LastName) as Fullname from Teacher;
/*# Fullname
RameshKumar
MeenaSharma
ArunVerma
PriyaSingh
KiranNair*/

-- 4. Find the length of each student’s name.
select concat(FirstName,'' ,LastName) as studentname From student ;
select length(concat(FirstName,'' ,LastName)) as length_of_studentname from student ;

/*# length_of_studentname
7
7
6
6
7 */


-- 5.Replace the word "Maths" with "Mathematics" in the Course table. (use REPLACE function)
select Replace(CourseName , 'Database Systems' , 'DBMS') as updated_name from course ;
/*# updated_name
DBMS
Computer Networks
Operating Systems
Data Structures
Software Engineering*/

-- 6.Find the absolute difference between maximum and minimum marks.
select abs(max(Marks)-min(Marks)) as absolute_Marks from student ;
/*# absolute_Marks
60*/

-- 7. Round off teachers’ salaries to the nearest thousand.
select round(Salary ,-3 ) as salarys from Teacher ;



-- 8.Show the square root of each course credit.
SELECT SQRT(Credits) AS SqrtCredits FROM Course;

/*# SqrtCredits
2
1.7320508075688772
2
1.7320508075688772
2 */


-- 9. Display students’ marks along with ceiling and floor values. 
      select ceil(Marks) as new_marks ,floor(Marks) as New_marks from student ;
     /* # new_marks	New_marks
450	450
480	480
430	430
470	470
490	490 */

-- 10. Find the modulus of total marks divided by 5.
 select sum(Marks) as module_marks from student where Marks % 5 ;

-- 11. Display the current date and time.
select now() as currentdate;
/*# currentdate
2025-09-10 18:52:28 */

-- 12.Show the year and month of hire for all teachers. 
select month(Hiredate) as Hiremonth ,year(Hiredate) as Hiremyear from Teacher ;
/*# Hiremonth	Hiremyear
6	2018
7	2019
3	2017
11	2020
1	2016 */

-- 13. List students who were born in January. 


-- 14. Find the difference in days between today and a teacher’s HireDate. 
      
-- 15. Find the total number of students in the school.
select count(*) as total_student from student ;
/*# total_student
5*/

-- 16. Calculate the average salary of teachers.
select avg(Salary) as average_salary from Teacher ;
/*# average_salary
44000*/

      
      -- 17. Find the highest and lowest marks in the Student table
      select max(Marks) as max_marks ,min(Marks) as min_marks from student ;
/*# max_marks	min_marks
490	430*/
