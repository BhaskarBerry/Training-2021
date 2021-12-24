USE Berry_DB 
GO

SELECT * FROM sys.tables t

SELECT * FROM EMPLOYEE

CREATE TABLE tbl_Duplicate
( id int,Name varchar(20))

INSERT INTO tbl_Duplicate
SELECT 1,'a' UNION
SELECT 2,'b'

SELECT * FROM dbo.tbl_Duplicate td
--using CTE
WITH temp AS
(
SELECT ROW_NUMBER() OVER(PARTITION BY id ORDER BY id ASC ) AS RN ,ID,Name   FROM dbo.tbl_Duplicate
) 
DELETE FROM temp WHERE RN> 1
