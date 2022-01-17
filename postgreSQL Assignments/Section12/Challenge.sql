--Challenge
INSERT INTO order_details
(orderid,productid,unitprice,quantity,discount)
VALUES(11078,11,14,20,0);


--challenege
UPDATE orders
SET requireddate ='2017-09-20',freight=50
WHERE orderid=11078;
--They also want 40Queso cabrales instead of 20 and we are giving a discount of .05.
--Trick is the WHERE clause to make sure we update the right order details since there is no order details id filed.
UPDATE orders-details
SET quantity = 40,discount=.05
WHERE orderid=11078 AND productid = 11;


--Challenege
Delete the order for the customer using the order id
DELETE orders
WHERE orderid=11078;

--Challenge
Backup orders in the year 1997 to a new table orders_1997
SELECT *
INTO orders_1997
FROM orders
WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31';

--Challenge
Add orders from DEC 2016 to table orders_1997
INSERT INTO orders_1997
SELECT * 
FROM orders
WHERE orderdate BETWEEN '1996-12-01' AND '1996-12-31';