




Create Table Customer(Id int,cname varchar(60),quantity int ,percost money ,totalcost money) 
Drop Table customer1


-----instead of trigger

Create Trigger dbo.insteadoftrigger
On Dbo.customer
Instead Of Insert 
AS Begin
Insert Into Customer
Select * From Inserted

End

--
Drop Trigger dbo.insteadoftrigger
INsert Into dbo.customer Values(1,'bberry',5,10,900)

Select * From customer

--ones usomer tale is triggeered ,we will not create/alter this table 
--because an INSTEAD OF INSERT trigger already exists on this object.
----------------------------------

Create Trigger dbo.insteadoftrigger
On Dbo.customer1
Instead Of Insert 
AS 
Begin
Declare @name varchar(70)
	Select @name= cname From Inserted
	If (len(@name)<>0)

	Insert Into Customer
Select * From Inserted
End

Drop Trigger dbo.insteadoftrigger

-------------------------------

-----After trigger
Create Trigger dbo.Aftertriggeres
On Dbo.customer
After Insert,Update,delete 
AS 
Begin
	Declare @id varchar(70)
	Select @id= id From Inserted
	
	Update  Customer
	Set totalcost=quantity*percost
	Where id=@id
End

