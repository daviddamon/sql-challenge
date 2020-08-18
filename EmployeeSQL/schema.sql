-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/i8wR2Z
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Note: Originally imported from QuickDBD, but heavily edited.
-- schema for sql-challenge homework

CREATE TABLE employees (
    emp_no VARCHAR NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
    emp_no VARCHAR NOT NULL,
    dept_no VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
    emp_no VARCHAR NOT NULL,
    dept_no VARCHAR NOT NULL,
  	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE salaries (
    emp_no VARCHAR NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
	FOREIGN KEY (title_id) REFERENCES employees(emp_title_id)
);

