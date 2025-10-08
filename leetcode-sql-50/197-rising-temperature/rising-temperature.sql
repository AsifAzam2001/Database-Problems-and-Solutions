SELECT
    w2.id
FROM
    Weather w1
    JOIN Weather w2
WHERE
    w2.temperature > w1.temperature
    AND w2.recordDate = DATE_ADD(w1.recordDate, INTERVAL 1 DAY);