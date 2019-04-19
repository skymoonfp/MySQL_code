USE learnsql;

-- 第1题
SELECT CONCAT(LAST_NAME, ', ', FIRST_NAME)
FROM EMPLOYEE_TBL;

-- 第2题
SELECT CONCAT(LAST_NAME, ', ', FIRST_NAME), SUBSTRING(PHONE, 1, 3)
FROM EMPLOYEE_TBL;

-- 第3题
SELECT CONCAT(FIRST_NAME, '.', LAST_NAME, '@PERPTECH.COM') AS E_mail
FROM EMPLOYEE_TBL;

-- 第4题
SELECT CONCAT(LAST_NAME,', ', FIRST_NAME) AS NAME,
	   CONCAT(SUBSTRING(EMP_ID, 1, 3), '-', 
			  SUBSTRING(EMP_ID, 4, 2), '-',
              SUBSTRING(EMP_ID, 6, 4)) AS ID,
	   CONCAT('(', SUBSTRING(PHONE, 1, 3), ')',
              SUBSTRING(PHONE, 4, 3), '-',
              SUBSTRING(PHONE, 7, 4)) AS PHONE
FROM EMPLOYEE_TBL;