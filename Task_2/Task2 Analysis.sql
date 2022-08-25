
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
 