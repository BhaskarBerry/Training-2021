Use Sampledb
Go 

Create Table Flipcart_services
(Service_no int,customer_id int,Cust_name Varchar(45),cust_orders int, Style varchar(78),
Payment_mode Varchar(70))


Insert Into Flipcart_services
Values (101,1,'pavanibhaskar',2,'shorttops','cashondelivery'),
(102,1,'bhaskar',3,'combo','online'),
(103,2,'pavanibhaskar',1,'longtops','ppay'),
(1014,1,'bbhaskar',2,'pants','netpay'),
(105,3,'pavaniberry',1,'shorttops','cardpay'),
(106,4,'hussen',3,'westernstyle','cashondelivery'),
(107,5,'bolt',2,'sarees','gpay'),
(101,2,'tata',1,'shorttops','online'),
(101,1,'ss',2,'sarees','cardpay'),
(101,4,'berry',1,'kidsware','cashondelivery')

Update Flipcart_services
set service_no=104 Where cust_name='bbhaskar'

Create Table Flipcart_Orders
(cust_id int,cst_name varchar(80),[Status] Varchar (60),orderdate date ,ExpectedDate date,
Cost money)


Insert Into Flipcart_Orders
Values (1,'pavanibhaskar','ship','05-10-2021','10-10-2021',500),
(2,'bhaskar','progress','04-10-2021', '11-10-2021',400),
(1,'bbhaskar','conform','03-10-2021', '12-10-2021',1000),
(3,'pavaniberryr','delivary','02-10-2020', '1-10-2020',600),
(6,'ssr','refund','10-10-2020', '10-18-2020',700),
(8,'tata','succesful','10-05-2021', '10-18-2021',700),
(1,'hussen','return','10-12-2021', '11-17-2021',600),
(7,'rattnan','delivery','10-05-2021', '10-05-2021',1500)

---------------------------------------------------
---inser 1000 recors in product table
--------------------------------------------------------


-------------------------------------
---------Cursor---------
----------------------------------------
Select * From dbo.order_bkp

Declare @cust_id int 
Declare @cust_name varchar(50)
Declare @cost money 
Declare ordercursor cursor for ----not a database object as database object is use to created
Select cust_id, cust_name, cost From dbo.order_bkp
Where cust_id=1

open  ordercursor     ----select statement exigute internally resultset set will be generated
Fetch Next From ordercursor into @cust_id,@cust_name,@cost---start pointind one by one ,
---no of records  we have perform multiple times(only one record will be Read  at a time 
while @@Fetch_status=0 
Begin 
	If (@cost>=500)
	Begin 
		Set @cost=@cost+4	
End
Else 
	If (@cost>800)
	Begin 
		Set @cost=@cost+7
	End
	update dbo.order_bkp Set cost=@cost Where cust_id= @cust_id
	
Fetch NExt From  ordercursor into @cust_id,@cust_name,@cost
end 
close ordercursor;

Deallocate ordercursor;