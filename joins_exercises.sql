use employees;

#2 (managers) & 3 (women only)
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) manager
FROM employees e
JOIN dept_manager de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.gender = 'F';

#4
SELECT t.title, count(*)
FROM employees e
JOIN titles t ON t.emp_no = e.emp_no
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Customer Service'
GROUP BY t.title;

#5 & 9 (Minakawa)
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) manager, s.salary
FROM employees e
JOIN dept_manager de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
JOIN salaries s ON s.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01';

#6
SELECT d.dept_no, d.dept_name, count(*) num_employees
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no;

#7 avg sal by dept
SELECT d.dept_name, avg(s.salary) ave_salary
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
JOIN salaries s ON s.emp_no = e.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY dept_name
ORDER BY ave_salary DESC;

#8
SELECT CONCAT(e.first_name, ' ', e.last_name) employee, s.salary
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
JOIN salaries s ON s.emp_no = e.emp_no
WHERE d.dept_name = 'Marketing' AND s.to_date = '9999-01-01'
ORDER BY s.salary DESC
LIMIT 7;



