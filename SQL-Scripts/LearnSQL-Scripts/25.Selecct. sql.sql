Use Sampledb
Go


------- select

Select * From [dbo].[Cars_details]



Select cars_details .*  From cars_details----avoide
join emp_bkp
on cars_details.id=emp_bkp.id

Select cars_details .* ,emp_bkp.lname as lastname 
From cars_details
join emp_bkp
on cars_details.id=emp_bkp.id
Order by lastname

----selecting specified number of records

Select id,model 
From cars_details
Order BY id
Offset 5 rows
Fetch First 6 Rows only

Select Top 8 id,model
From dbo.cars_details


-------without locking table 

Select * From cars_sales With (nolock)
Select * From cars_sales Withlock


-----multiple values From columns
Select * From cars_details
Where  id in(1,3,4)

Select * From cars_details
Where  cars_names='toyota' or cars_names='maruthi swif'


---selecting with more then one condition

Select * From cars_details
Where  cars_names='toyota' 
or id in (2,3,5)


Select * From cars_details
Where  (cars_names='toyota' And  id in (2,3,5) )
OR 
(cars_names='maruthi swif' And id in (2,3,5))



































Create Table Temple1(id int  identity(1,1) Primary key)
Create Table Temple(id int  identity(1,1), Primary key(id))