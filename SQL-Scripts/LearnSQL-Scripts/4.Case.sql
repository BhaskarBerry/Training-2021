--- CASE Expression
use TrainingDB
Go

Select * from dbo.Persons;

select Id, Lastname,
	(CASE 
		when Age > 40  Then 'Senior Developer'
		When Age < 21 Then 'Junior Dev'
	Else 'developer'
	End) AS Designation
	from Persons


Alter table  Persons
	Add Salary Money Default 5000

--- CASE with SUm to get the count 
select  Lastname,
	SUM(CASE 
		when Lastname = 'Bose'  Then Salary
		when Lastname = 'Ayub'  Then Salary
	Else 1
	End) AS Designation
	from Persons
	group by Lastname

select  count(Id) TotalCount,
	SUM (CASE 
		when City = 'Bangalore'  Then 1
		
		Else 0
	End) AS Destination_Banaglore
	from Persons

--------------------------------------------------
-- short hand case 

select ABS(CHECKSUM(NEWID()))


select case ABS(CHECKSUM(NEWID())) % 4
	when 0 Then 'Dr'
	when 1 Then 'Master'
	when 2 Then 'Mr'
	when 3 Then 'Mrs'
	Else 'Not Defined'
	END AS Result

select case 
	when ABS(CHECKSUM(NEWID())) % 4 = 0 Then 'Dr'
	when ABS(CHECKSUM(NEWID())) % 4 = 1 Then 'Master'
	when ABS(CHECKSUM(NEWID())) % 4 = 2 Then 'Mr'
	when ABS(CHECKSUM(NEWID())) % 4 =  3 Then 'Mrs'

	END AS Result

-------------------
--case clause in Order By 
select * from Persons

select * from Persons
order by 
 case city
 when 'Us' then 1
 when 'Bangalore' then 2
 Else 3
 End, Salary
--------------------------------------
--Using case in update
--------------------------------------

select * from Persons

update Dbo.Persons
Set Salary=Salary+
 Case city 
	 When 'Bangalore' then 1000
	 When 'Us'            Then 2000
	 When  'tyi'           Then 3000
	Else 0
 End 

 select * from Persons

 --------------------------------------	
 --using case in orderby
--------------------------------------

 Insert Into Dbo.Persons (Id,Lastname,Firstname,Age,City)
 Values (13,'jas',null,null,'chennai')


Select Id,Firstname,lastname
From Dbo.Persons
Order by
	Case 
		When Firstname is not null  and ltrim(rtrim(Firstname)) != '' Then 0
		when ltrim(rtrim(Firstname)) = ''  then 1
	Else 2
End ,Firstname
--------------------------------------
Select Id,Firstname,lastname
From Dbo.Persons
Order by
	Case 
		When Firstname is not null  and Firstname != '' Then 0
		when Firstname = ''  then 3
	Else 2
End ,Firstname
--------------------------------------
--coalesce 
Select Coalesce ( null,1,2)-->it gives the Fist not null value2

Select Coalesce(2,null,3)


Select * from Dbo.persons

Alter table Dbo.Persons
Add Date1 date ,Date2 Date

Select Id,date1,date2
From Dbo.Persons 
Order by
	Case
		When Coalesce(Date1 ,'2000-01-01')<coalesce(Date2, '2000-01-01') Then Date1 
	Else Date2
end

Alter Table Dbo.Date_Values 
Add Id Int Identity
--------------------------------------
SELECT * FROM dbo.date_values
-- case in order by clasue with lowest values based on two columns
Select *
From dbo.Date_values
Order by 
	Case 
		 when Coalesce(date1,'2000-01-01') < Coalesce(Date2,'2000-01-01') Then Date1
	Else Date2
End


SELECT min(date1) FROM dbo.date_values --2018-01-02
SELECT min(date2) FROM dbo.date_values --2018-01-01
