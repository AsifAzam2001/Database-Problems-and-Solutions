# Problem URL: https://www.hackerrank.com/challenges/weather-observation-station-17/problem

SELECT
    ROUND(LONG_W, 4)
FROM
    STATION
WHERE
    ROUND(LAT_N, 4) = (
        SELECT
            ROUND(MIN(LAT_N), 4)
        FROM
            STATION
        WHERE
            ROUND(LAT_N, 4) > 38.7780
    );


/*
# Alternative Way:

SET
    @MIN_LAT_N = (
        SELECT
            ROUND(MIN(LAT_N), 4)
        FROM
            STATION
        WHERE
            ROUND(LAT_N, 4) > 38.7780
    );

SELECT
    ROUND(LONG_W, 4)
FROM
    STATION
WHERE
    ROUND(LAT_N, 4) = @MIN_LAT_N;
    
*/