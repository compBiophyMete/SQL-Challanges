WITH votes AS (
    SELECT 
        voter, 
        candidate, 
        COUNT(candidate) OVER (PARTITION BY voter) AS votes
    FROM 
        voting_results
),
corrected_votes AS (
    SELECT 
        *, 
        ROUND(1.0 / COUNT(voter) OVER (PARTITION BY voter), 3) AS voter_count
    FROM 
        votes 
    WHERE 
        candidate IS NOT NULL
),
sorted_list AS (
    SELECT DISTINCT 
        candidate, 
        SUM(voter_count) OVER (PARTITION BY candidate) AS sum_count 
    FROM 
        corrected_votes 
    ORDER BY 
        sum_count DESC
)
SELECT 
    candidate 
FROM 
    sorted_list 
LIMIT 1;
