SELECT
    product_id,
    COALESCE(ROUND(SUM(price * units) / SUM(units), 2), 0) AS average_price
FROM
    Prices
    LEFT JOIN UnitsSold using (product_id)
WHERE
    purchase_date BETWEEN start_date AND end_date
    OR purchase_date IS NULL
GROUP BY
    product_id;