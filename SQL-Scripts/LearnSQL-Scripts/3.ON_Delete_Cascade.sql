--- On Delete cascade
--------------------------------------------
CREATE TABLE [dbo].[tbl_Room](
	[room_id] [int] NOT NULL,
	[room_type] [nvarchar](50) NOT NULL
) ON [PRIMARY]

Alter table tbl_Room
	Add constraint FK_ClientID Foreign key (room_id) references tbl_client(ClientID)


Alter table tbl_Room
	Drop constraint FK_ClientID

-- with cascade
Alter table tbl_Room
	Add constraint FK_ClientID Foreign key (room_id) references tbl_client(ClientID) on delete cascade
--------------------------------------------
CREATE TABLE [dbo].[tbl_client](
	[ClientID] [int] NOT NULL,
	[ClientName] [nvarchar](50) NOT NULL,
	[ClientMail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_client] ADD  CONSTRAINT [DF_tbl_client_ClientMail]  DEFAULT (N'abc@gmail.com') FOR [ClientMail]
GO
--------------------------------------------

Select * from tbl_client
Select * from tbl_Room order by 1 ASC


INSERT INTO [dbo].[tbl_client]  ([ClientID] ,[ClientName])
     VALUES(1,'Berry'),(2,'Byy'),(3,'Bose'),(
	 4,'Ram'),(15,'Rum')
GO

INSERT INTO [dbo].[tbl_Room]([room_id],[room_type])
     VALUES (1,'Normal'),(2, 'Duplex'),
	 (15,'Normal'),(3, 'Duplex'),
	 (15,'dduplex'),(4, 'Duplex'),
	 (15,'AC'),(2, 'AC')

-------------------------------------------
Delete from tbl_client where ClientID = 15


select * from sys.foreign_keys;

--select * from sys.all_objects where type = 'U33' ;

select * from sys.foreign_keys where object_id = OBJECT_ID(N'dbo.FK__Employees__Manag__1273C1CD') and parent_object_id =OBJECT_ID(N'dbo.Employees') ;
select OBJECT_ID(N'dbo.Employees'), OBJECT_ID(N'dbo.FK__Employees__Manag__1273C1CD')



CREATE TABLE Test_Employees (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FName VARCHAR(35) NOT NULL,
    LName VARCHAR(35) NOT NULL,
    PhoneNumber VARCHAR(11),
    ManagerId INT,
    DepartmentId INT NOT NULL,
    Salary INT NOT NULL,
    HireDate DATETIME NOT NULL,
    FOREIGN KEY (ManagerId) REFERENCES Test_Employees(Id),
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

Alter table Test_Employees
drop constraint FK__Test_Empl__Manag__3C69FB99

select OBJECT_ID(N'dbo.FK__Test_Empl__Manag__3C69FB99')

IF NOT EXISTS (select * from sys.foreign_keys where object_id = OBJECT_ID(N'dbo.FK_EMP_MANAGER') and parent_object_id =OBJECT_ID(N'dbo.Test_Employees'))
	print 'Pavani Dont Sleep'
	Alter table Test_Employees with CHECK ADD CONSTRAINT FK_EMP_MANAGER1
	FOREIGN KEY (ManagerId) REFERENCES Test_Employees(Id) On DELETE CASCADE
GO

/*
Introducing FOREIGN KEY constraint 'FK_EMP_MANAGER1' on table 'Test_Employees' may cause cycles or multiple cascade paths. Specify ON DELETE NO ACTION or ON UPDATE NO ACTION, or modify other FOREIGN KEY constraints.
Msg 1750, Level 16, State 0, Line 82
Could not create constraint or index. See previous errors.

*/
select * from sys.foreign_keys where object_id = OBJECT_ID(N'dbo.FK_EMP_MANAGER') and parent_object_id =OBJECT_ID(N'dbo.Test_Employees')


IF NOT EXISTS (select * from sys.all_objects where type = 'U' )
	print 'inside'
else
	print 'Outside'

Go

select 1=1
