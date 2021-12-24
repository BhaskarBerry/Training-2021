


--------------In clause---------

Select * From dbo.Cars_details
Select * From employees_details
Select * From dbo.Cars_details
Where id in(3,4,5,6)


Select * From dbo.Cars_details
Where id in(
Select id From employees_details)