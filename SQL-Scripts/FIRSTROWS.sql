SELECT * FROM EMPLOYEE

CREATE TABLE EMPLOYEE 
( EID INT,
  ENAME CHAR(20))
  
 CREATE TABLE EMPLOYEE_TARGET 
( EID INT,
  ENAME CHAR(20))
  
  SELECT * FROM EMPLOYEE_TARGET
  
 SELECT * FROM EMPLOYEE  WHERE ROWNUM<=3
 
SELECT *
FROM (select * from EMPLOYEE ORDER BY ENAME DESC) EMPLOYEE2
WHERE rownum <= 3
ORDER BY rownum DESC
  
  
 