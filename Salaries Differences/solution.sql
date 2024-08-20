WITH cte AS (
    SELECT *
    FROM db_employee AS dbe 
    JOIN db_dept AS dbd ON dbe.department_id = dbd.id
    WHERE dbd.department IN ('marketing', 'engineering')
)
SELECT ABS(
    (SELECT MAX(salary) FROM cte WHERE department_id = 4) -
    (SELECT MAX(salary) FROM cte WHERE department_id = 1)
) AS salary_difference;
