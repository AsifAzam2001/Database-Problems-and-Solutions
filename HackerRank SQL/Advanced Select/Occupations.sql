# Problem URL: https://www.hackerrank.com/challenges/occupations/problem

WITH
    RankedOccupations AS (
        SELECT
            Name,
            Occupation,
            RANK() OVER (
                PARTITION BY Occupation
                ORDER BY Name
            ) as rn
        FROM
            OCCUPATIONS
    )
SELECT
    MAX(
        CASE
            WHEN Occupation = 'Doctor' THEN Name
        END
    ) AS Doctor,
    MAX(
        CASE
            WHEN Occupation = 'Professor' THEN Name
        END
    ) AS Professor,
    MAX(
        CASE
            WHEN Occupation = 'Singer' THEN Name
        END
    ) AS Singer,
    MAX(
        CASE
            WHEN Occupation = 'Actor' THEN Name
        END
    ) AS Actor
FROM
    RankedOccupations
GROUP BY
    rn
ORDER BY
    rn;