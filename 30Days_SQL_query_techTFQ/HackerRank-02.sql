-- Question : https://www.hackerrank.com/challenges/weather-observation-station-7/
-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.


WITH CTE AS 
( 
SELECT 
    CITY,
    ROW_NUMBER() OVER(PARTITION BY CITY ORDER BY city asc ) as rn
FROM 
    STATION 
WHERE CITY LIKE '%a' OR 
      CITY LIKE '%e' OR
      CITY LIKE '%i' OR
      CITY LIKE '%o' OR
      CITY LIKE '%u'
)
SELECT 
    CITY
FROM 
    CTE 
WHERE rn = 1;
