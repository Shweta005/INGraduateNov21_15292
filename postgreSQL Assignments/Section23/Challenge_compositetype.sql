--Challenge1:
Create an address composite type
CREATE TYPE address AS (
	street_address 	varchar(50),
	street_address2 varchar(50),
	city			varchar(50),
	state_region	varchar(50),
	country			varchar(50),
	postalcode		varchar(15)
);

--Challenge2: Create table for friends and use the composite type.
CREATE TABLE friends (
	first_name varchar(100),
	last_name varchar(100),
	address	address
);

DROP TYPE address CASCADE;
DROP TABLE friends;

--Challenge3:Create a composite for name called full_name that includes first,middle,lastname 
recreate the address composite type. add both to a new friends table.
CREATE TYPE address AS (
	street_address 	varchar(50),
	street_address2 varchar(50),
	city			varchar(50),
	state_region	varchar(50),
	country			varchar(50),
	postalcode		varchar(15)
);
CREATE TYPE full_name AS (
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50)
);

CREATE TABLE friends (
	name full_name,
	address	address
);

--Challenge4: Remove types: Drop both types and the table friends
DROP TYPE address CASCADE;
DROP TYPE full_name CASCADE;
DROP TABLE friends;


--Challenge5:
CREATE TYPE address AS (
	street_address 	varchar(50),
	street_address2 varchar(50),
	city			varchar(50),
	state_region	varchar(50),
	country			varchar(50),
	postalcode		varchar(15)
);

CREATE TYPE full_name AS (
	first_name varchar(50),
	middle_name varchar(50),
	last_name varchar(50)
);

CREATE TYPE dates_to_remember AS (
  birthdate date,
  age       integer,
  anniversary date
);

CREATE TABLE friends (
	name full_name,
	address	address,
  specialdates dates_to_remember
);

--Input a record into friends table
INSERT INTO friends (name, address, specialdates)
VALUES (ROW('Boyd','M','Gregory'),ROW('7777','','Boise','Idaho','USA','99999'),ROW('1969-02-01',49,'2001-07-15'));

SELECT * FROM friends;
SELECT name FROM friends;

--Pull back city and birthdatefrom friends
SELECT (address).city,(specialdates).birthdate
FROM friends;

--Select all friends whose first name is Boyd
SELECT name FROM friends
WHERE (name).first_name = 'Boyd';

--Select state,middlename,age of everyone whose last name is gregory.
SELECT (address).state_region,(name).middle_name,(specialdates).age FROM friends
WHERE (name).last_name = 'Gregory';
