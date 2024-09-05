SELECT COUNT(*)::numeric * 100 / 
  (SELECT COUNT(*) 
   FROM orders AS o 
   JOIN customers AS c 
   ON o.cust_id = c.id) 
FROM orders AS o 
JOIN customers AS c 
ON o.cust_id = c.id 
WHERE c.address IS NOT NULL;
