USE MusicDB;

ALTER TABLE Customer ADD COLUMN refereed_by TINYINT;
ALTER TABLE Customer ADD CONSTRAINT FK_CUSTOMER_REFEREEDBY
      FOREIGN KEY (refereed_by) REFERENCES Customer(customer_id);

-- customer 5 being refereed by customer 2
UPDATE Customer SET refereed_by = 2 WHERE customer_id = 5;
UPDATE Customer SET refereed_by = 5 WHERE customer_id = 3;
UPDATE Customer SET refereed_by = 3 WHERE customer_id = 1;
UPDATE Customer SET refereed_by = 1 WHERE customer_id = 6;
-- this one is breaking the chain
UPDATE Customer SET refereed_by = 7 WHERE customer_id = 4;

SELECT * FROM Customer;

