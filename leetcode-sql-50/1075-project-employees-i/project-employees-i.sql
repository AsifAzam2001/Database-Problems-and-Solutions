SELECT
    project_id,
    ROUND(AVG(experience_years), 2) AS average_years
FROM
    Project
    LEFT JOIN Employee using (employee_id)
GROUP BY
    project_id;