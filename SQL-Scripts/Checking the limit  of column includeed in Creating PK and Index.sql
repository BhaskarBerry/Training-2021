USE [SOURCE_DB]
GO

/****** Object:  Table [dbo].[TESTpk]    Script Date: 5/26/2016 11:29:48 AM ******/
DROP TABLE [dbo].[TESTpk]
GO

/****** Object:  Table [dbo].[TESTpk]    Script Date: 5/26/2016 11:29:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TESTpk](
	[column1] [nchar](10) NOT NULL,
	[column2] [nchar](10) NOT NULL,
	[column3] [nchar](10) NOT NULL,
	[column4] [nchar](10) NOT NULL,
	[column5] [nchar](10) NOT NULL,
	[column6] [nchar](10) NOT NULL,
	[column7] [nchar](10) NOT NULL,
	[column8] [nchar](10) NOT NULL,
	[column9] [nchar](10) NOT NULL,
	[column10] [nchar](10) NOT NULL,
	[column11] [nchar](10) NOT NULL,
	[column12] [nchar](10) NOT NULL,
	[column13] [nchar](10) NOT NULL,
	[column14] [nchar](10) NOT NULL,
	[column15] [nchar](10) NOT NULL,
	[column16] [nchar](10) NOT NULL,
	[column17] [nchar](10) NOT NULL,
	[column18] [nchar](10) NOT NULL,
	[column19] [nchar](10) NOT NULL,
	[column20] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TESTpk] PRIMARY KEY CLUSTERED 
(
	[column1] ASC,
	[column2] ASC,
	[column3] ASC,
	[column4] ASC,
	[column5] ASC,
	[column6] ASC,
	[column7] ASC,
	[column8] ASC,
	[column9] ASC,
	[column10] ASC,
	[column11] ASC,
	[column12] ASC,
	[column13] ASC,
	[column14] ASC,
	[column15] ASC,
	[column16] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE CLUSTERED INDEX TEST_IX ON source_db.dbo.TESTPK([column1], 	[column2], 	[column3], 	[column4], 	[column5], 	[column6], 	[column7], 	[column8], 	[column9], 	[column10], 	[column11], 	[column12], 	[column13], 	[column14], 	[column15], 	[column16],[column17]
	)
GO

---Msg 1904, Level 16, State 1, Line 59
--The index 'TEST_IX' on table 'source_db.dbo.TESTPK' has 17 columns in the key list. The maximum limit for index key column list is 16.





	