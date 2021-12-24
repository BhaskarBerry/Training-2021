USE BERRY_DB
GO

/*SET XACT_ABORT ON is required for auto rollbacking the transaction batch in such cases.

By default the SET XACT_ABORT is OFF. There ar very few cases where the T-SQL statement that raised exception are rolled back and the transaction continues processing. Depending upon the severity of the error, the entire transaction may be rolled back even when SET XACT_ABORT is OFF.

But When SET XACT_ABORT is ON, if a T-SQL statement raises an exception, then the entire transaction is terminated and rolled back.
But there is an exception for some errors, like for error level 16, example: Datatype Conversion error, the transaction batch is automatically rolled back.*/

-- Create a table and insert test some records
CREATE TABLE X (NBR INT PRIMARY KEY)
 
INSERT INTO X VALUES(1)
INSERT INTO X VALUES(2)
 
-- Tran t1 : PK violation error
BEGIN TRANSACTION T1
    INSERT INTO X VALUES(3)
    INSERT INTO X VALUES(3) -- Msg 2627, Level 14, State 1, Line 9, Violation of PRIMARY KEY constraint...
    INSERT INTO X VALUES(4)
COMMIT TRANSACTION T1
 
SELECT * FROM X
-- Results 4 records inserted above, the entire transaction batch was not rolled back, but only the 2nd INSERT statement.
 --Truncate table X
-- To automatically rollback above transaction batch we will set XACT_ABORT to ON:
SET XACT_ABORT ON
 
BEGIN TRANSACTION T1
    INSERT INTO X VALUES(3)
    INSERT INTO X VALUES(3) -- Msg 2627, Level 14, State 1, Line 9, Violation of PRIMARY KEY constraint...
    INSERT INTO X VALUES(4)
COMMIT TRANSACTION T1
 
SET XACT_ABORT OFF
 
SELECT * FROM X
-- No results, Entire transaction batch is rolled back.
 
--// But for some types of errors setting the XACT_ABORT to ON is not required. Like for Datatype Conversion errors (level = 16). Let's check this:
 
-- Tran t2: Datatype conversion error
BEGIN TRANSACTION T2
    INSERT INTO X VALUES(5)
    INSERT INTO X VALUES('a') -- Msg 245, Level 16, State 1, Line 19, Conversion failed...
    INSERT INTO X VALUES(6)
COMMIT TRANSACTION T2
 
SELECT * FROM X
-- No results, Entire transaction batch is rolled back.
 
-- Final Cleanup
DROP TABLE X