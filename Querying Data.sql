USE EMPLOYEE;
SELECT DISTINCT SALARY FROM EMPLOYEES;
# ALIAS #
SELECT AGE AS EMPLOYEE_AGE, SALARY AS EMPLOYEE_SALARY FROM EMPLOYEES;
## WHERE CLAUSE AND OPERATOR ##
SELECT * FROM EMPLOYEES WHERE SALARY>50000 AND HIRE_DATE <'2016-01-01';
select * from employees where designation is null;
update employees set designation = 'DATA SCIENTIST' where designation is null;
SELECT * FROM EMPLOYEES WHERE DESIGNATION = 'DATA SCIENTIST';

## ORDER BY ##
SELECT* FROM EMPLOYEES ORDER BY Department_id ASC, SALARY DESC;

##LIMIT##
SELECT * FROM EMPLOYEES WHERE hire_date >= '2018-01-01' AND hire_date < '2019-01-01' ORDER BY hire_date ASC LIMIT 5;

#AGGREGATE FUNCTION#
SELECT SUM(e.salary) AS Total_Salary FROM Employees e JOIN Departments d ON e.department_id = d.department_id WHERE d.department_name = 'Finance';
SELECT MIN(age) AS Minimum_Age FROM Employees;

#GROUP BY#
SELECT location_id, MAX(SALARY) AS Maximum_Salary FROM EMPLOYEES GROUP BY location_id;
SELECT designation, AVG(SALARY) AS Average_salary FROM EMPLOYEES WHERE designation LIKE '%Analyst%' GROUP BY 1;

SELECT department_id, COUNT(*) AS Employee_Count FROM Employees GROUP BY department_id HAVING COUNT(*) < 3;
SELECT location_id, AVG(age) AS Average_Age FROM Employees WHERE gender = 'F'GROUP BY location_id HAVING AVG(age) < 30;

#inner join#
SELECT e.employee_name,
       e.designation,
       d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

#LEFT JOIN#
SELECT d.department_name,
       COUNT(e.employee_id) AS Employee_Count
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

#RIGHT JOIN#
USE EMPLOYEE;
SELECT l.location,
       e.employee_name
FROM Employees e
RIGHT JOIN Location l
ON e.location_id = l.location_id;