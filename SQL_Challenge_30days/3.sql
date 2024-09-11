/*
1. https://datalemur.com/questions/teams-power-users
2. Highest Salary Difference
*/

-- 1.

SELECT
  sender_id,
  COUNT(1) as total_cnt
FROM messages
WHERE sent_date BETWEEN '2022-08-1' AND '2022-08-31'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2;

-- 2.

CREATE TABLE Salaries (
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
PRIMARY KEY (emp_name, department)
);

INSERT INTO Salaries (emp_name, department, salary) VALUES
('Kathy', 'Engineering', 50000),
('Roy', 'Marketing', 30000),
('Charles', 'Engineering', 45000),
('Jack', 'Engineering', 85000),
('Benjamin', 'Marketing', 34000),
('Anthony', 'Marketing', 42000),
('Edward', 'Engineering', 102000),
('Terry', 'Engineering', 44000),
('Evelyn', 'Marketing', 53000),
('Arthur', 'Engineering', 32000);


SELECT *FROM SALARIES; 

SELECT 
	ABS(
	MAX(CASE WHEN department = 'Engineering' THEN SALARY END) -  
	MAX(CASE WHEN department = 'Marketing' THEN SALARY END) 
	) as difference
FROM 
	SALARIES;
