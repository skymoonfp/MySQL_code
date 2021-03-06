use learnsql;

-- p.203
SELECT CUSTOMER_TBL.CUST_ID, CUSTOMER_TBL.CUST_NAME,
CUSTOMER_TBL.CUST_PHONE, ORDERS_TBL.ORD_NUM, ORDERS_TBL.QTY
FROM CUSTOMER_TBL, ORDERS_TBL
WHERE CUSTOMER_TBL.CUST_ID = ORDERS_TBL.CUST_ID
AND ORDERS_TBL.QTY > 1 AND CUSTOMER_TBL.CUST_NAME LIKE 'G%'
ORDER BY CUSTOMER_TBL.CUST_NAME;

SELECT C.CUST_ID, 
	   C.CUST_NAME,
	   C.CUST_PHONE, 
       O.ORD_NUM,
       O.QTY
FROM CUSTOMER_TBL C,
	 ORDERS_TBL O
WHERE C.CUST_ID = O.CUST_ID
  AND O.QTY > 1 
  AND C.CUST_NAME LIKE 'G%'
ORDER BY 2;

-- p.207
SELECT EMP_ID, LAST_NAME, FIRST_NAME, STATE
FROM EMPLOYEE_TBL
WHERE LAST_NAME LIKE 'STEVENS';

SELECT EMP_ID, LAST_NAME, FIRST_NAME, STATE
FROM EMPLOYEE_TBL
WHERE LAST_NAME LIKE '%TEVENS%';

SELECT EMP_ID, LAST_NAME, FIRST_NAME, STATE
FROM EMPLOYEE_TBL
WHERE LAST_NAME LIKE 'ST%';

-- p.208
SELECT EMP_ID,
	   LAST_NAME,
       FIRST_NAME
FROM EMPLOYEE_TBL
WHERE CITY = 'INDIANAPOLIS'
   OR CITY = 'BROWNSBURG'
   OR CITY = 'GREENFIELD';

SELECT EMP_ID,
	   LAST_NAME,
       FIRST_NAME
FROM EMPLOYEE_TBL
WHERE CITY IN ('INDIANAPOLIS', 'BROWNSBURG', 'GREENFIELD');

SELECT C.CUST_ID, 
	   C.CUST_NAME,
       P.PROD_DESC,
       SUM(O.QTY) AS QTY,
       SUM(P.COST) AS COST,
       SUM(O.QTY * P.COST) AS TOTAL
FROM CUSTOMER_TBL AS C
	 INNER JOIN ORDERS_TBL AS O
				ON C.CUST_ID = O.CUST_ID
	 INNER JOIN PRODUCTS_TBL AS P
				ON O.PROD_ID = P.PROD_ID
WHERE PROD_DESC LIKE ('p%')
GROUP BY C.CUST_ID, C.CUST_NAME, P.PROD_DESC
HAVING SUM(O.QTY * P.COST) > 25.00;