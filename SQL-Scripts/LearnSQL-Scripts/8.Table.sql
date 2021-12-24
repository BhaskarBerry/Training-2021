use TrainingDB

----cretae a new table from the slect stmt

select * from sys.tables;
select * from sys.columns;
select * from Persons;

select * from sys.objects;
select * from tempdb.sys.objects;
select * from tempdb.sys.tables;

select * into cars_BKP from cars_details;

select * into cars_BKP from cars_details
Where 1=0


------insert data from another table
Insert Into cars_bkp
Select * From Cars_details



-- local temp table
create table #persons(
	id int,
	names varchar(40)
	)

insert into #persons values(1,'pavani'),(2,'qwsdasd'),(3,'aswdasd')
select * from #persons;


-- Global  temp table
create table ##persons1(
	id int,
	names varchar(40)
	)

insert into ##persons1 values(1,'pavani'),(2,'qwsdasd'),(3,'aswdasd')
select * from ##persons1;