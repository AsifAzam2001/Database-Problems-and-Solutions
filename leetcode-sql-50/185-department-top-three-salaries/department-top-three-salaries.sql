WITH
    CTE AS (
        SELECT
            e.name AS Employee,
            e.salary AS Salary,
            d.name AS Department
        FROM
            Employee e
            JOIN Department d ON e.departmentId = d.id
    ),
    RankedSalary AS (
        SELECT
            *,
            DENSE_RANK() OVER (
                PARTITION BY Department
                ORDER BY
                    Salary DESC
            ) AS earnerRank
        FROM
            CTE
    )
SELECT
    Department,
    Employee,
    Salary
FROM
    RankedSalary
WHERE
    earnerRank <= 3;