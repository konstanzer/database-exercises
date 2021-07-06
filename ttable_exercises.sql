use germain_1479;

create temporary table employees_with_departments
select length(concat(first_name, ' ',last_name)) full_name, dept_name
from employees.employees
	join employees.dept_emp d using(emp_no)
	join employees.departments using(dept_no)
where d.to_date > now();

select dept_name, round((avg(salary) - (
					select avg(salary) from salaries)) / (
				 select std(salary) from salaries), 2) z
from salaries
	join dept_emp d using(emp_no)
	join departments using(dept_no)
where d.to_date > now()
group by dept_name;

#2
create temporary table pay
select * from sakila.payment;
select round(amount*100,0) cents from pay;

