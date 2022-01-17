--Challenge
On orders create a single index on two fileds cutomerid and orderid
CREATE UNIQUE INDEX idx_orders_customerid_orderid
ON orders(cutomerid,orderid);

--Challenge
Drop idx_orders_customerid_orderid index on orders table
DROP INDEX orders_customerid_orderid;

--Challenge
CREATE  INDEX idx_person_fullname
ON person.person((firstname||''|| lastname));
DROP INDEX idx_person_fullname;
EXPLAIN SELECT * FROM person.person
WHERE firstname||''|| lastname ='Terri Duffy';