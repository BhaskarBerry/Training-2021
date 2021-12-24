Use Sampledb
Go


Select * From flipcart_services
select * From Flipcart_Orders



-------Subquerires in whereclause

Select  * From Flipcart_Orders
Where Cost=(Select Max(cost) From flipcart_orders)

---
Select * From Flipcart_Orders
Where cust_id not in
 (Select customer_id From Flipcart_services
)

Select Flipcart_Orders.*
From Flipcart_Orders
left Join Flipcart_services
On  Flipcart_Orders.cust_id=Flipcart_services.customer_id
Where Flipcart_services.customer_id is null---------both queries same output

-------Subqueries in fromclause
Select top 1 * From
(Select cust_id,cost From Flipcart_Orders
Where cost is null) as regularcustomer
Join Flipcart_services on regularcustomer.cust_id=Flipcart_services.customer_id;

--
Select * From (
Select [status],cost as higer From Flipcart_Orders) as e
Where Higer>500

--1.method getting rank
Select * From(
 Select cost, Dense_rank ()Over ( order by Cost desc ) As highest From Flipcart_Orders) as rs
Where highest=2;

---2.method 
with cte
As
(
Select cost, dense_rank ()Over ( order by Cost desc) As highest From Flipcart_Orders
) 
select * From cte where highest=2


-----
/*Select Top 1 * From 
(Select Top 3 Cost From Flipcart_Orders
order by cost desc ) Flipcart_orders----wrong outpt */
				

------subqueries using Select 
Select *,
(Select count(*) From Flipcart_Orders 
Where Flipcart_Orders.cust_id= Flipcart_services.customer_id)
As no_oforders from Flipcart_services;



---------correlaed subqueries 

Select * From Flipcart_Orders  As ot
Where cost> 
		(select Avg(cost)
		 From Flipcart_Orders as inn
		 Where ot.cust_id=inn.cust_id);














