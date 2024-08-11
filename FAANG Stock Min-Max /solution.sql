WITH ranked_prices AS (
    SELECT 
        ticker,
        open,
        TO_CHAR(date, 'Mon-YYYY') AS mnth,
        RANK() OVER (PARTITION BY ticker ORDER BY open DESC) AS open_rank_desc,
        RANK() OVER (PARTITION BY ticker ORDER BY open ASC) AS open_rank_asc
    FROM stock_prices
)
SELECT
    ticker,
    MAX(CASE WHEN open_rank_desc = 1 THEN mnth END) AS highest_mth,
    MAX(open) AS highest_open,
    MAX(CASE WHEN open_rank_asc = 1 THEN mnth END) AS lowest_mth,
    MIN(open) AS lowest_open
FROM ranked_prices
GROUP BY ticker
ORDER BY ticker;
