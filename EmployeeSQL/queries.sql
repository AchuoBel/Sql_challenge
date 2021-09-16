-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees as e 
join salaries as s on e.emp_no=s.emp_no
;

-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where  extract(year from hire_date) = 1986
;

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
select d.dept_no, n.dept_name, d.emp_no, e.last_name, e.first_name 
from dept_manager as d
join departments as n on d.dept_no = n.dept_no
join employees as e on d.emp_no = e.emp_no
;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, n.dept_name
from employees as e
join dept_emp as d on e.emp_no=d.emp_no
join departments as n on d.dept_no=n.dept_no
;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name='Hercules'
and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, n.dept_name
from employees as e
join dept_emp as d on e.emp_no=d.emp_no
join departments as n on d.dept_no=n.dept_no
where d.dept_no in (
	select dept_no from departments where dept_name='Sales'
	)
;

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, n.dept_name
from employees as e
join dept_emp as d on e.emp_no=d.emp_no
join departments as n on d.dept_no=n.dept_no
where d.dept_no in (
	select dept_no from departments 
	where dept_name='Sales' or dept_name='Development'
	)
;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as freq
from employees
group by last_name
order by freq desc;