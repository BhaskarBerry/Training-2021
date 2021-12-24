Use [SQL_QA]



Select * From [dbo].[integer_values]


-----Using Subqueries-----
Select id,counts, Row_number()Over(Order by counts desc) As 'ranks'
From(
Select Id,Sum(Vales) As Counts 
From  [dbo].[integer_values]
Group by id) As integer_values
order by id


-------With Cte----

With Ordering
As
(
Select Id,Sum(Vales) As Counts 
From  [dbo].[integer_values]
Group by id
)
Select id,counts, Row_number()Over(Order by counts desc) As 'ranks'
From Ordering


----

select * from [dbo].[integer_values];


Select Id,Sum(Vales) As Counts ,Row_number() over(Order by Sum(Vales)desc) As Ranks
From  [dbo].[integer_values]
Group by id




