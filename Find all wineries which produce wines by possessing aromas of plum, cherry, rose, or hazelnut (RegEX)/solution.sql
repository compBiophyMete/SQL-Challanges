SELECT DISTINCT winery
FROM winemag_p1
WHERE lower(description) ~ '\y(plum|plums|cherry|cherries|rose|roses|hazelnut|hazelnuts)\y';
