SELECT
    customer_id,
    COUNT(customer_id) AS count_no_trans
FROM
    Visits v
    LEFT JOIN Transactions t USING (visit_id)
WHERE
    transaction_id is NULL
GROUP BY
    customer_id;