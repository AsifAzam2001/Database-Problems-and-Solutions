# Problem URL: https://www.hackerrank.com/challenges/weather-observation-station-12/problem

SELECT
    DISTINCT CITY
FROM
    STATION
WHERE
    CITY NOT REGEXP "^[A E I O U]"
    AND CITY NOT REGEXP "[A E I O U]$";