USE CREDOm_JNJ

CREATE TABLE [dbo].[Customer](
 [id] int NULL ,
[Name] [varchar](100) NULL

) 

insert into dbo.[Customer]([id],[Name]) 
SELECT 1,'kk'union
SELECT 2,'dutta'

--Destination Table
CREATE TABLE [dbo].[DestinationTable](
 [Name] [varchar](100) NULL,
 [SaleDate] [datetime] NULL
)

select * FROM Employee

select * FROM Department

SELECT * FROM Employee
FULL OUTER JOIN Department Department ON Department.did=Employee.did




