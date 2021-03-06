USE Berry_DB
GO

SELECT * FROM SYS.TABLES
--INTRODUCED IN SQL SERVER 2012

--EMONTH returns a last day of the month
SELECT Eomonth(GETDATE(),1) AS Last_Month
SELECT DATEPART(DD, EOMONTH(GETDATE())) AS LASTDAY
SELECT DATEFROMPARTS(2089,12,28) AS DATEFORMAT
SELECT DATETIMEFROMPARTS(2000,10,3,12,28,8,89) AS TIMEPARTS
SELECT SMALLDATETIMEFROMPARTS(2000,10,30,12,28) AS TIMEPARTS
SELECT DATETIME2FROMPARTS(2019,09,23,12,23,12,6,4) AS Date2format
SELECT DATETIMEOFFSETFROMPARTS(2010,12,12,10,10,10,4,2,10,5) AS DateOFfset
