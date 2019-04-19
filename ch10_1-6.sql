USE learnsql;

-- 第一题
SELECT CITY
FROM EMPLOYEE_TBL;

-- 第二题
SELECT CITY, COUNT(*)
FROM EMPLOYEE_TBL
GROUP BY CITY;

-- 第三题
SELECT CITY, COUNT(*)
FROM EMPLOYEE_TBL
GROUP BY CITY
HAVING COUNT(*) > 1;

-- 第四题
SELECT CITY, COUNT(*)
FROM EMPLOYEE_TBL
GROUP BY CITY
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- 第五题
SELECT CITY, AVG(PAY_RATE), AVG(SALARY)
FROM EMPLOYEE_PAY_TBL P
INNER JOIN EMPLOYEE_TBL E
ON P.EMP_ID = E.EMP_ID
GROUP BY CITY;

-- 第六题
SELECT CITY, AVG(SALARY)
FROM EMPLOYEE_PAY_TBL P
INNER JOIN EMPLOYEE_TBL E
ON P.EMP_ID = E.EMP_ID
GROUP BY CITY
HAVING AVG(SALARY) > 20000;