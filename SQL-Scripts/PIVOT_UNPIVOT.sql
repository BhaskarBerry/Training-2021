USE Berry_DB
GO

SELECT * FROM SALES
--PIVOT TABLE
/*
DIS ADVANTAGE
--we can get back the pivoted if we have dame records with different sales amount for the same country
--we can only unpivot ioof the records in the table are unique.
*/
SELECT AGENT,INDIA,US
FROM SALES
PIVOT
( SUM(SALES) FOR COUNTRY IN(INDIA,US)) AS PT


--UN PIVOT
SELECT AGENT,COUNTRY,SALES
FROM(
SELECT AGENT,INDIA,US
FROM SALES
PIVOT
( SUM(SALES) FOR COUNTRY IN(INDIA,US)) AS PIVOTTABLE)PT
UNPIVOT
(
SALES
FOR COUNTRY IN (INDIA,US)
) AS UNPT




