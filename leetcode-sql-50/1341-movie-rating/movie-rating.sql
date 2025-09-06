WITH
    CTE AS (
        SELECT
            *
        FROM
            MovieRating mr
            JOIN Movies m USING (movie_id)
            JOIN Users u USING (user_id)
    ),
    USERCTE AS (
        SELECT
            user_id,
            name,
            COUNT(name) AS freq
        FROM
            CTE
        GROUP BY
            user_id,
            name
        ORDER BY
            freq DESC,
            name
    ),
    MOVIECTE AS (
        SELECT
            movie_id,
            title,
            AVG(rating) AS average
        FROM
            CTE
        WHERE
            created_at BETWEEN '2020-02-01' AND '2020-02-29'
        GROUP BY
            movie_id,
            title
        ORDER BY
            average DESC,
            title
    ),
    USERRESULT AS (
        SELECT
            name AS results
        FROM
            USERCTE
        LIMIT
            1
    ),
    MOVIERESULT AS (
        SELECT
            title AS results
        FROM
            MOVIECTE
        LIMIT
            1
    )
SELECT
    *
FROM
    USERRESULT

UNION ALL

SELECT
    *
FROM
    MOVIERESULT;