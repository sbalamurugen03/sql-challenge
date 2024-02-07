--1. List the employee number, last name, first name, sex, and salary of each employee 
SELECT
		employees.emp_no
		,employees.last_name
		,employees.first_name
		,employees.sex
		,(SELECT salaries.salary FROM salaries  
		  WHERE employees.emp_no = salaries.emp_no) AS salary		
FROM employees 
;

--2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT
		first_name
		,last_name
		,hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01'
;

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT
	d.dept_no,
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name,
	e.emp_title_id
FROM dept_emp as de
LEFT JOIN employees as e ON e.emp_no = de.emp_no
LEFT JOIN departments as d ON d.dept_no = de.dept_no
WHERE e.emp_title_id LIKE 'm%';

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT 
	dept_emp.dept_no, 
	dept_emp.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
FROM dept_emp 
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
;

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees 
WHERE 
	employees.first_name = 'Hercules' AND 
	employees.last_name LIKE 'B%'
;

--6.List each employee in the Sales department, including their employee number, last name, and first name
SELECT dept_emp.emp_no, 
	employees.last_name, 
	employees.first_name, 
	departments.dept_name
FROM employees 
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
;

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT  dept_emp.emp_no, 
	employees.last_name, 
	employees.first_name,
	departments.dept_name
FROM employees 
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
;

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT employees.last_name, COUNT (*)
FROM employees 
GROUP BY employees.last_name
ORDER BY COUNT(*) DESC
;