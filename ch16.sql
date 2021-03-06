USE learnsql;

-- p.195
CREATE INDEX NAME_IDX
ON EMPLOYEE_TBL (LAST_NAME);

CREATE UNIQUE INDEX NAME_IDX
ON EMPLOYEE_TBL (LAST_NAME);

-- p.196
CREATE INDEX ORD_IDX
ON ORDERS_TBL (CUST_ID, PROD_ID);