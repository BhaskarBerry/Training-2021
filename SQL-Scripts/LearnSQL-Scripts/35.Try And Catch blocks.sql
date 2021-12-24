Use sampledb
Go


----------Try/Catch
create Procedure sp_trycatch

AS 
Begin
BEgin Try
		Begin Transaction
				Insert into [dbo].[ordersaudit] values(1,'fhdfl')
				Insert into [dbo].[ordersaudit] values('A','fhdfl')
		commit Transaction

End Try
Begin Catch
	Throw 
	Rollback Transaction
End catch
End


Exec sp_trycatch












 dbo.order_bkp
