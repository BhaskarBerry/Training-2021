Use sampledb
Go

Create Table Flipcart_details(orders int)
Insert into flipcart_details Values (2)

 Select * From  [dbo].[order_bkp]
-----
Create View records_Checkings
as Select * From [dbo].[order_bkp]

 Select * From records_Checkings

 Insert into records_Checkings Values (2,'ghg','fhh','05-05-2021' ,'06-06-2021',null)

 Delete From records_Checkings
 Where cust_id=2