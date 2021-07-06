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

use world;
#2
select language, percentage from countrylanguage
join city using(countrycode)
where name = 'Santa Monica';
#3
select count(name), region from country
group by region;
#4
select sum(population), region from country
group by region;
#5
select sum(population), continent from country
group by continent;
#6 --this is wrong, should be weighted by population
select avg(lifeexpectancy) from country;
#7
select avg(lifeexpectancy) life, continent from country
group by continent
order by life;
#B

use sakila;





