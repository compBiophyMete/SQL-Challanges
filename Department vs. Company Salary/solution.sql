WITH cte AS (
    SELECT 
        employee.department_id, 
        salary.amount, 
        salary.payment_date
    FROM 
        employee
    JOIN 
        salary 
    ON 
        employee.employee_id = salary.employee_id
    WHERE 
        EXTRACT(MONTH FROM salary.payment_date) = 3 
        AND EXTRACT(YEAR FROM salary.payment_date) = 2024
),
avg_deptCTE AS (
    SELECT 
        department_id, 
        payment_date,  
        amount,
        AVG(amount) OVER(PARTITION BY department_id) AS avg_dept
    FROM 
        cte
)
SELECT DISTINCT 
    department_id, 
    TO_CHAR(payment_date, 'MM-YYYY'),
    CASE 
        WHEN (SELECT AVG(amount) FROM avg_deptCTE) < avg_dept THEN 'higher'
        WHEN (SELECT AVG(amount) FROM avg_deptCTE) > avg_dept THEN 'lower' 
        ELSE 'same' 
    END AS comparison 
FROM 
    avg_deptCTE;
