-- 데이터 베이스 보여줘
SHOW DATABASES;

CREATE DATABASE company;

-- 현재 선택된 데이터베이스
-- 만약 null이면 아무것도 없는것임.
SELECT database();

-- 사용하고자 하는 데이터베이스 
USE company;
--출력물,  Database Changed


CREATE TABLE EMPLOYEE(
    ID INT PRIMARY KEY,
    NAME VARCHAR(30) NOT NULL,
    BRITH_DATE DATE,
    SEX CHAR(1) CHECK(SEX IN('M','F')),
    POSITION VARCHAR(10),
    SALARY INT DEFAULT 50000000,
    DEPT_ID INT,
    FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(ID)
        on delete SET NULL ON UPDATE CASCADE,
        CHECK(salary >= 50000000)
);
