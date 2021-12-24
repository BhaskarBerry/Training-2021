Use Sampledb
Go
Select * From [dbo].[Cars_details]

-------Wihout Order by

Select Top 6 * From dbo.cars_details


----With Orderby

Select Top 6* 
From dbo.cars_details
Order By id Desc

Select top 6 id,status,totalcost
From dbo.cars_details
Order by id,totalcost Desc


Select top 6 id,status, totalcost, cars_names
From dbo.cars_details
Order by 1,3 desc


Select top 6 id,status as s, totalcost  c ,cars_names  n
From dbo.cars_details
Order by c desc


Select * From [dbo].[Cars_details]


Select * From dbo.cars_details
Order By 
Case  cars_names
	When ' toyota' Then 2
	When 'maruthi swif' Then 4
	When 'tata' Then 1
Else 3
End; 