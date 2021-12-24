USE SOURCE_DB
GO

--CREATE TABLE SeqObj_tbl (ID INT ,Name NVARCHAR(10))

--Syntax for creating Sequence Obj
CREATE SEQUENCE dbo.[SeqObj]	 AS INT START WITH 1 INCREMENT BY 1 

--Sequence objects with Increment by 2
CREATE SEQUENCE dbo.[SeqObj_Bkp]	AS INT START WITH 100 INCREMENT BY 2

--For small int datatype
CREATE SEQUENCE dbo.[SeqObj_SmallInt]	AS smallint START WITH 1000 INCREMENT BY 1

--For tinyINt datatype
CREATE SEQUENCE dbo.[SeqObj_TinyInt]	AS tinyint START WITH 1 INCREMENT BY 1

--For Default datatype -- it takes big int as defualt
CREATE SEQUENCE dbo.[SeqObj_Default]	START WITH 1 INCREMENT BY 1 

--For BigInt datatype
CREATE SEQUENCE dbo.[SeqObj_BigINT]	AS bigint START WITH 1 INCREMENT BY 1

--For Decimal datatype
CREATE SEQUENCE dbo.[SeqObj_Decimal]	 AS decimal  START WITH 100 INCREMENT BY 2

--For decrementing the incrermet value should be in negative value
CREATE SEQUENCE dbo.[SeqObj_Dec]	AS INT START WITH 100 INCREMENT BY -2

---Droping sequence object
DROP SEQUENCE [SeqObj_TinyInt]

--Generating next sequence value
SELECT NEXT VALUE FOR SeqObj
SELECT NEXT VALUE FOR SeqObj_Bkp
SELECT NEXT VALUE FOR SeqObj_Dec
SELECT NEXT VALUE FOR [SeqObj_TinyInt]

/*GO 256-- Error message once reaches the limit:-The sequence object 'SeqObj_TinyInt' has reached its minimum or maximum value. Restart the sequence object to allow new values to be generated.*/

--Retrieving the current sequence value.
SELECT current_value FROM sys.sequences WHERE name LIKE '%SeqObj%'
SELECT * FROM sys.sequences WHERE name LIKE '%SeqObj%' ORDER BY create_date desc

--Reset the sequence value.
ALTER SEQUENCE [SeqObj_TinyInt] RESTART WITH 5

--Using the sequence value in an insert query.
INSERT INTO SeqObj_tbl VALUES(NEXT VALUE FOR  [SeqObj_TinyInt] ,'Bhaskar')
INSERT INTO SeqObj_tbl VALUES(NEXT VALUE FOR  [SeqObj_TinyInt] ,'Berry')
INSERT INTO SeqObj_tbl VALUES(NEXT VALUE FOR  [SeqObj_TinyInt] ,'Raghu')
--SELECT * FROM SeqObj_tbl 

--Specifing the LIMIT ,i.e. MINVALUE and MAXVALUE
CREATE SEQUENCE dbo.[SO_Limit]
AS INT
START WITH 100
INCREMENT BY 10
MINVALUE 100
MAXVALUE 150

SELECT * FROM sys.sequences ORDER BY create_date DESC

--Specifing the LIMIT ,i.e. MINVALUE and MAXVALUE along with that cycle 
CREATE SEQUENCE dbo.[SO_Limit_Cycle]
AS INT
START WITH 100
INCREMENT BY 10
MINVALUE 100
MAXVALUE 150
CYCLE 

--SELECT NEXT VALUE  FOR [SO_Limit_Cycle]
--INSERT INTO SeqObj_tbl VALUES(NEXT VALUE FOR  [SO_Limit_Cycle] ,'Raghu')
--GO 12

--TRUNCATE TABLE SeqObj_tbl
--SELECT * FROM SeqObj_tbl

--Specifing the cache size to improve performance
CREATE SEQUENCE dbo.[SO_Cache]
AS INT
START WITH 100
INCREMENT BY 10
CACHE 20
