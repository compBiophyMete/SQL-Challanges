SELECT e2.managers_id, e1.position, COUNT(e1.position) FROM direct_reports AS e1
   JOIN direct_reports AS e2 ON e1.employee_id=e2.managers_id
    WHERE e1.position LIKE '%Manager%'
GROUP BY e2.managers_id, e1.position
ORDER BY e2.managers_id
