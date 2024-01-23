-- create table if it not exist
create table Customers(
    Customer_Id int,
    Customer_Name varchar(50),
    Customer_Phone char(10),
    Customer_City varchar(50),
    Customer_Pincode text,
    constraint pk_cus_id primary key(Customer_Id)
);

create table Items(
    Item_Id int ,
    Item_Name varchar(30),
    Item_Price int,
    Constraint pk_item_id Primary key(Item_Id)
);

create table Orders(
    Order_Id int,
    Item_Id int,
    Customer_Id int,
    Total_Amt int,
    constraint pk_order_id primary key(Order_Id),
    constraint fk_item_id foreign key (Item_Id) References Items(Item_Id),
    constraint fk_cus_id foreign key (Customer_Id) References Customers(Customer_Id)
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

-- primary key constraint 
ALTER TABLE Item
add Constraint pk_item_id Primary key (Item_Id); 

-- foreign key constraint 
Alter table Orders
add constraint fk_item_id foreign key (Item_Id) References Item(Item_Id),
add constraint fk_cus_id foreign key (Customer_Id) References Customers(Customer_Id);

-- drop constraints using constraint_name
Alter table Orders
drop constraint fk_item_id,
drop constraint fk_cus_id;

-- auto_increment  ( By default, the starting value for AUTO_INCREMENT is 1, and it will increment by 1 for each new record )
alter table sampleIncTab auto_increment=100; 
/*
error faced while creating table without set key for column - auto_incr constraint
Error Code: 1075. Incorrect table definition; there can be only one auto column and it must be defined as a key
*/


-- default constraint
ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';

-- create index ( Data retrieval is speed up by the usage of indexes )
create index idx_item_id on orders(Item_Id);

-- drop index 
Alter table Orders
drop index idx_item_id;

-- display the contraints on the selected table 
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Item';


create table Students(
	Roll_No int,
    Stud_Name varchar(40),
    Stud_Address varchar(50),
    Stud_Phone varchar(10),
    Stud_Age int
);

create table Courses(
	Course_Id int,
    Roll_No int
);

select * from Students;
insert into Students values(1,"HARSH","DELHI","xxxxxxxxxx",18);
insert into Students values(2,"PRATIK","BIHAR","xxxxxxxxxx",19);
insert into Students values(3,"RIYANKA","SILIGURI","xxxxxxxxxx",20);
insert into Students values(4,"DEEP","RAMNAGAR","xxxxxxxxxx",18);
insert into Students values(5,"SAPTHARI","KOLKATA","xxxxxxxxxx",19);
insert into Students values(6,"DHANRAJ","BARABAJAR","xxxxxxxxxx",20);
insert into Students values(7,"ROHIT","BALURGHAT","xxxxxxxxxx",18);
insert into Students values(8,"NIRAJ","ALIPUR","xxxxxxxxxx",19);


select * from Courses;
insert into Courses values(1,1);
insert into Courses values(2,2);
insert into Courses values(2,3);
insert into Courses values(3,4);
insert into Courses values(1,5);
insert into Courses values(4,9);
insert into Courses values(5,10);
insert into Courses values(4,11);
