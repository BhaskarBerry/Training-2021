use master
GO

/*How to Set databases from SINGLE USER mode to MULTI USER Mode in SQL Server*/
--For a chnaging the status for the single Database from single user to multiple user use the below Query

select * from sys.databases where name like '%berry_DB%'

ALTER DATABASE berry_DB SET MULTI_USER 
WITH ROLLBACK IMMEDIATE
/*
Use The cursor to loop through the list of databases which are in Single user mode and change to multi user database.
The select query can be modified to include or excluded database of your choice. Also script will take care of error.
Changes to the state or options of database '' cannot be made at this time. The database is in single-user mode, and a user is currently connected to it. 
as it will kill the processed attached to databases and set to multi user mode.
*/

USE MASTER
GO
DECLARE @DatabaseName AS VARCHAR(128)
DECLARE Cur CURSOR FOR
--Get list of Database those we want to put into Multi User Mode
	SELECT name from sys.databases where user_access_desc='Single_USER'
	OPEN Cur
	FETCH Next FROM Cur INTO @DatabaseName
	WHILE @@FETCH_STATUS = 0
		BEGIN
		--Innser  Cursor Start
		--Kill all user connection in case open for any database
		DECLARE @Spid INT
		DECLARE KillProcessCur CURSOR FOR
		SELECT request_session_id FROM   sys.dm_tran_locks 	WHERE  resource_database_id = DB_ID(@DatabaseName) 
		OPEN KillProcessCur
		FETCH Next FROM KillProcessCur INTO @Spid
		WHILE @@FETCH_STATUS = 0
			BEGIN
			  DECLARE @SQL VARCHAR(500)=NULL
			  SET @SQL='Kill ' + CAST(@Spid AS VARCHAR(5))
			  EXEC (@SQL)
			  PRINT 'ProcessID =' + CAST(@Spid AS VARCHAR(5))	+ ' killed successfull'
			  FETCH Next FROM KillProcessCur INTO @Spid
		  END
		CLOSE KillProcessCur
		DEALLOCATE KillProcessCur
--Inner Cursor Ends
--Outer Cursor: Put DB in Multi User Mode
      DECLARE @SQLSingleUSer NVARCHAR(MAX)=NULL
      SET @SQLSingleUSer='ALTER DATABASE ['+@DatabaseName+'] SET MULTI_USER WITH ROLLBACK IMMEDIATE'
         Print @SQLSingleUSer
         EXEC (@SQLSingleUSer)
      FETCH Next FROM Cur INTO @DatabaseName
  END
CLOSE Cur
DEALLOCATE Cur

--Check if all DBS are in Multi user Mode
Select name as DBName,state_desc,user_access_desc from sys.databases where user_access_desc='MULTI_USER' and database_id>4