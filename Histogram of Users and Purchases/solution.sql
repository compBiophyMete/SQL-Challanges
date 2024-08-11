WITH cte AS (
    SELECT 
        transaction_date, 
        user_id, 
        COUNT(user_id) AS purchase_count,
        RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS rnk
    FROM 
        user_transactions
    GROUP BY 
        transaction_date, 
        user_id
    ORDER BY 
        transaction_date ASC
)
SELECT 
    transaction_date, 
    user_id, 
    purchase_count 
FROM 
    cte 
WHERE 
    rnk = 1;
