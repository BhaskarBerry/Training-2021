USE SOURCE_DB
GO

DECLARE @X NVARCHAR(5)
SET @X= NULL
SELECT ISNULL(@X,'ABCDEFGH')
--ABCDE
--NOTE : It displays the length of the variable
SELECT COALESCE(@X,'ABCDEFGHIJKL')
--ABCDEFGHIJKL



