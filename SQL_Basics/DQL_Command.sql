-- to retrieve all the data in the table 
Select * from orders;

-- LIMIT - used to specify the number of records to return 
Select * from Orders limit 5;

-- OFFSET - number of rows to skip from the beginning of the returned data before presenting the results
Select * from Orders limit 5 offset 3;

-- where ( used to extract only those records that fulfill a specified condition )
select * from Item where Item_Id = 2 ;
