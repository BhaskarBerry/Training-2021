
--IF OBJECT_ID('tempdb..Employee') IS NOT NULL DROP TABLE Employee

-- CREATE TABLE Employee
--(
-- EmpID int PRIMARY KEY,
-- EmpName varchar (50) NOT NULL,
-- Salary int NOT NULL,
-- Address varchar (200) NOT NULL,
--)
--GO
--INSERT INTO Employee(EmpID,EmpName,Salary,Address) VALUES(1,'Mohan',12000,'Noida')
--INSERT INTO Employee(EmpID,EmpName,Salary,Address) VALUES(2,'Pavan',25000,'Delhi')
--INSERT INTO Employee(EmpID,EmpName,Salary,Address) VALUES(3,'Amit',22000,'Dehradun')
--INSERT INTO Employee(EmpID,EmpName,Salary,Address) VALUES(4,'Sonu',22000,'Noida')
--INSERT INTO Employee(EmpID,EmpName,Salary,Address) VALUES(5,'Deepak',28000,'Gurgaon')
--GO
 

DECLARE @id int,@Name varchar(100)
DECLARE Curr_Update CURSOR DYNAMIC FOR  
SELECT EmpID,EmpName FROM Employee
OPEN curr_Update


FETCH NEXT FROM Curr_Update INTO @Id,@Name
WHILE @@FETCH_STATUS=0 
BEGIN
IF @Name='Sonu'
UPDATE Employee SET Salary=1700  WHERE CURRENT OF Curr_Update

FETCH NEXT FROM Curr_Update INTO @Id,@Name

PRINT 'Test'
END

PRINT @Name

CLOSE Curr_Update
DEALLOCATE Curr_Update

SET NOCOUNT OFF

SELECT * FROM Employee