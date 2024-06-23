SELECT DISTINCT card_name, 
FIRST_VALUE(issued_amount) OVER(
  PARTITION BY card_name ORDER BY issue_year, issue_month ASC 
  )
FROM monthly_cards_issued ORDER BY card_name DESC;
