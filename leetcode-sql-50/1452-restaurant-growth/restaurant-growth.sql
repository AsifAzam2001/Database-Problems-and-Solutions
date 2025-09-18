WITH
    DailySales AS (
        SELECT
            visited_on,
            SUM(amount) AS daily_amount
        FROM
            Customer
        GROUP BY
            visited_on
    ),
    MovingWindow AS (
        SELECT
            visited_on,
            -- Calculate the sum of the current day and the 6 preceding days
            SUM(daily_amount) OVER (
                ORDER BY
                    visited_on ROWS BETWEEN 6 PRECEDING
                    AND CURRENT ROW
            ) AS amount,
            -- Calculate the average of the current day and the 6 preceding days
            AVG(daily_amount) OVER (
                ORDER BY
                    visited_on ROWS BETWEEN 6 PRECEDING
                    AND CURRENT ROW
            ) AS average_amount,
            MIN(visited_on) OVER () AS first_date
        FROM
            DailySales
    )
SELECT
    visited_on,
    amount,
    ROUND(average_amount, 2) AS average_amount
FROM
    MovingWindow
WHERE
    visited_on >= DATE_ADD(first_date, INTERVAL 6 DAY)
ORDER BY
    visited_on;