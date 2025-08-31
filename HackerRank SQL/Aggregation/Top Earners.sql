# Problem URL: https://www.hackerrank.com/challenges/earnings-of-employees/problem


SELECT
    MAX(months * salary),
    COUNT(*)
FROM
    Employee
WHERE
    months * salary = (
        SELECT MAX(months * salary)
        FROM Employee
    );



/*
# Alternative Way 1:

WITH EmployeeEarnings AS (
    SELECT
        (months * salary) AS earnings
    FROM
        Employee
)
SELECT
    earnings,
    COUNT(*)
FROM
    EmployeeEarnings
WHERE
    earnings = (SELECT MAX(earnings) FROM EmployeeEarnings)
GROUP BY
    earnings;



# Alternative Way 2:

WITH RankedEarnings AS (
    SELECT
        (months * salary) AS earnings,
        -- Rank employees by earnings in descending order. Top earner(s) get rank 1.
        DENSE_RANK() OVER (ORDER BY (months * salary) DESC) as rnk
    FROM
        Employee
)
SELECT
    earnings,
    COUNT(*)
FROM
    RankedEarnings
WHERE
    rnk = 1
GROUP BY
    earnings;



# Alternative Way 3:

SELECT
    derived_table.max_earnings,
    COUNT(e.employee_id)
FROM
    Employee AS e
JOIN
    (SELECT MAX(months * salary) AS max_earnings FROM Employee) AS derived_table
ON
    (e.months * salary) = derived_table.max_earnings
GROUP BY
    derived_table.max_earnings;



# Alternative Way 4:

SET
    @max_salary = (
        SELECT
            MAX(months * salary)
        FROM
            Employee
    );
SELECT
    @max_salary,
    COUNT(months * salary)  -- or COUNT(@max_salary)
FROM
    Employee
WHERE
    months * salary = @max_salary;


*/