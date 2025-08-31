# Problem URL: https://www.hackerrank.com/challenges/full-score/problem

SELECT
    h.hacker_id,
    h.name
FROM
    Hackers h
    JOIN Submissions s USING (hacker_id)
    JOIN Challenges c USING (challenge_id)
    JOIN Difficulty d USING (difficulty_level)
WHERE
    s.score = d.score
GROUP BY
    h.hacker_id,
    h.name
HAVING
    COUNT(h.hacker_id) > 1
ORDER BY
    COUNT(h.hacker_id) DESC,
    h.hacker_id ASC;
    
    
/*
# Alternative Way 1:

WITH
    FullScoreSubmissions AS (
        SELECT
            s.hacker_id
        FROM
            Submissions s
            JOIN Challenges c ON s.challenge_id = c.challenge_id
            JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
        WHERE
            s.score = d.score
    )
SELECT
    h.hacker_id,
    h.name
FROM
    FullScoreSubmissions fs
    JOIN Hackers h ON fs.hacker_id = h.hacker_id
GROUP BY
    h.hacker_id,
    h.name
HAVING
    COUNT(h.hacker_id) > 1
ORDER BY
    COUNT(h.hacker_id) DESC,
    h.hacker_id ASC;

*/