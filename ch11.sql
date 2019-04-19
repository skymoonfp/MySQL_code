USE LEARNSQL;

SELECT  CONCAT('JOHN', 'SON');                            -- p.126

SELECT LAST_NAME + ',' + FIRST_NAME NAME                     -- p.127
FROM EMPLOYEE_TBL;                                         -- 非MYSQL语法

SELECT CONCAT(LAST_NAME, ',  ', FIRST_NAME) NAME
FROM EMPLOYEE_TBL;

SELECT CITY, TRANSLATE(CITY, 'IND', 'ABC')                  -- 不支持TRANSLATE
FROM EMPLOYEE_TBL;

SELECT CITY, REPLACE(CITY, 'I', 'Z')                       -- p.128         
FROM EMPLOYEE_TBL;

SELECT UPPER(CITY)
FROM EMPLOYEE_TBL;

SELECT LOWER(CITY)                                         -- p.129
FROM EMPLOYEE_TBL;

SELECT UCASE(CITY)
FROM EMPLOYEE_TBL;

SELECT LCASE(CITY)
FROM EMPLOYEE_TBL;

SELECT EMP_ID, SUBSTRING(EMP_ID, 1, 3)
FROM EMPLOYEE_TBL;

SELECT PROD_DESC, INSTR(PROD_DESC, 'A')                      -- p.130；两个参数？
FROM PRODUCTS_TBL;

SELECT POSITION, LTRIM(POSITION, 'SALES')                    -- p.131；一个参数？
FROM EMPLOYEE_PAY_TBL;

SELECT RTRIM(FIRST_NAME)                                     -- 一个参数？
FROM EMPLOYEE_TBL 
WHERE FIRST_NAME = 'BRANDON';

select concat('(', ' happy    ', ')') as '右边有四空格字符串', 
	   concat('(', RTRIM(' happy    '), ')') as '去除右边空格';

SELECT POSITION, RTRIM(POSITION, 'ER')                        -- 一个参数？
FROM EMPLOYEE_PAY_TBL;                                        

SELECT DECODE(LAST_NAME, 'SMITH', 'JONES', 'OTHER')           -- p.132；不支持DECODE
FROM EMPLOYEE_TBL;

SELECT CITY,                                                   -- 不支持DECODE
	   DECODE(CITY, 'INDIANAPOLIS', 'INDY',
					'GREENWOOD', 'GREEN', 'OTHER')
FROM EMPLOYEE_TBL;

SELECT PROD_DESC, LENGTH(PROD_DESC)                            -- p.133；
FROM PRODUCTS_TBL;

SELECT PAGER, IFNULL(PAGER, 9999999999)
FROM EMPLOYEE_TBL;

SELECT EMP_ID, COALESCE(BONUS, SALARY, PAY_RATE)                 -- p.134；
FROM EMPLOYEE_PAY_TBL;

SELECT LPAD(PROD_DESC, 30, '.') PRODUCT
FROM PRODUCTS_TBL;

SELECT RPAD(PROD_DESC, 30, '-') PRODUCT                          -- p.135；
FROM PRODUCTS_TBL;

SELECT EMP_ID, ASCII(EMP_ID)
FROM EMPLOYEE_TBL;

SELECT EMP_ID, TO_NUMBER(EMP_ID)                               -- p.136；不支持TO_NUMBER
FROM EMPLOYEE_TBL;

SELECT EMP_ID, CONVERT(EMP_ID, DECIMAL(15,3))
FROM EMPLOYEE_TBL;

SELECT EMP_ID, CAST(EMP_ID AS DECIMAL(15 ,2))
FROM EMPLOYEE_TBL;

SELECT PAY = PAY_RATE, NEW_PAY = STR(PAY_RATE)                  -- p.137；？
FROM EMPLOYEE_PAY_TBL
WHERE PAY_RATE IS NOT NULL;

SELECT PAY_RATE, TO_CHAR(PAY_RATE)                              -- 不支持TO_CHAR   
FROM EMPLOYEE_PAY_TBL
WHERE PAY_RATE IS NOT NULL;

SELECT CONCAT(LAST_NAME, ',  ', FIRST_NAME) NAME,                -- p.138
	   CONCAT(SUBSTR(EMP_ID, 1, 3), '-',
			  SUBSTR(EMP_ID, 4, 2), '-',
              SUBSTR(EMP_ID, 6, 4)) AS ID
FROM EMPLOYEE_TBL;

SELECT SUM(LENGTH(LAST_NAME) + LENGTH(FIRST_NAME)) TOTAL
FROM EMPLOYEE_TBL;