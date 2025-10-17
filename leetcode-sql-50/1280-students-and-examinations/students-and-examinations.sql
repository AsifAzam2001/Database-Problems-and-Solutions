WITH
    CTE1 AS (
        SELECT
            *
        FROM
            Students
            CROSS JOIN Subjects
    ),
    CTE2 AS (
        SELECT
            DISTINCT student_id,
            subject_name,
            COUNT(subject_name) AS attended_exams
        FROM
            Examinations
        GROUP BY
            student_id,
            subject_name
    )
SELECT
    c1.student_id,
    c1.student_name,
    c1.subject_name,
    COALESCE(c2.attended_exams, 0) AS attended_exams
FROM
    CTE1 c1
    LEFT JOIN CTE2 c2 USING (student_id, subject_name)
ORDER BY
    student_id,
    subject_name;