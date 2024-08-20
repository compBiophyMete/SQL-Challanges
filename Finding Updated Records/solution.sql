WITH cte AS (
    SELECT *, 
           DENSE_RANK() OVER(PARTITION BY id ORDER BY salary DESC) AS rnk
    FROM ms_employee_salary
)
SELECT id, 
       first_name, 
       last_name, 
       department_id, 
       salary AS current_salary 
FROM cte 
WHERE rnk = 1
ORDER BY id ASC;
