USE Berry_DB
Go

/*
How to put All User Databases to Single User Mode in SQL Server
*/
Alter database Berry_DB set single_user 
with rollback immediate

select user_access_desc,* from Sys.databases 
/*
To run the above query for multiple databases we can use Cursor.we want to choose all the databases or databases which start with Sales%. Make change to select query to select the databases you would like to put in single user mode.
*/
----Cursor to loop through all the databases.
USE MASTER
GO

DECLARE @DatabaseName AS VARCHAR(128)

DECLARE Cur CURSOR
FOR
--Get list of Database those we want to put into Single User Mode
SELECT NAME FROM sys.databases
WHERE user_access_desc = 'SINGLE_USER'
AND NAME NOT IN ('master','tempdb','model' ,'msdb' )

OPEN Cur

FETCH NEXT
FROM Cur INTO @DatabaseName

WHILE @@FETCH_STATUS = 0
BEGIN
    --Inner  Cursor Start
    --Kill all connection to DB before Putting into Single User Mode
    DECLARE @Spid INT

    DECLARE KillProcessCur CURSOR
    FOR
    SELECT request_session_id
    FROM sys.dm_tran_locks
    WHERE resource_database_id = DB_ID(@DatabaseName)

    OPEN KillProcessCur

    FETCH NEXT
    FROM KillProcessCur
    INTO @Spid

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @SQL VARCHAR(500) = NULL

        SET @SQL = 'Kill ' + CAST(@Spid AS VARCHAR(5))
		EXEC (@SQL)
		PRINT 'ProcessID =' + CAST(@Spid AS VARCHAR(5)) + ' killed successfull'

        FETCH NEXT
        FROM KillProcessCur
        INTO @Spid
    END
    CLOSE KillProcessCur
    DEALLOCATE KillProcessCur
    --Inner Cursor Ends
    --Outer Cursor: Put DB in single User Mode
    DECLARE @SQLSingleUSer NVARCHAR(MAX) = NULL
    SET @SQLSingleUSer = 'ALTER DATABASE [' + @DatabaseName + '] SET Multi_USER WITH ROLLBACK IMMEDIATE'
	PRINT @SQLSingleUSer
	EXEC (@SQLSingleUSer)

    FETCH NEXT
    FROM Cur
    INTO @DatabaseName
END

CLOSE Cur
DEALLOCATE Cur

--Check if all DBS are in Single Mode
SELECT NAME AS DBName ,state_desc ,user_access_desc FROM sys.databases WHERE user_access_desc = 'Multi_USER'


