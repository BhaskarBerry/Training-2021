use TrainingDB
go

--- Cross apply

select * from persons

select * from Person_BKP

delete from Person_BKP where date1 is NULL

select * from Persons
cross apply Person_BKP where Persons.id = Person_BKP.id

--- outer apply 

select * from Persons
outer apply (select * from Person_BKP  as bkp  where bkp.id = Persons.id)
A

select * from Persons
LEFT OUTER JOIN  Person_BKP  as bkp  on bkp.id = Persons.id

select cast('2.1424545' as float)