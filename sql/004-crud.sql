-- Question 1: Return a list of employees with Job Titles and Department Names
-- Note: Only active employees have a null value for end_dt (end date)
select e.name as Employee, d.name as Department, j.name as Job_Title
from Employee e
join Employee_History eh
on e.id = eh.employee_id
join Department d
on eh.department_id = d.id 
join Job_Title j
on eh.job_title_id = j.id
where eh.end_dt is null;


-- Question 2: Insert Web Programmer as a new job title
insert into Job_Title (name)
values('Web Programmer');
-- Double check
select * from Job_Title;


-- Question 3: Correct the job title from web programmer to web developer
update Job_Title
set name = 'Web Developer'
where name = 'Web Programmer';
-- Double check
select * from Job_Title;


-- Question 4: Delete the job title Web Developer from the database
delete from Job_Title
where name = 'Web Developer';
-- Double check
select * from Job_Title;

-- Question 5: How many employees are in each department?
-- Note: Only active employees have a null value for end_dt (end date)
select d.name as Department, count(eh.employee_id) as Number_of_Emplo 
from Department as d
join Employee_History eh
on eh.department_id = d.id 
where eh.end_dt is null
group by d.name;


-- Question 6: Write a query that returns current and past jobs (include employee name, job title, department, manager name, start and end date for position) for employee Toni Lembeck.
select e.name as Employee, j.name as Job_Title, d.name as Department, m.name as Manager, eh.start_dt as Start_Date, eh. end_dt as End_Date 
from Employee as e
join Employee_History eh
on e.id = eh.employee_id
join Department d
on eh.department_id = d.id 
join Job_Title j
on eh.job_title_id = j.id
join Employee m
on eh.manager_id = m.id
where e.name = 'Toni Lembeck';