--Challenge1
--Connect employee to orders and pull back first name,last name and order date for all orders
SELECT firstname,lastname,orderdate
FROM orders
JOIN employees ON employees.employeeid = orders.employeeid;

--Challenge2
--Connect products to suppliers and pull back companyname,unitcost and units in stock
SELECT companyname,unitprice,unitsinstock
FROM products
JOIN suppliers ON suppliers.supplierid = products.supplierid;

--Challenge3
--Connect products to previous query and add product name to filed returned
SELECT companyname,productname,orderdate,order_details.unitprice,quantity
FROM orders
JOIN order_details ON orders.orderid = order_details.orderid
JOIN customers ON customers.customerid = orders.customerid
JOIN products ON products.productid = order_details.productid;

--Challenge4
--Connect products to previous query and add categoryname to filed returned
SELECT companyname,productname,categories.categoryname,orderdate,order_details.unitprice,quantity
FROM orders
JOIN order_details ON orders.orderid = order_details.orderid
JOIN customers ON customers.customerid = orders.customerid
JOIN products ON products.productid = order_details.productid
JOIN categories ON categories.categoryid = products.categoryid;

--Challenge5
Take previous query and add a where clause that select category name of Seafood and amount spent >=500
SELECT companyname,productname,categories.categoryname,orderdate,order_details.unitprice,quantity
FROM orders
JOIN order_details ON orders.orderid = order_details.orderid
JOIN customers ON customers.customerid = orders.customerid
JOIN products ON products.productid = order_details.productid
JOIN categories ON categories.categoryid = products.categoryid
WHERE categoryname='Seafood' AND
         order_details.unitprice * quantity >=500;

--Challenge 6:Left join
Do a left join between products and order-_details
SELECT orderid,productname
FROM products
LEFT JOIN  order_details
ON order_details.productid = products.productid;

--Challenge7
Use is null to find out without orders
SELECT orderid,productname
FROM products
LEFT JOIN  order_details
ON order_details.productid = products.productid
WHERE orderid is NULL;

--Challenge 8
Do a right join between customer demo and customer
SELECt companyname,customercustomerdemo.customerid
FROM customercustomerdemo
RIGHT JOIN customers 
ON customercustomerdemo.customerid = customers.customerid;

--Challenge 9
Do a full join between products and categories
SELECT productname,categoryname
FROM products
FULL JOIN categories
ON products.categoryid = categories.categoryid; 

--Challenge 10:self join
Find supplier from same country and order by country
SELECT s1.companyname AS SupplierName1,
       s2.compnayname AS SupplierName2, s1 country
FROM suppliers s1
JOIN suppliers s2 ON s1.country = s2.country
WHERE 1.supplierid <> s2.supllierid
ORDER BY s1.country;


--Challenge 11
Add products to the previous join of orders and order_details
SELECT * FROM orders
JOIN order_details USING(orderid)
JOIN products USING(productid);

--Challenge 12
Add customers to previous query using NATURAL join
Warning you must order the join correctly.The natural must connect previous table to next tab;e or it will do a cross join connecting every row to another row.
SELECT*
FROM customers
NATURAL JOIN order_details
NATURAL JOIN products;