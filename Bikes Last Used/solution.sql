WITH cte AS (
    SELECT bike_number, 
           end_time, 
           DENSE_RANK() OVER(PARTITION BY bike_number ORDER BY end_time DESC) AS rnk
    FROM dc_bikeshare_q1_2012
    ORDER BY end_time DESC
)
SELECT bike_number, 
       end_time 
FROM cte 
WHERE rnk = 1;
