CREATE DATABASE AggregateDemo;
GO

USE AggregateDemo;
GO

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Department NVARCHAR(50),
    Location NVARCHAR(50),
    Salary DECIMAL(10,2),
    Status NVARCHAR(20)
);

INSERT INTO Employees (EmployeeID, Name, Department, Location, Salary, Status)
VALUES
(1, 'Ananya', 'HR', 'New York', 70000, 'Active'),
(2, 'Bunny', 'HR', 'New York', 58000, 'Active'),
(3, 'Charmi', 'Engineering', 'Chicago', 90000, 'Active'),
(4, 'Divya', 'Engineering', 'Chicago', 95000, 'Active'),
(5, 'Elon', 'Marketing', 'Boston', 70000, 'Inactive'),
(6, 'Fruti', 'Engineering', 'Chicago', 88000, 'Active'),
(7, 'Gowtham', 'Marketing', 'Boston', 72000, 'Active'),
(8, 'Harsha', 'HR', 'New York', 51000, 'Active'),
(9, 'Priya', 'Engineering', 'Chicago', 77000, 'Inactive'),
(10, 'Surya', 'Marketing', 'Boston', 73000, 'Active');


SELECT * FROM Employees;


--- Using Aggregate Functions
--- Count number of employees
SELECT COUNT(*) AS TotalEmployees FROM Employees;


---Sum of all salaries:
SELECT SUM(Salary) AS TotalSalary FROM Employees;


---Average salary:
SELECT AVG(Salary) AS AverageSalary FROM Employees;

---Minimum and maximum salary:
SELECT MIN(Salary) AS MinSalary, MAX(Salary) AS MaxSalary FROM Employees;



---- Using GROUP BY Functions
--- Average salary by department:
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;


--- Count employees per department:
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

--- Group by multiple columns:
SELECT Department, Location, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department, Location;


----Filter Groups Using HAVING
---Only departments with average salary > 70000:
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 70000;


---Departments with more than 2 employees:
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 2;


----Using ROUND()
---Round average salaries to 2 decimals:
SELECT Department, ROUND(AVG(Salary), 2) AS RoundedAvgSalary
FROM Employees
GROUP BY Department;


---- COUNT(DISTINCT)
---Count distinct departments:
SELECT COUNT(DISTINCT Department) AS NumDepartments
FROM Employees;


---Count distinct locations:
SELECT COUNT(DISTINCT Location) AS NumLocations
FROM Employees;


