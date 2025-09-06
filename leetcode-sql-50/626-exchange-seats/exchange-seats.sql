SELECT
    CASE
        WHEN id % 2 = 0 THEN id - 1 
        WHEN id = (
            SELECT
                COUNT(*)
            FROM
                Seat
        ) THEN id 
        ELSE id + 1
    END AS id,
    Student
FROM
    Seat
ORDER BY
    id;

/*
# Alternative Solution:

SELECT
    id,
    CASE
        WHEN id % 2 != 0 THEN LEAD(student, 1, student) OVER (
            ORDER BY
                id
        )
        ELSE LAG(student, 1) OVER (
            ORDER BY
                id
        )
    END AS student
FROM
    seat;
*/