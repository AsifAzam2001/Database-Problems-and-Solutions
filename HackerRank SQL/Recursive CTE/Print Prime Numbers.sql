# Problem URL: https://www.hackerrank.com/challenges/print-prime-numbers/problem

WITH
    RECURSIVE numbers AS (
        SELECT
            2 AS n
        
        UNION ALL

        SELECT
            n + 1
        FROM
            numbers
        WHERE
            n < 1000
    ),
    primes AS (
        SELECT
            n
        FROM
            numbers n1
        WHERE
            NOT EXISTS (
                SELECT
                    69
                FROM
                    numbers n2
                WHERE
                    n2.n < n1.n
                    AND n1.n % n2.n = 0
                    AND n2.n > 1
            )
    )
SELECT
    GROUP_CONCAT(n SEPARATOR '&') AS prime_numbers
FROM
    primes;