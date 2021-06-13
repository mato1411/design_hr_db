-- 1. Drop staging table
drop table stg_table;

-- 2. Create staging table
create table stg_table (emp_id varchar(8),
	emp_nm varchar(50),
	email  varchar(100),
	hire_dt date,
	job_title varchar(100),
	salary int,
	department_nm varchar(50),
	manager varchar(50),
	start_dt date,
	end_dt date,
	location varchar(50),
	address varchar(100),
	city varchar(50),
	state varchar(2),
	education_lvl varchar(50));
					   
-- 3. Copy the data to a staging table
copy stg_table
from '/home/workspace/hr-dataset.csv' 
delimiter ';' 
csv header;