
SELECT DISTINCT
    l1.num AS ConsecutiveNums
FROM
    Logs l1
JOIN
    Logs l2 ON l1.id + 1 = l2.id
JOIN
    Logs l3 ON l1.id - 1 = l3.id
WHERE
    l1.num = l2.num 
    AND l2.num = l3.num;



/*

# Alternative Solution:

WITH
    NumberedLogs AS (
        SELECT
            num,
            -- Get the number from the previous row
            LAG(num, 1) OVER (
                ORDER BY
                    id
            ) AS prev_num,
            -- Get the number from the next row
            LEAD(num, 1) OVER (
                ORDER BY
                    id
            ) AS next_num
        FROM
            Logs
    )
SELECT
    DISTINCT num AS ConsecutiveNums
FROM
    NumberedLogs
WHERE
    num = prev_num
    AND num = next_num;

*/