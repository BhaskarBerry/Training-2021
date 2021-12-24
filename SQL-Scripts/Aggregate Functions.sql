USE SOURCE_DB
GO

	SELECT * FROM sys.dm_tran_locks


SELECT MIN(1,2,3)
SELECT MAX(1,2,3)
SELECT AVG(1,2,3)

-----------------------------

SELECT MIN(1+2-3)
SELECT MAX(1+2/3)
SELECT AVG(1+2*3)

use Berry_DB
GO


create table students(Stu_ID int,course varchar(20),[start_date] date, endDate date)
SELECT * FROM students
	
SELECT MIN(start_date) FROM students---2010-01-01
SELECT MAX(start_date) FROM students--2010-01-03
SELECT COUNT(start_date) FROM students--3dd
SELECT SUM(start_date) FROM students--Operand data type date is invalid for sum operator.
SELECT AVG(start_date) FROM students	--Operand data type date is invalid for avg operator.
SELECT AVG(start_date,Enddate) FROM dbo.students --The AVG function requires 1 argument(s).
		