-- to retrieve all the data in the table 
Select * from orders;

-- LIMIT - used to specify the number of records to return 
Select * from Orders limit 5;

-- OFFSET - number of rows to skip from the beginning of the returned data before presenting the results
Select * from Orders limit 5 offset 3;

-- where ( used to extract only those records that fulfill a specified condition )
select * from Item where Item_Id = 2 ;

-- if stock is null the result can be also return null value
select Item_Id , Item_Name, (stock*Item_Price) as Amount from Item;

-- IFNULL and COALESCE - returns 0 if the value is NULL
select Item_Id , Item_Name, (IFNULL(stock,0) * Item_Price) as Amount from Item;
select Item_Id , Item_Name, (COALESCE(stock,0) * Item_Price) as Amount from Item; 

-- Case Statement 
select Item_Id , Item_Name, Item_Price , Stock, 
case
	when Stock is Null then "NO"
	else "YES"
    end as "IsStockPresent" 
from Item;

-- Order by used to sort the results in ascending or descending 
Select * from Item order by Item_Name asc | desc;

-- MiN() and MAX()
SELECT MIN(Item_Price) AS MaxItem FROM Item;
SELECT MAX(Item_Price) AS MinItem FROM Item;

-- AND , OR , NOT OPERATORS
select * from Item where not stock=10;
select * from Item where Item_Price=10 and stock=10;
select * from Item where Item_Price=10 or stock=10;

-- NULL values
select * from Item where stock IS NULL;
select * from Item where stock IS NOT NULL;

-- LIKE 
select * from Item where Item_Name like "____";
select * from Item where Item_Name like "_o%";
select * from Item where Item_Name like "H%";

-- SUM, (AVG and COUNT can omit the NULL value)
Select sum(stock) as SUMOFSTOCKS from Item;
select avg(Stock) as AVGOFSTOCKS from Item; 
select count(Item_Id) as TOTAL from Item;  

-- BETWEEN include the values  (low to high)
select * from Item where Item_Price between 20 and 50; 
select * from Item where Item_Price not between 20 and 50;

-- IN operator
select * from Employees where Designation in ("Teacher","Student");
select * from Student where City in ("chennai","Trichy","Madurai");

-- Alias 
select Item_Name as Product_Name from Item;
select Item_Id as Id, Item_Name as "Name" from Item;
select I.Item_Name from Item as I;
select Item_Id , concat_ws(",",Item_Name,Item_Price,stock) as Details from Item; 

-- INNER JOIN
SELECT Courses.COURSE_ID, Students.Stud_NAME, Students.Stud_AGE FROM Students
INNER JOIN Courses
ON Students.ROLL_NO = Courses.ROLL_NO;

-- LEFT JOIN
SELECT Students.Stud_Name,  Courses.Course_Id 
FROM Students
LEFT JOIN Courses 
ON Courses.Roll_No = Students.Roll_No; 

-- RIGHT JOIN
SELECT Students.Stud_Name, Courses.Course_Id 
FROM Students
RIGHT JOIN Courses 
ON Courses.Roll_No = Students.Roll_No;  

-- Self Join
SELECT a.ID, b.NAME as EARNS_HIGHER, a.NAME 
as EARNS_LESS, a.SALARY as LOWER_SALARY
FROM CUSTOMERS a, CUSTOMERS b
WHERE a.SALARY < b.SALARY;


-- union it doesn't allows duplicate
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

-- union all  it allows duplicate
SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;

-- Group by
SELECT COUNT(CustomerID), Country
FROM Customers group by Country;  

SELECT COUNT(CustomerID), Country 
FROM Customers where Country="Brazil"; -- it returns only brazil country count 

-- Having clause ( WHERE cannot be used for aggregate functions )
SELECT COUNT(Stud_Age), Stud_Age FROM Students GROUP BY Stud_Age HAVING COUNT(Stud_Age) > 2 ORDER BY Stud_Age asc;

-- WINDOW FUNCTION (used to do calculation across the set of rows)
SELECT E.*,
  MAX(EMP_SALARY) OVER() AS MAXSALARY
FROM EMPLOYEES E;

-- by using partition clause
SELECT E.*,
  MAX(EMP_SALARY) OVER(PARTITION by Emp_Dept) AS MAXSALARY
FROM EMPLOYEES E;

-- row_number ( it assigns a unique sequential number to each row within a specific partition )
SELECT E.*, 
   row_number() over(partition by emp_dept order by emp_id asc ) as RowNum
from EMPLOYEES E;

-- Rank  and Dense Rank
Select * from (
    SELECT E.*, 
    rank() over(partition by emp_dept order by Emp_Salary ) as rnk,
    dense_rank() over(partition by emp_dept order by Emp_Salary ) as dense_rnk
    from EMPLOYEES E ) X
where X.rnk  <= 3;


-- LAG and LEAD ( used to get preceding and succeeding value of any row within its partition )
-- Lag 
select E.*,
lag(emp_salary) over( partition by emp_dept order by emp_id) as prev_record
from Employees E ;

-- additional parameter in lag and lead
select E.*,
lag(emp_salary,2,0) over( partition by emp_dept order by emp_id asc) as prev_record
from Employees E ;

-- lead 
select E.*,
lead(emp_salary,2,0) over( partition by emp_dept order by emp_id asc) as nxt_record
from Employees E ;

-- WITH clause

''' 
for example written in sub-query
select * from employees e where emp_salary > (select avg(emp_salary) as Average_Salary from employees) ;
using with clause - easy to understand, reuse the query, store in temporary table
avg_salary scope was untill the full query execution
'''

with Average_Salary(avg_salary) as 
       ( select avg(emp_salary) from employees ) 
select * from employees e, Average_Salary av where e.emp_salary > av.avg_salary;


-- MYSQL Basic Methods 
SELECT DISTINCT emp_dept, length(Emp_dept) FROM Employees; -- return unique
SELECT CONCAT(emp_Id, ' ', Emp_salary) FROM Employees;     -- concatenate the string 
SELECT REPLACE(Emp_dept, 'I', 'i') FROM Employees;         -- replace the string 
Select INSTR(Emp_name, 'a') from Employees ;               -- return index
Select lower(Emp_Name)  from Employees ;		   -- return as lowercase
Select upper(Emp_Name)  from Employees ;	 	   -- return as uppercase
Select * from Employees where MOD(Emp_Id,2) <> 0;          -- modulus function
Select now();						   -- return '2024-02-05 22:44:48'
select curdate();                                          -- return "2024-02-05"
