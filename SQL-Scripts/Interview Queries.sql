CREATE TABLE dbo.SaleHisTory
  (
     ID             INT IDENTITY(1, 1),
     SalePersonName VARCHAR(100),
     SaleCountry    VARCHAR(50),
     SaleAmt        INT,
     SheetName      VARCHAR(100)
  ) 
  
  SELECT * FROM SaleHisTory
  
  CREATE TABLE [dbo].[SourceTable](
 [Name] [varchar](100) NULL,
 [SaleDate] [varchar](50) NULL
) 

insert into dbo.SourceTable 
SELECT 'Aamir','2013-12-03 10:19:56.887' UNION
SELECT 'Raza','Test Date'

--Destination Table
CREATE TABLE [dbo].[DestinationTable](
 [Name] [varchar](100) NULL,
 [SaleDate] [datetime] NULL
)

select * FROM [DestinationTable]

--http://www.bullraider.com/database/sql-tutorial/7-complex-queries-in-sql

--Interview Queries

use temp1
drop TABLE Employee_Test
CREATE TABLE Employee_Test
(
Emp_ID INT 
)

INSERT INTO Employee_Test VALUES (1000);
INSERT INTO Employee_Test VALUES (1000);
INSERT INTO Employee_Test VALUES (2000);
INSERT INTO Employee_Test VALUES (2000);




SELECT * FROM Employee_Test ORDER BY Emp_Sal DESC

 --http://howtodoinjava.com/2013/01/09/sql-query-to-find-find-the-nth-highest-salary-of-an-employee/
--TOP 1
SELECT TOP 1 Emp_Sal FROM Employee_Test ORDER BY Emp_Sal DESC
--TOP 2
SELECT MIN(Emp_Sal) FROM Employee_Test WHERE Emp_Sal IN(SELECT Top 2 EMP_Sal FROM Employee_Test ORDER BY Emp_Sal DESC)
--TOP 3

SELECT MIN(Emp_Sal) FROM Employee_Test WHERE Emp_Sal IN(SELECT TOP 3 Emp_Sal FROM Employee_Test ORDER BY Emp_Sal DESC)
--Find Any Highest Salary but it has some permonce issue because inner query need to process everytime and its depedent on Outer Query
SELECT *
FROM Employee_Test Emp1
WHERE (7) = (
SELECT COUNT( DISTINCT ( Emp2.Emp_Sal ) )
FROM Employee_Test Emp2
WHERE Emp2.Emp_Sal >= Emp1.Emp_Sal
)
--To Avoid that there is an second option for this.

SELECT MIN(Emp_Sal)
FROM
(
    SELECT DISTINCT TOP 3 Emp_Sal
    FROM EMPLOYEE_TEST
    ORDER BY Emp_Sal DESC
) Emp2
ORDER BY Emp_Sal
WHERE Emp2.Emp_Sal >= Emp1.Emp_Sal


---=======================================================================================
--Finding TOP X records from each group

create table photo_test
(
pgm_main_Category_id int,
pgm_sub_category_id int,
file_path varchar(MAX)
)

insert into photo_test values(17,15,'photo/bb1.jpg')                                                      
insert into photo_test values(17,16,'photo/cricket1.jpg')                                                    
insert into photo_test values(17,17,'photo/base1.jpg')                                                       
insert into photo_test values(18,18,'photo/forest1.jpg')                                                       
insert into photo_test values(18,19,'photo/tree1.jpg')                                                           
insert into photo_test values(18,20,'photo/flower1.jpg')                                                     
insert into photo_test values(19,21,'photo/laptop1.jpg')                                                       
insert into photo_test values(19,22,'photo/camer1.jpg')                                                 
insert into photo_test values(19,23,'photo/cybermbl1.jpg')                                                    
insert into photo_test values(17,24,'photo/F1.jpg')

select count(pgm_sub_category_id),pgm_main_Category_id from photo_test group by pgm_main_Category_id

select pgm_main_Category_id,pgm_sub_category_id,file_path  from (
select pgm_main_Category_id,pgm_sub_category_id,file_path,RANK() over (partition by pgm_main_Category_id order by pgm_sub_category_id) as rankid
from photo_test) photo_test1 where rankid <3

--======================================================================================================================
--Delete Duplicates
CREATE TABLE Employee_Test1
(
Emp_ID INT,
Emp_name Varchar(100),
Emp_Sal Decimal (10,2)
)

INSERT INTO Employee_Test1 VALUES (1,'Anees',1000);
INSERT INTO Employee_Test1 VALUES (2,'Rick',1200);
INSERT INTO Employee_Test1 VALUES (3,'John',1100);
INSERT INTO Employee_Test1 VALUES (4,'Stephen',1300);
INSERT INTO Employee_Test1 VALUES (5,'Maria',1400);
INSERT INTO Employee_Test1 VALUES (6,'Tim',1150);
INSERT INTO Employee_Test1 VALUES (6,'Tim',1150);


select * from Employee_Test1 group by Emp_ID,Emp_name,Emp_Sal

select * from Employee_Test1

USE Temp
select Emp_ID,Emp_name,Emp_Sal,row_number() over (partition by Emp_ID order by Emp_ID) as rankid from employee_test1

;with T as
(
	select * , row_number() over (partition by Emp_ID order by Emp_ID) as rank
	from employee_test1
)

delete
from T
where rank > 1

--Scenario if you want fetch the employess where department is not assigned
CREATE TABLE EMp(id int,Name Varchar(50))

INSERT INTO EMp(id,Name)
SELECT 1,'A' UNION
SELECT 2,'B' UNION
SELECT 3,'C' UNION
SELECT 4,'D' UNION
SELECT 5,'E' UNION
SELECT 6,'F' 


CREATE TABLE Dep(id int,Name varchar(50),Eid Varchar(50))

INSERT INTO Dep(id,Name,Eid)

SELECT 7,'M1',1 UNION
SELECT 8,'M2',2 UNION
SELECT 9,'M3',1 UNION
SELECT 10,'M4',2 UNION
SELECT 11,'M5',3 UNION
SELECT 12,'M6', 4

SELECT Emp.id,EMp.Name,Dep.Eid 
FROM EMp LEFT JOIN Dep ON Emp.id= CONVERT(INT,Dep.eid)
WHERE Dep.eid is NULL

USE Temp

--Find Employees who worked on more than one department
SELECT Count(Eid),Name
FROM Emp 
INNER JOIN Dep ON Dep.Eid=Emp.id
GROUP BY Name HAVING Count(Eid)>1

--2 nd Option
SELECT Name FROM EMp WHERE ID IN (
(Select DISTINCT id from emp) EXCEPT (Select Eid from Dep))

--Calling Stored Procedures In Views
USE CREDONet_Master

IF OBJECT_ID('tempdb..#Test') IS NOT NULL  DROP TABLE #Test

create table #test(id int,name varchar(20))

INSERT INTO #Test(ID,Name)

SElect 1,'Test' union all
SElect 2,'Test' union all
SElect 3,'Test'

CREATE PROCEDURE dbo.Usp_customer
AS
  BEGIN
      SELECT ID,
             Name
             
      FROM   #Test
  END 


EXEC sp_serveroption 'SERVERNAME\MSSQL2008', 'DATA ACCESS', TRUE


create view vw_getdata
AS
  SELECT *  FROM   OPENQUERY([WN7-30RXVS1\MSSQLSERVER2008], 'EXEC master.dbo.usp_Customer')
  
SELECT * FROM dbo.vw_getdata

--Replace 

DECLARE @Name Varchar(50)
SET @Name='India'
SELECT REPLACE(@Name,'d','b')
--SELECT @Name

----Self join Example

--CREATE TABLE Emp(eid int,ename varchar(20),mid int)

--INSERT INTO Emp(eid,ename,mid)

--SELECT 1,'A',1 UNION
--SELECT 2,'B',2 UNION
--SELECT 3,'C',5 UNION
--SELECT 4,'D',8 UNION
--SELECT 5,'E',1 UNION
--SELECT 6,'F',2 UNION
--SELECT 7,'G',4 UNION
--SELECT 8,'H',3 

SELECT * FROM Emp WHERE mid=1 ORDER BY mid

SELECT m.ename Manger,E.ename Employee
FROM Emp E  
join Emp m ON M.mid=E.eid
WHERE m.mid=1
ORDER BY m.ename

--Get Top 2,3 Salaries in Each DepartMent
DROP TABLE Employee_Test
CREATE TABLE Employee_Test
(
Emp_ID INT Identity,
Emp_name Varchar(100),
Emp_Sal Decimal (10,2),
DepName Varchar(100),
Sex Char(1)
)


INSERT INTO Employee_Test(Emp_name,Emp_Sal,DepName,Sex)
SELECT 'A',1000,'IT','M' UNION
SELECT 'B',2000,'HR','M' UNION
SELECT 'C',3000,'IT','M' UNION
SELECT 'D',6000,'HR','M' UNION
SELECT 'E',9000,'HR','M' UNION
SELECT 'F',5000,'Pay','M' UNION
SELECT 'G',9000,'Pay','M' 

SELECT * FROM Employee_Test ORDER BY DepName


SELECT DepName,Emp_Sal FROM Employee_Test GROUP BY DepName,Emp_Sal


SELECT DepName,MAx(Emp_Sal)
FROM Employee_Test 
GROUP BY DepName

--How to find out department wise second maximum salary.
;With T AS
(
SELECT *,RANK()OVER(PARTITION BY DepName ORDER BY Emp_Sal) AS Sal FROM Employee_Test 
)
--SELECT * FROM T
SELECT * FROM T WHERE Sal IN(2)


SELECT * FROM Employee_Test ORDER BY DepName

SELECT max(Emp_Sal)
FROM Employee_Test
WHERE Emp_Sal NOT IN
    (SELECT max(Emp_Sal)
     FROM Employee_Test
     GROUP BY DepName)
GROUP BY DepName
 

CREATE TABLE WorksFor (
employerID int identity(1,1) primary key,
pname varchar(30),
cname varchar(20),
salary int
);

INSERT INTO WorksFor(pname,cname,salary)
VALUES
('John Smith','BigStore',27500),
('Jane Doe','SmallStore',19000),
('Adam Scott','BigStore',50000),
('Bonnie Noel','SmallMfg',25000),
('Cassie Johnson','BigStore',35000),
('Donald Eckerson','SmallStore',29000),
('Erin Joel','SmallMfg',49000);

CREATE TABLE Manages (
manageID int identity(1,1) primary key,
pname varchar(30),
mname varchar(30)
);

INSERT INTO Manages(pname,mname)
VALUES
('John Smith','Adam Scott'),
('Jane Doe','John Doe'),
('Bonnie Noel','Erin Joel'),
('Cassie Johnson','Adam Scott'),
('Donald Eckerson','John Doe');



SELECT w.salary,w.pname FROM 
WorksFor w 
INNER JOIN Manages m on m.pname=w.pname

SELECT * FROM WorksFor WHERE pname NOT iN(
SELECT w.pname FROM 
WorksFor w 
INNER JOIN Manages m on m.pname=w.pname )



--To get salaries where employee sal greather than boss salary
SELECT w.pname,w.salary
FROM 
WorksFor w 
LEFT OUTER JOIN(SELECT w.pname,w.salary FROM WorksFor w INNER JOIN Manages m on m.pname=w.pname) m On w.pname=m.pname
LEFT OUTER JOIN(SELECT w.salary,w.pname  FROM WorksFor w LEFT JOIN Manages m ON m.pname=w.pname WHERE m.manageID IS NULL)e on e.pname=w.pname
WHERE ISNULL(e.salary,0)>ISNULL(m.salary,0)

--List of Department and Max salary for each department

SELECT * FROM Employee_Test




--FIND ENAME WHO WAS HIRED FIRST
SELECT ENAME FROM EMP WHERE HIREDATE IN(SELECT MIN(HIREDATE) FROM EMP);

--FIND THE SQUARE ROOT OF THE SALARY IN EMP TABLE
SELECT SQRT(SAL) FROM EMP;
--Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
--SELECT EMPNO,ENAME,JOB,HIREDATE,(SYSDATE-HIREDATE)/365 FROM EMP WHERE JOB = ‘MANAGER’;

--List the emps in the asc order of Designations of those joined after the second half of 1981.
select  * from emp where hiredate between '01-jul-1981' and '31-dec-1981' ORDER BY MGR;

--List the Five character names starting with ‘S’ and ending with ‘H’.
SELECT ENAME FROM EMP WHERE ENAME LIKE 'S%H' AND LENGTH(ENAME)=5;

SELECT * FROM Emp
SELECT * FROM DEp


SELECT datename(DAY,GETDATE() )



--queries on employee and department tables in sql