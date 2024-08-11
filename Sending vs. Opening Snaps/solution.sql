WITH cte AS (
    SELECT ab.age_bucket, a.activity_type, a.time_spent
    FROM activities AS a 
    JOIN age_breakdown AS ab ON a.user_id = ab.user_id 
    WHERE a.activity_type != 'chat'
    GROUP BY ab.age_bucket, a.activity_type, a.time_spent
)

SELECT 
    age_bucket, 
    ROUND(SUM(time_spent) FILTER(WHERE activity_type = 'send') * 100.0 / SUM(time_spent), 2) AS send_perc,
    ROUND(SUM(time_spent) FILTER(WHERE activity_type = 'open') * 100.0 / SUM(time_spent), 2) AS open_perc
FROM 
    cte
GROUP BY 
    age_bucket;
