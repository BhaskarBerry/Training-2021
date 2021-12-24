------------Function----------

Create Function  Firstword
(@email Varchar(80))

Returns Varchar(120)
As 
	Begin 
		Declare  @Variable varchar(90)
		Set @variable =Substring(@email,0,
												Case Charindex(' ',@email)
													When 0  Then  Len (@email)+1 
													Else Charindex (' ',@email)
												End
										)
Return @variable
End 

Sp_helptext Firstword

Select dbo.Firstword  ('ABC@GMAIL.COM CDV@A.COM')
Select dbo.Firstword  ('"hLOHELOOJHGSJH" "DFhello"')
SELECT LEN('hLOHELOOJHGSJHDFhello') +1

SELECT Charindex('HELLO', 'hLOHELLOOJHGSJHFhello', 12)
SELECT Charindex(' ', '"hLOHELOOJHGSJH" "DFhello"')
SELECT  SUBSTRING('hLOHELOOJHGSJHDFhello',0,6)

SELECT LEN('hLOHELOOJHGSJHDFhello')
SELECT LEN('hLOHELOOJHGSJHDF')
-----------------------------------------------------------------

-----------------------------------------------------------------


Create Function fn_employees1
(@deptid int)
Returns Table
As
Return
(
select * From Emp_details e
Where e.eid = @deptid
)
Go

Select * From dept_details d
Cross Apply fn_employees1
(d.did)
Go

Select * From dept_details d
outer apply fn_employees (d.did)


Select * From fn_employees (2)
-------------------------------------------------------------


Select * From emp_details e 
cross apply
(Select * From dbo.dept_details D
Where e.eid=d.did) as b


Select * From emp_details e 
outer apply 
(Select * From dbo.dept_details D
Where e.eid=d.did) as b


Select e.eid,e. ename From emp_details e 
Left outer join dbo.dept_details d
On e.eid=d.did
