USE Berry_DB
GO
--Create Function in SQL Server / T-SQL
--Multi-Statement Table-Valued Functions

create table dbo.tbl_employee(ID int, name nvarchar (10),salary int, start_date  datetime, city nvarchar (10), region      char (1))
GO

insert into dbo.tbl_employee (ID, name,    salary, start_date, city,       region)
SELECT 1,  'Jason', 40420,  '02/01/94', 'New York', 'W' UNION
SELECT 2,  'Robert',14420,  '01/02/95', 'Vancouver','N' UNION
SELECT 3,  'Celia', 24020,  '12/03/96', 'Toronto',  'W' UNION
SELECT 4,  'Linda', 40620,  '11/04/97', 'New York', 'N' UNION
SELECT 5,  'David', 80026,  '10/05/98', 'Vancouver','W' UNION
SELECT 6,  'James', 70060,  '09/06/99', 'Toronto',  'N' UNION
SELECT 7,  'Alison',90620,  '08/07/00', 'New York', 'W' UNION
SELECT 8,  'Chris', 26020,  '07/08/01', 'Vancouver','N' UNION
SELECT 9,  'Mary',  60020,  '06/09/02', 'Toronto',  'W' 

select * from dbo.tbl_employee
GO
/*ID	name	salary	start_date	city	region
------------------------------------------------------------
1	Jason	40420	1994-02-01 00:00:00.000	New York	W
2	Robert	14420	1995-01-02 00:00:00.000	Vancouver	N
3	Celia	24020	1996-12-03 00:00:00.000	Toronto	W
4	Linda	40620	1997-11-04 00:00:00.000	New York	N
5	David	80026	1998-10-05 00:00:00.000	Vancouver	W
6	James	70060	1999-09-06 00:00:00.000	Toronto	N
7	Alison	90620	2000-08-07 00:00:00.000	New York	W
8	Chris	26020	2001-07-08 00:00:00.000	Vancouver	N
9	Mary	60020	2002-06-09 00:00:00.000	Toronto	W*/
--------------------------------------------------------------------------------
-- Multi-Statement Table-Valued Functions
ALTER FUNCTION dbo.MultiValued_Fnc(@ID Int)
   RETURNS @EmployeeList Table (  ID     Int , Name   nVarChar(50) , Salary Money)
 AS
   BEGIN
     IF @ID IS NULL
       BEGIN
         INSERT INTO @EmployeeList (ID, Name, Salary)
         SELECT ID, Name, Salary  FROM dbo.tbl_employee
       END
     ELSE
       BEGIN
         INSERT INTO @EmployeeList (ID, Name, Salary)
          SELECT ID, Name, Salary  FROM dbo.tbl_employee   WHERE ID = @ID
	   END
     RETURN
   END
 GO
--------------------------------------------------------------------------------
select * from dbo.MultiValued_Fnc(2)
 GO
/*ID	Name	Salary
-----------------------
2	Robert	14420.00*/
DROP FUNCTION dbo.MultiValued_Fnc
--------------------------------------------------------------------------------
-- Inline Table-Valued Functions
 ALTER FUNCTION dbo.Inline_fun(@ID Int)
   RETURNS Table
 AS
  RETURN
   ( SELECT ID, Name, Salary FROM dbo.tbl_employee    WHERE ID = @ID)
  GO

 SELECT * FROM dbo.Inline_fun(7)
/*ID	Name	Salary
------------------
7	Alison	90620*/       
--------------------------------------------------------------------------------
--UDFs Returning a Scalar Value
select * FROM dbo.tbl_employee
 DECLARE @Counter int
 SET @Counter = 1
	WHILE @Counter < 10
	 BEGIN
	    INSERT INTO dbo.tbl_employee (Start_date)VALUES ( DATEADD(mi,@Counter,GETDATE()))
	    SET @Counter = @Counter + 1
	 END

SELECT * FROM dbo.tbl_employee
GO
--------------------------------------------------------------------------------
--Define function to get last name

ALTER FUNCTION dbo.fnName (@Name VarChar(100))
   RETURNS VarChar(100)
 AS
   BEGIN
      DECLARE @CommaPosition Int, @LastName varchar(100)
      SET @CommaPosition = CHARINDEX(@Name,',')
      SET @LastName = SUBSTRING(@Name, 1, @CommaPosition)
      RETURN @LastName
   END
 GO
 --------------------------------------------------------------------------------
 --Define user function and use it in select statement
 CREATE FUNCTION dbo.ufnIsOdd (@n int)
 RETURNS bit
 AS
 BEGIN
    RETURN (@n % 2)
 END
 GO
 
DECLARE @numb int
 SET @numb = 6
 SELECT @numb 'Number', dbo.ufnIsOdd (@numb) 'Is_odd = 1'
 SET @numb = 7
 SELECT @numb 'Number', dbo.ufnIsOdd (@numb) 'Is_odd = 1'
--------------------------------------------------------------------------------

--Store Procedure Function
 --------------------------------------------------------------------------------
--Performing Data Manipulation: Adding a New Row
CREATE PROC AddRecord
  @ID int,
  @Name varchar(50)
 AS
 INSERT dbo.tbl_employee (ID, Name) VALUES (@ID, @Name)
 GO

 EXEC AddRecord 5, 'DBA-Berry'
GO

SELECT * FROM dbo.tbl_employee
 GO
/*ID	name	salary	start_date	city	region
------------------------------------------------------
1	Jason	40420	1994-02-01 00:00:00.000	New York	W
2	Robert	14420	1995-01-02 00:00:00.000	Vancouver	N
3	Celia	24020	1996-12-03 00:00:00.000	Toronto	W
4	Linda	40620	1997-11-04 00:00:00.000	New York	N
5	DBA-Berry	NULL	NULL	NULL	NULL*/ 
 --------------------------------------------------------------------------------
 --Returning a Single Result Set from a procedure
  --Check to see if a procedure exists and Returning a Single Result Set 
IF EXISTS(SELECT * FROM sys.objects WHERE type = 'P' AND name = 'usp_getData')
     DROP PROCEDURE usp_getData
 GO

 CREATE PROCEDURE usp_getData
 AS
 SELECT * from dbo.tbl_employee
 GO

 EXEC usp_getData
GO
--------------------------------------------------------------------------------
--Define procedure to insert or update
 --Altering Objects
 /* Checks for existing Employee record  If exists, updates the record.  If not,  inserts new record */

CREATE PROCEDURE dbo.spInsertOrUpdateEmployee
   -- Input parameters --
    @Name nVarChar(50),
    @salary Money
 AS
     IF EXISTS (SELECT * FROM Employee WHERE name = @name)
        UPDATE Employee
        SET Salary = @salary
        WHERE Name = @Name
     ELSE
        INSERT INTO dbo.tbl_employeeu (Name, salary)
        SELECT @Name, @salary
     IF @@Error <> 0
        RAISERROR 50001 'spInsertUpdateProduct execution'
 GO

 EXEC spInsertOrUpdateEmployee 'Mary', 999999
 GO

