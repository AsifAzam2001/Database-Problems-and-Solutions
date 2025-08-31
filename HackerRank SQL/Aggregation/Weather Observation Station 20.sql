# Problem URL: https://www.hackerrank.com/challenges/weather-observation-station-20/problem

WITH
    NumberedLatitudes AS (
        SELECT
            LAT_N,
            ROW_NUMBER() OVER (
                ORDER BY
                    LAT_N
            ) AS row_num,
            COUNT(*) OVER () AS total_rows
        FROM
            STATION
    )
SELECT
    ROUND(AVG(LAT_N), 4) AS median
FROM
    NumberedLatitudes
WHERE
    row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2));