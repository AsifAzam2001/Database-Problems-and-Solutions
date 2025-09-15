WITH
    CTE AS (
        SELECT
            *,
            SUM(weight) OVER (
                ORDER BY
                    turn
            ) AS CumulativeWeight
        FROM
            Queue
    ),
    RankedPersons AS (
        SELECT
            person_name,
            RANK() OVER (
                ORDER BY
                    CumulativeWeight DESC
            ) AS rnk
        FROM
            CTE
        WHERE
            CumulativeWeight <= 1000
    )
SELECT
    person_name
FROM
    RankedPersons
WHERE
    rnk = 1;