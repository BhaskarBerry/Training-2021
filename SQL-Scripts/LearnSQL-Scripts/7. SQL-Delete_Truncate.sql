use TrainingDB

----FloatAnd real data types------
Select Cast (Pi()+3.3 As Float)

Select Cast (400 As Float)

select pi ()+2

select Cast (123 as varbinary(8))
------------------------------------------------------
-----Delete rows from  comparison between two tables

Select eid From table1

except 
Select Did From #dept
Select eid From table2;

Select * From #emp1 
Where not Exists( Select * From #dept
Where #emp1.eid=#dept.did);

Delete  from #emp1
Where  not Exists (
Select * from #dept 
Where #emp1.eid=#dept.did);


If Exists ( Select * From information_schema.tables
				Where  Table_schema ='dbo'
				And Table_name='tb3'
Drop Table Dbo.tb3;

---------------------------------------------------------
------Finding duplicates on a column with detail----
---------------------------------------------------------

with duplicae_rows 
 (eid,ron)
 As
 (----
 select eid,row_number() Over ( partition by eid order by gender desc ) as ron
 From dbo.table1
 )
 Select * from duplicae_rows
 Where Ron > 1
 Order by eid;
 ------------------------------------------------------------

 with duplicae_rows 
 (eid,ron)
 As
 (
 select eid,Sum(1)
 Over (partition by eid) as ron
 From dbo.table1

 )
 Select * from duplicae_rows
 Where Ron > 1
 Order by eid



 Select * from table1
----
 select ename,departmenti,gender,row_number() Over ( order by gender desc ) as 'f'
 From dbo.table1;
 -----
 select eid,ename,Sum(1)
 Over (partition by eid) as ron
 From dbo.table1


 