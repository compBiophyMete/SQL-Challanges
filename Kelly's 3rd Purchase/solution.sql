WITH cte AS (SELECT customer_id, transaction_id, amount,
  RANK() OVER(PARTITION BY customer_id ORDER BY transaction_id ASC) 
  AS rnk
  FROM purchases)
SELECT customer_id,transaction_id,
  amount, amount-amount*0.33 AS discounted_amount 
FROM cte WHERE rnk=3;
