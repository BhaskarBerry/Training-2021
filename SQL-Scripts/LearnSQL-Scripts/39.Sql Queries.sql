use Sql_Qa


Create Function Calculate_Age
(
@Dob Date,@Calculatedate Date
)
Returns Int
As 
Begin
Declare @age Int
--IF(@calculatedate < @dob )
--Return -1
Select @age = Year(@calculatedate)-Year(@dob)+
Case When DateAdd ( Year,Year(@calculatedate)-Year(@dob)
,@dob) > @calculatedate Then -1 
Else 0
End
Return @age
End



Select dbo.Calculate_Age ('1996-05-27',Getdate())

Drop Function dbo.Calculate_Age


Select Eomonth(Getdate())


 SELECT CONVERT(Date, GETDATE())
 SELECT DATEADD(dd, 1, DATEDIFF(dd, 0, GETDATE())) 'returns 2016-07-21 00:00:00.000'
 SELECT CAST(GETDATE() AS DATE)
 SELECT CONVERT(CHAR(10),GETDATE(),111)


 --Date Range With Recursive CTE
 Declare @FromDate Date = '2014-04-21',
@ToDate Date = '2014-05-02'
;With DateCte (Date) As
(
Select @FromDate Union All
Select DateAdd(Day, 1, Date)
From DateCte
Where Date < @ToDate
)
Select Date
From DateCte;
--------------------------------
--------------------------------------------------------------------


Select  E.*,
 row_number() Over(order by id)
From (Select id,Sum(vales),
From Dbo.integer_values
Group by id ) As E
Order by id

