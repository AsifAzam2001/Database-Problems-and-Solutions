WITH
    RankedPrices AS (
        SELECT
            *,
            RANK() OVER (
                PARTITION BY product_id
                ORDER BY
                    change_date DESC
            ) AS rnk
        FROM
            Products
        WHERE
            change_date <= '2019-08-16'
    ),
    FilteredProducts AS (
        SELECT
            product_id,
            new_price AS price
        FROM
            RankedPrices
        WHERE
            rnk = 1
    )
SELECT
    p.product_id,
    COALESCE(fp.price, 10) AS price
FROM
    (
        SELECT
            DISTINCT product_id
        FROM
            Products
    ) AS p
    LEFT JOIN FilteredProducts fp USING (product_id);