USE SOURCE_DB
GO


DECLARE @d DATETIME = '10/01/2011';
SELECT FORMAT ( @d, 'd') AS 'US English Result'
      ,FORMAT ( @d, 'd', 'en-gb' ) AS 'Great Britain English Result'
      ,FORMAT ( @d, 'd', 'de-de' ) AS 'German Result'
      ,FORMAT ( @d, 'd', 'zh-cn' ) AS 'Simplified Chinese (PRC) Result'; 

SELECT FORMAT ( @d, 'D' ) AS 'US English Result'
      ,FORMAT ( @d, 'D', 'en-gb' ) AS 'Great Britain English Result'
      ,FORMAT ( @d, 'D', 'de-de' ) AS 'German Result'
      ,FORMAT ( @d, 'D', 'zh-cn' ) AS 'Chinese (Simplified PRC) Result';


	        DECLARE @d DATETIME = GETDATE();
SELECT FORMAT( @d, 'dd/MM/yyyy', 'en-US' ) AS 'DateTime Result'
       ,FORMAT(123456789,'###-##-####') AS 'Custom Number Result';