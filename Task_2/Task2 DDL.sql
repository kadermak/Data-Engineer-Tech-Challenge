--
-- Task 2 Create DDL
--

BEGIN;

CREATE TABLE TB_Car (
    Car_ID integer NOT NULL PRIMARY KEY,
    Manufacturer_ID integer NOT NULL,
	Car_Serial_Number text NOT NULL,
    Car_Model_Name text,
	Car_Weight numeric,
	Car_Price_Amount numeric,
	Car_Colour_Code text,
	Car_Location_Address text,
	-- audit column
	DELETE_IND char(1) NOT NULL,
	CREATE_TS  timestamp NOT NULL,
	UPDATE_TS  timestamp NOT NULL
	
);


CREATE TABLE TB_Customer (
    Customer_ID integer NOT NULL PRIMARY KEY,
    Customer_Name text,
    Customer_Phone_Number integer,
	Transaction_ID integer NOT NULL,
	-- audit column
	DELETE_IND char(1) NOT NULL,
	CREATE_TS  timestamp NOT NULL,
	UPDATE_TS  timestamp NOT NULL
);



CREATE TABLE TB_Sales_Person (
    Sales_Person_ID integer NOT NULL PRIMARY KEY,
    Sales_Person_Name text,
    Sales_Person_Phone_Number integer,
	Sales_Person_Email text,
	-- audit column
	DELETE_IND char(1) NOT NULL,
	CREATE_TS  timestamp NOT NULL,
	UPDATE_TS  timestamp NOT NULL
	
);

 

CREATE TABLE TB_Sales_Transaction (
    Transaction_ID integer NOT NULL,
    Transaction_DateTime timestamp,
    Sales_Person_ID integer,
    Customer_ID integer,
    Car_ID integer,
	Store_ID text,
	Sales_Amount numeric,
	Sales_Qty numeric,
	-- audit column
	DELETE_IND char(1) NOT NULL,
	CREATE_TS  timestamp NOT NULL,
	UPDATE_TS  timestamp NOT NULL
);
 

CREATE TABLE TB_Manufacturer (
	Manufacturer_ID integer NOT NULL PRIMARY KEY,
    Manufacturer_Name text,
	-- audit column
	DELETE_IND char(1) NOT NULL,
	CREATE_TS  timestamp NOT NULL,
	UPDATE_TS  timestamp NOT NULL
);

/*

-- Task 2 Data Analysis 

-- #1 spending summary
SELECT t.Customer_ID, c.Customer_Name, SUM(t.Sales_Amount) 
FROM TB_Sales_Transaction t LEFT JOIN TB_Customer c ON t.Customer_ID = c.Customer_ID AND t.DELETE_IND ='F' AND c.DELETE_IND='F'
GROUP BY 1,2
ORDER BY 3,1;

-- #2 sales summary 
SELECT m.Manufacturer_id, m.Manufacturer_Name, SUM(t.Sales_Amount), SUM(t.Sales_Qty)  
FROM TB_Sales_Transaction t LEFT JOIN TB_Car c ON t.Car_ID = c.Car_ID AND t.DELETE_IND ='F' AND c.DELETE_IND='F'
LEFT JOIN TB_Manufacturer m ON c.Manufacturer_ID = m.Manufacturer_ID AND m.DELETE_IND ='F' 
GROUP BY 1 ;
 
*/