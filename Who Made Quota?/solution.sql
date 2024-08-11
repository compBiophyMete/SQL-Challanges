SELECT 
    d.employee_id, 
    CASE
        WHEN SUM(d.deal_size) >= s.quota THEN 'yes' 
        ELSE 'no' 
    END AS made_quota
FROM 
    deals AS d
JOIN 
    sales_quotas AS s 
ON 
    d.employee_id = s.employee_id
GROUP BY 
    d.employee_id, s.quota
ORDER BY 
    d.employee_id ASC;
