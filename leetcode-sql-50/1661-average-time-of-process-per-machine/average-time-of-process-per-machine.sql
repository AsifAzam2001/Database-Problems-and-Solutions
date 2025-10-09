SELECT
    a.machine_id,
    ROUND(AVG(a.timestamp - b.timestamp), 3) AS processing_time
FROM
    Activity a
    JOIN Activity b USING (machine_id)
WHERE
    a.activity_type = 'end'
    AND b.activity_type = 'start'
    AND a.process_id = b.process_id
GROUP BY
    a.machine_id;