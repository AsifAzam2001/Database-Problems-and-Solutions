# Problem URL: https://www.hackerrank.com/challenges/weather-observation-station-18/problem

SELECT
    ROUND(ABS(min_lat - max_lat) + ABS(min_long - max_long), 4)
FROM
    (
        SELECT
            MIN(LAT_N) AS min_lat,
            MAX(LAT_N) AS max_lat,
            MIN(LONG_W) AS min_long,
            MAX(LONG_W) AS max_long
        FROM
            STATION
    ) AS Aggregates;



/*
# Alternative Way:

SET
    @MIN_LAT_N = (
        SELECT
            MIN(LAT_N)
        FROM
            STATION
    );

SET
    @MAX_LAT_N = (
        SELECT
            MAX(LAT_N)
        FROM
            STATION
    );

SET
    @MIN_LONG_W = (
        SELECT
            MIN(LONG_W)
        FROM
            STATION
    );

SET
    @MAX_LONG_W = (
        SELECT
            MAX(LONG_W)
        FROM
            STATION
    );

SELECT
    ROUND(
        (
            ABS(@MIN_LAT_N - @MAX_LAT_N) + ABS(@MIN_LONG_W - @MAX_LONG_W)
        ),
        4
    );
    
*/