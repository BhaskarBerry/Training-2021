Use sampledb
Go

Select * From dbo.Cars_details;

With check_duplicates (customerid,[status],ros)
As
(
Select customerid,[status],row_number()over
	(partition by customerid Order By employeeid) As ros
	From dbo.cars_details
	)
	Select * From  check_duplicates
	where ros>1
	order by Customerid