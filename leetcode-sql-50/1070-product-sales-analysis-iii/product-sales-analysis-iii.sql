WITH
    RankedSales AS (
        SELECT
            *,
            RANK() OVER (
                PARTITION BY product_id
                ORDER BY year ASC
            ) as year_rank
        FROM
            Sales
    )
SELECT
    product_id, 
    year AS first_year, 
    quantity, 
    price
FROM
    RankedSales
WHERE
    year_rank = 1;