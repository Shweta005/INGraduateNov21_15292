--1.Challenge 1: Find all customer names and contacts that we have in Mexico.
SELECT companyname, contactname 
FROM customers
WHERE country = 'Mexico';

--2.Challenge 2:How many orders had a freight cost equal to or greater than $250
SELECT COUNT(*) 
FROM orders
WHERE freight >= 250;

--3.Challenge3: How many orders shipped before july 5,1997.
SELECT COUNT (*) 
FROM orders
WHERE shippeddate < '1997-07-05';

--4.Challenge 4: We want the distinct where orders were shipped via united package(id=2) and the ship country is Brazil.
SELECT DISTINCT(customerid) 
FROM orders
WHERE shipcountry='Brazil' AND shipvia =2;

--5.Challenge 5: How many suppliers do we have in Germany and spain.
SELECT  COUNT(*) 
FROM suppliers
WHERE country='Germany' OR country='Spain' ;

--6.Challenge 6: How many orders shipped to USA,Brazil and Argentina
SELECT  COUNT(*) 
FROM orders
WHERE shipcountry='USA' OR shipcountry='Brazil' OR shipcountry ='Argentina' ;

--7.Challenge 7. How many suppliers are not in USA
SELECT  COUNT(*) 
FROM suppliers
WHERE NOT country='USA'  ;

--8.Challenge 8. How many orders are shipped to Canada or spain and shipdate after may 1,1997 ->SELECT  COUNT(*) 
SELECT  COUNT(*) 
FROM orders
WHERE (shipcountry='Canada' OR shipcountry='Spain') 
AND shippeddate > '1997-05-01';

--9.Challenge 9. How many orders  shipped between june 1 1996 and sept 30,1996
SELECT COUNT(*)
FROM orders
WHERE  shippeddate  
BETWEEN '1996-06-01' 
AND '1996-09-30';

--10.Challenege:10 :How many products do we have in categoryid 1,4,6 or 7
SELECT COUNT(*) 
FROM categories
WHERE categoryid
IN (1,4,6,7);
