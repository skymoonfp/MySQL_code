show databases;

USE company;

SHOW tables;

DESC t_dept;

ALTER TABLE t_dept
	MODIFY deptno INT(11) FIRST;

ALTER TABLE t_dept
	MODIFY loc VARCHAR(40) AFTER dname;

CREATE TABLE t_diary(
	diaryno	INT(11)	NOT NULL,
    tablename	VARCHAR(20)	NULL,
    diarytime	DATETIME	NULL
);

ALTER TABLE t_diary
	ADD CONSTRAINT pk_diary PRIMARY KEY (diaryno);
    
SELECT AUTO_INCREMENT 
	FROM information_schema.tables 
		WHERE table_name="t_diary";
        
ALTER TABLE t_diary
	MODIFY diaryno INT(11) AUTO_INCREMENT;

DESC t_diary;

CREATE TRIGGER tri_diarytime
	BEFORE INSERT
		ON t_dept FOR EACH ROW
			INSERT INTO t_diary VALUES(NULL, 't_dept', NOW());

INSERT INTO t_dept VALUES(1, 'cjgongdept', 'ShangXi');
SELECT *
	FROM t_diary;

DELIMITER $$
CREATE TRIGGER tri_diarytime2
	BEFORE INSERT
		ON t_dept FOR EACH ROW
			BEGIN
				INSERT INTO t_diary VALUES(NULL, 't_dept', now());
                INSERT INTO t_diary VALUES(NULL, 't_dept', CURDATE());
			END $$
DELIMITER ;

DROP TRIGGER tri_diarytime2;

INSERT INTO t_dept VALUES('83', 'MARKET', 'BEIJING');
SELECT *
	FROM t_diary;

SHOW TRIGGERS;

SELECT * 
	FROM information_schema.tables
		WHERE table_name="t_diary";
DROP TABLE t_diary;
CREATE TABLE t_diary(
	diaryno	INT(11)	NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tablename	VARCHAR(20)	NULL,
    diarytime	DATETIME	NULL
);
        
SELECT *
	FROM information_schema.triggers;