USE Berry_DB
GO

--IIF FUNCTION INTRO IN 2012
/*Returns one of two values based on the boolean expression
shorthand for case stmt */

DECLARE @A int
SET @A = 1
SELECT IIF(@A=1,'MALE','FEMALE') AS RESULT 