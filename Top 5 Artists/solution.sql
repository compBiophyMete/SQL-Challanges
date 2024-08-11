WITH cte AS (
    SELECT 
        a.artist_name, 
        gsr.rank  
    FROM 
        artists AS a 
    JOIN 
        songs AS s ON a.artist_id = s.artist_id
    JOIN 
        global_song_rank AS gsr ON s.song_id = gsr.song_id 
    WHERE 
        gsr.rank <= 10
),

rankCTE AS (
    SELECT 
        artist_name,
        DENSE_RANK() OVER(ORDER BY COUNT(artist_name) DESC) AS artist_rank
    FROM 
        cte 
    GROUP BY 
        artist_name 
    ORDER BY 
        COUNT(artist_name) DESC
) 

SELECT 
    * 
FROM 
    rankCTE 
WHERE 
    artist_rank <= 5;
