# Problem URL: https://www.hackerrank.com/challenges/the-report/problem

SELECT
    CASE
        WHEN g.Grade > 7 THEN s.Name
        ELSE NULL
    END AS Name,
    g.Grade,
    s.Marks
FROM
    Students AS s
    JOIN Grades AS g ON s.Marks BETWEEN g.Min_Mark
    AND g.Max_Mark
ORDER BY
    g.Grade DESC,
    CASE
        WHEN g.Grade > 7 THEN s.Name
        ELSE s.Marks
    END ASC;

/*
# Alternative Way 1:

WITH
    CTE AS (
        SELECT
            s.Name,
            s.Marks,
            g.Grade
        FROM
            Students s
            JOIN Grades g ON s.Marks BETWEEN g.Min_Mark
            AND g.Max_Mark
    )
SELECT
    CASE
        WHEN Grade > 7 THEN Name
        ELSE NULL
    END AS Name,
    Grade,
    Marks
FROM
    CTE
ORDER BY
    Grade DESC,
    CASE
        WHEN Grade > 7 THEN Name
        ELSE Marks
    END ASC;



# Alternative Way 2 (MySQL Specific):

SELECT
    IF(g.Grade > 7, s.Name, NULL) AS Name,
    g.Grade,
    s.Marks
FROM
    Students AS s
    JOIN Grades AS g ON s.Marks BETWEEN g.Min_Mark
    AND g.Max_Mark
ORDER BY
    g.Grade DESC,
    IF(g.Grade > 7, s.Name, s.Marks) ASC;

*/