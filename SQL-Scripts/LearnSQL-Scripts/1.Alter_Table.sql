Use TrainingDB
Go

------------------------------------------------------
CREATE TABLE Departments (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(25) NOT NULL
);

CREATE TABLE Employees (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    PhoneNumber VARCHAR(11),
    ManagerId INT,
    DepartmentId INT NOT NULL,
    Salary INT NOT NULL,
    HireDate DATETIME NOT NULL,
    FOREIGN KEY (ManagerId) REFERENCES Employees(Id),
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

select * from Departments
select * from Employees

--- Add Columns
ALter table Employees
ADD StartingDate date Not Null DEFAULT GetDate(),
	DateOfBirth date NULL

Alter table Employees
ADD Salary Money Not Null DEFAULT 25000.00 

-- Add constarint
Alter table Employees
 Add constraint DF_salary
 DEFAULT 25000.00 FOR Salary  

--- drop Columns
Alter table Employees
	Drop column phonenumber,[DateOfBirth]

--- drop Constaraint 
Alter  table Employees
	Drop constraint DF__Employees__Salar__15502E78