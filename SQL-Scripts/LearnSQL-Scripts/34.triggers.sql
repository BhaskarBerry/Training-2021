Use Sampledb
Go

Create Table audit (id int,auditdata nvarchar(300))
----Triggers
-------Dml Triggers
select * from audit_data 

Create Trigger Tr_orders_inserted
	ON  audit
	For Insert 
As
Begin
	Insert Into audit_data (id ,auditdata )
	(Select id ,auditdata From inserted)
End

-------------------------------------------------

select * from audit;

select * from audit_data;

insert into audit values(1, 'TestData')

-------------------------------------------------
--1.method

Create Trigger Tr_orders_insert
	ON dbo.Order_bkp
	After update,Insert 
As
Begin 
	Insert Into[dbo].audit_data(id,auditdata)
	Select cust_id,cust_name  From inserted
End;

insert into dbo.Order_bkp values(125,'Berry','return','07-07-2021',null,679)--not work 

select * from Order_bkp
select * from [dbo].audit_data

-------------------------
Create Trigger Tr_orders_created
	ON dbo.Order_bkp
	For  Insert 
As
Begin 
	Declare @id int
	Select  @id = cust_Id From Inserted
	Insert Into dbo.audit_data
	values 
	(  @id,'new customer with id =' + cast(1 As nvarchar(45)) +  'is added At' + cast (GEtdate() As nvarchar (70)))
End

-------------------------
select * from dbo.audit_data 

	Insert Into dbo.audit_data
	values 
	( 1, 'new customer with id =' + cast(1 As nvarchar(45)) +  'is added At' + cast (GEtdate() As nvarchar (70)))


	select  'new customer with id =' + cast(1 As nvarchar(45)) +  'is added At' + cast (GEtdate() As nvarchar (70))
----------not work





Drop Trigger Tr_orders_inserted



---
Select * from order_bkp
Select * From dbo.ordersaudit


Create TRigger Tr_orders_delete
ON dbo.Order_bkp
After delete
As
Begin
Insert Into order_bkp
Select * From Deleted 
End

Delete From dbo.Order_bkp Where cust_id=4

-----------After Update Trigger-----------

Create Trigger insertdata
On dbo.Order_bkp
After Update
As
Begin
	Select * From deleted
	Select * From inserted
End
--
update order_bkp
Set status='conform',cost=2000
Where cust_id in(4,10);
-- in this update 3 rows affected :1.trigger2.deleted,3.inserted
--insetted table contain the new data after updation
--delete table contain old data

-------------------------------------------------------------------

----------insted of Insert Trigger---------


Create View  Vw_jointables
As 
Select cust_id, [status] ,cost ,Payment_mode
From  dbo.Order_bkp
Join dbo.services_bkp
On services_bkp.customer_id=order_bkp.cust_id


Select * From Vw_jointables

Insert Into Vw_jointables values (4,'sh',2000,'cod')--View or function 'Vw_jointables' is not updatable because the modification affects multiple base tables

---multiple tables will be there view ''does not'' insert 

update Vw_jointables
set payment_mode='online'
Where cust_id=4

Delete From  Vw_jointables Where cust_id=4--View or function 'Vw_jointables' is not updatable because the modification affects multiple base tables.



--SO WE USE TRIGGER


Create Trigger Vw_jointable_instedofinsert
On Vw_jointables -----viewname
Instead of insert
As 
Begin
	Select * From Inserted
	Select * From deleted
End
	
Insert Into Vw_jointables  values (4,'sh',2000,'cod')
















Select * from order_bkp
Select * From [dbo].[services_bkp]