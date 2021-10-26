--- SQL Interview Question
Create database SQL_QA
Go

Use SQL_QA
Go

/*
1.Assume you are given the below tables for trades and users. Write a query to list the top 3 cities which had the highest number of completed orders.

Create Table Users (
	[User_id] int Primary key,
	city Nvarchar(70),
	Email nvarchar(70),
	signup_date Datetime
)

Create Table Trades(
	Order_id Int Primary key,
	[User_id] Int,
	Price float,
	Quantity Int,
	[Status] nvarchar(60),
	Foreign key([User_id]) References  Users([User_id])
)

Insert Into Users Values
(1,'banglore','pavanib@com','10-10-2021'),
(2,'hyd','pavanib@abc','8-4-2021'),
(3,'banglore','pavanib@yahoo','1-5-2021'),
(4,'chennai','pavanib@gmail.com','10-7-2021'),
(5,'delhi','pavanib@email.com','9-2-2021'),
(6,'hyd','pavanib@co','8-1-2021')

Insert Into Trades Values
(1,2,'2000',5,'completed'),
(2,3,'3000',3,'cancelled'),
(3,1,'5000',8,'completed'),
(4,4,'1000',3,'cancelled'),
(5,3,'1000',8,'cancelled'),
(6,1,'2000',5,'completed'),
(7,1,'3000',1,'completed'),
(8,4,'1000',2,'cancelled'),
(9,1,'2000',4,'completed'),
(10,6,'3000',2,'completed'),
(11,3,'2000',1,'cancelled')
*/

Select * From Trades  order by User_id
Select * From Users order by city 

Select Top 3 U.city, count(T.User_id) as No_of_orders
From Users U
Inner Join Trades T ON U.user_id = T.user_id
Where [Status]='completed'
group by U.city
order by count(T.User_id) DESC

