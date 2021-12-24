USE SOURCE_DB
GO

SELECT * FROM sys.tables
--Create testable to hold some data
CREATE TABLE [dbo].[Test_table](
 [id] [int] IDENTITY(1,1) NOT NULL,
 [Department] [nchar](10) NOT NULL,
 [Code] [int] NOT NULL,
 CONSTRAINT [PK_Test_table] PRIMARY KEY CLUSTERED 
(
 [id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--Insert some test data
insert into Test_table values('A',111)
insert into Test_table values('B',29)
insert into Test_table values('C',258)
insert into Test_table values('D',333)
insert into Test_table values('E',15)
insert into Test_table values('F',449)
insert into Test_table values('G',419)
insert into Test_table values('H',555)
insert into Test_table values('I',524)
insert into Test_table values('J',698)
insert into Test_table values('K',715)
insert into Test_table values('L',799)
insert into Test_table values('M',139)
insert into Test_table values('N',219)
insert into Test_table values('O',869)


	SELECT Department,* FROM Test_table GROUP BY Department  

SELECT id,department,code,
FIRST_VALUE(code) OVER (ORDER BY code) FstValue,
LAST_VALUE(code) OVER (ORDER BY code ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) LstValue
FROM test_table

insert into Test_table values( 'A',51)
insert into Test_table values( 'A',111)
insert into Test_table values( 'A',169)
insert into Test_table values( 'A',514)
insert into Test_table values( 'B',5331)
insert into Test_table values( 'B',12211)
insert into Test_table values( 'B',101)
insert into Test_table values( 'B',135)


SELECT id,department,code,
FIRST_VALUE(code) OVER (PARTITION BY Department ORDER BY code) FstValue,
LAST_VALUE(code) OVER (Partition by Department ORDER BY code  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) LstValue
FROM test_table