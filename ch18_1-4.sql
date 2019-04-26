use learnsql;

-- 第1题
CREATE USER John;

-- 第2题
GRANT SELECT 
ON EMPLOYEE_TBL
TO John;

-- 第3题
GRANT SELECT 
ON learnsql.*
TO John;

GRANT SELECT 
ON TABLE *
TO John;

-- 第4题
REVOKE SELECT 
ON learnsql.*
FROM John;

DROP USER John;

DROP USER John CASCADE;