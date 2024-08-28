DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_managers;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;

CREATE TABLE departments (
  dept_no VARCHAR PRIMARY KEY NOT NULL,
  dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
  emp_no VARCHAR NOT NULL,
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_managers (
  dept_no VARCHAR NOT NULL,
  emp_no VARCHAR NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE title (
  title_id VARCHAR PRIMARY KEY NOT NULL,
  title VARCHAR
);

CREATE TABLE employees (
  emp_no VARCHAR PRIMARY KEY NOT NULL,
  emp_title_id VARCHAR NOT NULL,
  birthdate DATE,
  first_name VARCHAR,
  last_name VARCHAR,
  sex CHAR,
  hire_date DATE,
  FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
);

CREATE TABLE salaries (
  emp_no VARCHAR NOT NULL,
  salary VARCHAR NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  PRIMARY KEY (emp_no, salary) -- If you want a unique constraint on salary per employee
);

select * from title;