create database class;
use class;

create table Department(
dept_id int primary key, dept_name varchar(10),location varchar(50));

create table Employee(
emp_id int primary key,emp_name varchar(10),age int,salary int,designation varchar(10),address varchar(50),joining_date date,dept_id int,
foreign key (dept_id) references Department(dept_id));

insert into Department values
(1,"SOCSE","F_Block"),
(2,"SOB","B_Block"),
(3,"SOLAS","C_Block"),
(4,"SDI","D_Block");

insert into Employee values
(101,"Nandan J",20,50000,"Manager","Deepanjali Nagar","2025-07-20",1),
(102,"Harshitha H",18,10000,"Junior Developer","Bidadi","2025-03-12",3),
(103,"Yashwanth P V",18,30000,"Junior Developer ","Koramangala","2025-03-13",3),
(104,"Pruthvi",19,20000,"Senior Developer ","Vijayanagar","2025-03-19",2),
(105,"Sharon Arlin",20,50000,"MD","Kammanahalli","2025-04-20",3),
(106,"Shishir",18,20000,"Intern","Pattanagere","2025-05-20",4),
(107,"Neha Kiran",21,70000,"Senior Developer","Basaveshwar nagar","2024-08-23",4);

select * from Employee;
-- Output:
# emp_id, emp_name, age, salary, designation, address, joining_date, dept_id
-- '101', 'Nandan J', '20', '50000', 'Manager', 'Deepanjali Nagar', '2025-07-20', '1'
-- '102', 'Harshitha H', '18', '10000', 'Junior Developer', 'Bidadi', '2025-03-12', '3'
-- '103', 'Yashwanth P V', '18', '30000', 'Junior Developer ', 'Koramangala', '2025-03-13', '3'
-- '104', 'Pruthvi', '19', '20000', 'Senior Developer ', 'Vijayanagar', '2025-03-19', '2'
-- '105', 'Sharon Arlin', '20', '50000', 'MD', 'Kammanahalli', '2025-04-20', '3'
-- '106', 'Shishir', '18', '20000', 'Intern', 'Pattanagere', '2025-05-20', '4'
-- '107', 'Neha Kiran', '21', '70000', 'Senior Developer', 'Basaveshwar nagar', '2024-08-23', '4'

-- Salary Increment for developers

update Employee set salary=salary+5000 where designation like "%developer%";

-- 4
select
dept_id,
count(*)as total_employees,
avg(salary) as average_salary,
max(salary) as highest_salary,
min(salary) as lowest_salary from Employee group by dept_id;
-- Output:
# dept_id, total_employees, average_salary, highest_salary, lowest_salary
-- '1', '1', '50000.0000', '50000', '50000'
-- '2', '1', '25000.0000', '25000', '25000'
-- '3', '3', '33333.3333', '50000', '15000'
-- '4', '2', '47500.0000', '75000', '20000'

-- 5
select 
upper(emp_name) as uppercase_name,upper(designation) as uppercase_job,
concat(emp_name," works as ",designation) as info from Employee;
-- Output:
# uppercase_name, uppercase_job, info
-- 'NANDAN J', 'MANAGER', 'Nandan J works as Manager'
-- 'HARSHITHA H', 'JUNIOR DEVELOPER', 'Harshitha H works as Junior Developer'
-- 'YASHWANTH P V', 'JUNIOR DEVELOPER ', 'Yashwanth P V works as Junior Developer '
-- 'PRUTHVI', 'SENIOR DEVELOPER ', 'Pruthvi works as Senior Developer '
-- 'SHARON ARLIN', 'MD', 'Sharon Arlin works as MD'
-- 'SHISHIR', 'INTERN', 'Shishir works as Intern'
-- 'NEHA KIRAN', 'SENIOR DEVELOPER', 'Neha Kiran works as Senior Developer'


-- 6
select 
  emp_name,
  year(joining_date) as joining_year,
  timestampdiff(year, joining_date , curdate()) as years_worked
from employee;

-- Output:
# emp_name, joining_year, years_worked
-- 'Nandan J', 2025, '0'
-- 'Harshitha H', 2025, '0'
-- 'Yashwanth P V', 2025, '0'
-- 'Pruthvi', 2025, '0'
-- 'Sharon Arlin', 2025, '0'
-- 'Shishir', 2025, '0'
-- 'Neha Kiran', 2024, '1'

-- 7
select emp_name,salary from Employee where salary>40000 and salary<80000 and designation not like "%Sales%";
-- Output:
# emp_name, salary
-- 'Nandan J', '50000'
-- 'Sharon Arlin', '50000'
-- 'Neha Kiran', '75000' 

-- 8
select emp_name,designation,dept_name,location from Employee e
inner join department d on e.dept_id = d.dept_id;
-- output
# emp_name, designation, dept_name, location
-- 'Nandan J', 'Manager', 'SOCSE', 'F_Block'
-- 'Pruthvi', 'Senior Developer ', 'SOB', 'B_Block'
-- 'Harshitha H', 'Junior Developer', 'SOLAS', 'C_Block'
-- 'Yashwanth P V', 'Junior Developer ', 'SOLAS', 'C_Block'
-- 'Sharon Arlin', 'MD', 'SOLAS', 'C_Block'
-- 'Shishir', 'Intern', 'SDI', 'D_Block'
-- 'Neha Kiran', 'Senior Developer', 'SDI', 'D_Block'

-- 9
select 
  emp_name,
  dept_name
from employee e
left join department d on e.dept_id = d.dept_id;

-- 10
select 
  dept_name,
  emp_name
from employee e
right join department d on e.dept_id = d.dept_id;

-- 11
delimiter //
create procedure insertemployee(
  in id int,
  in name varchar(30),
  in age int,
  in salary int,
  in job varchar(30),
  in addr varchar(50),
  in doj date,
  in dept int
)
begin
  insert into employee values (id, name, age, salary, job, addr, doj, dept);
end //
delimiter ;

call insertemployee(108, 'hemasai c', 19, 25000, 'developer', 'rr nagar', '2025-06-01', 1);

-- 12
delimiter //
create procedure updatesalary(
  in id int,
  in new_salary int
)
begin
  update employee
  set salary = new_salary
  where emp_id = id;
end //
delimiter ;

call updatesalary(103, 35000);

-- 13
delimiter //
create procedure deleteemployee(
  in id int
)
begin
  delete from employee where emp_id = id;
end //
delimiter ;

call deleteemployee(106);

-- 14
select 
  emp_name,
  dept_name,
  timestampdiff(year, joining_date, curdate()) as years_worked,
  salary + 5000 as salary_after_increment
from employee e
join department d on e.dept_id = d.dept_id
where timestampdiff(year, joining_date , curdate()) > 2;
Tutorial_5.sql
Displaying Tutorial_5.sql.
DBMS Tutorial 
B.R Sharath Shetty
•
Oct 15
Due Oct 15
Dear Students
    Complete the given scenario in workbench and submit by the end of day

SQL LAB ACTIVITY.docx
Microsoft Word
Class comments
