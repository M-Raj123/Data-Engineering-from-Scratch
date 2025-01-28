-- Question : https://www.hackerrank.com/challenges/weather-observation-station-8
 
WITH CTE AS 
( 
SELECT 
    CITY,
    ROW_NUMBER() OVER(PARTITION BY CITY ORDER BY city asc ) as rn
FROM 
    STATION 
WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%')
    AND 
    (CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U' or CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u')
)
SELECT 
    CITY
FROM 
    CTE 
WHERE rn = 1;


-- another approch 

SELECT 
    DISTINCT CITY
FROM 
    STATION 
WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%')
    AND 
    (CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U' or CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u');
