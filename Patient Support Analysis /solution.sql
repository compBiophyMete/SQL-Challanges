WITH m3 AS (
  SELECT policy_holder_id, COUNT(case_id) FROM callers 
  GROUP BY policy_holder_id HAVING COUNT(case_id)>=3
  ORDER BY COUNT(case_id) ASC
  )
SELECT COUNT(policy_holder_id) AS policy_holder_count FROM m3
