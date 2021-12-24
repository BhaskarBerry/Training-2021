USE Berry_DB
GO



---2nd way using coalesce
DECLARE @Csv VARCHAR(1000) 
SELECT @csv = COALESCE(@Csv+',', '')+NAME
FROM [dbo].tbl_Employee
SELECT @Csv
/* PUTTA,MALA,RAGHU,SYAM,RAM,NAYAN,raghu*/

---3rd way using stuff function
SELECT  STUFF((SELECT  ',' + EE.NAME
            FROM tbl_Employee EE
            WHERE  EE.ID=E.ID
            ORDER BY EE.NAME
        FOR XML PATH('')), 1, 1, '') AS listStr

FROM tbl_Employee E
GROUP BY E.ID
----------------------------------------------------------------------------------------------
--The following T-SQL scripts demonstrate the building of comma delimited list:
-- EXAMPLE 1 - Using XML PATH (SQL Server 2005 and on)
-- T-SQL create comma delimited list from single column result
SELECT ColorCommaDelimitedList =
Stuff((SELECT ', ' + name AS [text()]
        FROM  
        (SELECT DISTINCT name FROM tbl_Employee
         ) x
        For XML PATH ('')),1,1,'')
-----------------
SELECT CASE WHEN LEN(NAME) > 0 THEN LEFT(NAME, LEN(NAME)-1) ELSE '' END AS NAME 
FROM (
SELECT p.name +',' 
FROM dbo.tbl_Employee p
FOR XML PATH('')
)tmp (name)
/*
NAME
--------
PUTTA,MALA,RAGHU,SYAM,RAM,NAYAN,raghu
*/
------------
 
-- EXAMPLE 2 - Using XML PATH & CTE (SQL Server 2005 and on)
-- T-SQL create comma delimited list using CTE - Common Table Expression
;WITH cte AS
(SELECT DISTINCT name FROM tbl_Employee)
 SELECT ColorCommaDelimitedList =
   Stuff((SELECT ', ' + name AS [text()]
          FROM cte 
          For XML PATH ('')),1,1,'')
 /*
ColorCommaDelimitedList
 MALA, NAYAN, PUTTA, RAGHU, RAM, SYAM
 */
------------
 
-- EXAMPLE 3 - Using local variable (SQL Server 2000 and before)

 
-- T-SQL creating comma delimited list with local variable & multiple statements
DECLARE @CommaLimitedList VARCHAR(MAX) = ''
bw	`SELECT @CommaLimitedList = Color + ', ' + @CommaLimitedList
FROM (SELECT DISTINCT Color FROM Production.Product WHERE Color is not null) x
SELECT CommaDelimitedList=@CommaLimitedList
GO
/*
CommaDelimitedList
Yellow, White, Silver/Black, Silver, Red, Multi, Grey, Blue, Black,
*/
 ------------
 
-- EXAMPLE 4 - Using XML PATH & correlated subquery for sublist

 
-- Create comma delimited sublist
SELECT   Subcategory = ps.[Name],
         ColorList = Stuff((SELECT DISTINCT  ', ' + Color AS [text()]
                            FROM AdventureWorks2008.Production.Product p
                            WHERE p.ProductSubcategoryID = ps.ProductSubcategoryID
                            FOR XML PATH ('')),1,1,'')
FROM     AdventureWorks2008.Production.ProductSubcategory ps
ORDER BY Subcategory;
GO
/*
Subcategory             ColorList
....
Helmets                 Black, Blue, Red
Hydration Packs         Silver
Jerseys                 Multi, Yellow
....
*/
------------

-- EXAMPLE 5 - Preparing spaces delimited list

-- T-SQL make spaces delimited list of ProductNumbers
SELECT Alpha.List.value('.','varchar(256)') AS DelimitedList 
FROM   (SELECT   TOP ( 5 ) ProductNumber + '    ' 
        FROM     AdventureWorks2008.Production.Product 
        ORDER BY ProductNumber DESC 
        FOR XML PATH(''), TYPE) AS Alpha(List); 
/*
DelimitedList
WB-H098    VE-C304-S    VE-C304-M    VE-C304-L    TT-T092    
*/

------------