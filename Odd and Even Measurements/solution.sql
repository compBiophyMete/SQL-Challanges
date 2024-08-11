WITH cte AS (
    SELECT  
        DATE(measurement_time) AS measurement_day,
        measurement_value,
        RANK() OVER(
            PARTITION BY DATE(measurement_time) 
            ORDER BY measurement_time ASC
        ) AS rank
    FROM 
        measurements
    GROUP BY 
        measurement_time, 
        measurement_value 
    ORDER BY 
        measurement_time ASC
)   
SELECT 
    measurement_day, 
    SUM(
        CASE
            WHEN rank % 2 = 1 THEN measurement_value 
            ELSE 0 
        END
    ) AS odd_sum, 
    SUM(
        CASE
            WHEN rank % 2 = 0 THEN measurement_value 
            ELSE 0 
        END
    ) AS even_sum
FROM 
    cte 
GROUP BY 
    measurement_day 
ORDER BY 
    measurement_day ASC;
