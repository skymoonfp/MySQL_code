USE LEARNSQL;

select min(last_name) as 第一个, max(last_name) as 最后一个 from employee_tbl;

select min(last_name) as first_name from employee_tbl;
select max(last_name) as last_name from employee_tbl;