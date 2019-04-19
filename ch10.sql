USE learnsql;

SELECT EMP_ID, CITY                       -- p.115
FROM EMPLOYEE_TBL
GROUP BY CITY, EMP_ID;

SELECT EMP_ID, SUM(SALARY)
FROM EMPLOYEE_PAY_TBL
GROUP BY SALARY, EMP_ID;

SELECT SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEE_PAY_TBL;

SELECT SUM(SALARY)
FROM EMPLOYEE_PAY_TBL
GROUP BY SALARY;

SELECT CITY
FROM EMPLOYEE_TBL;

SELECT CITY, COUNT(*)                     -- p.116
FROM EMPLOYEE_TBL
GROUP BY CITY;

CREATE TABLE EMP_PAY_TMP                     -- 创建临时表EMP_PAY_TMP
(
CITY  VARCHAR(15)  NOT NULL,
LAST_NAME  VARCHAR(15)  NOT NULL,
FIRST_NAME  VARCHAR(15)  NOT NULL,
PAY_RATE  DECIMAL(4,2),
SALARY  DECIMAL(8,2)
);
INSERT INTO EMP_PAY_TMP
SELECT CITY, LAST_NAME, FIRST_NAME, PAY_RATE, SALARY
FROM EMPLOYEE_TBL, EMPLOYEE_PAY_TBL
WHERE EMPLOYEE_TBL.EMP_ID = EMPLOYEE_PAY_TBL.EMP_ID;

CREATE TABLE EMP_PAY_TMP AS                             -- 创建临时表EMP_PAY_TMP  方法二
SELECT CITY, LAST_NAME, FIRST_NAME, PAY_RATE, SALARY
FROM EMPLOYEE_TBL, EMPLOYEE_PAY_TBL
WHERE EMPLOYEE_TBL.EMP_ID = EMPLOYEE_PAY_TBL.EMP_ID;

DROP TABLE EMP_PAY_TMP;               -- 检查临时表EMP_PAY_TMP状态
DELETE FROM EMP_PAY_TMP;
SELECT * FROM EMP_PAY_TMP;

SELECT CITY, AVG(PAY_RATE), AVG(SALARY)
FROM EMP_PAY_TMP
GROUP BY CITY;

SELECT CITY, AVG(PAY_RATE), AVG(SALARY)            -- p.117
FROM EMP_PAY_TMP
WHERE CITY IN ('INDIANAPOLIS', 'WHITELAND')
GROUP BY CITY
ORDER BY 2, 3;                                  -- MYSQL NULL默认最小，ORACLE NULL默认最大

SELECT CITY, AVG(PAY_RATE), AVG(SALARY)            
FROM EMP_PAY_TMP
WHERE CITY IN ('INDIANAPOLIS', 'WHITELAND', 'GREENWOOD')
GROUP BY CITY
ORDER BY 2, 3;

SELECT CITY, AVG(PAY_RATE), AVG(SALARY)            
FROM EMP_PAY_TMP
WHERE CITY IN ('INDIANAPOLIS', 'WHITELAND', 'GREENWOOD')
GROUP BY CITY
ORDER BY CASE 
WHEN 2 is null then 1 else 0 end asc, 3;                    -- 使AVG(PAY_RATE)为NULL的记录排到后面

SELECT YEAR(DATE_HIRE) AS YEAR_HIRED, SUM(SALARY)             -- p.118
FROM EMPLOYEE_PAY_TBL
GROUP BY 1;

SELECT LAST_NAME, FIRST_NAME, CITY
FROM EMPLOYEE_TBL
GROUP BY LAST_NAME;

SELECT LAST_NAME, FIRST_NAME, CITY
FROM EMPLOYEE_TBL
GROUP BY LAST_NAME, FIRST_NAME, CITY;

SELECT CITY, LAST_NAME
FROM EMPLOYEE_TBL
GROUP BY CITY, LAST_NAME;

SELECT CITY, COUNT(*)                                   -- p.119
FROM EMPLOYEE_TBL
GROUP BY CITY
ORDER BY 2, 1;

SELECT CITY, ZIP, AVG(PAY_RATE), AVG(SALARY)            -- p.120
FROM EMPLOYEE_TBL E
INNER JOIN EMPLOYEE_PAY_TBL P
ON E.EMP_ID=P.EMP_ID
GROUP BY CITY, ZIP
ORDER BY CITY, ZIP;

SELECT CITY, ZIP, AVG(PAY_RATE), AVG(SALARY)
FROM EMPLOYEE_TBL E
INNER JOIN EMPLOYEE_PAY_TBL P
ON E.EMP_ID=P.EMP_ID
GROUP BY CITY, ZIP WITH ROLLUP;

SELECT CIYT, ZIP, AVG(PAY_RATE), AVG(SALARY)                 -- p.121
FROM EMPLOYEE_TBL E
INNER JOIN EMPLOYEE_PAY_TBL P
ON E.EMP_ID = P.EMP_ID
GROUP BY CUBE(CITY, ZIP);                                   -- MYSQL不支持CUBE

SELECT CITY, AVG(PAY_RATE), AVG(SALARY)
FROM EMP_PAY_TMP
WHERE CITY <> 'GREENWOOD'
GROUP BY CITY
HAVING AVG(SALARY) > 20000
ORDER BY 3;