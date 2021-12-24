USE [Berry_Solutions]
GO
--------------------------------------------------------------
--Create table [dbo].[Person_Deatils]
CREATE TABLE [dbo].[Person_Deatils](
	[Emp_ID] [int] PRIMARY KEY,
	[Emp_Sal]  DECIMAL(10,2) NULL ,
	[FName] Nvarchar(10),
	[Lname] Varchar(10)) 
--------------------------------------------------------------	
--------------------------------------------------------------
--Create Audit table [dbo].[Audit_Person_Deatils]
CREATE TABLE [dbo].[Audit_Person_Deatils](
	[Emp_ID] [int] NULL,
	[Emp_Sal] DECIMAL(10,2) NULL ,
	[FName] NVARCHAR(10),
	[Lname] Varchar(10),
	[Audit_Action] Varchar(110),
	[Audit_time] DATETIME) 
------------------------------------------------------------------

INSERT INTO Person_Deatils([Emp_ID],[Emp_Sal],[FName],[Lname])
SELECT 001,10000,'Bhaskar','Berry' UNION
--SELECT 002,20000,'Bhaskar','Reddy' UNION
--SELECT 003,30000,'Mala','Sree'
SELECT 007,70000,'Louis','Louis'

--ALTER TABLE Person_Deatils Disable TRIGGER ALL

BEGIN TRAN
UPDATE Person_Deatils SET Lname = 'Reddy_B' WHERE Emp_ID = 0003

DELETE FROM Person_Deatils WHERE Emp_ID = 1
ROLLBACK TRAN


SELECT * FROM Person_Deatils
SELECT * FROM AUDIT_Person_Deatils 

--DROP TABLE [Person_Deatils] 
--DROP TABLE AUDIT_Person_Deatils 
--CREATE INDEX X_Fname ON [dbo].[Person_Deatils](FName)
--CREATE INDEX X_Fname1 ON [dbo].[Person_Deatils](FName)
--CREATE UNIQUE INDEX X_Lname ON  [dbo].[Person_Deatils](FName)
--CREATE CLUSTERED INDEX X_Emp_ID ON [dbo].[Person_Deatils](Emp_ID)
--DROP INDEX  X_Lname   ON [dbo].[Person_Deatils]

--------------------------INSERT TRIGGER START----------------------------------------------
--INSERT OF TRIGGER
CREATE TRIGGER trgAfterInsert ON dbo.Person_Deatils
FOR INSERT
AS
	DECLARE @Emp_ID			INT,
			@Emp_Sal		DECIMAL(10,2),
			@FName			NVARCHAR(10),
			@LName			NVARCHAR(10), 
			@audit_action	VARCHAR(100)
			
	SELECT @Emp_ID =I.Emp_ID FROM INSERTED I
	SELECT @Emp_Sal =I.Emp_Sal FROM INSERTED I
	SELECT @FName =I.FName FROM INSERTED I
	SELECT @LName =I.LName FROM INSERTED I
	SELECT @audit_action ='Inserted Record -- After Insert Trigger.'
	--SELECT COUNT(*) AS C_Before_Person_Deatils FROM  Person_Deatils
	--SELECT COUNT(*) AS C_Before_AUDIT_Person_Deatils FROM AUDIT_Person_Deatils
	INSERT INTO AUDIT_Person_Deatils([Emp_ID],[Emp_Sal],[FName],[Lname],[Audit_Action],[Audit_time])
	VALUES(@Emp_ID,@Emp_Sal,@FName,@LName,@audit_action,GETDATE());
	--SELECT COUNT(*) AS C_Before_Person_Deatils FROM  Person_Deatils
	--SELECT COUNT(*) AS C_Before_AUDIT_Person_Deatils FROM AUDIT_Person_Deatils
	--PRINT 'AFTER INSERT trigger fired.'
GO
--DROP TRIGGER trgAfterInsert 
--ALTER TABLE Person_Deatils DISABLE TRIGGER trgAfterInsert
--------------------------INSERT TRIGGER END----------------------------------------------

/*==============INSTEAD OF INSERT Trigger===============*/
CREATE TRIGGER trgInsteadofinsert ON dbo.Person_Deatils
INSTEAD OF INSERT
AS
BEGIN
	
	SELECT COUNT(*) AS C_Before_Person_Deatils FROM  Person_Deatils
	SELECT COUNT(*) AS C_Before_AUDIT_Person_Deatils FROM AUDIT_Person_Deatils
	
	INSERT INTO AUDIT_Person_Deatils([Emp_ID],[Emp_Sal],[FName],[Lname],[Audit_Action],[Audit_time])
    SELECT I.Emp_ID,I.Emp_Sal,I.FName,I.Lname ,'Insert instead of trigger',GETDATE()
    FROM INSERTED I
	
	SELECT COUNT(*) AS C_Before_Person_Deatils FROM  Person_Deatils
	SELECT COUNT(*) AS C_Before_AUDIT_Person_Deatils FROM AUDIT_Person_Deatils
END
GO

--DROP TRIGGER trgInsteadofinsert 
--------------------------INSERT TRIGGER END-------------------------------------------------------------------------	

/*--------------------------UPDATE TRIGGER START--------------------------*/
--ALTER TABLE Person_Deatils DISABLE TRIGGER trg_AfterUpdate
CREATE TRIGGER trg_AfterUpdate ON dbo.Person_Deatils
FOR UPDATE
AS
	DECLARE @Emp_ID			INT,
			@Emp_Sal		DECIMAL(10,2),
			@FName			NVARCHAR(10),
			@LName			NVARCHAR(10), 
			@audit_action	VARCHAR(100)

	SELECT @Emp_ID =I.Emp_ID FROM INSERTED I
	SELECT @Emp_Sal =I.Emp_Sal FROM INSERTED I
	SELECT @FName =I.FName FROM INSERTED I
	SELECT @LName =I.LName FROM INSERTED I

	IF UPDATE(Emp_Sal)
		SET @audit_action='Updated Record -- After Update Trigger.';
	--IF UPDATE(FName)
	--	SET @audit_action='Updated Record -- After Update Trigger.';	
	--IF UPDATE(LName)
	--	SET @audit_action='Updated Record -- After Update Trigger.';				

	SELECT COUNT(*) AS C_Before_Person_Deatils FROM  Person_Deatils
	SELECT COUNT(*) AS C_Before_AUDIT_Person_Deatils FROM AUDIT_Person_Deatils
	
	INSERT INTO AUDIT_Person_Deatils([Emp_ID],[Emp_Sal],[FName],[Lname],[Audit_Action],[Audit_time])
	VALUES(@Emp_ID,@Emp_Sal,@FName,@LName,@audit_action,GETDATE());

	SELECT COUNT(*) AS C_Before_Person_Deatils FROM  Person_Deatils
	SELECT COUNT(*) AS C_Before_AUDIT_Person_Deatils FROM AUDIT_Person_Deatils
--	PRINT 'AFTER UPDATE Trigger fired.'
GO
--DROP TRIGGER trg_AfterUpdate 
/*--------------------------UPDATE TRIGGER END--------------------------*/
/*--INSTEAD OF UPDATE*/
--DROP TRIGGER trgInsteadofupdate 
CREATE TRIGGER trgInsteadofupdate ON dbo.Person_Deatils
INSTEAD OF UPDATE
AS
BEGIN
	
	SELECT COUNT(*) AS C_Before_Person_Deatils FROM  Person_Deatils
	SELECT COUNT(*) AS C_Before_AUDIT_Person_Deatils FROM AUDIT_Person_Deatils
	
	INSERT INTO AUDIT_Person_Deatils([Emp_ID],[Emp_Sal],[FName],[Lname],[Audit_Action],[Audit_time])
    SELECT I.Emp_ID,I.Emp_Sal,I.FName,I.Lname ,'Update instead of trigger',GETDATE()
    FROM INSERTED I
	
	SELECT COUNT(*) AS C_Before_Person_Deatils FROM  Person_Deatils
	SELECT COUNT(*) AS C_Before_AUDIT_Person_Deatils FROM AUDIT_Person_Deatils
END
GO
/*--------------------------UPDATE TRIGGER END-----------------------------------------------------------------------*/
/*--------------------------DELETE TRIGGER START--------------------------*/
 --ALTER TABLE Person_Deatils DISABLE TRIGGER trg_AfterDelete
CREATE TRIGGER trg_AfterDelete ON dbo.Person_Deatils
FOR DELETE
AS
	DECLARE @Emp_ID			INT,
			@Emp_Sal		DECIMAL(10,2),
			@FName			NVARCHAR(10),
			@LName			NVARCHAR(10), 
			@audit_action	VARCHAR(100)

	SELECT @Emp_ID = D.Emp_ID FROM DELETED D
	SELECT @Emp_Sal = D.Emp_Sal FROM DELETED D
	SELECT @FName = D.FName FROM DELETED D
	SELECT @LName = D.LName FROM DELETED D
	SET @audit_action='Deleted -- After Delete Trigger.';

	SELECT COUNT(*) AS C_Before_Person_Deatils FROM  Person_Deatils
	SELECT COUNT(*) AS C_Before_AUDIT_Person_Deatils FROM AUDIT_Person_Deatils
	
	INSERT INTO AUDIT_Person_Deatils([Emp_ID],[Emp_Sal],[FName],[Lname],[Audit_Action],[Audit_time])
	VALUES(@Emp_ID,@Emp_Sal,@FName,@LName,@audit_action,GETDATE());
	
	SELECT COUNT(*) AS C_Before_Person_Deatils FROM  Person_Deatils
	SELECT COUNT(*) AS C_Before_AUDIT_Person_Deatils FROM AUDIT_Person_Deatils
	--PRINT 'AFTER DELETE TRIGGER fired.'
GO
/*--------------------------DELETE TRIGGER END--------------------------*/
/*--INSTEAD OF DELETE*/
--DROP TRIGGER trgInsteadofDelete 
ALTER TRIGGER trgInsteadofDelete ON dbo.Person_Deatils
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @Emp_ID			INT,
			@Emp_Sal		DECIMAL(10,2),
			@FName			NVARCHAR(10),
			@LName			NVARCHAR(10), 
			@audit_action	VARCHAR(100)

	SELECT @Emp_ID = D.Emp_ID FROM DELETED D
	SELECT @Emp_Sal = D.Emp_Sal FROM DELETED D
	SELECT @FName = D.FName FROM DELETED D
	SELECT @LName = D.LName FROM DELETED D
	SET @audit_action='Deleted -- Instead Of Delete Trigger.';

	SELECT COUNT(*) AS C_Before_Person_Deatils FROM  Person_Deatils
	SELECT COUNT(*) AS C_Before_AUDIT_Person_Deatils FROM AUDIT_Person_Deatils
	
	--DELETE FROM Person_Deatils WHERE Emp_ID=@Emp_ID;
	--COMMIT;
	
	INSERT INTO AUDIT_Person_Deatils([Emp_ID],[Emp_Sal],[FName],[Lname],[Audit_Action],[Audit_time])
	VALUES(@Emp_ID,@Emp_Sal,@FName,@LName,@audit_action,GETDATE());
	
	--PRINT 'Record Deleted -- Instead Of Delete Trigger.'
	SELECT COUNT(*) AS C_Before_Person_Deatils FROM  Person_Deatils
	SELECT COUNT(*) AS C_Before_AUDIT_Person_Deatils FROM AUDIT_Person_Deatils
END
GO

/*--------------------------DELETE TRIGGER END---------------------------------------------------------------------*/


SELECT * FROM sys.triggers