USE TAS_Staging
----ALTER Columns in RDPUsers TABLE----

	PRINT 'ALTER Columns in RDPUsers TABLE Begins'

-- ADD COLUMN AccountTypeID in RDPUsers TABLE

	AccountTypeID:
	IF (SELECT count(1) FROM syscolumns WITH (NOLOCK)
	     WHERE name in ('AccountTypeID')
	       AND id = object_id('dbo.RDPUsers'))>0
		BEGIN
		PRINT 'AccountTypeID Column ALREADY exists in TABLE dbo.RDPUsers'
		GOTO Finish
		End
	Else
		BEGIN
		ALTER TABLE dbo.RDPUsers
		ADD AccountTypeID INT DEFAULT ((0)) NULL;
		End

	IF @@error <> 0
		BEGIN
		PRINT 'FAILED adding column(s) to TABLE dbo.RDPUsers'
		GOTO ErrRaise
		End

	IF (SELECT count(1) FROM syscolumns WITH (NOLOCK) 
	     WHERE name in ('AccountTypeID')
	       AND id = object_id('dbo.RDPUsers'))=1
		BEGIN
		PRINT 'Column(s) verified in TABLE dbo.RDPUsers'
		GOTO Finish
		End

	Else
		BEGIN
		PRINT 'Column(s) NOT verified in TABLE dbo.RDPUsers'
		GOTO ErrRaise
		End



	ErrRaise:
	PRINT ' '
	exec sp_addmessage @msgnum = 50005,
	@severity = 18,
	@msgtext = '';

	RAISERROR (50005, -- Message id.
	18, -- Severity,
	1, -- State,
	N'ERROR IN SCRIPT. ROLLING BACK TRANSACTION.');

	exec sp_dropmessage @msgnum = 50005;
	PRINT ' '
	PRINT 'Rollback has occurred.'
	PRINT ' '
	PRINT getdate()
	GOTO Errhand

	Finish:
	PRINT ' '
	PRINT 'Execution of Scripts Completed Successfully'
	PRINT getdate()

	Errhand:
	GO
	PRINT 'RDPUsers TABLE Columns altered successfully'
	PRINT GETDATE()
