use SOURCE_DB

SELECT * from sys.tables

select * from cONATCT_ref


select ' ' + name + ','from cONATCT_ref FOR XML PATH

DECLARE @string  varchar(4000) ,@string1 varchar(4000)
select @string = COALESCE(@string+', ','') + name from cONATCT_ref
select @string1 =  name + COALESCE(@string1+',','') from cONATCT_ref
SELECT  @string
SELECT  @string1


declare @tmp varchar(250)
SET @tmp = ''
select @tmp = @tmp + name  + ', ' from cONATCT_ref
SELECT @tmp
select SUBSTRING(@tmp, 0, LEN(@tmp))

--BOASE, mala, mom, ram, 
--BOASE, mala, mom, ram

-- Get CSV values
SELECT SUBSTRING((SELECT ',' + Name FROM cONATCT_ref  ORDER BY Name FOR XML PATH('')   ),2,200000) AS CSV
GO

BOASE,mala,mom,ram
SELECT ',' + s.Name FROM cONATCT_ref AS s ORDER BY s.Name FOR XML PATH(''),2,200000)

DECLARE @X varchar(20)
SET @X=NULL
SELECT COALESCE(@X,null,'abckde')


