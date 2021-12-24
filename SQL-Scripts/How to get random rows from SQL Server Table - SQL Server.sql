use Berry_DB
go

-----How to get random rows from SQL Server Table - SQL Server------
/*We can use the same Top clause but as we are asked to provide the random records, we need to sort them randomly first. We can use newid() function in order by clause to sort them randomly.
1.Using NEWID().
2.By using TABLESAMPLE SYSTEM 
 "TABLESAMPLE SYSTEM returns an approximate percentage of rows and generates a random value for each physical 8-KB page in the table. Based on the random value for a page and the percentage specified in the query, a page is either included in the sample or excluded. Each page that is included returns all rows in the sample result set".
 From here you can understand that if you have small table with few pages , you might not want to use TableSample as it will include or exclude the entire page. With few records in table, you might want to use method 1 and for large tables you can use TableSample.
 If I would run below query on my dbo.Customer table, Sometime I will get no records and when get the records, it will return all the records as they are placed on single page.
*/

select * from INFORMATION_SCHEMA.TABLES
select top 3* from tbl_Employee ORDER by NEWID()
select * from tbl_Employee
select top 50 PERCENT * from tbl_Employee ORDER by NEWID()

Select * from dbo.tbl_Employee TABLESAMPLE(30 PERCENT) 
/*
If you want to limit, you can use below query. Once again, I will suggest to use TableSample with big table where you have data on multiple data pages.
*/
Select  top 3 * from dbo.tbl_Employee TABLESAMPLE(3 ROWS) 