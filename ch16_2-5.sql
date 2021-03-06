use learnsql;

-- 第2题
CREATE INDEX EP_POSITION
ON EMPLOYEE_PAY_TBL (POSITION);

-- 第3题
DROP INDEX EP_POSITION
ON EMPLOYEE_PAY_TBL;
CREATE  UNIQUE INDEX EP_POSITION
ON EMPLOYEE_PAY_TBL (POSITION);

CREATE UNIQUE INDEX SALARY_IDX
ON EMPLOYEE_PAY_TBL (SALARY);

-- 第5题
CREATE INDEX ORD_IDX_1
ON ORDERS_TBL (CUST_ID, PROD_ID, ORD_DATE);