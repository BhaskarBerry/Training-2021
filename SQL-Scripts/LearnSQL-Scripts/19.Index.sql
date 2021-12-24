use Sampledb
Go


---------------index---------------

Create Index IX_Cars_Id_e_m_s
On dbo.cars_details (id,employeeid,model,[status])

Create Index Ix_Cars
On dbo.cars_details----not work


----------Clusterd index And unique index

Create  clustered Index  IX_cars_customerid
On dbo.cars_details (customerid,id);

Create  Unique Index  IX_cars_customerid
On dbo.cars_details (customerid)--- not work because duplicates will be there

Create  Unique Index  IX_cars_id
On dbo.cars_details (id);


Update dbo.cars_details  Set 
Id=4 Where totalcost=800 on duplicate key---not work



----Drop Index

Drop Index Dbo.cars_details.IX_Cars_Id_e_m_s

Drop Index  IX_Cars_Id_e_m_s
 On Dbo.cars_details


 ------disable
 Alter Index  IX_cars_customerid 
 on  Dbo.cars_details Disable;---------some error

Alter Index  IX_Cars_Id_e_m_s
 on  Dbo.cars_details Disable;



 --------Rebuild 
 Alter Index  IX_cars_customerid 
 on  Dbo.cars_details Rebuild;

Alter Index  IX_Cars_Id_e_m_s
 on  Dbo.cars_details Rebuild;


------sorted inddex

Create Index Ix_Cars_cost
On dbo.cars_details(totalcost desc)


------unique index allows nulls
Create Index IX_cars_model
On dbo.Cars_details(model) Where model is  not null

Create Index IX_cars_id
On dbo.Cars_details(id) Where id is null----fail


-------------------------------------------------------
-------non clustered index
Create  Nonclustered Index 
IX_cars_id 
On dbo.Cars_details(id);

Drop Index dbo.Cars_details.IX_cars_id ;
-----------------------------------------------------------


--------pratial index

Create Index I_car_totalcost
On  dbo.Cars_details(totalcost)
Where id=3;

--------
Select totalcost
From dbo.Cars_details
Where id=3


--------------index view ---
----Create View
Create View v_totalcars_sales
with Schemabinding
As 
Select cars_names,Sum(isnull((quantitysold*totalcost),0) ) as sold ,
count_big(*) as totaltrasactions
From dbo.Cars_details
join  [dbo].[cars_sales]
On  [dbo].[cars_sales].customerid=dbo.Cars_details.customerid 
Group by cars_names

Select * From  v_totalcars_sales


Select * From [dbo].[cars_sales]

Select * From dbo.Cars_details;


----Create Index

Create nonclustered INdex  Ix_cars_names
On v_totalcars_sales(Quantitysold)





create Table Oneindex
(Id int, Firstname varchar(60),Lastname varchar (80),city nvarchar(90))

Insert Into Oneindex(id,Firstname,Lastname,City)
Select Top 1000 row_number()Over(Order by A.Name)Rowid,
'bob',
Case When Row_Number()Over(Order BY A.name)%2 =1 Then 'Smith'
Else 'Brown' End,
 Case
 When Row_Number()Over(Order BY A.name)%100 =1 Then 'las vegas'
 When Row_Number()Over(Order BY A.name)%10 =1 Then 'New york '
 When Row_Number()Over(Order BY A.name)%10 =2Then 'san marino '
 When Row_Number()Over(Order BY A.name)%10 =3 Then 'los angeles '
 else 'Houston'
 End
 From Sys.all_objects A
 Cross Join Sys.all_Objects B
 Go


 Drop TAble Oneindex


 Select * From Sys.all_objects 
 Select * From OneIndex
 Where City='las vegas'
 
 Select * From OneIndex
 Where City='las vegas'


  Select * From OneIndex
 Where City='san marino'

  Select * From OneIndex
 Where City='los angeles'


Select 1000%10
Select 1000/100
