USE Berry_DB
GO
--Conerts the datatype for the mentioned one.
SELECT TRY_CONVERT(INT,'100.012') AS RESULT
--return null if not able to convert the data type
SELECT TRY_CONVERT(INT,'ABC') AS Result
--xml
SELECT TRY_CONVERT(XML,'ABC') AS op
SELECT TRY_CONVERT(XML,10) AS op--Explicit conversion from data type int to xml is not allowed.
--using case to get thye meaningful name 
SELECT CASE WHEN TRY_CONVERT(INT ,'ABC') IS NULL
THEN 'Conversion Failed'
ELSE 'Converfsion successful'
END

--using the iif function to get thye meaningful name 
SELECT IIF(TRY_CONVERT(INT ,'ABC') IS NULL,	 'Conversion Failed', 'Converfsion successful') AS RE

--Convert and try_convert diff
SELECT CONVERT(INT,'ABC') AS RE--Conversion failed when converting the varchar value 'ABC' to data type int.
SELECT TRY_CONVERT(INT ,'ABC')

---------------------------------------------------------------------------------------------------------------------
--TRY_PARSE()
/* converting from string to datetime format or numeric data type 
returns null if the specified datatype cannot be converted
requires .net frame work language.
*/
--it can be used in case or iff stmt to get the meaningful error name 
SELECT TRY_PARSE('abc' AS INT)
SELECT TRY_PARSE('123' AS INT)

SELECT TRY_PARSE(AGE AS INT) AS AGE_INT FROM EMPLOYEE
SELECT PARSE(AGE AS INT) AS AGE_INT FROM EMPLOYEE
--Error converting string value 'thirty    ' into data type int using culture ''.

--try_convert() and try_parse differences
/*1.try_parse is used  for converting from string to datetime format or numeric data type where as try_convert is used for generic type conversion
2.Try_parse() relies on the presence of .NET framework CLR. whereas try_conert doesn't.
 */

SELECT TRY_CONVERT(XML,'<root><child/></root>') AS RE
SELECT TRY_PARSE('<root><child/></root>' AS XML) AS RE--Invalid data type xml in function TRY_PARSE.