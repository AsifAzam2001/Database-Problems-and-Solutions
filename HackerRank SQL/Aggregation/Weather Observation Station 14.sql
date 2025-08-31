# Problem URL: https://www.hackerrank.com/challenges/weather-observation-station-14/problem

SELECT
    ROUND(MAX(LAT_N), 4)
FROM
    STATION
WHERE
    ROUND(LAT_N, 4) < 137.2345;