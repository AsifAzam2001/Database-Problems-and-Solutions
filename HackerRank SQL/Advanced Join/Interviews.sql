# Problem URL: https://www.hackerrank.com/challenges/interviews/problem

SELECT
    contest_id,
    hacker_id,
    name,
    SUM(total_submissions) AS total_submissions,
    SUM(total_accepted_submissions) AS total_accepted_submissions,
    SUM(total_views) AS total_views,
    SUM(total_unique_views) AS total_unique_views
FROM
    Contests C
    JOIN Colleges COL USING (contest_id)
    JOIN Challenges CHAL USING (college_id)
    LEFT JOIN (
        SELECT
            challenge_id,
            SUM(total_views) AS total_views,
            SUM(total_unique_views) AS total_unique_views
        FROM
            View_Stats
        GROUP BY
            challenge_id
    ) VS USING (challenge_id)
    LEFT JOIN (
        SELECT
            Challenge_id,
            SUM(total_submissions) AS total_submissions,
            SUM(total_accepted_submissions) AS total_accepted_submissions
        FROM
            Submission_Stats
        GROUP BY
            challenge_id
    ) SS USING (challenge_id)
GROUP BY
    contest_id,
    hacker_id,
    name
HAVING
    total_submissions + total_accepted_submissions + total_views + total_unique_views != 0
ORDER BY
    contest_id;