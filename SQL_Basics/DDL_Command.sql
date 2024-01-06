-- create table if it not exist
create table Item(
    Item_Id int,
    Item_Name varchar(30),
    Item_Price int
);

-- show the newly created tables
show tables;

-- see the table structure
describe Item;
	
-- delete an existing table 
drop table Item;

-- delete the data inside a table
Truncate table Item; 

-- Alter the Table 
-- Add new column 
Alter table Item 
Add Item_Rating int ;

-- Drop Existing column 
Alter table Item
Drop column Item_Rating;

-- Modify Existing Column (To change the data type of a column in a table)
 Alter table Item 
 Modify column Item_Rating char; 

-- two ways to display the column information
show columns from Item; 
describe Item;

-- copy table and data
CREATE TABLE duplicate_item_table LIKE item;  
INSERT duplicate_item_table SELECT * FROM item;

-- rename column old to new 
Alter table Item 
rename column Item_Rating to Item_Rate ;

-- change column name and datatype
Alter table Item 
change column Item_Rating Item_Rate int;

--  Constraint

-- not null constraint ( By default, a column can hold NULL values )
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
); 

-- check constraint 
ALTER TABLE Item
ADD CONSTRAINT nn_name
CHECK (Item_Name IS NOT NULL);

-- primary constraint 
ALTER TABLE Item
add Constraint pk_item_id Primary key (Item_Id); 

-- display the contraints on the selected table 
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Item';
