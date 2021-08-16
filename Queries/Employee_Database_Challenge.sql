--Deliverable #1 create Retirement Titltes table
SELECT e.emp_no,
    e.first_name,
	e.last_name,
		tl.title,
		tl.from_date,
		tl.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN title as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
    rt.first_name,
    rt.last_name,
    rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Count the number of employees by their most recent job title who are about to retire
SELECT COUNT (ut.emp_no),
    ut.title
--INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

--Deliverable #2 create mentorship-eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
	e.last_name,
	e.birth_date,
		de.from_date,
		de.to_date,
	    tl.title
INTO mentorship_eligibilty
FROM employees as e
LEFT JOIN dept_employees as de
ON (e.emp_no = de.emp_no) 
LEFT JOIN title as tl
ON (e.emp_no = tl.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;