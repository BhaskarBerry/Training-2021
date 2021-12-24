--------------------------------------------
----create Db
create database TrainingDB
Go
----Use Training Db
use TrainingDB
Go
--------------------------------------------
----create table test
create table dbo.Test
(id int,
name varchar(20))

----insert data into test table
insert into dbo.Test values(1, 'Bhaskar Berry'),(2,'Pavani'),(3, 'Ayub')

select * from dbo.Test
--------------------------------------------
Create Database Sampledb
Go

Create Table [dbo].[products]
(id int primary key identity ,pname varchar (70),descripts varchar (50))


insert into [dbo].[products]
values (1,'product-1','product-1 description')


insert into [dbo].[productsales]
values (1,5,5,3)
truncate table dbo.products 
-----------------------------------------------------
--------------------------------------------------


Set Identity_insert dbo.products on


------
Set nocount on 
Declare @count int=1
While @count<=1000
Begin
Declare @id int = '1'+ltrim (@count)
Declare @name Nvarchar(50)='product-1'+ltrim(@count)
Declare @descripts NVarchar (70) ='product-1 description'+ltrim(@count)

Insert Into [dbo].[products] Values(@id,@name,@descripts)


Set @count=@count+1

If(@count%1000=0)
		Print ltrim (@count )+'rows inserted'
End;



Select * From [dbo].[products];

