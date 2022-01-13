--Assignment1
Join (with inner join) together person, personphone, businessentity and phonenumber type 
in the persons schema.  Return first name, middle name, last name, phone number and the 
name of the phone number type (home, office, etc.)  
Order by business entity id descending.

SELECT firstname,middlename,lastname,phonenumber,name
FROM person.personphone AS p
JOIN person.businessentity AS b ON b.businessentityid=p.businessentityid
JOIN person.person AS p ON p.businessentityid=b.businessentityid
JOIN person.phonenumbertype AS pn ON pn.phonenumbertypeid=p.phonenumbertypeid
ORDER BY p.businessentityid DESC;


--Assignment2
Join (Inner) productmodel, productmodelproductiondescriptionculture, productdescription and culture from the production schema.  Return the productmodel name, culture name, and productdescription description ordered by the product model name.
FROM person.personphone AS p
JOIN person.businessentity USING (businessentityid)
JOIN person.person USING (businessentityid)
JOIN person.phonenumbertype USING (phonenumbertypeid)
ORDER BY p.businessentityid DESC;

--Assignment3
Add a join to previous example to production.product and return the product name field in addition to other information.
SELECT pm.name,c.name,description
FROM production.productdescription
JOIN production.productmodelproductdescriptionculture USING (productdescriptionid)
JOIN production.culture AS c USING (cultureid)
JOIN production.productmodel AS pm USING (productmodelid)
ORDER BY pm.name ASC;

--Assignment4
Join product and productreview in the schema table.  Include every record from product and any reviews they have.  Return the product name, review rating and comments.  Order by rating in ascending order.
SELECT name, rating, comments
FROM production.product
LEFT JOIN production.productreview USING (productid)
ORDER BY rating ASC;

--Assignment5
Use a right join to combine workorder and product from production schema to bring back all products and any work orders they have.  Include the product name and workorder orderqty and scrappedqty fields.  Order by productid ascending.
SELECT p.name,orderqty,scrappedqty
FROM production.workorder
RIGHT JOIN production.product AS p USING (productid)
ORDER BY p.productid ASC;
