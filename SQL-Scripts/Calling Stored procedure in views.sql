USE CREDONet_Master

IF OBJECT_ID('tempdb..#Test') IS NOT NULL  DROP TABLE #Test

create table #test(id int,name varchar(20))

INSERT INTO #Test(ID,Name)

SElect 1,'Test' union all
SElect 2,'Test' union all
SElect 3,'Test'

CREATE PROCEDURE dbo.Usp_customer
AS
  BEGIN
      SELECT ID,
             Name
             
      FROM   #Test
  END 


EXEC sp_serveroption 'SERVERNAME\MSSQL2008', 'DATA ACCESS', TRUE


create view vw_getdata
AS
  SELECT *  FROM   OPENQUERY([WN7-30RXVS1\MSSQLSERVER2008], 'EXEC master.dbo.usp_Customer')
  
SELECT * FROM dbo.vw_getdata