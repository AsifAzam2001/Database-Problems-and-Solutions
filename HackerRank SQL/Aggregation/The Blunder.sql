# Problem URL: https://www.hackerrank.com/challenges/the-blunder/problem

SELECT
    CEIL(
        AVG(Salary) - AVG(CAST(REPLACE(SALARY, '0', '') AS DECIMAL))
    )
FROM
    EMPLOYEES;