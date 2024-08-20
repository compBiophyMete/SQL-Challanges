WITH cte AS (
    SELECT 
        title.worker_title, 
        worker.salary, 
        RANK() OVER(ORDER BY worker.salary DESC) AS rnk 
    FROM 
        worker
    JOIN 
        title ON worker.worker_id = title.worker_ref_id
)
SELECT 
    worker_title 
FROM 
    cte 
WHERE 
    rnk = 1;
