create database new;
create Table student (id int,name varchar(30),age int,department varchar(10),salary int);
insert into student value (1,"ashok"
,20,"cse",60000);
insert into student value (2,"suresh",30,"cse",80000);
insert into student value (3,"ramesh",39,"iot",70000);
insert into student value (4,"naresh",21,"iot",60000);
insert into student value (5,"hanuman",22,"cse",89000);
select * from student;
select * from student where salary >=60000;
select * from student where name ="ashok";
select name from student order by salary desc;
select * from student limit 3;
select name ,salary +20000 as new_salary from student;
select department,avg(salary) as total_salary from student where salary >=50000 GROUP BY department;
select id,name,age,department,avg(salary) over() as avg_salary from student;
select id,name,salary,max(salary) over() as maximum_salary from student;
select id,name,age,salary,rank() OVER(PARTITION BY department order by salary desc) as rank_number from student;
select name,salary,department,row_number() over(order by salary desc) as row_num from student;
select name,salary,department,sum(salary) over(PARTITION BY department) as total_salary from student;
select name,salary,dense_rank() over() as salary_rank from student;
select name,salary,sum(salary) over() as total_salary from student;
select name,salary,lag(salary) over() as lag_value from student;
select name,salary,lead(salary) over() as lead_salary from student;
with avg_salary as (select * from student) select * from avg_salary;
with sum_salary as (select * from student where salary =60000) SELECT * from sum_salary;

SELECT * from student where salary >60000 and salary > (select avg(salary) from student);
 select name,salary,
 CASE 
    WHEN salary =60000 THEN 'high'
    when salary =70000 then 'medium'
    ELSE 'low'
 END as total_salary from student;
 
Create table department (id int,department varchar(10),post varchar(20));
insert into department value (1,"iot","software");
insert into department value (2,"cse","hardware");
insert into department value (3,"iot","software");
insert into department value (4,"iot","hardware");
select * from department;
select name from student union select post from department;
select id,name from student union all select id,department from department;
select student.name,student.age,student.salary,department.id,department.post from student student left join department department on student.id = "department";
select student.name,student.age,student.salary,department.id,department.post from student student inner join department department on student.id = "department";
select student.name,student.salary,student.age,department.id from student student cross join department department on student.id =department.id;
select id,name from student INTERSECT select id,department from department;
select student.name,student.salary,student.age,department.id from student student cross join department department on student.id =department.id;