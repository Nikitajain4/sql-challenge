-- To view the data in the tables

SELECT * FROM departments

SELECT * FROM dept_emp
 
SELECT * FROM dept_manager

select * from employees

SELECT * FROM salaries

SELECT * FROM titles


-- 1.List the employee number, last name, first name, sex, and salary of each employee.
select employees.emp_no,
 employees.last_name,
 employees.first_name,
 employees.sex,
 salaries.salary
FROM employees
inner join salaries on
employees.emp_no = salaries.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name,last_name, hire_date 
from employees
where hire_date 
between '1986-01-01 'and '1986-12-31'

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.

select 
departments.dept_no,
departments.dept_name,
dept_manager.emp_no,
employees.first_name,
employees.last_name,
titles.title
from dept_manager
inner join departments on
departments.dept_no=dept_manager.dept_no
inner join employees on 
employees.emp_no = dept_manager.emp_no
inner join titles on 
employees.emp_title_id = titles.title_id
where title_id = 'm0001'

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select
departments.dept_no,
departments.dept_name,
dept_emp.emp_no,
employees.first_name,
employees.last_name
from employees
inner join dept_emp on 
dept_emp.emp_no =employees.emp_no
inner join departments on
departments.dept_no = dept_emp.dept_no



--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT 
first_name,last_name,sex
FROM employees
WHERE
	first_name = 'Hercules'
	AND last_name LIKE'B_%'
	;

--6.List each employee in the Sales department, including their employee number, last name, and first name.

select 
dept_emp.emp_no,
employees.first_name,
employees.last_name
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on
dept_emp.dept_no =departments.dept_no
where dept_name = 'Sales'

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select 
dept_emp.dept_no,
dept_emp.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on
dept_emp.dept_no =departments.dept_no
where dept_name = 'Sales' or
dept_name ='Development'

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "lastname_count"
FROM employees
GROUP BY last_name
order by lastname_count desc;