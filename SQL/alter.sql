USE MusicDB;

-- Altering a table won't affect previous data that was inserted before, it will keep the integrity of the data at running time.

ALTER TABLE Customer ADD COLUMN refereed_by TINYINT; -- created the attribute
-- we made the attribute a FK, we can't do this in the line above because they are two different statements.
ALTER TABLE Customer ADD CONSTRAINT PK_CUSTOMER_REFEREEDBY FOREIGN KEY (refereed_by) REFERENCES Customer(customer_id);

-- customer 5 is refereed by customer 2
UPDATE Customer SET refereed_by = 2 WHERE customer_id = 5;
-- customer 2 is refereed by customer 6
UPDATE Customer SET refereed_by = 6 WHERE customer_id = 2;
-- customer 6 is refereed by customer 3
UPDATE Customer SET refereed_by = 3 WHERE customer_id = 6;
-- customer 3 is refereed by customer 4
UPDATE Customer SET refereed_by = 4 WHERE customer_id = 3;
-- customer 7 is refereed by customer 9, this is breaking the chain, this shouldn't be in the output.
UPDATE Customer SET refereed_by = 9 WHERE customer_id = 7;


SELECT * FROM Customer;
