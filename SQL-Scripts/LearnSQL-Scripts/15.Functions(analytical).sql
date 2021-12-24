use  sampledb
go


-------First And Last value Function-----
Select first_value ([status]) Over( Order by id) 
From Cars_details
----
Select last_value ([status]) Over( Order by id Desc) 
From Cars_details


---------lead and lag functions-----
Select id,totalcost,
lag(totalcost,1,6) Over(Order by id asc) as lagv
From dbo.cars_details;


Select id,totalcost,
lead (totalcost,2,4) Over(order by id Desc) as leav
From Cars_details


---Percent_rank
Select customerid,totalcost,
percent_rank() Over(order by totalcost Desc) as r
From Cars_details

---cumulative_distribution
Select customerid,totalcost,
cume_dist() Over(order by totalcost Desc) as r
From Cars_details


--percentile_continious and percentile_discreet  
Select percentaile_cont
Select percentile_disc


Select * From dbo.cars_details


----------Patidex
Select [status],patindex('%ready%',[status]) p
From dbo.Cars_details



SELECT Patindex('%author%', ' prominent author') As-----------12
  position;

  
SELECT Patindex('% %', 'prominent author') As-----10
  position;

  --------is null
 Declare @maxval  int
 Set @maxval = 20

  Declare @minval  int
 Set @minval = null

 Select  isnull(@maxval,@minval)
 Select  isnull(@minval,@maxval)


Select * From dbo.Cars_details

 Select  isnull([status],'happy') From dbo.Cars_details
