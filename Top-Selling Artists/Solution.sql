WITH classified_table AS  (
      SELECT artist_name, genre,concert_revenue, number_of_members,
      concert_revenue/number_of_members AS
      revenue_per_band_number,       
      RANK() OVER (PARTITION BY genre 
      ORDER BY concert_revenue/number_of_members DESC
      ) AS  rnConcerts
     FROM concerts 
)
SELECT artist_name, genre, concert_revenue, number_of_members, revenue_per_band_number
FROM classified_table  WHERE rnConcerts=1 ORDER BY revenue_per_band_number DESC;
 
