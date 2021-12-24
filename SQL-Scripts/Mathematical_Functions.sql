-- Mathematical Numeric Functions in SQL Server 2012
/*ABS (number) Function
The ABS Function is used to ignore a negative number or value. This function returns a positive value if any value is not absolute or positive. The Numeric function abs always returns the absolute (positive) value of number.
*/
DECLARE @Test int;
SET @Test = -56765;
SELECT ABS(@Test) as absOutput;
SELECT ABS(-11.0) as absOutput, ABS(0.0) as absOutput, ABS(20.0) as absOutput,ABS(null) as absOutput,ABS(-null) as absOutput,ABS(-0.09) as absOutput,ABS(1/0.1) as absOutput
SELECT ABS('a')--Error converting data type varchar to float.

SELECT ABS(12+NULL+12)
/* CEILING (number) Function:The Ceiling Function rounds up a number to the next whole number, regardless of the decimal portion of a number. The ceil function returns the smallest integer value that is greater than or equal to the specified numeric expression. */
-- Ceiling Function
select CEILING (125.50)--126
Select CEILING (-125.30)--125
Select CEILING (0.30)--1
Select CEILING (0.05)--1
SELECT CEILING(4.2 + 9.1)--14
SELECT CEILING(NULL + 9.1) --NULL

/*
Floor (number) Function :-The Floor Function is the opposite of the ceiling function. The Floor function returns the largest integer value that is greater than or equal to the specified numeric expression or we can say that the Floor function is an expression of the exact numeric or approximate numeric data type category, except for the bit data type.
*/
-- Floor Function
select Floor (125.50)
Select Floor (-125.30)
Select Floor (0.30)
Select Floor (0.05)
SELECT Floor(4.2 + 9.1)
/* SQUARE (float_number) Function: The Square Function returns the square of the given expression. This function is an important function for when we determine something such as an area of a circle or another calculation which is based on a square. In this function, we also calculate pi()*r^2. R is the radius of circle.*/

-- Square Function
declare @a int,@b float, @c int
set @a =4
set @b =6.1
set @c=0
select SQUARE (@a)
select SQUARE (@b)
select SQUARE (@c)

DECLARE @r float
SET @r = 5
SELECT PI()* SQUARE(@r) as AreaofCircle

/*ROUND Function: The Round Function is used to round a positive or negative value to a specific length. The Round function returns the number rounded to the precision specified by length. If length is positive, the digits to the right of the decimal point are rounded. If it's negative the digits to the left of the decimal point are rounded.
*/
--Syntax :: ROUND (numeric_exp, length)  Numeric expression represents the numeric value to round and the length is a positive number, numeric_expression is rounded to the number of decimal positions specified by length.
-- ROUND Function
SELECT ROUND(123.9994, 3) as ROUNDFunction
Select ROUND(123.9995, 3) as ROUNDFunction
SELECT ROUND(123.4545, 2) as ROUNDFunction
Select ROUND(123.45, -2) as ROUNDFunction
SELECT ROUND(150.75, 0)  as ROUNDFunction
Select ROUND(150.75, 0, 1) as ROUNDFunction

/*IsNumeric (Expression) Function :The IsNumeric Function is used to check whether something is a valid numeric type or not. The IsNumeric function returns a value of 1 (true) if the expression is a numeric value and returns a value of 0 (false) otherwise.
*/
-- ISNUMERIC
declare @Name Varchar(30)
set @Name='berry'
SELECT ISNUMERIC (@Name) as ISNUMERICFunction
Select ISNUMERIC (5) as ISNUMERICFunction
Select ISNUMERIC (-5) as ISNUMERICFunction
Select ISNUMERIC ('Bhaskar') as ISNUMERICFunction

SELECT * FROM SOURCE_DB..tableA tn
SELECT * FROM sys.tables t
USE Berry_DB
CREATE TABLE [tbl_Numeric](id varchar(2))
INSERT INTO tbl_Numeric 
SELECT '4' union
SELECT '2' UNION
SELECT 'a' UNION
SELECT '3' UNION
SELECT 'b' 

SELECT *  FROM tbl_Numeric WHERE ISNUMERIC(ID)!=0
SELECT * FROM tbl_Numeric

/*DEGREES (numeric_expression) Function : The Degrees Function is used to determine the angle in degrees of the specified number expression. */
-- Degrees Function
SELECT DEGREES(7) as DegreesFunction
SELECT DEGREES(PI()/2) as DegreesFunction

/*Power*/
SELECT POWER(10,2) AS Power_Value
SELECT POWER(1000,-2) AS Power_Value

/*Sign +1 Positive ,0-Zero ,-1 of Negative*/

SELECT SIGN(123) AS Sign_Value
SELECT SIGN(-123) AS Sign_Value
SELECT SIGN(0) AS Sign_Value
SELECT SIGN(null) AS Sign_Value
SELECT SIGN('a') AS Sign_Value

/*SQRT Functions*/
SELECT SQRT(100) AS Value
SELECT SQRT(SQUARE(100)) AS Value
SELECT SQRT(100) AS Value


/*EXP-Returns the exponential value of the specified float expression.*/
SELECT EXP(100) AS VALUE