-- https://www.hackerrank.com/challenges/weather-observation-station-10/

SELECT 
    DISTINCT CITY
FROM 
    STATION 
WHERE (CITY NOT LIKE '%a' and CITY NOT LIKE '%e' and CITY NOT LIKE '%o' and CITY NOT LIKE '%i' and CITY NOT LIKE '%u' );
