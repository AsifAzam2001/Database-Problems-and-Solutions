# Problem URL: https://www.hackerrank.com/challenges/weather-observation-station-13/problem

SELECT
    ROUND(SUM(LAT_N), 4)
FROM
    STATION
WHERE
    ROUND(LAT_N, 4) < 137.2345
    AND ROUND(LAT_N, 4) > 38.7880;