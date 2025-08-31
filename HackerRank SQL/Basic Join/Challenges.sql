# Problem URL: https://www.hackerrank.com/challenges/challenges/problem

WITH
    CTE AS (
        SELECT
            *
        FROM
            Hackers H
            JOIN Challenges C USING (hacker_id)
    ),
    CountCTE AS (
        SELECT
            hacker_id,
            name,
            COUNT(challenge_id) as challenge_count
        FROM
            CTE
        GROUP BY
            hacker_id,
            name
    ),
    CountOccurrences AS (
        SELECT
            challenge_count,
            COUNT(*) as freq
        FROM
            CountCTE
        GROUP BY
            challenge_count
    )
SELECT
    cc.hacker_id,
    cc.name,
    cc.challenge_count
FROM
    CountCTE cc
    JOIN CountOccurrences co USING (challenge_count)
WHERE
    co.freq = 1
    OR cc.challenge_count = (
        SELECT
            MAX(challenge_count)
        FROM
            CountCTE
    )
ORDER BY
    cc.challenge_count DESC,
    cc.hacker_id;