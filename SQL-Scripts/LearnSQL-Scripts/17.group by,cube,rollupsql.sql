Use Sampledb
go

---------Group by Function---------

Select customerid,Sum(totalcost) as groupsalary
From dbo.cars_details
Group by Customerid
order by groupsalary

Select customerid,Sum(totalcost)
From dbo.cars_details
Group by Customerid
Having sum(totalcost)>900



select c.id,c.customerid,
sum(c.totalcost) as s
from employees_details E
inner join 
cars_details c
on c.id=e.id
Group by c.id,c.customerid
Having sum(c.totalcost)>500


select c.id,e.id from
Employees_details e
inner join 
Cars_details c
on c.id=e.id

----------------------------------------------------------
select customerid,sum(totalcost) as toalsal
From dbo.cars_details
Group by customerid
----------------------------------------------------------

---------------cube function-----------------------------s

Select customerid,sum(totalcost) as toalsal
From dbo.cars_details
Group by customerid
with cube;
-------
Select * From [dbo].[cube_rollup];

Select gender,country ,sum(salary) as toalsal
From dbo.cube_rollup
Group by gender,country
with cube;
----------------------------------------------------------

------------------rollup---------------------------------------
Select gender,country ,sum(salary) as toalsal
From dbo.cube_rollup
Group by gender,country
with rollup;

------
Select customerid,sum(totalcost) as toalsal
From dbo.cars_details
Group by customerid
with rollup;

select * from dbo.Cars_details;
-----------------------------------------------------------------------


------------------Grouping set----------------

Select gender,country,sum(salary) as toalsal
From dbo.cube_rollup
Group by 
Grouping sets  
(
(gender,country),
(gender),
(country),
()
)
order by
grouping (country), grouping(gender)










Select * From [dbo].[Employees_details]















