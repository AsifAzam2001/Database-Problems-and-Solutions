# Problem URL: https://www.hackerrank.com/challenges/weather-observation-station-10/problem

SELECT
    DISTINCT CITY
FROM
    STATION
WHERE
    CITY NOT REGEXP "[A E I O U]$";