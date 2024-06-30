SELECT e2.employee_id, e2.name FROM employee AS e1 
JOIN employee AS e2 
ON e1.employee_id = e2.manager_id
WHERE e2.salary > e1.salary
