SELECT 
    COALESCE(a.user_id, dp.user_id) AS user_id,
    CASE 
        WHEN dp.paid IS NULL THEN 'CHURN'
        WHEN dp.paid IS NOT NULL AND a.status = 'CHURN' THEN 'RESURRECT'
        WHEN dp.paid IS NOT NULL AND a.status != 'CHURN' THEN 'EXISTING' 
        ELSE 'NEW' 
    END AS new_status
FROM 
    advertiser AS a  
FULL OUTER JOIN 
    daily_pay AS dp 
ON 
    a.user_id = dp.user_id
ORDER BY 
    user_id;
