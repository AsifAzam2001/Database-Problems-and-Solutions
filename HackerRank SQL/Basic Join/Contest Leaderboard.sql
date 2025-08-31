# Problem URL: https://www.hackerrank.com/challenges/contest-leaderboard/problem

SELECT
    h.hacker_id,
    h.name,
    SUM(s.score) AS total_score
FROM
    Hackers h
    JOIN (
        SELECT
            hacker_id,
            challenge_id,
            MAX(score) AS score
        FROM
            Submissions
        GROUP BY
            hacker_id,
            challenge_id
    ) s USING (hacker_id)
GROUP BY
    h.hacker_id,
    h.name
HAVING
    total_score != 0
ORDER BY
    total_score DESC,
    h.hacker_id;
    
/*
# Alternative Way:

WITH
    SubmissionCTE AS (
        SELECT
            hacker_id,
            challenge_id,
            MAX(score) AS score
        FROM
            Submissions
        GROUP BY
            hacker_id,
            challenge_id
    )
SELECT
    h.hacker_id,
    h.name,
    SUM(s.score) AS total_score
FROM
    Hackers h
    JOIN SubmissionCTE s USING (hacker_id)
GROUP BY
    h.hacker_id,
    h.name
HAVING
    total_score != 0
ORDER BY
    total_score DESC,
    h.hacker_id;

*/