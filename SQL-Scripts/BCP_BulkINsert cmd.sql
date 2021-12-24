use Berry_DB
GO

select * from sys.tables

select * from tbl_Employee

/*
bcp {table|view|"query"}
    {out|queryout|in|format}
    {data_file|nul}
    {[optional_argument]...}

*/
bcp berry_DB.dbo.tbl_Employee out C:\Bhaskar_B\tbl_Employee.txt -S localhost\"WN7X64-GZDVD02\MSSQLSERVER_2014" –Usa –PJll_2015$

bulk insert 'C:\Bhaskar_B\tbl_Employee.txt'
from  Berry_DB.dbo.tbl_Customer
(
FIELDTERMINATOR ='|',
ROWTERMINATOR ='\n'

)
