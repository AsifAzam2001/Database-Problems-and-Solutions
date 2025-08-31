# Problem URL: https://www.hackerrank.com/challenges/weather-observation-station-16/problem

SELECT
    ROUND(MIN(LAT_N), 4)
FROM
    STATION
WHERE
    ROUND(LAT_N, 4) > 38.7780;