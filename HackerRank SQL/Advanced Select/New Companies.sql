# Problem URL: https://www.hackerrank.com/challenges/the-company/problem

SELECT
    company_code,
    founder,
    COUNT(DISTINCT lead_manager_code),
    COUNT(DISTINCT senior_manager_code),
    COUNT(DISTINCT manager_code),
    COUNT(DISTINCT employee_code)
FROM
    Employee e
    JOIN Company c USING (company_code)
GROUP BY
    company_code,
    founder
ORDER BY
    company_code;