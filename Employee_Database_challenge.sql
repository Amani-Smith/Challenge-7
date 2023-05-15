INSERT  INTO  retirementTitles
SELECT e.emp_no as emp_no ,e.first_name as first_name,e.last_name as last_name,t.title as title,t.from_date as from_date,t.to_date as to_date
FROM employees e,titles t
where e.emp_no = t.emp_no and e.birth_date between '1952-01-01'  and '1955-12-31';


SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO recent_titles
FROM retirementTitles
WHERE to_date ='9999-01-01'
ORDER BY emp_no, to_date DESC;


SELECT count(title),title
into retiring_titles
FROM recent_titles
group by title;

SELECT DISTINCT ON (e.emp_no) e.emp_no,e.first_name,e.last_name,e.birth_date,de.from_date,de.to_date
into mentorship_eligibility
from employees e,dept_emp de,titles t
where e.emp_no = de.emp_no and e.birth_date BETWEEN '1965-01-01'  and '1965-12-31' and e.emp_no = t.emp_no and de.to_date ='9999-01-01' 
ORDER BY emp_no;