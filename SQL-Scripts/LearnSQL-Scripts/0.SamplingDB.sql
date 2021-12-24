-- Sample tables 
CREATE DAtAbasE SampleDB
Go

use SampleDB


CREATE TABLE Department_details (
    Id INT NOT NULL ,
    Name VARCHAR(25) NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE Employees_details (
    Id INT NOT NULL ,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    PhoneNumber VARCHAR(11),
    ManagerId INT,
    DepartmentId INT NOT NULL,
    Salary INT NOT NULL)
   
    FOREIGN KEY (ManagerId) REFERENCES Employees(Id),
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id) on delete cascade
);

CREATE TABLE Customers_details (
    Id INT NOT NULL ,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    Email varchar(100) NOT NULL,
    PhoneNumber VARCHAR(11),
    PreferredContact VARCHAR(5) NOT NULL,
    PRIMARY KEY(Id)
);
create  TABLE Cars_details (
    Id INT NOT NULL,
    CustomerId INT NOT NULL,
    EmployeeId INT NOT NULL,
    Model varchar(50) ,
    Status varchar(25) ,
    TotalCost INT ,
    PRIMARY KEY(Id))

	drop Table Cars_details
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
    FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)
);

-- data
INSERT INTO Department_details
    (Id, Name)
VALUES
    (1, 'HR'),
    (2, 'Sales'),
    (3, 'Tech')
;


Set IDENTITY_INSERT departments  OFF

INSERT INTO  Employees_details 

    (Id, FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary)
VALUES
    (1, 'James', 'Smith', 1234567890, NULL, 1, 1000   ) ,         
    (2, 'John', 'Johnson', 2468101214, '1', 1, 400     ) ,          
    (3, 'Michael', 'Williams', 1357911131, '1', 2, 600         )   ,  
    (4, 'Johnathon', 'Smith', 1212121212, '2', 1, 500      )                     
;

INSERT INTO Customers_details
    (Id, FName, LName, Email, PhoneNumber, PreferredContact)
VALUES
    (1, 'William', 'Jones', 'william.jones@example.com', '3347927472', 'PHONE'),
    (2, 'David', 'Miller', 'dmiller@example.net', '2137921892', 'EMAIL'),
    (3, 'Richard', 'Davis', 'richard0123@example.com', NULL, 'EMAIL')
;

INSERT INTO  Cars_details
    (Id, CustomerId, EmployeeId, Model, Status, TotalCost)
VALUES


   ('1', '1', '2', 'Ford F-150', 'READY', '230'),
    ('2', '1', '2', 'Ford F-150', 'READY', '200'),
  ('3', '2', '1', 'Ford Mustang', 'WAITING', '100'),
   ('4', '3', '3', 'Toyota Prius', 'WORKING', '1254'),
	 ('5', '2', '6', 'Ford ', null, '800'),

	  ('6', '4', '5', null, 'repair', '1500'),
	   ('7', '2', '5', '', 'WAITING', '')







Create Table Employee
(Emp_id int,Emp_name varchar(70),dept_name varchar(80),salary money)

Insert Into Dbo.employee Values
(101,'goutham','admin',	2000.00),
(113,'mohan','admin',	4000.00),
(102,'adarsh','finance',	6000.00),
(103,'pavani','hr',	30000.00),
(105,'berry','hr',	3500.00),
(106,'dorvin','hr',	33000.00),
(107,'chandni','IT',	4000.00),
(109,'vikram','IT',	6000.00),
(110,'komal','IT',	8000.00),
(112,'dheeraj','IT',	10000.00)


Select * From Employee

-------------
Create Table Doctors
(id int Primary key identity(1,1),
dname varchar(80), Speciality varchar(80),
Hospital Nvarchar(90), City Nvarchar(60),
Consultation_Fee Money)



Select * From Doctors
Insert Into Doctors values
(1,	'Dr.Shasank',	'Ayurvedha',	'Apollo',	'bangalore',	400.00),
(2,	'Dr.Abdul',	'Homeopathy',	'Fortis',	'bangalore',	2000.00),
(3,	'Dr.Swetha'	,'Homeopathy',	'KMC',	'Manipal'	,1000.00),
(4,	'Dr.Murupy',	'Dermotology',	'KMC',	'Manipal',	1500.00),
(5,	'Dr.Pharhana',	'Physician',	'Gleneagles',	'Bangalore',	1700.00),
(6,'Dr.maryan',	'physician',	'Gleneagles',	'Bangalore',	1500.00)
-------------------------------------------------------------------------------------



Create Table login_Details
(login_id int primary key identity (1,1),
User_name varchar (70),login_date Date)

Insert Into Login_details(user_name,login_date) Values

('james','2021-10-21'),
('michal','2021-10-22'),
('michal','2021-10-22'),
('michal','2021-10-22'),
('james','2021-10-22'),
('james','2021-10-23'),
('james','2021-10-25'),('stewart','2021-10-23'),
('michal','2021-10-24'),
('james','2021-10-24'),
('stewart','2021-10-25'),
('stewart','2021-10-26'),
('michal','2021-10-27')


create table students
(id int primary key,
student_name varchar(50) 
)
insert into students values
(1, 'James'),
(2, 'Michael'),
(3, 'George'),
(4, 'Stewart'),
(5, 'Robin')
-----------------------------------------------
-------Weather Table
----------------------------------------------------
create table weather
(id int,
city varchar(50),
temperature int,
day date)



insert into weather values
(1, 'London', -1, '2021-01-01'),
(2, 'London', -2, '2021-01-02'),
(3, 'London', 4, '2021-01-03'),
(4, 'London', 1, '2021-01-04'),
(5, 'London', -2, '2021-01-05'),
(6, 'London', -5, '2021-01-06'),
(7, 'London', -7, '2021-01-07'),
(8, 'London', 5, '2021-01-08')
