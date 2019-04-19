USE LEARNSQL;

-- 第1题
SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
SELECT NOW();
SELECT CURRENT_TIMESTAMP;

-- 第2题
SELECT EMP_ID, DATE_HIRE
	FROM EMPLOYEE_PAY_TBL;
    
-- 第3题
SELECT EMP_ID, EXTRACT(YEAR FROM DATE_HIRE), DATE_HIRE
	FROM EMPLOYEE_PAY_TBL;
SELECT EMP_ID, EXTRACT(MONTH FROM DATE_HIRE), DATE_HIRE
	FROM EMPLOYEE_PAY_TBL;
SELECT EMP_ID, EXTRACT(DAY FROM DATE_HIRE), DATE_HIRE
	FROM EMPLOYEE_PAY_TBL;

-- 第4题
SELECT EMP_ID, YEAR(DATE_HIRE)
	FROM EMPLOYEE_PAY_TBL;
SELECT EMP_ID, MONTH(DATE_HIRE), MONTHNAME(DATE_HIRE)
	FROM EMPLOYEE_PAY_TBL;
SELECT EMP_ID, DAY(DATE_HIRE), DAYNAME(DATE_HIRE)
	FROM EMPLOYEE_PAY_TBL;

-- 第5题
SELECT EMP_ID, DATE_HIRE, CURRENT_DATE
	FROM EMPLOYEE_PAY_TBL;

-- 第6题
SELECT EMP_ID, DAY(DATE_HIRE), DAYNAME(DATE_HIRE)
	FROM EMPLOYEE_PAY_TBL;

-- 第7题
SELECT CURRENT_DATE, DAYOFYEAR(CURRENT_DATE) AS '儒略日期';

-- 第8题
SELECT NOW();
SELECT DATE(NOW());
SELECT TIME(NOW());