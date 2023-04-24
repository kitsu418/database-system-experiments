CREATE DATABASE IF NOT EXISTS MyDb;
USE MyDb;
CREATE TABLE dept (deptNo INT PRIMARY KEY, deptName VARCHAR(32));
CREATE TABLE staff (
    staffNo INT PRIMARY KEY,
    staffName VARCHAR(32),
    gender CHAR(1),
    dob DATE,
    salary NUMERIC(8, 2),
    deptNo INT,
    CONSTRAINT FK_staff_deptNo FOREIGN KEY (deptNo) REFERENCES dept (deptNo)
);