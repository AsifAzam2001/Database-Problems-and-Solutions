# Problem URL: https://www.hackerrank.com/challenges/weather-observation-station-8/problem

SELECT
    DISTINCT CITY
FROM
    STATION
WHERE
    CITY REGEXP "^[A E I O U]"
    AND CITY REGEXP "[A E I O U]$";