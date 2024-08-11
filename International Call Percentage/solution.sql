WITH cte AS (
    SELECT *, 
           (CASE 
                WHEN pi.country_id != pi2.country_id THEN 1 
                ELSE 0 
            END) as intOrdom 
    FROM phone_calls AS ph
    LEFT JOIN phone_info AS pi 
           ON ph.caller_id = pi.caller_id
    LEFT JOIN phone_info AS pi2 
           ON ph.receiver_id = pi2.caller_id
)
SELECT ROUND(SUM(intOrdom)::numeric * 100.0 / COUNT(*), 1) 
FROM cte;
