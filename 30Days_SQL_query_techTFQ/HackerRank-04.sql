-- Questions : https://www.hackerrank.com/challenges/weather-observation-station-9/problem?isFullScreen=true

SELECT 
    DISTINCT CITY
FROM 
    STATION 
WHERE (CITY NOT LIKE 'A%' and CITY NOT LIKE 'E%' and CITY NOT LIKE 'I%' and CITY NOT LIKE 'O%' and CITY NOT LIKE 'U%' );
