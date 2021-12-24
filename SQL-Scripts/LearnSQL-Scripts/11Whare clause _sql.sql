Use sampledb
Go

-----------------------------------------
-----------where clause--------------
--------------------------------------------
Select * From Cars_details

---Using AND operator
Select * From dbo.Cars_details
Where [status]='ready' and employeeid>1

---Using OR operator
Select * From dbo.Cars_details
Where [status]='ready' Or employeeid in(1,3) Or Totalcost=1254

-----Using In Operator----
Select * From dbo.Cars_details
where  customerid in (2,3,7)

-----UsingBetween  Operator----
Select * From dbo.Cars_details
where  totalcost   between 200 and 1000

Select * From dbo.Cars_details
where  [status]  between 'r' and 'y'

----Using like operator------

select * From dbo.Cars_details
where  [status] like ' w%';

select * From dbo.Cars_details
where  [status] like '%y';

select * From dbo.Cars_details
where  [status] like '%a%';

select * From dbo.Cars_details
where  [status] like '[rwa]%';

select * From dbo.Cars_details
where  [status] like '^[rwa]';

select * From dbo.Cars_details
where  [status] like '[rwa]%'  and 
  [status] like '_a%';


----Using with null/not null operator------

select * From dbo.Cars_details
where model is not null;

select * From dbo.Cars_details
where model is  null;


----Using Having with aggrigate Functions---

Select CustomerId,Count ([status]) as details 
From dbo.cars_details 
Group By CustomerId
Having Count ([status]) >1

Select CustomerId,Sum (totalcost) as details 
From dbo.cars_details 
Group By CustomerId
Having Sum (totalcost) >400
---to check for  customers  who have employeeid 1,2,4,5 and use having clause
select  Customerid
From Dbo.cars_details
Where employeeid in (1,2,5,4)
group by Customerid
having count  (Customerid)>1

---- chech for groups having   2 employeeids not 1
Select Customerid 
from dbo.Cars_details
Group by customerid
Having min (Case when 
Employeeid=2 then 2
else 0
end)>0 And 
Sum (Case When 
EmployeeId= 1 Then 3 
Else 0
End )>1






Select * from Dbo.Cars_details

-------------Where Exists---------------
select * from dbo.Cars_details  c
Where Exists(
Select 1 from  [dbo].[Customers_details] d
Where c.id=d.id)

select * from dbo.Cars_details  c
Where not Exists(
Select 1 from  [dbo].[Customers_details] d
Where c.id=d.id)













