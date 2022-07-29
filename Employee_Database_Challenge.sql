-- DELIVERABLE 1

-- Part 1: Retirement Titles
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles

-- Part 2: Exclude Duplicates
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO clean_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- SELECT * FROM clean_titles

-- Part 3: Retrieve Titles
SELECT count(title), title
INTO retiring_titles
FROM clean_titles
GROUP BY title 
ORDER BY count(title) DESC;

-- select * from retiring_titles

-- DELIVERABLE 2 (1 Part)

SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
e.gender,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_emp AS de ON (e.emp_no = de.emp_no)
JOIN titles as t on (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

