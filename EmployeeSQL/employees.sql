-- Import tables

-- Review imported CSV data in tables
SELECT * FROM employees LIMIT 10;
SELECT * FROM departments LIMIT 10;
SELECT * FROM dept_emp LIMIT 10;
SELECT * FROM dept_manager LIMIT 10;
SELECT * FROM salaries LIMIT 10;
SELECT * FROM titles LIMIT 10;


-- change column name to match other table
ALTER TABLE employees
RENAME COLUMN emp_title_id TO title_id;
SELECT * FROM employees LIMIT 10;

------------------------------------
--Join tables to add all column data

SELECT employees.emp_no, employees.title_id, employees.birth_date, employees.first_name,
	employees.last_name, employees.sex, employees.hire_date
FROM employees AS e

FULL JOIN dept_emp AS de
ON e.emp_no = de.emp_no;

FULL JOIN dept_manager AS dm
ON e.emp_no = dm.emp_no;

FULL JOIN departments AS d
ON e.dept_no = d.dept_no;

FULL JOIN salaries AS s
ON e.emp_no = s.emp_no;

FULL JOIN titles AS t
ON e.title_id = t.title_id;

-- Review combined data in tables
SELECT * FROM e LIMIT 10;

-----------------------------------------------------------------------------
--1. List the following details of each employee: employee number, last name,
--first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex--,e.salary
FROM employees AS e


--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date, e.emp_no, 
FROM employees AS e
WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31'


--3. List the manager of each department with the following information: department
--number, department name, the manager's employee number, last name, first name.

SELECT e.dept_no, e.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
WHERE -- on dept_manager table = TRUE


--4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.first_name, e.last_name--, e.dept_name
FROM employees AS e


--5. List first name, last name, and sex for employees whose first name is 
--"Hercules" and last names begin with "B."

SELECT e.first_name, e.last_name, e.sex  
FROM employees AS e
WHERE e.first_name = 'Hercules' AND e.last_name::text LIKE 'B%';


--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.



--7. List all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.



--8. In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
