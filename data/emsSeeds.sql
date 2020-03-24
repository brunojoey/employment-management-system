USE buisnessDB;

SELECT * FROM department;
SELECT * FROM role;
SELECT * FROM employees;

INSERT INTO department (name) VALUES (1, "New York City, New York"), (2, "Austin, Texas"), (3, "Atlanta, Georgia"), (4, "San Francisco, California");

INSERT INTO role (title, salary, department_id) VALUES (1, "President", 150,000);

INSERT INTO role (title, salary, department_id) VALUES (2, "Managers", 100,000);

INSERT INTO role (title, salary, department_id) VALUES (4, "Engineers", 60,000);

INSERT INTO role (title, salary, department_id) VALUES (3, "Quality Assurance", 55,000);

INSERT INTO role (title, salary, department_id) VALUES (5, "Interns" 30,000);

INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ();