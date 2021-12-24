USE Berry_DB
GO

SELECT * FROM tbl_Department
SELECT top 2 * FROM tbl_Department
UNION 
SELECT top 2 * FROM tbl_Department  WHERE id IN (SELECT top 2 ID FROM tbl_DEpartment  ORDER BY 1 desc)