const mysql = require("mysql");
const util = require("util");
const { prompt } = require("inquirer");

const connectionAsync = util.promisify(connection.connect).bind(connection);
const queryAsync = util.promisify(connection.query).bind(connection);

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "",
    database: businessDB
});

connection.connect(function(err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId);
    appStart();
});

async function appStart() {
    try {
        const questions = {
            type: "list",
            message: "What would you like to do?",
            name: "startList",
            choices: [
                {value: "allEmployees", name: "View all employees."},
                {value: "departmentEmployees", name: "View the employees by department."},
                {value: "managerEmployees", name: "View the employees by managers."},
                {value: "updateManager", name: "Update an employee's manager."},
                {value: "updateEmployeeRole", name: "Update an employee's role."},
                {value: "addEmployee", name: "Add an employee."},
                {value: "removeEmployee", name: "Remove an employee."}
            ]
        };
        const { list } = await prompt(questions);
    }
    catch (err) {
        throw err;
    };
};