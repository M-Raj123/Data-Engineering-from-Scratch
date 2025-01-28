
-- Question:  https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true

-- Sample Input

-- For example, CITY has four entries: DEF, ABC, PQRS and WXY.

-- Sample Output

-- ABC 3
-- PQRS 4
-- Explanation

-- When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths 3, 3, 4 and 3 . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.

-- Note
-- You can write two separate queries to get the desired output. It need not be a single query.

WITH CTE AS
(   
SELECT 
    CITY , LENGTH(CITY) as LEN,
    ROW_NUMBER() OVER(PARTITION BY LENGTH(CITY) ORDER BY CITY asc) as rn
FROM 
    STATION 
WHERE LENGTH(CITY) in (
    (SELECT MAX(LENGTH(CITY)) FROM STATION), (SELECT MIN(LENGTH(CITY)) FROM STATION))
)
SELECT 
  CITY , LEN  
FROM 
  CTE 
WHERE rn = 1;
