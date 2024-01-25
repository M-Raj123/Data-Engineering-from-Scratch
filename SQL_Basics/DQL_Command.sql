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


-- union it allows duplicate
SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;
