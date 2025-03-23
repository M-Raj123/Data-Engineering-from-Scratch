
-- Question : https://www.hackerrank.com/challenges/the-pads/

SELECT
    CONCAT(NAME,'(',SUBSTRING(Occupation, 1,1),')')
FROM 
    OCCUPATIONS
ORDER BY NAME;
    

SELECT 
    CONCAT('There are a total of ',count(*),' ',LOWER(Occupation),'s.')
FROM
    OCCUPATIONS
GROUP BY 
    Occupation
ORDER BY 1 asc;
