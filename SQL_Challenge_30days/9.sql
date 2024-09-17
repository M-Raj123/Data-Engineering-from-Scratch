/*

1. https://leetcode.com/problems/department-top-three-salaries

*/

SELECT 
  department_name,
  employee_name,
  salary  
FROM ( 
SELECT 
  d.name as department_name
  e.name as employee_name,
  e.salary as salary,
  DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC ) as rn 
FROM employee AS e
JOIN department AS d
ON e.department_id = d.department_id 
) x1 
WHERE rn <= 3;
