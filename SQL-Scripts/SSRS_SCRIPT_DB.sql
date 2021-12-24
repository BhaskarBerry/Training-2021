--CREATING A SAMPLE DATABASE "SSRS_DEMO"

CREATE DATABASE SSRS_DEMO
USE SSRS_DEMO

CREATE TABLE EMPLOYEE(ID INT PRIMARY KEY,FNAME VARCHAR(20),LNAME VARCHAR(20),DOB DATETIME,GENDER VARCHAR(6))
INSERT INTO EMPLOYEE VALUES(100,'Bhaskar','Berry','1990/12/17','Male')
INSERT INTO EMPLOYEE VALUES(101,'Ayub','Md','1991/06/06','Male')
INSERT INTO EMPLOYEE VALUES(102,'Baba','vishwa','1990/02/15','Female')
INSERT INTO EMPLOYEE VALUES(103,'Mala','shree','1991/01/14','Female')
INSERT INTO EMPLOYEE VALUES(104,'Jhon','Luois','1989/12/01','Male')
INSERT INTO EMPLOYEE VALUES(105,'Jack','Rap','1987/12/17','Male')
INSERT INTO EMPLOYEE VALUES(106,'Merry','Immaculate','1990/10/17','Female')
INSERT INTO EMPLOYEE VALUES(107,'Raghu','reddy','1995/12/17','Male')
INSERT INTO EMPLOYEE VALUES(108,'Modi','Modi','1980/12/17','Male')
INSERT INTO EMPLOYEE VALUES(109,'Abdul','Md','1990/12/17','Male')
INSERT INTO EMPLOYEE VALUES(110,'Roopa','Raghu','1989/12/17','Female')

SELECT * FROM EMPLOYEE
--DROP TABLE EMPLOYEE

CREATE TABLE PRODUCTS(PROD_ID INT PRIMARY KEY ,PROD_NAME NVARCHAR(20),PROD_PRICE FLOAT)
INSERT INTO PRODUCTS VALUES(1,'DELL_LAPTOP',30000.00)
INSERT INTO PRODUCTS VALUES(2,'HP_LAPTOP',35000.00)
INSERT INTO PRODUCTS VALUES(3,'LENOVO_LAPTOP',40000.00)
INSERT INTO PRODUCTS VALUES(4,'APPLE_LAPTOP',130000.00)
INSERT INTO PRODUCTS VALUES(5,'MAC_NOTEBOOK',30000.00)

SELECT * FROM PRODUCTS
--DROP TABLE PRODUCTS

--DROP TABLE  SALES

CREATE TABLE SALES(SALES_ID INT PRIMARY KEY,SALESYTD FLOAT ,SALES_2014 FLOAT,PROD_ID INT FOREIGN KEY (PROD_ID) REFERENCES PRODUCTS(PROD_ID))
INSERT INTO SALES VALUES(10,1000.0,2000.0,1)
INSERT INTO SALES VALUES(11,1500.0,1030.5,2)
INSERT INTO SALES VALUES(12,8000.0,2030.0,1)
INSERT INTO SALES VALUES(13,700.0,5000.0,4)
INSERT INTO SALES VALUES(14,1300.0,5060.0,5)
INSERT INTO SALES VALUES(15,500.0,6000.0,5)
INSERT INTO SALES VALUES(16,1100.0,2060.0,3)
INSERT INTO SALES VALUES(17,2300.0,1000.0,3)
INSERT INTO SALES VALUES(18,9800.0,2700.0,4)
INSERT INTO SALES VALUES(19,8000.0,9000.5,1)

--SELECT * FROM SALES ORDER BY PROD_ID

SELECT S.SALES_ID,P.PROD_NAME,R.REGION_NAME ,SALESYTD  ,SALES_2014 from SALES_ORDER SO
INNER JOIN SALES S ON S.SALES_ID = SO.SALEID
INNER JOIN REGION  R ON R.SALE_ID = S.SALES_ID
LEFT JOIN PRODUCTS P ON p.PROD_ID = s.PROD_ID
GROUP BY SO.ORDERDATE,P.PROD_NAME,R.REGION_NAME,S.SALES_ID


CREATE TABLE REGION(REGION_NAME NVARCHAR(10),SALE_ID INT FOREIGN KEY (SALE_ID) REFERENCES SALES(SALES_ID) )
INSERT INTO REGION VALUES('Asia',10);
INSERT INTO REGION VALUES('Asia',11);
INSERT INTO REGION VALUES('Asia',12);
INSERT INTO REGION VALUES('Asia',13);
INSERT INTO REGION VALUES('Europe',19);
INSERT INTO REGION VALUES('Europe',18);
INSERT INTO REGION VALUES('Europe',17);
INSERT INTO REGION VALUES('Europe',16);
INSERT INTO REGION VALUES('America',15);
INSERT INTO REGION VALUES('America',10);
INSERT INTO REGION VALUES('America',10);

--REGION_NAME,COUNT(SALE_ID) 

SELECT R.REGIONNAME,SUM(S.SALESYTD) AS [SALES IN 2015] FROM REGION  R
INNER JOIN SALES S ON S.SALES_ID = R.SALE_ID
GROUP BY REGION_NAME


CREATE TABLE SALES_ORDER 
(SALES_ORDERID INT , ORDERDATE DATETIME NOT NULL,TOTALDUE MONEY,SHIPDATE DATETIME,DUEDATE DATETIME,
SALEID INT FOREIGN KEY (SALEID) REFERENCES SALES(SALES_ID))
INSERT INTO SALES_ORDER VALUES(1000,'2004-06-06',1200,'2004-06-13','2004-06-08',10)
INSERT INTO SALES_ORDER VALUES(1001,'2014-06-06',1300,'2004-06-13','2014-06-08',11)
INSERT INTO SALES_ORDER VALUES(1002,'2014-06-06',1200,'2004-06-13','2014-06-08',12)
INSERT INTO SALES_ORDER VALUES(1003,'2006-06-06',1200,'2004-06-13','2006-06-08',13)
INSERT INTO SALES_ORDER VALUES(1004,'2006-06-07',1200,'2004-06-13','2006-06-08',14)
INSERT INTO SALES_ORDER VALUES(1005,'2000-06-07',1200,'2004-06-13','2000-06-15',15)
INSERT INTO SALES_ORDER VALUES(1006,'2013-06-07',1200,'2004-06-13','2013-06-15',16)
INSERT INTO SALES_ORDER VALUES(1007,'2014-06-08',1200,'2004-06-13','2004-06-08',17)
INSERT INTO SALES_ORDER VALUES(1008,'2004-06-08',1200,'2004-06-13','2004-06-09',18)
INSERT INTO SALES_ORDER VALUES(1009,'2004-06-08',1200,'2004-06-13','2004-06-09',19)
INSERT INTO SALES_ORDER VALUES(1010,'2004-06-08',1200,'2004-06-13','2004-06-09',15)
INSERT INTO SALES_ORDER VALUES(10011,'2004-06-09',1200,'2004-06-13','2004-06-09',14)

--DROP TABLE SALES_ORDER
SELECT YEAR(ORDERDATE) as orderd,TOTALDUE FROM SALES_ORDER

---
SELECT SUM(SO.TOTALDUE) AS TOTAL_DUE,Year(SO.ORDERDATE) ORDER_DATE,
S.SALES_ID,P.PROD_NAME,R.REGION_NAME from SALES_ORDER SO
INNER JOIN SALES S ON S.SALES_ID = SO.SALEID
INNER JOIN REGION  R ON R.SALE_ID = S.SALES_ID
LEFT JOIN PRODUCTS P ON p.PROD_ID = s.PROD_ID
GROUP BY SO.ORDERDATE,P.PROD_NAME,R.REGION_NAME,S.SALES_ID



