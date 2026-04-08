# ,-- ,single line comment
/* multi line comment
Agenda For pre interview prepration
Window in partition by , 
*/

# HCL PRACTICE CODE 

use data_1;
create table course12(
 course_id int ,
course_name varchar(30),
course_fees int
);
insert  into course12 values(23,"fsda",14),
(33,"java",16);
select * from course12;

create table student12(
student_id int ,
student_name varchar(30),
fees_date date,               
course_id varchar(30)
);
insert into student12 values(25,"harsha","2023-3-22",22),
(27,"sanika","2023-5-12",13)

select * from student12;

##scenario question give me total course name ,all no of students

select  count(s.student_id)as total_student
from student s
inner join course c on c.course_id=s.course_id
group by c.course_id;


# 2nd interview question
## There is 2 table Employee and department we need to join 2 table with common attribute and find perticular thing 

create table employee12(
emp_id int ,
emp_name varchar(30),
course_fees int
);
insert  into employee12 values(3,"amit",4),
(13,"ramesh",16);
select * from employee12;

create table department12(
dept_id int ,
dept_name varchar(30),              
dept_email varchar(20)
);
insert into department12 values(21,"harsha","name@123"),
(29,"sanika","kite@234");

select * from department12;

select d.dept_name, e.emp_id
from department d 
inner join employee e on e.emp_id=d.emp_id
where dept_name="sanika";

SELECT d.dept_name, e.emp_id
FROM department d 
INNER JOIN employee e ON e.emp_id = d.emp_id
WHERE d.dept_name = "sanika";
**************************************************************************************************************************
# datediff
datediff(End date , start date)= This will give output in form of day 
explanation: 

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
## char varchar explanation

CREATE TABLE tension(
call1 varchar(5),
call2 char(5)
);
insert into tension value("Rag", "ram")

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

/*There is scenario that in 2 table there ared pri and foreign key both so how to handle
 that situation so we can do one thing that make one key as comment then we can assign fk to pk of 2nd table */

drop database mavenmovies; 
alter table staff 
add constraint fk_staff_store FOREIGN KEY (store_id) REFERENCES store (store_id) ON DELETE RESTRICT ON UPDATE CASCADE;
describe staff ;
describe store;

ALTER TABLE staff
DROP FOREIGN KEY fk_staff_store,
DROP FOREIGN KEY fk_staff_address;
 
Alter table staff  drop foreign key fk_staff_store;

SELECT * FROM staff;
desc staff;
drop table  staff;


CREATE TABLE film (
  film_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  description TEXT DEFAULT NULL,
  release_year YEAR DEFAULT NULL,
  language_id TINYINT UNSIGNED NOT NULL,
  original_language_id TINYINT UNSIGNED DEFAULT NULL,
  rental_duration TINYINT UNSIGNED NOT NULL DEFAULT 3,
  rental_rate DECIMAL(4,2) NOT NULL DEFAULT 4.99,
  length SMALLINT UNSIGNED DEFAULT NULL,
  replacement_cost DECIMAL(5,2) NOT NULL DEFAULT 19.99,
  rating ENUM('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  special_features SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (film_id),
  KEY idx_title (title),
  KEY idx_fk_language_id (language_id),
  KEY idx_fk_original_language_id (original_language_id),
  CONSTRAINT fk_film_language FOREIGN KEY (language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_film_language_original FOREIGN KEY (original_language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

*************************************************************************************************************************
CREATE TABLE ExampleTable (
    signed_column INT,
    unsigned_column INT UNSIGNED
);
**************************************************************************************************************************
use data_1;
create table employees1(
emp_id int ,
name varchar(30),
salary int );

insert into employees1 values(23,"mina",23400),
(24,"gita",23400),
(25,"tina",12300),
(26,"min",23400),
(27,"mna",234500),
(28,"ina",23400),
(29,"mhna",23400),
(30,"mona",23400),
(31,"mipa",23400);


select *from employees;

select  max(salary) from employees limit 4; 
truncate employees;
select max(salary) from employees;

select
name ,salary,
row_number() over(partition by name order by salary ) as top_n
from employees as t;
  
select salary,date(salary) from employees ;
select concat (name, '' ,salary) from employees;
select upper(name) from employees;

SELECT CURRENT_DATE();
SELECT CURRENT_TIME();
SELECT CURRENT_TIMESTAMP();
SELECT NOW();
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS formatted_date;## Y= 2024 ,y=24

select now();
yyyy-mm-dd hh:mm:ss  
select date_format('2024-03-10' , '%m-%d-%y')
SELECT DATEDIFF('2024-03-10', '2024-03-05') AS date_difference; #excluding the start date itself.

**********************************************************************************************************************
#indexing 3 type clusture ,non clustered=create object  ,unique index

#primary key inbuild clusture included

2
5
4
6
8
2
9

use data_1;
create table employees2(
emp_id int ,
name varchar(30),
salary int );

insert into employees2 values(31,"mina",23400),
(21,"gita",23400),
(32,"tina",12300),
(26,"min",23400),
(27,"mna",234500),
(28,"ina",23400),
(50,"mhna",23400),
(10,"mona",23400),
(8,"mipa",23400);

select *from employees2

create table employees3(
emp_id int primary key,
name varchar(30),
salary int non-clustered index);

insert into employees3 values(1,"mina",23400);
(21,"gita",23400),
(32,"tina",12300),
(26,"min",23400),
(27,"mna",234500),
(28,"ina",23400),
(50,"mhna",23400),
(10,"mona",23400),
(8,"mipa",23400);
select *from employees3

create table employees4(
emp_id int ,
name varchar(30),
salary int );

insert into employees4 values(1,"mina",23400),
(21,"gita",23400),
(32,"tina",12300),
(26,"min",23400);

select *from employees4;

delete from employees4 where emp_id in(1,21,32,26);

select *from employees3;

truncate employees3
select *from employees3;
select *from employees4;

#stored procedure ,function

create procedure ABC
create function DEF
select emp_id ,ABC*salary from employees3 ;
select emp_id ,DEF*salary from employees3 ;


# cte table
create table employees23(
emp_id int ,
name varchar(30),
salary int );


WITH harsha as
(select *from employees23 where salary>10000)
select name from harsha;

## ~student marks marks 0< kum nhi 100 se jyda nhi 600 -cheak 

create table employees23(
emp_id int ,
name varchar(30),
date_sell date,
salary int );

select curdate();
create table DOP (D_P date);
insert into dop values ('2022-03-09'),
('2021-05-11');
select *from DOP2;

update dop
set d_p = date_format(d_p, '%d-%m-%Y');
select *from DOP;
 
 # sirf month 
ddd= wed, mmmm=july,mmm=jul,yy=23 ,yyyy-2023 ,"yyyy-dddd-mmmm"
date_format(date_coulmn, desired format)

2 date me differance
*************************************************************************************************************************
CREATE TABLE ExampleTable (
    signed_column INT,
    unsigned_column INT UNSIGNED
);

use data_1;
use mavenmovies;

select date_format(today(), "%y-%m-%d") ;
select datediff("29-05-2024" ,"20-05-2024");

**********************************************************************************************************************
create database dummy_1;
use dummy_1;
create table Employee(
emp_id int ,
emp_name varchar(25),
primary key (emp_id)
);

insert into employee values
(12, "harsha"),
(14,"geeta"),
(15,"sita");

create database dummy_2;
use dummy_2;
create table emp_salary (
salary int,
age int ,
city varchar(20),
emp_id int,
foreign key (emp_id) references dummy_1.employee(emp_id)
);

insert into emp_salary values
(1200,23,"nagpur" ,12),
(1400,19,"rampur",14),
(2300,23,"mumbai",15)
;
drop table emp_salary;

select * from dummy_1.employee;
select * from emp_salary;
select * 
from emp_salary ES
inner join employee e on es.emp_id=e.emp_id;

select 
e.emp_id,
e.emp_name,
es.salary,
es.age,
es.city
from dummy_1.employee e
inner join dummy_2.emp_salary es on e.emp_id=es.emp_id;


#CREATE TABLE employees (
    employee_id INT NOT NULL,
    name VARCHAR(100) NOT NULL
);


create table student(
stu_id int,
stu_name varchar(20),
stu_batch varchar(30)
);

/*
insert into student value(
(12,"gita","fsda"),
(23,"minal","AIR))*/


SELECT * FROM film where rating = "G" and release_year=2006 and rental_duration <=4 and length <=100
and title like "a%" or title like "b%" ;

SELECT * FROM film where (rating = "G" or rating="PG") and release_year=2006 and rental_duration >4 
and title like "a%" or title like "b%";

SELECT * FROM film where release_year=2006 and rental_duration >4 
and (title like "a%" or title like "b%") and (rating = "G" or rating="PG");

SELECT * FROM film where (title like "a%" or title like "b%") and release_year=2006 
and rental_duration >4 and (rating = "G" or rating="PG");

select * from film where rating="pg" and replacement_cost=20.99 and (length=86 or length=48) and rental_duration=6;

**********************************************************************************************************************
# HOW to find value of string 4 charchter only in different way

use mavenmovies;
select * from customer where length(first_name)=4;

SELECT * FROM customer 
WHERE LENGTH(first_name) = 4
  AND locate(first_name, 4) = 'a' ;
  
SELECT first_name FROM customer 
WHERE first_name REGEXP '^.{4}$';

select first_name from customer where first_name regexp "^[aeiou]";
select first_name from customer where first_name  not regexp "^[aeiouAEIOU].*[aeiouAEIOU]$";

select first_name from customer where first_name  not regexp "^[aeiou]";
select first_name from customer where first_name  not regexp "[aeiou]$";

select DISTINCT(LAST_NAME)from customer
where LAST_NAME not regexp '^[aeiouAEIOU]' OR LAST_NAME not regexp '[aeiouAEIOU]$';## we use or ,and 

select first_name from customer where left(first_name,1)!='a' and left(first_name,1)!='e' and 
left(first_name,1)!='i' and left(first_name,1)!='o' and left(first_name,1)!='u';

select * from customer 
where SUBSTRING(first_name, 4, 8);

select * from customer limit 10,3 ;

#...................................................................................................
## ceil ,floor for round up round down

select * from payment;
select ceil(amount) as round_up from payment;
select floor(amount) as round_up from payment;


