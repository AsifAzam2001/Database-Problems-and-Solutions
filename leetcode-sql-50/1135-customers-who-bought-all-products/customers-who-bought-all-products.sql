WITH
    CustomerCTE AS (
        SELECT
            customer_id,
            COUNT(DISTINCT product_key) AS buy_count
        FROM
            Customer
        GROUP BY
            customer_id
    )
SELECT
    customer_id
FROM
    CustomerCTE
WHERE
    buy_count = (
        SELECT
            COUNT(*)
        FROM
            Product
    );
