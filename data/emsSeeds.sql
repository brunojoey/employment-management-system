USE buisnessDB;

SELECT * FROM department;
SELECT * FROM role;
SELECT * FROM employees;

INSERT INTO department (name)
VALUES (1, "New York City, New York"), (2, "Austin, Texas"), (3, "Atlanta, Georgia"), (4, "San Francisco, California");

INSERT INTO role (title, salary, department_id)
VALUES ();

INSERT INTO employees (first_name, last_name, role_id, manager_id)
VALUES ();