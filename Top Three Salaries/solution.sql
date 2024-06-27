WITH cte AS (
  SELECT d.department_name, e.name, e.salary, 
  DENSE_RANK() OVER(PARTITION BY d.department_name ORDER BY
  e.salary DESC) AS rnk
  FROM employee as E    
  JOIN department AS d ON e.department_id = d.department_id)

SELECT department_name, name, salary FROM cte WHERE rnk<=3
ORDER BY department_name ASC, salary DESC, name ASC
