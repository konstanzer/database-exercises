use employees;

select count(distinct(title)) from titles;

#899 rows
SELECT * FROM employees
	WHERE last_name LIKE 'E%E';
#1,873 rows
SELECT * FROM employees
	WHERE last_name LIKE '%Q%';

#547 rows
SELECT * FROM employees
	WHERE last_name LIKE '%Q%'
	AND last_name NOT LIKE '%QU%';