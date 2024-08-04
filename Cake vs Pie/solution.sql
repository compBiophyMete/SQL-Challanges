SELECT
    date_sold,
    ABS(SUM(CASE WHEN product = 'Cake' THEN amount_sold ELSE 0 END) -
        SUM(CASE WHEN product = 'Pie' THEN amount_sold ELSE 0 END)) AS difference,
    CASE
        WHEN SUM(CASE WHEN product = 'Cake' THEN amount_sold ELSE 0 END) >
            SUM(CASE WHEN product = 'Pie' THEN amount_sold ELSE 0 END)
        THEN 'Cake'
        ELSE 'Pie'
    END AS sold_more
FROM
    desserts
GROUP BY
    date_sold
ORDER BY
    date_sold;
