WITH cte AS (
    SELECT from_user, COUNT(*) 
    FROM google_gmail_emails 
    GROUP BY from_user 
    ORDER BY COUNT(*) ASC
)
SELECT *, 
       ROW_NUMBER() OVER (ORDER BY count DESC, from_user ASC) 
FROM cte;
