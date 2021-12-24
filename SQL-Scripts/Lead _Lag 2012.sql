USE SOURCE_DB
GO

SELECT * FROM INFORMATION_SCHEMA.TABLES

CREATE TABLE TblLead(name varchar(5))
INSERT INTO TblLead(name)
	SELECT 'A' UNION
	SELECT 'B' UNION
	SELECT 'C' UNION
	SELECT 'D' UNION
	SELECT 'E' 

SELECT name  FROM TblLead 

CREATE TABLE ##Temp(Id int Identity(1,1),name varchar(5))

	INSERT INTO ##Temp( name)
	SELECT name  FROM TblLead 
	SELECT * FROM ##Temp

DELETE from ##Temp WHERE name ='E'
	
CREATE TABLE tblLag(name1 varchar(5),name varchar(5))
----Logic
DECLARE @N int
SELECT @N = Count (1) FROM ##Temp
WHILE (@N > 1)
	BEGIN
		INSERT INTO tblLag (name1,name)
		SELECT *  FROM 	(SELECT name , lead(name,@N-1) OVER(ORDER BY name) AS Na FROM ##Temp	)	 AS tblN WHERE tblN.Na IS not null
		SET @N = @N-1
	END

SELECT * FROM tblLag ORDER BY 1,2 ASC

SELECT *  FROM 	(SELECT name , lead(name,0) OVER(ORDER BY name) AS Na FROM ##Temp	) AS a

TRUNCATE TABLE tblLag


SELECT id,department,Code,
LEAD(Code,2) OVER (ORDER BY Code ) LeadValue,
LAG(Code,2) OVER (ORDER BY Code ) LagValue
FROM test_table

---passing default value to null value with 0.
SELECT id,department,Code,
LEAD(Code,2,0) OVER (ORDER BY Code ) LeadValue,
LAG(Code,3,0) OVER (ORDER BY Code ) LagValue
FROM test_table