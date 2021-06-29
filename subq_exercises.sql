use employees;

#1 by 101010 hire date
select emp_no, last_name from employees
where hire_date = (
		select hire_date from employees
		where emp_no = '101010');
		
#2 is there an A-A-mod up in here? no subquery needed
#subquery only makes sense to me when you have to run a query in order to run the query
#potentially uncovering first name discrimination

select distinct(title) from employees
	join titles t using(emp_no)
	join dept_emp de using(emp_no)
where first_name = 'Aamod' AND de.to_date > current_date;
		
#3 91,479 ghosts
select emp_no, to_date, last_name from employees
join dept_emp using(emp_no)
where emp_no IN (
		select emp_no from employees
		where to_date < current_date);
		
#4 four women managers but no subquery
select dept_name, last_name, gender from dept_manager
	join employees using(emp_no)
	join departments using(dept_no)
where to_date > current_date AND gender = 'F';

#5 are you above average? ~$64k
select emp_no, last_name, salary from employees
	join salaries using(emp_no)
where to_date > current_date
	AND salary > (
		select avg(salary) from salaries)
ORDER BY salary;

#6:  -sigma+x < x < sigma+x w/ stdev ~16.9k
# it is ~78 percent, 163k/(300k-91k)
select emp_no, salary from employees
	join salaries using(emp_no)
where to_date > current_date
	AND salary BETWEEN (select avg(salary)-std(salary) from salaries)
		AND (select avg(salary)+std(salary) from salaries)
ORDER BY salary DESC;




