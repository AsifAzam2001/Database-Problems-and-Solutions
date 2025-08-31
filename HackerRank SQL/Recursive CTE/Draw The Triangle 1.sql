# Problem URL: https://www.hackerrank.com/challenges/draw-the-triangle-1/problem

WITH
    RECURSIVE numbers AS (
        SELECT
            1 AS n
        
        UNION ALL
        
        SELECT
            n + 1
        FROM
            numbers
        WHERE
            n < 20
    )
SELECT
    REPEAT('* ', n) AS stars
FROM
    numbers
ORDER BY
    n DESC;


/*
# ALternative Way:

WITH
    RECURSIVE pattern AS (
        -- Anchor member: start with 20 stars (row 1)
        SELECT
            20 AS row_num,
            REPEAT('* ', 20) AS stars
            
        UNION ALL
        
        -- Recursive member: reduce the number of stars by 1 each row
        SELECT
            row_num - 1,
            REPEAT('* ', row_num - 1)
        FROM
            pattern
        WHERE
            row_num > 1
    )
SELECT
    stars
FROM
    pattern;

*/