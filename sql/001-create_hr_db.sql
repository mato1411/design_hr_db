-- 1. Create HR db tables

create table Job_Title(
    id serial primary key,
    name varchar(100));

create table Department(
    id serial primary key,
    name varchar(50)); 
	
create table Location(
    id serial primary key,
    name varchar(50),
	address varchar(100),
	city varchar(50),
	state varchar(2));

create table Education_Lvl(
    id serial primary key,
    lvl varchar(50));

create table Employee(
    id serial primary key,
	ref_id varchar(8) not null unique,
    name varchar(50),
	email varchar(100),
	hire_dt date,
	education_lvl_id int references Education_Lvl(id));
	
create table Employee_History(
	employee_id int references Employee(id),
	job_title_id int references Job_Title(id),
	manager_id int references Employee(id),
	department_id int references Department(id),
	location_id int references Location(id),
	start_dt date,
	end_dt date,
	primary key(employee_id, start_dt));
	
create table Salary(
    salary numeric,
	employee_id int,
	start_dt date,
	foreign key (employee_id,
		start_dt) references Employee_History(employee_id, start_dt));