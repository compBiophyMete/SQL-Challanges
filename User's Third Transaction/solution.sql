WITH rankUsers AS (SELECT user_id, spend, transaction_date, RANK() OVER(PARTITION BY user_id 
                  ORDER BY transaction_date ASC) AS rnk
FROM transactions)

SELECT user_id, spend, transaction_date FROM rankUsers WHERE rnk=3;
