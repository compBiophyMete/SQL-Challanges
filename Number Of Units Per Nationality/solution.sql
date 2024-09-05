SELECT nationality, 
       COUNT(DISTINCT unit_id) 
FROM airbnb_hosts AS ah 
JOIN airbnb_units AS au 
    ON ah.host_id = au.host_id
WHERE ah.age < 30 
  AND au.unit_type = 'Apartment'
GROUP BY nationality;
