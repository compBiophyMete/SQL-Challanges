WITH newRank AS (
SELECT order_id, 
CASE
  WHEN order_id % 2 = 0 THEN order_id-1
  WHEN order_id % 2 = 1 AND order_id = (SELECT MAX(order_id) FROM orders) THEN order_id
  WHEN order_id % 2 = 1 OR order_id < MAX(order_id) THEN order_id+1

END AS new_order_id 
FROM orders
GROUP BY order_id ORDER BY order_id ASC) 

SELECT nr.new_order_id AS corrected_order_id,o.item AS item FROM newRank AS nr  
JOIN orders AS o ON nr.order_id=o.order_id ORDER BY nr.new_order_id ASC;
