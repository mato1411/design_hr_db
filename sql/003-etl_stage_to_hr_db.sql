-- 1. Load the data to HR db tables

insert into Department (name)
select distinct(department_nm) from stg_table;

insert into Job_Title (name)
select distinct(job_title) from stg_table;

insert into Education_Lvl (lvl)
select distinct(education_lvl) from stg_table;

insert into Location (name, address, city, state)
select distinct(location), address, city, state from stg_table;

insert into Employee (ref_id, name,	email, hire_dt, education_lvl_id)
select distinct(s.emp_id), s.emp_nm, s.email, s.hire_dt, edu.id
from stg_table as s
join Education_Lvl as edu
on edu.lvl = s.education_lvl;

insert into Employee_History (employee_id, job_title_id, manager_id, department_id, location_id, start_dt, end_dt)
select e.id, j.id,
	(select id from Employee where name = s.manager), 
	d.id, l.id, s.start_dt, s.end_dt
from stg_table as s
join Employee as e
on e.ref_id = s.emp_id
join Job_Title as j
on j.name = s.job_title
join Department as d
on d.name = s.department_nm
join Location as l
on l.name = s.location;

insert into Salary (salary, employee_id, start_dt)
select s.salary, e.id, s.start_dt
from stg_table as s
join Employee as e
on e.ref_id = s.emp_id;

-- 2. Print data of all tables
select * from stg_table;
select * from Job_Title;
select * from Location;
select * from Department;
select * from Education_Lvl;
select * from Employee;
select * from Salary;
select * from Employee_History;