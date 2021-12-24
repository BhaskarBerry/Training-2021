USE Berry_DB
GO

CREATE TABLE UnSparsed(ID INT IDENTITY(1,1),
FirstCol INT,
SecondCol VARCHAR(100),
ThirdCol SmallDateTime)
GO

CREATE TABLE Sparsed(ID INT IDENTITY(1,1),
FirstCol INT SPARSE,
SecondCol VARCHAR(100) SPARSE,
ThirdCol SmallDateTime SPARSE)
GO

DECLARE @idx INT = 0
WHILE @idx < 50000
BEGIN
INSERT INTO UnSparsed VALUES (NULL,NULL, NULL)
INSERT INTO Sparsed VALUES (NULL, NULL, NULL)
SET @idx+=1
END
GO

SELECT * FROM UnSparsed
SELECT * FROM Sparsed


sp_spaceused 'UnSparsed'
GO
sp_spaceused 'Sparsed'
GO
DROP TABLE UnSparsed
GO
DROP TABLE Sparsed
GO

-------------------------------------------------------------------------------------------------------
--A list of all columns that use the SPARSE property can be obtained via the is_sparse field in sys.columns:
------------------------------------------------------------------------------------------------------
SELECT so.name [Table Name], sc.name [Column Name] 
FROM sys.columns sc
JOIN sys.objects so
ON so.OBJECT_ID = sc.OBJECT_ID
WHERE is_sparse = 1
GO

ALTER TABLE UnSparsed
ADD DetailSet XML COLUMN_SET FOR ALL_SPARSE_COLUMNS

ALTER TABLE Sparsed
ADD DetailSet XML COLUMN_SET FOR ALL_SPARSE_COLUMNS

----------------------
/*Msg 1734, Level 16, State 1, Line 53
Cannot create the sparse column set 'DetailSet' in the table 'Sparsed' because the table already contains one or more sparse columns. A sparse column set cannot be added to a table if the table contains a sparse column.*/
----------------------------

CREATE TABLE Sparsed(ID INT IDENTITY(1,1),
FirstCol INT SPARSE,
SecondCol VARCHAR(100) SPARSE,
ThirdCol SmallDateTime SPARSE,
DetailSet XML COLUMN_SET FOR ALL_SPARSE_COLUMNS )
GO

select FirstCol,* from Sparsed

INSERT INTO Sparsed(FirstCol,SecondCol,ThirdCol)
select 1,NULL,NULL UNION
select 2,NULL,NULL UNION ALL
select NULL,NULL,NULL UNION ALL
select NULL,NULL,NULL UNION ALL
select NULL,NULL,NULL UNION ALL
select NULL,NULL,NULL UNION ALL
select 3,NULL,GETDATE()
----------------------------------------------------------------------------
CREATE TABLE Royalty
(  
   Chronology INT PRIMARY KEY,
   FirstName VARCHAR(50) SPARSE,
   LastName VARCHAR(50) SPARSE,
   CrownYear INT SPARSE,
   Region VARCHAR(100) SPARSE,
   Motto VARCHAR(100) SPARSE,
   DetailSet XML COLUMN_SET FOR ALL_SPARSE_COLUMNS 
)
GO

INSERT Royalty(Chronology, FirstName, CrownYear, Region, Motto)
VALUES (1, 'Catherine', 1509, 'Aragon', 'Humble and Loyal');
GO

INSERT Royalty(Chronology, FirstName, LastName, CrownYear, Motto)
VALUES (2, 'Anne', 'Boleyn', 1533, 'La Plus Heureuse');
GO

SELECT *  into Royal FROM Royalty
GO


select * from Royal

INSERT INTO Royalty(Chronology,DetailSet)
SELECT 3,'<FirstName>bERRY</FirstName><CrownYear>1509</CrownYear><Region>Aragon</Region><Motto>Humble and Loyal</Motto>'

