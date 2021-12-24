Use Sampledb
Go

-------stored procedure using  Inputparameters

Create Procedure  sp_Price_Range

(@mincost int ,
@MAxcost int )
As 
Begin
	Select cost From dbo.Flipcart_orders
	Where cost between @mincost And @maxcost

	End;
	 
Exec sp_Price_Range 500,1000


--stored procedure using outputparameters

Select * From [dbo].[Flipcart_Orders];
Select * From dbo.Flipcart_services

Create Procedure sum_customerscostbyid
(@id int ,
@Sum int output)

As 
	Begin 
		select cust_id, Sum(cost) As amount From dbo.Flipcart_orders
		Group by cust_id 
	End

	Declare @amount int 
	Exec sum_customerscostbyid    1, @amount out
	--Exec sum_customerscostbyid  @id= 1, @sum =@amount out


-----return using outputparameters 
Create Procedure getstatusbyid
(@id int ,
@progress nvarchar(90))
	
as 
Begin 
Select a.cust_id, a.ExpectedDate From flipcart_orders a
	inner Join Flipcart_services b
	On a.cust_id=b.customer_id where customer_id=2
End
Declare @comment nvarchar (60)
Exec getstatusbyid 1,@comment

