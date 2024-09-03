WITH cte AS (
    SELECT 
        COALESCE(user_firstname, '') || ' ' || COALESCE(user_lastname, '') AS fullname,
        * 
    FROM 
        user_flags 
    WHERE 
        flag_id IS NOT NULL
)
SELECT 
    video_id, 
    COUNT(DISTINCT fullname) 
FROM 
    cte 
GROUP BY 
    video_id;
