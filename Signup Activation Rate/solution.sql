WITH cte AS (
    SELECT 
        e.user_id, 
        t.signup_action
    FROM 
        emails AS e   
    LEFT JOIN 
        texts AS t 
    ON 
        e.email_id = t.email_id
    GROUP BY 
        e.user_id, 
        t.signup_action
)
SELECT 
    ROUND(
        SUM(
            CASE  
                WHEN signup_action = 'Confirmed' THEN 1 
                ELSE 0 
            END
        )::numeric / COUNT(DISTINCT user_id), 2
    ) AS confirm_rate 
FROM 
    cte;
