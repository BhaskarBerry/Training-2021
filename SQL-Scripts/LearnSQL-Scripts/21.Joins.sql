use sampledb
Go

-------------JOINS------------

------Inner Joins

Select * From Dbo.cars_Details
Select * From Dbo.cars_sales

Select a.*,b.customerid
From Dbo.cars_Details A
inner Join Dbo.cars_sales  B
On a.id=b.customerid


Select a.*,b.customerid
From Dbo.cars_Details A
 Join Dbo.cars_sales  B
On a.id=b.customerid



Select a.*,b.customerid
From Dbo.cars_Details A
Right Join Dbo.cars_sales  B
On a.id=b.customerid


Select a.*,b.customerid
From Dbo.cars_Details A
left outer Join Dbo.cars_sales  B
On a.id=b.customerid


Select a.*,b.customerid
From Dbo.cars_Details A
left anti senmi Join Dbo.cars_sales  B
On a.id=b.customerid---not work


------------Self join

Select * From Dbo.cars_Details

select  a.*,b.manager_name
From Dbo.manager_details A
 Join Dbo.manager_details  b
On a.emp_name=b.manager_name


Select a.*,b.customerid
From Dbo.cars_Details A
 inner join Dbo.cars_sales B
On len(a.id)=len(b.customerid)

 Select * From [dbo].[manager_details]

----Cross join
Select a.*,b.customerid
From Dbo.cars_Details A
Cross join Dbo.cars_sales B
On a.id=b.customerid

Select a.*,b.customerid
From Dbo.cars_Details A
 join Dbo.cars_sales B
On 1=2



---------joining on a Subquery 

select b.customerid
From dbo.cars_sales b
join
(Select a.cars_names, a.customerid 
From Dbo.cars_details a
Group by a.cars_names,a.customerid) as ab
on ab.customerid=b.customerid

-------
Select a.*
From Dbo.cars_details a
left join
(select b.customerid
From dbo.cars_sales b
Group by b.customerid) as ab
on ab.customerid=a.customerid

------Cross Apply &outer apply

Select * From [dbo].[Employees_details] E
cross apply 
( Select Top 1 *

From  Dbo.cars_Details D
Where 
 d.id=e.id
Order by e.id
) As ids

---------------------------------------
Select * From [dbo].[Employees_details] E
cross apply 
( Select Top 1
d.id,d.cars_names,d.customerid
From  Dbo.cars_Details D
Where d.customerid=1 
And d.id=e.id
Order by e.id
) As ids

Select * From [dbo].[Employees_details] E
outer apply 
( Select Top 1
d.id,d.cars_names,d.customerid
From  Dbo.cars_Details D
Where d.customerid=1
And d.id=e.id
Order by e.id
) As ids



---CTE Recurcive joins
With merge_of_tables
As
(
 Select fname ,id
 From dbo.Employees_details 

 Union all

  Select m.fname ,m.id
 From dbo.Employees_details m
 Join merge_of_tables
on  m.id=merge_of_tables.id

)
Select * From merge_of_tables






USE [SampleDB]
GO











-----------Full join
Select a.*,b.customerid
From Dbo.cars_Details A
full Join Dbo.cars_sales  B
On a.id=b.customerid















Select * From [dbo].[Employees_details][dbo].[person_details]




Select * From Dbo.cars_Details
Select * From Dbo.cars_sales









