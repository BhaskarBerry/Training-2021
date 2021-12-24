Use Sampledb
Go

Select * From Department_Bkp
Select * From [dbo].[Emp_bkp]

Merge Into Department_Bkp As Target_d
Using[dbo].[Emp_bkp] As Source_o
On Target_d.Id=Source_o.id
When Matched And  Exists (
Select Source_o.id,Source_o.Fname
Intersect 
Select Target_d.id,Target_d.[name])
Then 
		Update Set Target_d.[name]=Source_o.[fname]
When Not Matched By Target Then
		Insert (id , [name]) Values (Source_o.id, Source_o.[fname])
When not Matched by Source Then
		Delete;




		
Merge Into Department_Bkp As T
Using Dept_Bkp As S
On t.id=s.id
When Matched Then 
		Update Set T.[name]=S.[name]
When Not Matched By Target Then
		Insert (id , [name]) Values (S.id, S.[name])
When not Matched by Source Then
		Delete;



insert Into  Department_Bkp
Select * From  [dbo].[Department_details]

Select * From Department_Bkp
Select * From  Dept_Bkp

Truncate Table  Dept_Bkp
Truncate Table Department_Bkp

Insert Into  Dept_Bkp (id , [name]) Values (1,'IT'),(2,'saless'),(3,'tech')

