
Declare @Doctors_bck1 Table 
(id int,Dname varchar(70))

Select *  
From[dbo].[Cars_details]

SELECT @@SERVICENAME

SELECT @@SERVERNAME

Select @@version


UPDATE dbo.cars_bck1
SET [status] = 'B'
OUTPUT INSERTED.*
WHERE [status] = '';


Create Type Dbo.Udt As TAble
(Id int )
Select * From Dbo.Udt

Drop Type Dbo.Udt

SELECT *
FROM sys.objects

SELECT object_id, name, type, create_date
FROM sys.objects


SELECT type, count(*) as c
FROM sys.objects
GROUP BY type
having count(*)<10


SELECT *
FROM sys.objects
ORDER BY object_id
OFFSET 50 ROWS FETCH first 10 ROWS ONLY

SELECT *
FROM sys.objects
ORDER BY object_id
OFFSET 50 ROWS


Declare @val Int=12
Select  @val As c, @val+8 As c2



SELECT id
FROM [dbo].[Cars_details]
WHERE model=''


set ansi_nulls on
SELECT id
FROM [dbo].[Cars_details]
WHERE model=''



Declare @val Int
Select ISnull(@val,3)

SELECT id
FROM [dbo].[Cars_bck1)]
WHERE  ISnull(totalcost,2)<>1

Select *  
From[dbo].[Cars_details]


DECLARE @Date date = null
SELECT CASE WHEN @Date = NULL THEN 1
WHEN @Date <> NULL THEN 2
WHEN @Date > NULL THEN 3
WHEN @Date < NULL THEN 4
WHEN @Date IS NULL THEN 5
WHEN @Date IS NOT NULL THEN 6
End


Select * From Dbo.Cars_bck1


Select * From Sys.Objects
Where Name like '%udt%'

Drop Type Dbo.Udt

DECLARE @convert_code INT = 105 -- See Table Below
SELECT CONVERT(VARCHAR(30), GETDATE(), @convert_code) AS [Result]

 Select GetDate()
--Date & Time Formatting using FORMAT
DECLARE @Date DATETIME = '2016-09-05 00:01:02.333'
SELECT FORMAT(@Date, N'dddd, MMMM dd, yyyy hh:mm:ss tt')


















.