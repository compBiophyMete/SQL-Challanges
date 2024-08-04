SELECT u.first_name
  FROM user_time AS ut 
  JOIN users AS u 
  ON ut.user_id=u.user_id
  WHERE (SELECT AVG(media_time_minutes) FROM user_time)
        <ut.media_time_minutes
  ORDER BY u.first_name ASC;
