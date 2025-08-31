# Problem URL: https://www.hackerrank.com/challenges/african-cities/problem

SELECT
    c.NAME
FROM
    COUNTRY cn
    JOIN CITY c ON cn.CODE = c.COUNTRYCODE
WHERE
    cn.CONTINENT = 'Africa';