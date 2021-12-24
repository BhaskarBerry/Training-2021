use sampledb
Go
----cast function----

select  1+2
--select pavani+1 --not work (int and characters)
Select 'pavani'+'_'+cast(1 as varchar)

Select 'pavani'+cast(1 as varchar)

select '12-09-2021'+ cast('pavani' as varchar)

----------------

Declare @datetime as datetime

Set @datetime= '12-09-2021 12:10:00'

Select cast( @datetime  as date)

Select cast(@datetime as time)



----------------convert-----------------

select  convert(varchar (100),getdate())

select  convert(varchar (100),getdate(),108)------ 102 isdate styles

select  convert(varchar (100),getdate(),101)

select  convert(date,getdate())

select  convert(date,getdate(),108)

------------------------- parse--------------------------------
Select try_parse ('monday, 13 august ' As datetime using 'en-us') as 'datein englidh'

Select parse (status As int ) From cars _details


--------------------Datename----------------------
Select Datename(day,getdate())
Select Datename(Month,Getdate())
select datename(year,Getdate())

Select Datename( dd ,  '11-10-2021')
Select datename(Weekday,'10-12-2021')


---------------------datediff-------------------
Select  Datediff (year,'05-27-1996', Getdate() )
Select Datediff(Day, orderdate, shipdate) From Dbo.Sales


---------------------dateadd--------------------
Select Dateadd (day,2,Getdate())
Select dateadd (month,-1,Getdate())


----------------------choose--------------------

Select Choose( 3, 'pavani','bhaskar','pavanibhaskar')

-------------------------iif----------------------------
select *,iif(totalcost>800,'bonus','no bouns') From dbo.cars_details;


-------------------------------------------------------------------------
------------------------------------------------------------------------

----------------------lead and lag function ---------------------------

Select *, TotalCost+ Lag(Totalcost,1,0)  over (Order by Id) as  previoussum, 
sum(TotalCost)  over (Order by Id) as  cumulativesum
From dbo.cars_details


--------------------------------------------------------------------------
--------------------------------------------------------------------------


Select *From dbo.Cars_details




































select * From cars_details