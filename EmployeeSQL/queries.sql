
-- Review imported CSV data in tables
SELECT * FROM departments LIMIT 10;
SELECT * FROM titles LIMIT 10;
SELECT * FROM employees LIMIT 10;
SELECT * FROM salaries LIMIT 10;
SELECT * FROM dept_manager LIMIT 10;
SELECT * FROM dept_emp LIMIT 10;

-----------------------------------------------------------------------------
--1. List the following details of each employee: employee number, last name,
--first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s ON e.emp_no = s.emp_no;


--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--3. List the manager of each department with the following information: department
--number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
INNER JOIN departments AS d ON dm.dept_no = d.dept_no;


--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no


--5. List first name, last name, and sex for employees whose first name is 
--"Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex  
FROM employees AS e
WHERE e.first_name = 'Hercules' AND e.last_name::text LIKE 'B%';


--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


--7. List all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


--8. In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS counter
FROM employees
GROUP BY last_name
ORDER BY counter DESC; 
