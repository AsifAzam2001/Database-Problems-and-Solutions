WITH
    CTE AS (
        SELECT
            user_id,
            count(user_id) AS freq
        FROM
            Signups s
            LEFT JOIN Confirmations c USING (user_id)
        GROUP BY
            user_id
    ),
    ConfirmationCTE AS (
        SELECT
            user_id,
            count(user_id) AS confirmationfreq
        FROM
            Signups s
            JOIN Confirmations c USING (user_id)
        WHERE
            c.action = 'confirmed'
        GROUP BY
            user_id
    )
SELECT
    c1.user_id,
    COALESCE(ROUND(c2.confirmationfreq / c1.freq, 2), 0) AS confirmation_rate
FROM
    CTE c1
    LEFT JOIN ConfirmationCTE c2 USING (user_id);