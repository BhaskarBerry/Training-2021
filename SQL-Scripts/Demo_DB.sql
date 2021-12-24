--Create a new Database "Demo_DB"
/*CREATE DATABASE Demo_DB
USE Demo_DB
Go

CREATE TABLE Users(
ID INT Primary key identity,
Fname nvarchar(50),
Lname nvarchar(50),
EmailID nvarchar(50))
*/
select * from users
--create stored proc to nsert into user table
/*
CREATE PROC sp_InsertUsers(@Fname nvarchar(50),@Lname nvarchar(50),@EmailID nvarchar(50))
AS
	BEGIN
		INSERT INTO Users VAlues(@Fname,@Lname ,@EmailID)
	END
Go
*/	


