USE SOURCE_DB
GO

	SELECT * FROM sys.tables
	CREATE SYNONYM M  for SOURCE_DB.dbo.Contact_BKP
		SELECT * FROM contact_Bkp

		SELECT * FROM M