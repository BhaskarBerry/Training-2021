USE SOURCE_DB
GO

SELECT * FROM SYS.tables
--1.USing Top key word we can get top record
SELECT TOP 2 * FROM contact_Bkp
--2.Using Rowcount we can achive this to get the top count in rowcount 
SET ROWCOUNT 3
SELECT * FROM contact_Bkp  order BY 1 DESC
--3.Using OFFSET option we can achiev but this option is avaliable in 2012.
SELECT * from contact_Bkp ORDER BY id desc OFFSET 0  ROWS FETCH FIRST 2 ROWS ONLY
--4.To get top2 records USING cte
WITH TEMP AS
(
	SELECT  ROW_NUMBER() OVER (ORDER BY ID ASC) as RN ,* FROM contact_Bkp
)
SELECT * FROM TEMP WHERE RN <=2 ORDER BY 1 DESC
--5.to get top records using sub query
SELECT t.Id, t.Name,t.MAILD_iD FROM ( SELECT ID, Name,MAILD_id, ROW_NUMBER() OVER (ORDER BY Id) AS RowNumber  FROM contact_Bkp) t
WHERE RowNumber <= 2
--6.TO Get the top records ated queries corel
SELECT t.Id, t.Name FROM contact_Bkp t WHERE 3 > (SELECT count(*) FROM contact_Bkp t2 WHERE t.id > t2.id)





SELECT top 2 ID,NAME from contact_Bkp
UNION 
SELECT top 2 ID,NAME from contact_Bkp order by 1 desc
SELECT * from contact_Bkp ORDER BY id ASC OFFSET 0  ROWS FETCH FIRST 2 ROWS ONLY
