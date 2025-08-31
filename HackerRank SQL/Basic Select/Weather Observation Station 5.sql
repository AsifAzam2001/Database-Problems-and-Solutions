# Problem URL: https://www.hackerrank.com/challenges/weather-observation-station-5/problem

(
    SELECT
        CITY,
        LENGTH(CITY)
    FROM
        STATION
    ORDER BY
        LENGTH(CITY) DESC,
        CITY ASC
    LIMIT
        1
)
UNION ALL
(
    SELECT
        CITY,
        LENGTH(CITY)
    FROM
        STATION
    ORDER BY
        LENGTH(CITY) ASC,
        CITY ASC
    LIMIT
        1
);



/*
# Alternative Way 1:

SELECT
    CITY,
    LENGTH(CITY)
FROM
    STATION
WHERE
    LENGTH(CITY) = (
        SELECT
            MAX(LENGTH(CITY))
        FROM
            STATION
    )
ORDER BY
    CITY
LIMIT
    1;

SELECT
    CITY,
    LENGTH(CITY)
FROM
    STATION
WHERE
    LENGTH(CITY) = (
        SELECT
            MIN(LENGTH(CITY))
        FROM
            STATION
    )
ORDER BY
    CITY
LIMIT
    1;

*/



/*
# Alternative Way 2:

SET
    @maxlen = (
        SELECT
            MAX(LENGTH(CITY))
        FROM
            STATION
    );

SET
    @minlen = (
        SELECT
            MIN(LENGTH(CITY))
        FROM
            STATION
    );

SELECT
    CITY,
    LENGTH(CITY)
FROM
    STATION
WHERE
    LENGTH(CITY) = @maxlen
ORDER BY
    CITY
LIMIT
    1;

SELECT
    CITY,
    LENGTH(CITY)
FROM
    STATION
WHERE
    LENGTH(CITY) = @minlen
ORDER BY
    CITY
LIMIT
    1;

*/