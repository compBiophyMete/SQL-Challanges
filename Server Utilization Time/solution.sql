WITH cte AS (
    SELECT *, 
           LEAD(status_time) OVER (PARTITION BY server_id ORDER BY server_id, status_time) AS lead_time 
    FROM server_utilization
)
SELECT FLOOR(EXTRACT(EPOCH FROM SUM(lead_time - status_time)) / 86400) AS total_uptime_days 
FROM cte 
WHERE lead_time IS NOT NULL AND session_status = 'start';
