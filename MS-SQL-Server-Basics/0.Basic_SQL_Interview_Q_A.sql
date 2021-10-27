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
--------------------------------------------------------------
Select * From Trades  order by User_id
Select * From Users order by city 

Select Top 3 U.city, count(T.User_id) as No_of_orders
From Users U
Inner Join Trades T ON U.user_id = T.user_id
Where [Status]='completed'
group by U.city
order by count(T.User_id) DESC;

--------------------------------------------------------------

With Cte_highorders_cites
As
(
Select city,count(T.user_id)As orders,Dense_Rank() over(Order by count(T.User_id)) As ranks
From Users
Join Trades T On Users.user_id=T.User_id
Where status='completed'
Group By city
)
Select Top 3 City , orders From  Cte_highorders_cites

-------------------------------------------------------------------------------------
/*
--Assume you have the below events table on app analytics. Write a query to get the click-through rate per app in 2022.
create table tbl_events(
app_id int primary key,
event_id Varchar(10),
time_stamp datetime
)
*/

select * from tbl_events

insert into tbl_events values(1, 'Click','10-10-2022'),
(2, 'Impression','10-11-2022'),
(3, 'Click','1-10-2022'),
(4, 'Click','2-10-2022'),
(5, 'Click','3-10-2022'),
(6, 'Impression','4-10-2022'),
(7, 'Click','5-10-2022'),
(8, 'Click','6-10-2022'),
(9, 'Impression','1-10-2022')

select * from tbl_events;

select
  (1.0 * (select count(app_id) from tbl_events where event_id =  'Click' and year(time_stamp) = 2022)) /
  (select count(app_id) from tbl_events where event_id = 'Impression' and year(time_stamp) = 2022) as CTR;

select *, (((select cast(count(app_id) as float) from tbl_events where event_id = 'Click')/(select cast(count(app_id) as float) from tbl_events where event_id != 'Click'))) as clickThroughRate from tbl_events;

SELECT app_id, SUM(CASE WHEN event_id = 'Click' THEN 1 ELSE 0 END) as total_Clicks,
	SUM(CASE WHEN event_id = 'Impression' THEN 1 ELSE 0 END) AS CTR
FROM tbl_events
Group BY app_id
-------------------------------------------------------------------------------------