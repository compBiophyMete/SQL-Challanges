WITH queryReport AS (
SELECT e.employee_id, COALESCE(COUNT( DISTINCT q.query_id), 0) AS unique_queries
FROM queries AS q 
RIGHT JOIN employees as e ON q.employee_id=e.employee_id
AND EXTRACT(YEAR FROM query_starttime)=2023 AND
EXTRACT(MONTH FROM query_starttime) BETWEEN 7 AND 9
GROUP BY e.employee_id)

SELECT unique_queries, COUNT(employee_id) FROM queryReport
GROUP BY unique_queries ORDER BY unique_queries
