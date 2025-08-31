# Problem URL: https://www.hackerrank.com/challenges/asian-population/problem

SELECT
    SUM(c.POPULATION)
FROM
    COUNTRY cn
    JOIN CITY c ON cn.CODE = c.COUNTRYCODE
WHERE
    cn.CONTINENT = 'Asia';