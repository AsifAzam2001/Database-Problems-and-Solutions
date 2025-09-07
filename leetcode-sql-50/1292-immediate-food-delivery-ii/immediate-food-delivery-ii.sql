WITH
    RankedOrders AS (
        SELECT
            order_date,
            customer_pref_delivery_date,
            RANK() OVER (
                PARTITION BY customer_id
                ORDER BY order_date ASC
            ) as order_rank
        FROM
            Delivery
    )
SELECT
    ROUND(
        AVG(IF(order_date = customer_pref_delivery_date, 1, 0)) * 100,
        2
    ) AS immediate_percentage
FROM
    RankedOrders
WHERE
    order_rank = 1;

/*
# Alternative Solution:

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

*/