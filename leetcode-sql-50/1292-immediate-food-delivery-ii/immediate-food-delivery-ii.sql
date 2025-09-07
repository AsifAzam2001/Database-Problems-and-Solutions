WITH
    firstOrderCTE AS (
        SELECT
            customer_id,
            MIN(order_date) AS first_order
        FROM
            Delivery
        GROUP BY
            customer_id
    )
SELECT
    ROUND(
        AVG(
            IF(d.order_date = d.customer_pref_delivery_date, 1, 0)
        ) * 100,
        2
    ) AS immediate_percentage
FROM
    Delivery d
    JOIN firstOrderCTE f ON d.customer_id = f.customer_id
    AND d.order_date = f.first_order;