WITH cte_sorted AS (
    SELECT 
        uf.user_firstname || ' ' || uf.user_lastname AS full_name, 
        COUNT(DISTINCT video_id) AS counter
    FROM 
        user_flags AS uf
    JOIN 
        flag_review AS fr 
        ON uf.flag_id = fr.flag_id 
    WHERE 
        fr.reviewed_outcome = 'APPROVED'
    GROUP BY 
        uf.user_firstname || ' ' || uf.user_lastname
    ORDER BY 
        COUNT(DISTINCT video_id) DESC
)
SELECT 
    full_name 
FROM 
    cte_sorted 
WHERE 
    counter = (SELECT MAX(counter) FROM cte_sorted);
