WITH
    CTE AS (
        SELECT
            e2.id,
            e2.name,
            COUNT(e2.id) AS reportfreq
        FROM
            Employee e1
            JOIN Employee e2 on e1.managerId = e2.id
        GROUP BY
            e2.id,
            e2.name
        HAVING
            reportfreq >= 5
    )
SELECT
    name
FROM
    CTE;
