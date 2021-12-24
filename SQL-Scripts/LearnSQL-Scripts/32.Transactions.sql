Use Sampledb
Go


-----Transactions

BEgin Transaction 
	Update dbo.order_bkp Set status='hjk' WHERE CUST_ID=6

Select * from order_bkp


------
Create Procedure sp_datachange
As
Begin
	Begin Try
		Begin Transaction
				Update dbo.order_bkp Set status='hjk' WHERE CUST_ID=6

				Update dbo.order_bkp Set status='hjk' WHERE CUST_ID='B'
		Commit transaction
		Print 'Transaction succes'
	End Try
	 Begin Catch
		Rollback Transaction
		Print 'Transaction Error'
	 End Catch
End;

Exec sp_datachange

Drop Proceure sp_datachange