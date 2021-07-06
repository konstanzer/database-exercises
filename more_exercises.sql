use employees;
#1
select last_name, d.dept_name, salary-dept_mean diff
from employees
join salaries s using(emp_no)
join dept_manager dm using(emp_no)
join departments d using(dept_no)
join (select dept_no, avg(salary) dept_mean
			from salaries
				join dept_emp using(emp_no)
			where salaries.to_date > current_date
			group by dept_no) mean_sal using(dept_no)
where s.to_date > current_date and dm.to_date > current_date
order by diff;


select dept_no, avg(salary) dept_mean
	from salaries
		join dept_emp using(emp_no)
	where salaries.to_date > current_date
	group by dept_no