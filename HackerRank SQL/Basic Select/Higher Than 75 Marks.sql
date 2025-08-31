# Problem URL: https://www.hackerrank.com/challenges/more-than-75-marks/problem

SELECT
    Name
FROM
    STUDENTS
WHERE
    Marks > 75
ORDER BY
    SUBSTRING(Name, LENGTH(NAME) - 2, 3),
    ID;