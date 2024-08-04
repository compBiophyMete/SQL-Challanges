SELECT product_name, 
  ROUND((new_size::numeric-original_size::numeric)*100.0/original_size::numeric,0) 
  AS size_change_percentage,
  ROUND((new_price::numeric-original_price::numeric)*100.0/original_price::numeric,0) 
  AS price_change_percentage,
  (CASE 
    WHEN new_price>=original_price AND new_size<original_size
          THEN 'True' ELSE 'False' END) AS Shrinkflation_Flag
  FROM products
  ORDER BY product_name ASC;
