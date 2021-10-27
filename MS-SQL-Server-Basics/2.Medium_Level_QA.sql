Create database SQL_QA
Go

Use SQL_QA
Go

----------------------------------------------------
--1. Fetch All the Duplicate Recodrs in a table
----------------------------------------------------

Select * From[dbo].[Users];

With Fetch_duplicaterecords
As
	(
		select *,Row_number()Over(partition By city Order By User_id) As records
		From users
	)

Select * From Fetch_duplicaterecords Where records > 1

--------------------------------------------------------------
--2.Fetch The second last Record From table 
---------------------------------------------------------------
Select * From[dbo].[Trades]

Select * From (Select *, Row_number()Over(Order By Order_id desc )  as record
From Trades) as w Where record =2

with cte_fetch_secondlast_record
As
	(
		select *, Row_number()OVer(Order by Order_id Desc) as Record
		From trades
	)
Select * From cte_fetch_secondlast_record
where record=2;

--------------------------------------------------------------------
--3.Display employees who earn Highest salary And The lowest Salary In each Department
------------------------------------------------------------------------


Select Dept_name,  MAX(salary) As max_salary , MIN(salary) As max_salary
From dbo.Employee 
Group by dept_name
order by dept_name
;

Select * From dbo.Employee order by dept_name;
--subquery
select x.*
from employee e
join (select *,
		max(salary) over (partition by dept_name) as max_salary,
		min(salary) over (partition by dept_name) as min_salary
		from employee) x
		on e.emp_id = x.emp_id
		and (e.salary = x.max_salary or e.salary = x.min_salary)
order by x.dept_name, x.salary;

--cte
with Emp_CTE
As(
		Select Dept_name,  MAX(salary) As max_salary , MIN(salary) As min_salary
		From dbo.Employee 
		Group by dept_name
)
select e.Emp_id,e.Emp_name,e.dept_name,e.salary,x.max_salary,x.min_salary from dbo.Employee  as e
join Emp_CTE  as x on e.dept_name = x.dept_name
		and (e.salary = x.max_salary or e.salary = x.min_salary)



select Emp_name, Dept_name ,salary From dbo.Employee
where salary in  (
						SELECT MAX(salary) As min_max_salary
						From dbo.Employee 
						Group by dept_name
						union all
						SELECT MIN(salary) as min_max_salary
						From dbo.Employee 
						Group by dept_name
     				) 


--------------------------------------------------------------
--4.Fetch The Details of Doctors Who Work In the same Hospital But In Different Speciality
-------------------------------------------------------------------

Select * From dbo.Doctors;

Select H.id ,H.dname , H.Speciality, H.Hospital
From Dbo.Doctors As H
Join Dbo.Doctors As D
On H.Hospital=D.Hospital 
And H.id<>D.id And H.Speciality<>d.speciality

Select  H.id ,H.dname , H.Speciality, H.Hospital
From Dbo.Doctors As H
Join Dbo.Doctors As D
On H.Hospital=D.Hospital 
And H.id<>D.id

--------------------------------------------------------
--5.fetch the users who logged consecutively 3 0r more times
--------------------------------------------------------
