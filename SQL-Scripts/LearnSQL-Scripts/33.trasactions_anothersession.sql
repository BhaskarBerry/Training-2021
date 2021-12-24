Use Sampledb
Go



Set Transaction Isolation level Read Uncommitted 

Select * From [dbo].[order_bkp]





--------------------------
select cust_name 
From  dbo. order_bkp
Group by cust_name
Having count(cust_name)=1----without duplicate recodrs
-----------------------------