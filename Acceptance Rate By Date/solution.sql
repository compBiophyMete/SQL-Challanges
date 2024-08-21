WITH cte AS (
    SELECT *, 
           LEAD(action, 1) OVER (PARTITION BY user_id_sender) AS next_action
    FROM fb_friend_requests
),

cte2 AS (
    SELECT date, 
           SUM(CASE WHEN next_action = 'accepted' THEN 1 ELSE 0 END) AS accepted,
           SUM(CASE WHEN action = 'sent' THEN 1 ELSE 0 END) AS sent 
    FROM cte  
    GROUP BY date
)

SELECT date, 
       accepted * 1.0 / sent 
FROM cte2 
WHERE accepted != 0;
