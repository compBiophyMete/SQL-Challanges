WITH temp AS (
              SELECT EXTRACT(YEAR FROM transaction_date) AS year,
              product_id, spend as current_spend,
              LAG(spend,1) OVER (PARTITION BY product_id) AS prev_year_spend
              FROM user_transactions
)
SELECT *, ROUND((current_spend-prev_year_spend)*100/prev_year_spend,2) 
as yoy_rate 
FROM temp
