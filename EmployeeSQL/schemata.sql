-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/i8wR2Z
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- schema for sql-challenge homework

DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
    dept_no VARCHAR(30) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no)
);

COPY departments--(dept_no, dept_name)
FROM 'C:\Users\dave\Data_Bootcamp\Homework\sql-challenge\EmployeeSQL\data\departments.csv'
DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE titles (
    title_id VARCHAR(30) NOT NULL,
    title VARCHAR(30) NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (title_id)
);

COPY titles (title_id, title)
FROM 'C:\Users\dave\Data_Bootcamp\Homework\sql-challenge\EmployeeSQL\data\titles.csv'
DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
    emp_no INT NOT NULL,
    title_id VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(30) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (emp_no)
);

COPY employees (emp_no, title_id, birth_date, first_name, last_name, sex, hire_date)
FROM 'C:\Users\dave\Data_Bootcamp\Homework\sql-challenge\EmployeeSQL\data\employees.csv'
DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL
);

COPY salaries (emp_no, salary)
FROM 'C:\Users\dave\Data_Bootcamp\Homework\sql-challenge\EmployeeSQL\data\salaries.csv'
DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(30) NOT NULL
);

COPY dept_emp (emp_no, dept_no)
FROM 'C:\Users\dave\Data_Bootcamp\Homework\sql-challenge\EmployeeSQL\data\dept_emp.csv'
DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE dept_manager (
    dept_no VARCHAR(30) NOT NULL
	emp_no INT NOT NULL,
);

COPY dept_manager (dept_no, emp_no)
FROM 'C:\Users\dave\Data_Bootcamp\Homework\sql-challenge\EmployeeSQL\data\dept_manager.csv'
DELIMITER ',' CSV HEADER;


ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_title_id FOREIGN KEY(title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

