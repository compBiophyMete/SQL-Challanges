SELECT ROUND(
    SUM(
        CASE 
            WHEN call_category IS NULL OR call_category = 'n/a' THEN 1 
            ELSE 0 
        END
    )::numeric * 100.0 / COUNT(*), 1
) AS uncategorised_call_pct
FROM callers;
