USE SOURCE_DB
GO


SELECT * FROM sys.tables
	SELECT * FROM contact_Bkp

	-- Odd Numbers.
	WITH  TEst AS
	(
	SELECT ROW_NUMBER() OVER (ORDER BY id asc) AS rn ,* FROM contact_bkp
	)
	SELECT * FROM Test  WHERE rn%2=1

	---Using table expression
	SELECT * FROM(	SELECT*, ROW_NUMBER() OVER (ORDER BY ID asc) AS rn  FROM contact_bkp ) AS Test WHERE rn % 2 = 1
	
	

	---Even rows
	--one way using CTW and row_number
	(
	SELECT ROW_NUMBER() OVER (ORDER BY id asc) AS rn ,* FROM contact_bkp
	)
	SELECT * FROM Test  WHERE rn%2=0

	--using table variable
	SELECT * FROM(	SELECT*, ROW_NUMBER() OVER (ORDER BY ID asc) AS rn  FROM contact_bkp ) AS Test WHERE rn % 2 = 0
	