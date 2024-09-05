WITH cte_union AS (
    SELECT * FROM fb_eu_energy
    UNION ALL
    SELECT * FROM fb_asia_energy
    UNION ALL
    SELECT * FROM fb_na_energy
),

cte_sum AS (
    SELECT date, SUM(consumption) AS total_consumption 
    FROM cte_union 
    GROUP BY date
)

SELECT date, total_consumption 
FROM cte_sum 
WHERE total_consumption = (
    SELECT MAX(total_consumption) 
    FROM cte_sum
);
