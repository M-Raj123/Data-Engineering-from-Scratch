-- Question 
-- https://www.hackerrank.com/challenges/more-than-75-marks/problem 


WITH CTE AS
(
  SELECT
      ID , Name, SUBSTRING(Name ,  length(Name)-2 ,length(Name)) as sub , Marks
  FROM 
      STUDENTS
  WHERE 
      MARKS > 75
  ORDER BY 3,1
)SELECT Name FROM CTE;
