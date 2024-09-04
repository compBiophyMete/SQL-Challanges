WITH cte AS (
    SELECT 
        year, 
        company_name, 
        COUNT(product_name), 
        LEAD(COUNT(product_name)) OVER (PARTITION BY company_name ORDER BY company_name, year) AS next_year_count 
    FROM 
        car_launches 
    GROUP BY 
        1, 2 
    ORDER BY 
        company_name, year
)

SELECT 
    company_name, 
    next_year_count - COUNT(product_name) 
FROM 
    cte 
WHERE 
    next_year_count IS NOT NULL;
