-- Data manipulation language (DML) is in charge of the manipulation of attributes' values



USE MusicDB;
-- Change name from customer_id 1 from Jose to John
UPDATE Customer SET name = 'John' WHERE customer_id = 1;

-- Delete all the data for customer id 1

DELETE FROM Customer WHERE customer_id = 1;

SELECT * FROM Customer;
DROP TABLE Customer; -- DDL
TRUNCATE TABLE Customer; -- DML