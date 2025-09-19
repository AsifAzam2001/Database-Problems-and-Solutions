WITH
    Users AS (
        SELECT
            requester_id AS id
        FROM
            RequestAccepted
        UNION
        SELECT
            accepter_id
        FROM
            RequestAccepted
    ),
    CTE1 AS (
        SELECT
            requester_id AS id,
            COUNT(requester_id) AS requestfreq
        FROM
            RequestAccepted
        GROUP BY
            requester_id
    ),
    CTE2 AS (
        SELECT
            accepter_id AS id,
            COUNT(accepter_id) AS acceptfreq
        FROM
            RequestAccepted
        GROUP BY
            accepter_id
    )
SELECT
    id,
    COALESCE(requestfreq, 0) + COALESCE(acceptfreq, 0) AS num
FROM
    Users
    LEFT JOIN CTE1 USING (id)
    LEFT JOIN CTE2 USING (id)
ORDER BY
    num DESC
LIMIT 
    1;