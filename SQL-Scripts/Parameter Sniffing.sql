USE berry_DB
---The process of looking at parameter values when compiling a stored procedure is commonly called “parameter sniffing”
/*SQL erver tries to optimize the execution of your stored procedures by creating compiled execution plans.  An execution plan for a stored procedure is created the first time a stored procedure is executed.  When the SQL Server database engine compiles a stored procedure it looks at the parameter values being passed and creates an execution plan based on these parameters.  The process of looking at parameter values when compiling a stored procedure is commonly called “parameter sniffing”.  Parameter sniffing can lead to inefficient execution plans sometimes; especially when a stored procedure is called with parameter values that have different cardinality. */
SET NOCOUNT ON;
--DROP TABLE BillingInfo;
----Create table 
CREATE TABLE BillingInfo(ID INT IDENTITY,BillingDate DATETIME,BillingAmt MONEY,BillingDesc varchar(500)); 
DECLARE @I INT;
DECLARE @BD INT;
SET @I = 0;
WHILE @I < 1000000
BEGIN
	  SET @I = @I + 1;
	  SET @BD=CAST(RAND()*10000 AS INT)%3650;
	  INSERT BillingInfo (BillingDate, BillingAmt)
	  VALUES (DATEADD(DD,@BD,  CAST('1999/01/01' AS DATETIME)), RAND()*5000);
END
 
ALTER TABLE BillingInfo   ADD  CONSTRAINT [PK_BillingInfo_ID]  PRIMARY KEY CLUSTERED (ID);
 
CREATE NONCLUSTERED INDEX IX_BillingDate  ON dbo.BillingInfo(BillingDate);

SELECT * FROM BillingInfo

---Procedure.

CREATE PROC [dbo].[DisplayBillingInfo]
  @BeginDate DATETIME,
  @EndDate DATETIME
AS
SELECT BillingDate, BillingAmt
  FROM BillingInfo
  WHERE BillingDate between @BeginDate AND @EndDate; 

---Ist set 
SET STATISTICS IO ON;
DBCC FREEPROCCACHE;
EXEC dbo.DisplayBillingInfo
  @BeginDate = '1999-01-01', 
  @EndDate  = '1999-12-31'; 
 
EXEC dbo.DisplayBillingInfo
  @BeginDate = '2005-01-01', 
  @EndDate  = '2005-01-03';
  /*
  Table 'BillingInfo'. Scan count 1, logical reads 3597, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'BillingInfo'. Scan count 1, logical reads 3597, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
  */
  --2nd set
  SET STATISTICS IO ON;
DBCC FREEPROCCACHE;
EXEC dbo.DisplayBillingInfo
  @BeginDate = '2005-01-01', 
  @EndDate  = '2005-01-03';
 
EXEC dbo.DisplayBillingInfo
  @BeginDate = '1999-01-01', 
  @EndDate  = '1999-12-31'; 
  /*
  Table 'BillingInfo'. Scan count 1, logical reads 2676, physical reads 0, read-ahead reads 5, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'BillingInfo'. Scan count 1, logical reads 336645, physical reads 0, read-ahead reads 4, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
    */


---solution for parameter sniffing
--Option 1: With Recompile

DROP PROC [dbo].[DisplayBillingInfo]
GO
CREATE PROC [dbo].[DisplayBillingInfo]
  @BeginDate DATETIME,
  @EndDate DATETIME
WITH RECOMPILE
AS
SELECT BillingDate, BillingAmt
  FROM BillingInfo
  WHERE BillingDate between @BeginDate AND @EndDate; 

  DBCC FREEPROCCACHE;
EXEC dbo.DisplayBillingInfo
  @BeginDate = '2005-01-01', 
  @EndDate  = '2005-01-03';
 --index seek 
EXEC dbo.DisplayBillingInfo
  @BeginDate = '1999-01-01', 
  @EndDate  = '1999-12-31';
  --Index scan
  /*
  Table 'BillingInfo'. Scan count 1, logical reads 2676, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'BillingInfo'. Scan count 1, logical reads 3597, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
  */

  --Option 2: Disabling Parameter Sniffing

DROP PROC [dbo].[DisplayBillingInfo]
GO
CREATE PROC [dbo].[DisplayBillingInfo]
  @BeginDate DATETIME,
  @EndDate DATETIME
WITH RECOMPILE
AS
DECLARE @StartDate DATETIME;
DECLARE @StopDate DATETIME;
SET @StartDate = @BeginDate;
SET @StopDate = @EndDate;
SELECT BillingDate, BillingAmt
  FROM BillingInfo
  WHERE BillingDate between @StartDate AND @StopDate; 

  --Option 3: Creating Multiple Stored Procedures

  CREATE PROC [dbo].[DisplayBillingInfoNarrow]
  @BeginDate DATETIME,
  @EndDate DATETIME
AS
SELECT BillingDate, BillingAmt
  FROM BillingInfo
  WHERE BillingDate between @BeginDate AND @EndDate; 
GO
CREATE PROC [dbo].[DisplayBillingInfoWide]
  @BeginDate DATETIME,
  @EndDate DATETIME
AS
SELECT BillingDate, BillingAmt
  FROM BillingInfo
  WHERE BillingDate between @BeginDate AND @EndDate; 
GO 
DROP PROCEDURE [dbo].[DisplayBillingInfo];
GO 
CREATE PROC [dbo].[DisplayBillingInfo]
  @BeginDate DATETIME,
  @EndDate DATETIME
AS
IF DATEDIFF(DD,@BeginDate, @EndDate) < 4
  EXECUTE DisplayBillingInfoNarrow @BeginDate, @EndDate
ELSE
  EXECUTE DisplayBillingInfoWide @BeginDate, @EndDate
GO
 

 -------
 DBCC FREEPROCCACHE;
EXEC dbo.DisplayBillingInfo
  @BeginDate = '2005-01-01', 
  @EndDate  = '2005-01-03';
 
EXEC dbo.DisplayBillingInfo
  @BeginDate = '1999-01-01', 
  @EndDate  = '1999-12-31';

----------------------------------- 