DROP DATABASE IF EXISTS businessdb;
CREATE DATABASE businessdb;

USE businessdb;

CREATE TABLE department (
    id INT(10) AUTO_INCREMENT,
    name VARCHAR(50) NULL,
    PRIMARY KEY(id)
);

CREATE TABLE role (
    id INT(10) AUTO_INCREMENT,
    title VARCHAR(30) NULL,
    salary DECIMAL(10,3) NOT NULL,
    department_id INTEGER(10) NULL,
    FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE SET NULL,
    PRIMARY KEY(id) 
);

CREATE TABLE employee (
    id INT(10) AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INTEGER(10) NULL,
    manager_id INTEGER(10) NULL,
    PRIMARY KEY(id) 
);

ALTER TABLE employee
ADD FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL;

SELECT * FROM department;
SELECT * FROM role;
SELECT * FROM employee;