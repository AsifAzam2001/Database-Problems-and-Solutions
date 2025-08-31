# Problem URL: https://www.hackerrank.com/challenges/average-population-of-each-continent/problem

SELECT
    CN.CONTINENT,
    FLOOR(AVG(C.POPULATION))
FROM
    CITY C
    JOIN COUNTRY CN ON C.COUNTRYCODE = CN.CODE
GROUP BY
    CN.CONTINENT;