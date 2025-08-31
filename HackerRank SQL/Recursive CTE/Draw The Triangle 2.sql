# Problem URL: https://www.hackerrank.com/challenges/draw-the-triangle-2/problem

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
    numbers;



/*
# Alternative Way:

WITH
    RECURSIVE pattern AS (
        -- Anchor member: start with 1 stars (row 1)
        SELECT
            1 AS row_num,
            -- Explicitly cast the column to be large enough for the final result
            CAST(REPEAT('* ', 1) AS CHAR(40)) AS stars
            
        UNION ALL
        
        -- Recursive member: increase the number of stars by 1 each row
        SELECT
            row_num + 1,
            REPEAT('* ', row_num + 1)
        FROM
            pattern
        WHERE
            row_num < 20
    )
SELECT
    stars
FROM
    pattern;
*/