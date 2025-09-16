WITH
    categories AS (
        SELECT
            'Low Salary' AS category
        UNION ALL
        SELECT
            'Average Salary'
        UNION ALL
        SELECT
            'High Salary'
    ),
    CTE AS (
        SELECT
            *,
            IF(
                income < 20000,
                "Low Salary",
                IF(income > 50000, "High Salary", "Average Salary")
            ) AS category
        FROM
            Accounts
    )
SELECT
    category,
    COUNT(account_id) AS accounts_count
FROM
    categories
    LEFT JOIN CTE USING (category)
GROUP BY
    category;