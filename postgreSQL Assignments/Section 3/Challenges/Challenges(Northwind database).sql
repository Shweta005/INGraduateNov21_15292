--Challenge1:Select everything from Employee table
SELECT * FROM employees;

--Challenge2: Select name and description of all our product categories table.
SELECT categoryname,description 
FROM categories;

--Challenge3:What are unique regions our suppliers are in?
SELECT DISTINCT region 
FROM suppliers;

--Challenge 4:How many orders have we had?
SELECT COUNT (*) 
FROM orders;

--Challenge 5:How many distinct products have been ordered(use order details)?
SELECT COUNT (DISTINCT productid) 
FROM order_details;

--Challenge6: Select the amount spent on order details(price times quantity)
SELECT ordered ,unitprice*quantity
FROM order_details;







