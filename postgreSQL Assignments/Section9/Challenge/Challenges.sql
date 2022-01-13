--Challenge1(Union removes duplicate entries)
Distinct countries of all our customers and suppliers in alphabatical order
Select country
from customers
UNION 
Select country
from suppliers
ORDER BY country;

--Challenge 2(union all doesn't removes duplicate enries)
All list of countries of our suppliers and customers, with a record  for each one 
Select country
from customers
UNION ALL
Select country
from suppliers
ORDER BY country;

--Challenge 3
Distinct cities that we have a supplier and customer located in
Select city
from customers
INTERSECT
Select city
from suppliers;

--Challenge4
The count of the no of cust and supplier pairs that are in city same city
SELECT COUNT(*) FROM (Select city
from customers
INTERSECT
Select city
from suppliers) AS same_city;

--Challenge 5
Cities we have a supplier with no customers
Select city
from suppliers
EXCEPT
Select city
from customers;

--challenge 6
How many customers do we have in cities without suppliers
 SELECT COUNT(*) FROM (Select city
from customers
EXCEPT
Select city
from suppliers) AS same_city;