CREATE DATABASE company;

USE company;

CREATE TABLE t_dept(
	deptno INT,
    dname VARCHAR(20),
    loc VARCHAR(40)
);

DESCRIBE t_dept;

SHOW CREATE TABLE t_dept;

DROP TABLE t_dept;

ALTER TABLE t_dept
	RENAME tab_dept;

DESCRIBE tab_dept;

ALTER TABLE tab_dept
	RENAME t_dept;
    
ALTER TABLE t_dept
	ADD descri VARCHAR(20);
    
ALTER TABLE t_dept
	ADD descri VARCHAR(20) FIRST;

ALTER TABLE t_dept
	ADD descri VARCHAR(20)
		AFTER deptno;

ALTER TABLE t_dept
	DROP descri;

ALTER TABLE t_dept
	MODIFY deptno VARCHAR(20);

DESC t_dept;

ALTER TABLE t_dept
	CHANGE loc location VARCHAR(40);
    
ALTER TABLE t_dept
	CHANGE location loc VARCHAR(20);

ALTER TABLE t_dept
	MODIFY loc VARCHAR(40) FIRST;

ALTER TABLE t_dept
	MODIFY deptno INT(11) 
		AFTER dname;