use CREDONET_Master
GO

use CREDOm_ANZ
GO

/***********************************************************************************/
---Generally sql Developer should know
--Get the related Stored Procedure to a table
SELECT DISTINCT o.name, o.xtype FROM syscomments c INNER JOIN sysobjects o ON c.id=o.id
WHERE c.TEXT LIKE '%subunitdetails%'
/***********************************************************************************/
--Or you can use following query
SELECT Name FROM sys.procedures WHERE OBJECT_DEFINITION(OBJECT_ID) LIKE '%subunitDetail%'
 /***********************************************************************************/
--Get the related table to a Stored Procedure
;WITH stored_procedures AS (
SELECT o.name AS proc_name, oo.name AS table_name,ROW_NUMBER() OVER(partition by o.name,oo.name ORDER BY o.name,oo.name) AS row
FROM sysdepends d
INNER JOIN sysobjects o ON o.id=d.id
INNER JOIN sysobjects oo ON oo.id=d.depid WHERE o.xtype = 'P')
SELECT proc_name, table_name FROM stored_procedures
WHERE row = 1 AND proc_name LIKE '%W50GetLeaseCatCosts%'
ORDER BY proc_name,table_name 
/***********************************************************************************/
--Get the related trigger to a table
select so.name, text from sysobjects so, syscomments sc where type = 'TR' and so.id = sc.id and text like '%subunitdetail%'
/***********************************************************************************/
--Get the related views to a table
SELECT view_name, Table_Name FROM INFORMATION_SCHEMA.VIEW_TABLE_USAGE
WHERE Table_Name= 'activeusers'
ORDER BY view_name, table_name 
/***********************************************************************************/
---Get the related table to a view
SELECT view_name, Table_Name FROM INFORMATION_SCHEMA.VIEW_TABLE_USAGE
WHERE View_Name = 'YourViewName'
ORDER BY view_name, table_name 
/***********************************************************************************/
--Get the tables that do not have an identity column
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES where Table_NAME NOT IN(
SELECT DISTINCT c.TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS c
INNER JOIN sys.identity_columns ic ON (c.COLUMN_NAME=ic.NAME)) AND TABLE_TYPE ='BASE TABLE'
 
SELECT * FROM sys.identity_columns WHERE is_identity =1
/***********************************************************************************/
--Get a list of tables with the number of records of each table
CREATE TABLE #count(  table_name varchar(255),    row_count int
EXEC sp_MSForEachTable @command1='INSERT #counts (table_name, row_count) SELECT ''?'', COUNT(*) FROM ?' SELECT table_name, row_count FROM #counts ORDER BY table_name, row_count DESC
/***********************************************************************************/



































@