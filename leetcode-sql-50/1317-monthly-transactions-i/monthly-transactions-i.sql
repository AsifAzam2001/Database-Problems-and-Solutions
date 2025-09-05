
SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(IF(state = 'approved', 1, 0)) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM
    Transactions
GROUP BY
    month,
    country;

/*
# Alternate Solution:

WITH
    transCTE AS (
        SELECT
            DATE_FORMAT(trans_date, '%Y-%m') AS month,
            country,
            COUNT(id) AS trans_count,
            SUM(amount) AS trans_total_amount
        FROM
            Transactions
        GROUP BY
            month,
            country
    ),
    approvedCTE AS (
        SELECT
            DATE_FORMAT(trans_date, '%Y-%m') AS month,
            country,
            COUNT(id) AS approved_count,
            SUM(amount) AS approved_total_amount
        FROM
            Transactions
        WHERE
            state = 'approved'
        GROUP BY
            month,
            country
    )

SELECT
    c.month,
    c.country,
    c.trans_count,
    COALESCE(a.approved_count, 0) AS approved_count,
    c.trans_total_amount,
    COALESCE(a.approved_total_amount, 0) AS approved_total_amount
FROM
    transCTE c
    LEFT JOIN approvedCTE a ON c.month = a.month AND c.country <=> a.country;
*/