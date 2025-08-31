# Problem URL: https://www.hackerrank.com/challenges/the-pads/problem

SELECT
    CONCAT(Name, '(', LEFT(Occupation, 1), ')')
FROM
    OCCUPATIONS
ORDER BY
    Name;

SELECT
    CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.')
FROM
    OCCUPATIONS
GROUP BY
    Occupation
ORDER BY
    COUNT(Occupation), Occupation;


/*
# Alternative Way:

SELECT
    ReportLine
FROM
    (
        SELECT
            CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS ReportLine,
            1 AS SortKey,  
            -- Names will be sorted first
            Name AS OrderValue
        FROM
            OCCUPATIONS
        UNION
        ALL
        SELECT
            CONCAT(
                'There are a total of ',
                COUNT(Occupation),
                ' ',
                LOWER(Occupation),
                's.'
            ) AS ReportLine,
            2 AS SortKey,
            -- Summaries will be sorted second
            CAST(COUNT(Occupation) AS CHAR) AS OrderValue
        FROM
            OCCUPATIONS
        GROUP BY
            Occupation
    ) AS FinalReport
ORDER BY
    SortKey,
    OrderValue;
    
*/