--Employee
select
emp_no,
first_name,
last_name
from public.employees

--Titles
select 
title,
from_date,
to_date
from public.titles


--Joined
select
a1.emp_no,
first_name,
last_name,
title,
from_date,
to_date
from 
	public.employees a1
join
	public.titles b1
on 
	a1.emp_no = b1.emp_no
where a1.birth_date between '1952-01-01' and '1955-12-31' 
order by emp_no asc


--create Retirement Titles Table
CREATE TABLE Retirement_Titles AS
select
a1.emp_no,
first_name,
last_name,
title,
from_date,
to_date
from 
	public.employees a1
join
	public.titles b1
on 
	a1.emp_no = b1.emp_no
where a1.birth_date between '1952-01-01' and '1955-12-31' 
order by emp_no asc


--Export Retirement Titles
select * from Retirement_Titles

--Starter Code
select
a1.emp_no,
first_name,
last_name,
title
from 
	public.employees a1
join
	public.titles b1
on 
	a1.emp_no = b1.emp_no
where a1.birth_date between '1952-01-01' and '1955-12-31' 
order by emp_no asc


-- Use Dictinct with Orderby to remove duplicate rows
select
 DISTINCT ON (a1.emp_no) a1.emp_no,
first_name,
last_name,
title
from 
	public.employees a1
join
	public.titles b1
on 
	a1.emp_no = b1.emp_no
where 
	a1.birth_date between '1952-01-01' and '1955-12-31' 
and
	b1.to_date = '9999-01-01'
order by
a1.emp_no asc, b1.to_date  


--Insert into Table during Creation
CREATE TABLE Unique_Retirement_Titles AS
select
 DISTINCT ON (a1.emp_no) a1.emp_no,
first_name,
last_name,
title
from 
	public.employees a1
join
	public.titles b1
on 
	a1.emp_no = b1.emp_no
where 
	a1.birth_date between '1952-01-01' and '1955-12-31' 
and
	b1.to_date = '9999-01-01'
order by
a1.emp_no asc, b1.to_date 

--Select for Export
select * from public.Unique_Retirement_Titles

--Count of Titles
select count(title) from public.Unique_Retirement_Titles

--Count of Titles grouped by Title
select 
count(title), 
title 
from public.Unique_Retirement_Titles
group by title
order by count(title) desc


--Create Table
CREATE TABLE Retirement_Title_Count AS
select 
count(title), 
title 
from public.Unique_Retirement_Titles
group by title
order by count(title) desc

--Export Retirement Title Counts
select * from Retirement_Title_Count


--~*~*~*~*~*~*~*~*Deliverable 2*~*~*~*~*~*~*~*~*~*~*~*
select
DISTINCT ON (a1.emp_no) a1.emp_no,
first_name,
last_name,
birth_date,
b1.from_date,
b1.to_date,
c1.title
from 
	public.employees a1
join
	public.dept_emp b1
on
	a1.emp_no = b1.emp_no
join
	public.titles c1
on
	a1.emp_no = c1.emp_no
where 
	b1.to_date = '9999-01-01'
and
	a1.birth_date between '1965-01-01' and '1965-12-31'
order by a1.emp_no asc

--Create Mentorship Table 
CREATE TABLE Mentorship_Eligibilty AS
select
DISTINCT ON (a1.emp_no) a1.emp_no,
first_name,
last_name,
birth_date,
b1.from_date,
b1.to_date,
c1.title
from 
	public.employees a1
join
	public.dept_emp b1
on
	a1.emp_no = b1.emp_no
join
	public.titles c1
on
	a1.emp_no = c1.emp_no
where 
	b1.to_date = '9999-01-01'
and
	a1.birth_date between '1965-01-01' and '1965-12-31'
order by a1.emp_no asc


--Export for review
select * from Mentorship_Eligibilty