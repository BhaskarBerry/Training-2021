---Create a table Employee
--CREATE DATABASE [BerryTech_DB]
--USE [BerryTech_DB]
/*
CREATE TABLE [dbo].[Employee](
	[ID] INT NOT NULL PRIMARY KEY,
	[First_Name] VARCHAR(20) NULL,
	[Last_Name] VARCHAR(20) NULL,
	[DOB]	DATETIME NULL,
	[Gender] CHAR(1) NULL,
	[Description] NVARCHAR(20)
	)

INSERT INTO [Employee] ([ID],[First_Name],[Last_Name],[DOB],[Gender],[Description])	
SELECT 102,'Bse','Bhaskar','1989/12/17','M','Hello Berry' UNION
SELECT 103,'IMMAC','MERRY','1990/12/17','F','Hello Berry' UNION
SELECT 104,'Jhon','Jhon','1990/12/17','M','Hello Jhon' UNION
SELECT 105,'Sree','Mala','1990/12/17','F','Hello Mala' UNION
SELECT 106,'yub','Ayub','1990/12/17','M','Hello Ayub' UNION
SELECT 107,'Bhim','rao','1990/12/17','M','Hello rao'


SELECT * FROM Employee	

--DROP TABLE [Des_Employee]
CREATE TABLE [dbo].[Des_Employee](
	ID INT,
	[First_Name] VARCHAR(20) NULL,
	[Last_Name] VARCHAR(20) NULL,
	[DOB]	DATETIME NULL,
	[Gender] CHAR(1) NULL,
	[Description] NVARCHAR(20),
	[ULast] VARCHAR(20) NULL,
	[L_Des] NVARCHAR(20)
	)
	
SELECT * FROM Employee	
SELECT * FROM [Des_Employee]
*/

---Aggregate Transformation.

CREATE TABLE [dbo].[Des_Order_Details](
	[OrderID] [int]  NULL,
	[ProductID] [int]  NULL,
	[UnitPrice] [money]  NULL,
	[Quantity] [smallint]  NULL,
	[Discount] [real]  NULL
	)
	
select * from Order_Details order by [ProductID] ASC

select * from Des_Order_Details
DELETE FROM Des_Order_Details