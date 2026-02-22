create database projects;

use projects;
select * from Hr; 

alter table Hr 
change column ï»¿id emp_id varchar(20) null; 

describe Hr; 

select birthdate from Hr; 

set sql_safe_updates = 0; 

update Hr
set birthdate = case
  When birthdate like '%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
  When birthdate like '%-%' then date_format(str_to_date(birthdate,'%m-%d-%yY'),'%Y-%m-%d')
  Else null
End;

ALTER TABLE Hr
MODIFY COLUMN birthdate date; 

update Hr
set hire_date = case
  When hire_date like '%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
  When hire_date like '%-%' then date_format(str_to_date(hire_date,'%m-%d-%yY'),'%Y-%m-%d')
  Else null
End;
ALTER TABLE Hr
MODIFY COLUMN hire_date date; 
select hire_date from Hr; 

select termdate from Hr; 

update Hr
set termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate is not null and termdate!='';

SELECT termdate FROM Hr; 

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE; 

alter table Hr add column age int; 
select * from Hr; 

update Hr 
set age = timestampdiff(YEAR, birthdate,curdate());  

select birthdate,age from Hr; 

select 
min(age) as youngest,
max(age) as oldest
from Hr;


select count(*) from Hr where age<18;

