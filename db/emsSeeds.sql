use businessdb;

INSERT INTO department (name) VALUES ('Executive'), ('Sales'), ('Engineering'), ('Finance'), ('Legal');

INSERT INTO role (title, salary, department_id)
VALUES ('President', 250000, 1), ('CEO', 220000, 1), ('Sales Lead', 100000, 2), ('Salesperson', 80000, 2), ('Lead Engineer', 150000, 3), 
('Software Engineer', 120000, 3), ('Account Manager', 160000, 4), ('Accountant', 125000, 4), ('Legal Team Lead', 250000, 5), ('Lawyer', 190000, 5);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ('Tom','Nook', 1, 1), ('Blathers','Owl', 2, 2), ('Kyle', 'Derrickson', 3, NULL), ('Mike', 'Cheveski', 3, 3), ('Ashley', 'Miles', 4, NULL), ('Kevin', 'Neal', 5, 4),
('Javier', 'Bardez', 6, NULL), ('Nicole', 'Brown', 7, 5), ('Sarah', 'Dennison', 8, NULL), ('Tom', 'Blakeman', 9, 6);