--And and OR 

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Bangalore'
);

Insert into Persons(    ID , LastName ,
    FirstName , Age) values(1, 'Bose','Bhaskar', 30),
(2, 'Bose','B', 40),
(3, 'Bose','Bhaskar', 20),
(4, 'Raghu','Ram', 31)

Select * from Persons

select * from Persons where Id =1 and Age = 40
select * from Persons where Id =1 or Age = 40
select * from Persons where Id =1 and Age = 30
