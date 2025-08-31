# Problem URL: https://www.hackerrank.com/challenges/weather-observation-station-6/problem

SELECT
    DISTINCT CITY
FROM
    STATION
WHERE
    CITY REGEXP "^[A E I O U]";


/*
# Alternative Way:

SELECT
    DISTINCT CITY
FROM
    STATION
WHERE
    CITY LIKE 'A%'
    OR CITY LIKE 'E%'
    OR CITY LIKE 'I%'
    OR CITY LIKE 'O%'
    OR CITY LIKE 'U%';
*/

