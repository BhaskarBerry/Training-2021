---- CTE -----




With Cte_update_gender_values
As 
(
Select eid,ename,Gender,Row_number() over ( order by eid) as result
From dbo.emp_details
)

--delete  From Cte_update_gender_values where result > 1

Update Cte_update_gender_values
Set gender='malejk' where eid in(2,4,5)

Select * from Cte_update_gender_values
--------------------------------------------
---views
--------------------------------------------

Create view view_emp_details
As 
Select eid,ename,Gender From emp_details


update View_emp_details 
Set Gender='fm' where eid=2 


Select * From [dbo].[emp_details]

------------------------------------------------------------------


With cte_department_values(dname,[location])
As 
(
	Select  dname,[location] 
	From dbo.dept_details Where dname='IT'
	)
select  dname,[location] 
From cte_department_values
 

 Select * From [dbo].[emp_details]

Select * From Dept_details

---------Recursive Cte-----
With Recursive 

update   [dbo].[emp_details]
Set mname='mike' where eid =5



	-------------------------------------------------------------
-----Generating values-----

with numbers (id)
As
(
--staring number/inex
select 1
--to-level unionall operator required for recursion
Union All
--iteration epression
Select id+1
-- table epression we first declare used as  source for recursion
From numbers
--clause to define the end of the recursion 
Where id<=100
)
--use the generated  table expression like a regular table
Select id From numbers

	
	--------------------------------------------------------
	Select * From [dbo].[emp_details]


Declare @datefrom datetime ='2020-12-7  10:00'
Declare @dateto   Datetime ='2020-05-7  11:00'
Declare @intervaldays int   =7

With date_details
As (
	Select @datefrom As res ,1 As TeamA, 2 as TeamB, 3 As  teamC 
	Union All
	Select Dateadd (d, @intervaldays , res ),
			case  TeamA 
			When 1 Then  2 
			When  2 then  3 
			When 3 Then 1 
			End As TeamA

From date_details Where res<Dateadd (d, @intervaldays , @dateto )
)



-----------------------------------------------------------------------
With Cte_rank
As
( select *,rank() over (order by customerid) as ranks
From cars_details
)
Select Top (5) * From cte_rank