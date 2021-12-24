

---skipping some rows from reslt

Select id,cars_names
From dbo.cars_details
Order by id 
OffSet 6 rows



--limiting amount of reslts
Select  top 7 *
From dbo.cars_details


Select  top 7  id,cars_names
From dbo.cars_details

--
Select id,cars_names
From dbo.cars_details
Order by id 
OffSet 6 rows
Fetch first  8 rows only

--
Select id,cars_names
From dbo.cars_details
order by id 
OffSet 6 rows
Fetch next 4 rows only




------skipping then taking some reslts 

Select id, cars_names From
( Select id,cars_names ,Row_number() over(Order By id ) as rw
From dbo.Cars_details) 
where Rw Between 5 And 12---not work


---using cte
With skip_rows (id,cars_details,rw)
As
(Select id,cars_names,Row_number()
Over(Order by id) As rw
From dbo.cars_details
)
select id,cars_details From skip_rows
where rw between 5 And 10 