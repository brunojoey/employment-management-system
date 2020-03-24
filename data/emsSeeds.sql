USE buisnessDB;

SELECT * FROM department;
SELECT * FROM role;
SELECT * FROM employees;

/* DEPARTMENTS */
INSERT INTO department (name) VALUES (1, "New York City, New York"), (2, "Austin, Texas"), (3, "Atlanta, Georgia"), (4, "San Francisco, California"), (5, "Seattle, Washington");

/* ROLES */
INSERT INTO role (title, salary, department_id) VALUES (1, "President", 150,000, 1), (1, "President", 150,000, 5);

INSERT INTO role (title, salary, department_id) VALUES (2, "Managers", 100,000, 1), (2, "Managers", 100,000, 2), (2, "Managers", 100,000, 3), (2, "Managers", 100,000, 4), (2, "Managers", 100,000, 5);

INSERT INTO role (title, salary, department_id) VALUES (3, "Engineers", 60,000, 1), (3, "Engineers", 60,000, 2), (3, "Engineers", 60,000, 3), (3, "Engineers", 60,000, 4), (3, "Engineers", 60,000, 5);

INSERT INTO role (title, salary, department_id) VALUES (4, "Quality Assurance", 55,000, 1), (4, "Quality Assurance", 55,000, 2), (4, "Quality Assurance", 55,000, 3), (4, "Quality Assurance", 55,000, 4), (4, "Quality Assurance", 55,000, 5);

INSERT INTO role (title, salary, department_id) VALUES (5, "Interns" 30,000, 1), (5, "Interns" 30,000, 2), (5, "Interns" 30,000, 3), (5, "Interns" 30,000, 4), (5, "Interns" 30,000, 5);

/* PRESIDENTS */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES ("Blathers", "Owl", 1, NULL), ("Tom", "Nook", 2, NULL);

/* MANAGERS */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (2, "Solid", "Snake", 4, 101), (3, "Reneigh", "Glam", 5, 102), (4, "Timmy", "Nook", 6, 103), (5, "Tommy", "Nook", 7, 104);

/* ENGINEERS */
/* NEW YORK */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* AUSTIN */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* ATLANTA */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* SAN FRANCISCO */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* SEATTLE */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* QUALITY ASSURANCE */
/* NEW YORK */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* AUSTIN */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* ATLANTA */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* SAN FRANCISCO */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* SEATTLE */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* INTERNS */
/* NEW YORK */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* AUSTIN */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* ATLANTA */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* SAN FRANCISCO */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);

/* SEATTLE */
INSERT INTO employees (first_name, last_name, role_id, manager_id) VALUES (1, "Cloud", "Strife", 3, 100), (1, "Cloud", "Strife", 3, 100);