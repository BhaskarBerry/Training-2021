--USE SOURCE_DB
--GO

--SELECT * FROM sys.tables

--SELECT * FROM tblA
--tblB
--SELECT * FROM tblEmployee

--CREATE VIEW view_tblEmployee
--AS
		
--SELECT C.ID,C.NAme AS Cname ,CR.name AS RefName  FROM cONATCT C
--INNER JOIN cONATCT_ref  CR ON C.ID = CR.ID


--SELECT * FROM dbo.view_tblEmployee vte

--UPDATE view_tblEmployee
--set RefName = 'BOASE'
--WHERE ID = 1

--DROP  VIEW view_tblEmployee

--DROP VIEW dbo.view_tblEmployee
--SELECT * FROM tblEmployee


--SELECT C.ID,C.NAme ,CR.name FROM cONATCT C
--INNER JOIN cONATCT_ref  CR ON C.ID = CR.ID
--SELECT * FROM cONATCT_ref


	--SELECT *  FROM cONATCT  --5

	--	SELECT * FROM  contact_Bkp--3




		MERGE contact_Bkp as T
		USING cONATCT AS S
		ON T.ID = S.ID
		WHEN MATCHED THEN
		UPDATE 	SET T.MAILD_id =S.MAILD_id+'Jilli'
 
	 WHEN NOT MATCHED BY TARGET THEN
	  INSERT (ID,NAME,MAILD_id)	  VALUES ( S.ID,S.NAME,S.MAILD_id);
 
SELECT * FROM contact_Bkp;