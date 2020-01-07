--1.List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, last_name, first_name, gender, salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no;

--2. List employees who were hired in 1986.
SELECT employees.emp_no, last_name, first_name, hire_date
FROM employees 
WHERE date_part('year', hire_date) = 1986
ORDER BY employees.hire_date;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates
SELECT departments.dept_no, departments.dept_name, employees.emp_no, first_name, last_name, dep_manager.from_date, dep_manager.to_date
FROM employees 
INNER JOIN dep_manager ON employees.emp_no = dep_manager.emp_no
JOIN departments ON dep_manager.dept_no = departments.dept_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, first_name, last_name, departments.dept_name
FROM employees
INNER JOIN dep_emp ON employees.emp_no = dep_emp.emp_no
JOIN departments ON dep_emp.dept_no = departments.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B".
SELECT employees.emp_no, last_name, first_name, hire_date
FROM employees 
WHERE first_name='Hercules' AND last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
INNER JOIN dep_emp ON employees.emp_no = dep_emp.emp_no
JOIN departments ON dep_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
INNER JOIN dep_emp ON employees.emp_no = dep_emp.emp_no
JOIN departments ON dep_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development')
ORDER BY employees.emp_no;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(last_name), last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;
