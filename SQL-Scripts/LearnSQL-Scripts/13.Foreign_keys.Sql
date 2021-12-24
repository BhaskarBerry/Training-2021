Use sampledb
Go

--------------Foreign key--------
Select * From dbo.Employees_Details

Select * from department_details


Alter Table dbo.employees_details
Add primary key (id)

Alter Table department_details 
Add constraint fk_dept_employees
Foreign key (id) References employees_details(id)

