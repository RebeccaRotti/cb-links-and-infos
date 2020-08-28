-- SIMPLE SELECT 1 --
SELECT * FROM employees;
SELECT first_name, last_name FROM employees;
SELECT last_name FROM employees ORDER BY last_name ASC; -- oder DESC
SELECT DISTINCT manager_id FROM employees;
SELECT * FROM employees WHERE manager_id = 100;

-- SIMPLE SELECT 2 --
SELECT country_name FROM countries;
SELECT city, country_id FROM locations;
SELECT region_name AS Region FROM regions;
SELECT job_id, job_title FROM jobs ORDER BY job_title ASC;
SELECT DISTINCT location_id FROM departments;

-- SIMPLE SELECT WITH WHERE CLAUSE --
SELECT first_name, last_name FROM employees WHERE first_name LIKE ('K%');
SELECT first_name, last_name FROM employees WHERE first_name <> 'Peter' OR first_name <> 'Eleni';
SELECT first_name, last_name, salary FROM employees WHERE salary > 10000;
SELECT department_name, location_id FROM departments WHERE location_id = 1700;
SELECT first_name, last_name, phone_number FROM employees WHERE phone_number LIKE ('%121%');

-- JOINS --
SELECT countries.country_name, regions.region_name
FROM countries
JOIN regions ON countries.region_id = regions.region_id;

SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id;

SELECT job_history.start_date, job_history.end_date, employees.first_name, employees.last_name
FROM job_history
JOIN employees ON job_history.employee_id = employees.employee_id;

SELECT job_history.start_date, job_history.end_date, jobs.job_title
FROM job_history
JOIN jobs ON job_history.job_id = jobs.job_id;

SELECT employees.first_name, employees.last_name, job_history.start_date, job_history.end_date, jobs.job_title
FROM employees
JOIN job_history ON employees.employee_id = job_history.employee_id
JOIN jobs ON job_history.job_id = jobs.job_id;
