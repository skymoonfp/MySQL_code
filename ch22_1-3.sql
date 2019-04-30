use learnsql;
USE MYSQL;
SHOW TABLES;

-- 第1题 
SELECT CONCAT('DESCRIBE ', TABLE_NAME, ';')
FROM TABLES_PRIV;

-- 第2题
SELECT CONCAT('SELECT COUNT(*) FROM ', TABLE_NAME, ';')
FROM TABLES;

-- 第3题 
BEGIN
	 DECLARE @custname VARCHAR(30);
     DECLARE @purchases decimal(6,2);
     DECLARE customercursor CURSOR
     FOR
     SELECT C.CUST_NAME, SUM(P.COST * Q.QTY) AS SALES
     FROM CUSTOMER_TBL C
     INNER JOIN ORDERS_TBL O ON C.CUST_ID = O.CUST_ID
     INNER JOIN PRODUCTS_TBL P ON O.PROD_ID = P.PROD_ID
     GROUP BY C.CUST_NAME;
     OPEN customercursor;
     FETCH NEXT FROM customercursor INTO @custname, @purchases
     WHILE (@@FETCH_STATUS <> -1)
		   BEGIN
			   IF (@@FETCH_STATUS <> -2)
                    BEGIN
						 PRINT @custname + ':$' + CAST(@purchases AS VARCHAR(20))
					END
		   FETCH NEXT FROM customercursor INTO @custname, @purchases
           END;
     CLOSE customercursor;
     DEALLOCATE customercursor;
END;