const db = require("./db");
const { prompt } = require("inquirer");
const logo = require("asciiart-logo");

appStart();

function appStart() {
    const appText = logo({ name: "Employee Management" }).render();
    console.log(appText);

    questionPrompts();
};

async function questionPrompts() {
    try {
        const { startList } = await prompt([{
            type: "list",
            message: "What would you like to do?",
            name: "startList",
            choices: [
                { value: "All_Employees", name: "View all employees." },
                { value: "Department_Employees", name: "View the employees by department." },
                { value: "Manager_Employees", name: "View the employees by managers." },
                { value: "Update_Manager", name: "Update an employee's manager." },
                { value: "Add_Employee", name: "Add an employee." },
                { value: "Remove_Employee", name: "Remove an employee." },
                { value: "Update_EmployeeRole", name: "Update an employee's role." },
                { value: "Add_Role", name: "Add a role." },
                { value: "Remove_Role", name: "Remove a role." },
                { value: "View_Roles", name: "View all roles." },
                { value: "View_Departments", name: "View all departments."},
                { value: "Add_Department", name: "Add a department."},
                { value: "Remove_Department", name: "Remove a department."},
                { value: "Quit_Application", name: "Quit the application." }
            ]
        }]);
        switch (startList) {
            case "All_Employees":
                return allEmployees();
            case "Department_Employees":
                return departmentEmployees();
            case "Manager_Employees":
                return managerEmployees();
            case "Update_Manager":
                return updateManager();
            case "Add_Employee":
                return addEmployee();
            case "Remove_Employee":
                return removeEmployee();
            case "Update_EmployeeRole":
                return updateRole();
            case "Add_Role":
                return addRole();
            case "Remove_Role":
                return removeRole();
            case "View_Roles":
                return viewRoles();
            case "View_Departments":
                return viewDepartments();
            case "Add_Department":
                return addDepartment();
            case "Remove_Department":
                return removeDepartment();
            case "Quit_Application":
                return quitApplication();
        };
    }
    catch (err) {
        throw err;
    };
};

async function allEmployees() {
    const employees = await db.findAllEmployees();

    console.log("\n");
    console.table(employees);

    questionPrompts();
};

async function departmentEmployees() {
    const departments = await db.findAllDepartments();

    const departmentChoices = departments.map(({ id, name }) => ({
        name: name,
        value: id
    }));

    const { departmentId } = await prompt([
        {
            type: "list",
            name: "departmentId",
            message: "Which department would you like to see employees for?",
            choices: departmentChoices
        }
    ]);

    const employees = await db.findAllEmployeesByDepartment(departmentId);

    console.log("\n");
    console.table(employees);

    questionPrompts();
};

async function managerEmployees() {
    const managers = await db.findAllEmployees();

    const managerChoices = managers.map(({ id, first_name, last_name }) => ({
        name: `${first_name} ${last_name}`,
        value: id
    }));

    const { managerId } = await prompt([
        {
            type: "list",
            name: "managerId",
            message: "Which employee do you want to see direct reports for?",
            choices: managerChoices
        }
    ]);

    const employees = await db.findAllEmployeesByManager(managerId);

    console.log("\n");

    if (employees.length === 0) {
        console.log("The selected employee has no direct reports");
    } else {
        console.table(employees);
    }

    questionPrompts();
};

async function removeEmployee() {
    const employees = await db.findAllEmployees();

    const employeeChoices = employees.map(({ id, first_name, last_name }) => ({
        name: `${first_name} ${last_name}`,
        value: id
    }));

    const { employeeId } = await prompt([
        {
            type: "list",
            name: "employeeId",
            message: "Which employee do you want to remove?",
            choices: employeeChoices
        }
    ]);

    await db.removeEmployee(employeeId);

    console.log("Removed employee from the database");

    questionPrompts();
};

async function updateRole() {
    const employees = await db.findAllEmployees();

    const employeeChoices = employees.map(({ id, first_name, last_name }) => ({
        name: `${first_name} ${last_name}`,
        value: id
    }));

    const { employeeId } = await prompt([
        {
            type: "list",
            name: "employeeId",
            message: "Which employee's role do you want to update?",
            choices: employeeChoices
        }
    ]);

    const roles = await db.findAllRoles();

    const roleChoices = roles.map(({ id, title }) => ({
        name: title,
        value: id
    }));

    const { roleId } = await prompt([
        {
            type: "list",
            name: "roleId",
            message: "Which role do you want to assign the selected employee?",
            choices: roleChoices
        }
    ]);

    await db.updateEmployeeRole(employeeId, roleId);

    console.log("Updated employee's role");

    questionPrompts();
};

async function updateManager() {
    const employees = await db.findAllEmployees();

    const employeeChoices = employees.map(({ id, first_name, last_name }) => ({
        name: `${first_name} ${last_name}`,
        value: id
    }));

    const { employeeId } = await prompt([
        {
            type: "list",
            name: "employeeId",
            message: "Which employee's manager do you want to update?",
            choices: employeeChoices
        }
    ]);

    const managers = await db.findAllPossibleManagers(employeeId);

    const managerChoices = managers.map(({ id, first_name, last_name }) => ({
        name: `${first_name} ${last_name}`,
        value: id
    }));

    const { managerId } = await prompt([
        {
            type: "list",
            name: "managerId",
            message:
                "Which employee do you want to set as manager for the selected employee?",
            choices: managerChoices
        }
    ]);

    await db.updateEmployeeManager(employeeId, managerId);

    console.log("Updated employee's manager");

    questionPrompts();
};

async function viewRoles() {
    const roles = await db.findAllRoles();

    console.log("\n");
    console.table(roles);

    questionPrompts();
};

async function addRole() {
    const departments = await db.findAllDepartments();

    const departmentChoices = departments.map(({ id, name }) => ({
        name: name,
        value: id
    }));

    const role = await prompt([
        {
            name: "title",
            message: "What is the name of the role?"
        },
        {
            name: "salary",
            message: "What is the salary of the role?"
        },
        {
            type: "list",
            name: "department_id",
            message: "Which department does the role belong to?",
            choices: departmentChoices
        }
    ]);

    await db.createRole(role);

    console.log(`Added ${role.title} to the database`);

    questionPrompts();
};

async function removeRole() {
    const roles = await db.findAllRoles();

    const roleChoices = roles.map(({ id, title }) => ({
        name: title,
        value: id
    }));

    const { roleId } = await prompt([
        {
            type: "list",
            name: "roleId",
            message:
                "Which role do you want to remove? (Warning: This will also remove employees)",
            choices: roleChoices
        }
    ]);

    await db.removeRole(roleId);

    console.log("Removed role from the database");

    questionPrompts();
};

async function viewDepartments() {
    const departments = await db.findAllDepartments();

    console.log("\n");
    console.table(departments);

    questionPrompts();
};

async function addDepartment() {
    const department = await prompt([
        {
            name: "name",
            message: "What is the name of the department?"
        }
    ]);

    await db.createDepartment(department);

    console.log(`Added ${department.name} to the database`);

    questionPrompts();
};

async function removeDepartment() {
    const departments = await db.findAllDepartments();

    const departmentChoices = departments.map(({ id, name }) => ({
        name: name,
        value: id
    }));

    const { departmentId } = await prompt({
        type: "list",
        name: "departmentId",
        message:
            "Which department would you like to remove? (Warning: This will also remove associated roles and employees)",
        choices: departmentChoices
    });

    await db.removeDepartment(departmentId);

    console.log(`Removed department from the database`);

    questionPrompts();
};

async function addEmployee() {
    const roles = await db.findAllRoles();
    const employees = await db.findAllEmployees();

    const employee = await prompt([
        {
            name: "first_name",
            message: "What is the employee's first name?"
        },
        {
            name: "last_name",
            message: "What is the employee's last name?"
        }
    ]);

    const roleChoices = roles.map(({ id, title }) => ({
        name: title,
        value: id
    }));

    const { roleId } = await prompt({
        type: "list",
        name: "roleId",
        message: "What is the employee's role?",
        choices: roleChoices
    });

    employee.role_id = roleId;

    const managerChoices = employees.map(({ id, first_name, last_name }) => ({
        name: `${first_name} ${last_name}`,
        value: id
    }));
    managerChoices.unshift({ name: "None", value: null });

    const { managerId } = await prompt({
        type: "list",
        name: "managerId",
        message: "Who is the employee's manager?",
        choices: managerChoices
    });

    employee.manager_id = managerId;

    await db.createEmployee(employee);

    console.log(
        `Added ${employee.first_name} ${employee.last_name} to the database`
    );

    questionPrompts();
};

function quitApplication() {
    process.quit();
};