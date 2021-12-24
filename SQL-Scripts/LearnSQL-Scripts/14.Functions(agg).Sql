Create DAtabase SampleDB
Go

------------Sum Function------


Select Sum(totalcost) From dbo.cars_details

Select status,sum(totalcost)
From dbo.cars_details
Group by status
 
Select status,sum(totalcost)
From dbo.cars_details
Group by status
 Having sum(totalcost)>500

 Select CustomerId,
 Sum(Case 
 When status='ready' Then totalcost
  Else 0
  End) as so,
  Sum( Case
 When Status='waiting' then totalcost
 Else 0
 end ) as debit
 From dbo.Cars_details
 Group by CustomerId

 ----------------Avg function --------------------------

 Select Avg(totalcost) c
 From dbo.cars_Details
 Where Customerid=2;
 ---------------------------------------------------------

 ---------------------------------------------------------

 With cte_group_columns 
	 As
	 (
		 Select [status],model From dbo.cars_details
	 )
	select t.[status],	 stuff((Select  '|'+t1.[status]
	 From cte_group_columns t1
	 Where t1.[status]=t.status
	 Order by t.status
	 For Xml path('')),1,1, ' '
	 ) As col
	 From cte_group_columns t
	 Group by t.status;

 Select [status],model From dbo.cars_details;



 Select stuff(status , 1 , 3, 'start')
From cars_details;

Select Stuff('pavaniberr',7,7,'bhaskar')

-----
Select CustomerId, 
     STUFF(
                 (Select  ',' + [status] From cars_details  For XML Path('')), 1, 1,'') as grops
 From cars_details Group By CustomerId

 ----
 Select  ',' + [status] From cars_details  For XML Path;

 Select  ',' + [status] From cars_details  For XML Path('')

 -------
Select Id, 
    groups = STUFF(
                 (Select  ',' + [status] From cars_details  For XML Path('')), 1, 1, '')
 From cars_details Group By id

 ---------------------------------------------------------------------------------------------------


Select  customerid,String_agg ([status],',')From 
within group (Order by [status]) as col
From dbo.Cars_details
Group by customerid------------not work






 Select * from [dbo].
Cars_details