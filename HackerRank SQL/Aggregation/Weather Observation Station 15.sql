# Problem URL: https://www.hackerrank.com/challenges/weather-observation-station-15/problem

SELECT
    ROUND(LONG_W, 4)
FROM
    STATION
WHERE
    ROUND(LAT_N, 4) = (
        SELECT
            ROUND(MAX(LAT_N), 4)
        FROM
            STATION
        WHERE
            ROUND(LAT_N, 4) < 137.2345
    );



/*
# Alternative Way:

SET
    @MAX_LAT_N = (
        SELECT
            ROUND(MAX(LAT_N), 4)
        FROM
            STATION
        WHERE
            ROUND(LAT_N, 4) < 137.2345
    );

SELECT
    ROUND(LONG_W, 4)
FROM
    STATION
WHERE
    ROUND(LAT_N, 4) = @MAX_LAT_N;
    
*/