#Joseph Elikishvili Assignment4
DROP DATABASE IF EXISTS corp;
CREATE DATABASE corp;
use corp;

CREATE TABLE employees (
employeeID int,
ename varchar(30),
supervisorID int,
title varchar(30),
primary key(employeeID)
);

INSERT INTO employees (employeeID, ename, supervisorID, title) VALUES
(1,"Steve Jobs",NULL,"CEO"),
(2,"Tim Cook",1,"COO"),
(3,"Scott Forstall",1,"SVP IOS Software"),
(4,"Katie Cotton",1,"VP Comunications"),
(5,"Jennifer Baily",2,"VP Online Stores"),
(6,"Kim Vorath",3,"VP Program Management");

Select Employees.ename AS 'Employee Name',
Managers.ename AS 'Manager Name'
FROM employees
Left join employees as Managers on Employees.supervisorID=Managers.employeeID;