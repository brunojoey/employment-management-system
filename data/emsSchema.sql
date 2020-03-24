DROP DATABASE IF EXISTS buisnessDB;
CREATE DATABASE buisnessDB;
USE buisnessDB;

CREATE TABLE department (
    id INTEGER(10) AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NULL,
    PRIMARY KEY(id)
);

CREATE TABLE role (
    id INTEGER(10) AUTO_INCREMENT NOT NULL,
    title VARCHAR(30) NULL,
    salary DECIMAL(10,3) NOT NULL,
    department_id INTEGER(10) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department (id) NULL,
    PRIMARY KEY(id) 
);

CREATE TABLE employees (
    id INTEGER(10) AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INTEGER(10) NULL,
    manager_id INTEGER(10) NULL
);

ALTER TABLE employees
ADD FOREIGN KEY (role_id) REFERENCES role (id) NULL;

ALTER TABLE employees
ADD FOREIGN KEY (manager_id) REFERENCES employees (id) NULL;

SELECT * FROM department;
SELECT * FROM role;
SELECT * FROM employees;