WITH cte AS (
    SELECT 
        user_id, 
        EXTRACT(MONTH FROM event_date) AS mnth,
        SUM(
            CASE 
                WHEN event_type IN ('sign-in', 'like', 'comment') 
                     AND (EXTRACT(YEAR FROM event_date) = 2022 AND EXTRACT(MONTH FROM event_date) BETWEEN 6 AND 7)
                THEN 1 
                ELSE 0 
            END
        ) AS sum
    FROM 
        user_actions 
    WHERE 
        EXTRACT(YEAR FROM event_date) = 2022 
        AND EXTRACT(MONTH FROM event_date) BETWEEN 6 AND 7
    GROUP BY 
        user_id, 
        event_date 
    ORDER BY 
        user_id ASC
),

distincts AS (
    SELECT DISTINCT 
        user_id, 
        mnth AS month, 
        sum 
    FROM 
        cte 
    GROUP BY 
        user_id, 
        mnth, 
        sum
),

distinctLead AS (
    SELECT 
        *, 
        LEAD(sum, 1) OVER (PARTITION BY user_id ORDER BY user_id) AS lead_value,
        LAG(sum, 1) OVER (PARTITION BY user_id ORDER BY user_id) AS lag_value
    FROM 
        distincts 
)

SELECT 
    month, 
    SUM(COALESCE(sum, 1)) 
FROM 
    distinctLead 
WHERE 
    lead_value IS NULL 
    AND lag_value IS NOT NULL 
GROUP BY 
    month;
