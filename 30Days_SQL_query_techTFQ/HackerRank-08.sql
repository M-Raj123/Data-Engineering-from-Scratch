-- Question : https://www.hackerrank.com/challenges/what-type-of-triangle/problem

SELECT
    CASE 
    WHEN (A+B <= C OR B+C <= A OR A+C <= B) THEN 'Not A Triangle'
    WHEN A=B and B=C and A=C THEN 'Equilateral'
    WHEN (A=B or B=C or A=C) THEN 'Isosceles'
    ELSE 'Scalene'
    END as result
FROM 
    TRIANGLES;
