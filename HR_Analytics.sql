CREATE DATABASE hr_analytics;
USE hr_analytics;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    job_role VARCHAR(50),
    salary DECIMAL(10,2),
    experience INT,
    job_satisfaction INT,
    attrition VARCHAR(10)
);
SHOW TABLES;
INSERT INTO employees VALUES
(1, 'Arun', 'IT', 'Developer', 45000, 3, 4, 'No'),
(2, 'Priya', 'HR', 'HR Executive', 35000, 2, 5, 'No'),
(3, 'Karthik', 'Finance', 'Accountant', 40000, 5, 3, 'Yes'),
(4, 'Divya', 'IT', 'Tester', 38000, 4, 4, 'No'),
(5, 'Rahul', 'Sales', 'Sales Executive', 30000, 2, 2, 'Yes'),
(6, 'Meena', 'HR', 'Recruiter', 36000, 3, 4, 'No'),
(7, 'Vijay', 'IT', 'Manager', 60000, 8, 5, 'No'),
(8, 'Anitha', 'Finance', 'Analyst', 42000, 6, 3, 'No'),
(9, 'Suresh', 'Sales', 'Sales Manager', 50000, 7, 2, 'Yes'),
(10, 'Nisha', 'IT', 'Developer', 48000, 4, 5, 'No'),
(11, 'Manoj', 'HR', 'HR Manager', 55000, 9, 4, 'No'),
(12, 'Keerthi', 'Finance', 'Auditor', 39000, 3, 3, 'Yes'),
(13, 'Ajay', 'Sales', 'Sales Executive', 32000, 2, 4, 'No'),
(14, 'Sneha', 'IT', 'Designer', 41000, 3, 5, 'No'),
(15, 'Ramesh', 'Finance', 'Manager', 65000, 10, 4, 'No'),
(16, 'Pooja', 'HR', 'Recruiter', 34000, 1, 3, 'Yes');
SELECT * FROM employees;
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
ORDER BY total_employees DESC;
SELECT department,
       ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC;
SELECT attrition,
       COUNT(*) AS total_employees
FROM employees
GROUP BY attrition;
SELECT department,
       COUNT(*) AS total_attrition
FROM employees
WHERE attrition = 'Yes'
GROUP BY department
ORDER BY total_attrition DESC;
SELECT department,
       ROUND(AVG(job_satisfaction), 2) AS average_satisfaction
FROM employees
GROUP BY department
ORDER BY average_satisfaction DESC;
SELECT department,
       ROUND(AVG(experience), 2) AS average_experience
FROM employees
GROUP BY department
ORDER BY average_experience DESC;
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_percentage
FROM employees;
SELECT
    job_satisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left
FROM employees
GROUP BY job_satisfaction
ORDER BY job_satisfaction;