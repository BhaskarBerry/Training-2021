USE Berry_DB
GO

SELECT * FROM SALES
SELECT Agent ,Country ,SUM(SALES) AS TotalAmount FROM  SALES
GROUP BY dbo.SALES.AGENT,COUNTRY
UNION
SELECT Agent ,NULL ,SUM(SALES) AS TotalAmount FROM  SALES
GROUP BY AGENT
UNION
SELECT NULL ,COUNTRY ,SUM(SALES) AS TotalAmount FROM  SALES
GROUP BY COUNTRY
UNION
SELECT NULL ,NULL ,SUM(SALES) AS TotalAmount FROM  SALES 	ORDER BY AGENT ASC

---Grouping sets introduced oin SQL server 2008

SELECT Agent ,Country ,SUM(SALES) AS TotalAmount FROM  SALES
GROUP BY
GROUPING SETS	
((AGENT,COUNTRY)
,(AGENT)
,(COUNTRY)
,()
)
ORDER BY AGENT ASC

---------------------------------------------------------------------------------------------------
--ROLLUP IN SQL SERVER
---------------------------------------------------------------------------------------------------
SELECT Country ,SUM(SALES) AS TotalAmount FROM  SALES
GROUP BY
GROUPING SETS	
((COUNTRY) 
,()	)

	SELECT Country ,SUM(SALES) AS TotalAmount FROM  SALES
	GROUP BY ROLLUP(COUNTRY)

	SELECT Country ,SUM(SALES) AS TotalAmount FROM  SALES
	GROUP BY (COUNTRY)WITH  ROLLUP

SELECT AGENT, Country ,SUM(SALES) AS TotalAmount FROM  SALES
GROUP BY ROLLUP(AGENT,COUNTRY)
	

---------------------------------------------------------------------------------------------------
--GROUP BY CUBE IN SQL SERVER
---------------------------------------------------------------------------------------------------

SELECT AGENT, Country ,SUM(SALES) AS TotalAmount FROM  SALES
GROUP BY CUBE(AGENT,COUNTRY)
ORDER BY 1 ,2 ASC		

SELECT AGENT ,Country ,SUM(SALES) AS TotalAmount FROM  SALES
GROUP BY
GROUPING SETS	
((COUNTRY,AGENT),
 (COUNTRY),
 (AGENT)
,()	)
ORDER BY 1 ,2 ASC	



---------------------------------------------------------------------------------------------------
--Difference between GROUP BY CUBE AND ROLLUP IN SQL SERVER
---------------------------------------------------------------------------------------------------
/*Cube generates a result set that shows aggregates for all combinations of values in the selected columns,where as ROLLUP generates a result set that shows aggregates for a hierarchy of values in the selected columns.*/
---------------------------------------------------------------------------------------------------
--grouping function
/*IS null can also be use to replace but when the column contains null it may show the wrong results.*/
SELECT 
CASE WHEN GROUPING(AGENT)=1 THEN 'All' ELSE ISNULL(AGENT,'UNKNOWN') END AS AGENT
,Country ,SUM(SALES) AS TotalAmount FROM  SALES
GROUP BY
GROUPING SETS	
((COUNTRY,AGENT),
 (COUNTRY),
 (AGENT)
,()	)
ORDER BY 1 ,2 ASC	
