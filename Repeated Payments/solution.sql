WITH cte AS (
    SELECT 
        merchant_id, 
        credit_card_id, 
        amount, 
        transaction_timestamp,
        LEAD(transaction_timestamp, 1) 
            OVER (
                PARTITION BY merchant_id, credit_card_id, amount 
                ORDER BY merchant_id, credit_card_id, transaction_timestamp
            ) AS lead_time
    FROM transactions
)
SELECT 
    SUM(
        CASE 
            WHEN EXTRACT(EPOCH FROM (lead_time - transaction_timestamp)) / 60 <= 10 
            THEN 1 
            ELSE 0 
        END 
    ) AS payment_count
FROM cte 
WHERE lead_time IS NOT NULL;
