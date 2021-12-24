

DECLARE @tempDB Varchar(1000),
@select varchar(1000),@From varchar(1000)

IF OBJECT_ID('tempdb..#GetCurrencyDetails') IS NOT NULL DROP TABLE #GetCurrencyDetails
CREATE TABLE #GetCurrencyDetails(CurKey iNT,CUrName Varchar(100),CurISOCODE varchar(100))


DECLARE curr_getCurrency CURSOR FORWARD_ONLY FOR
SELECT DISTINCT ClientDB FROM Client WHERE offline=0 AND CLientID=341

OPEN curr_getCurrency FETCH curr_getCurrency INTO @tempDB


WHILE @@FETCH_STATUS=0

BEGIN 
IF @tempDB IS NOT NULL

SET @select ='
INSERT INTO #GetCurrencyDetails(CurKey,CUrName,CurISOCODE)
SELECT DISTINCT CurrencyKey,fldEnglish,CurrencyISOCode
FROM tbvCurrencies
INNER JOIN '+@tempDB+'..SubUnitRents ON SubUnitRents.RentAmountCurr=tbvCurrencies.CurrencyKey
INNER JOIN '+@tempDB+'..TenantImprovement ON TenantImprovement.AmountCurr=tbvCurrencies.CurrencyKey
INNER JOIN Client ON CLient.CLientID=SubunitRents.CLientID
WHERE Client.CLientID=341'

  EXEC(@select)
PRINT @tempDB
--PRINT @select
FETCH NEXT FROM curr_getCurrency INTO @tempdb
END 

SELECT * FROM #GetCurrencyDetails

CLOSE curr_getCurrency
DEALLOCATE curr_getCurrency

DROP TABLE #GetCurrencyDetails

--SELECT CurrencyKey* FROM tbvCurrencies