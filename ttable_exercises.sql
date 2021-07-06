use employees;
#create temporary table employees_with_departments
select concat(last_name, ', ',first_name) name, dept_name
from employees
	join dept_emp d using(emp_no)
	join departments using(dept_no)
where d.to_date > now();

select round(std(salary),2) std, round(avg(salary),2) mean
from salaries;

select dept_name, round((avg(salary)-63811)/16905, 2)
from salaries
	join dept_emp d using(emp_no)
	join departments using(dept_no)
where d.to_date > now()
group by dept_name;

use sakila;
#create temporary table bustarhymes
select round(amount*100,0) cents from payment;

