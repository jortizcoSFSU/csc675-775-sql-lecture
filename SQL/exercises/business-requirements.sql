/*

In this SQL script, students will learn to solve business requirements using the following
SQL stored components:

Triggers: A trigger is a database object that automatically executes a specified
         action in response to certain events on a particular table or view,
         such as an INSERT, UPDATE, or DELETE operation. It is typically used for
         enforcing business rules, maintaining audit trails, and managing complex
         integrity constraints.



Functions: A function is a reusable database object that performs a specific operation
          and returns a single value or result. Functions are typically designed to accept
          input parameters, perform calculations or manipulations, and return the result.
          Functions are often used in SQL statements and can be invoked within queries,
          where they return a value to the calling context.



Procedures: A procedure, or stored procedure, is a programmable database object that performs
           a series of operations, often including complex logic, and may or may not return
           a result. Procedures are typically invoked explicitly by a user or application
           and can execute multiple SQL statements, perform transactions, and support
           control-of-flow elements like loops and conditional statements.
           Unlike functions, procedures can perform actions that modify database state.



Scheduled Events: A scheduled event is a database object that executes SQL statements at a
                 predefined time or recurring intervals without user intervention. Scheduled
                 events are commonly used for automated maintenance tasks, data summarization,
                 report generation, or other periodic database operations. They are managed by
                 the database event scheduler and can be configured to run once or at specific
                 time intervals.



Permissions: Permissions in SQL define the access control rules that determine what actions
             users or roles can perform on database objects. These include privileges such as
             SELECT, INSERT, UPDATE, DELETE, EXECUTE (for stored procedures and functions), and
             GRANT or REVOKE commands to assign or remove permissions. Proper use of permissions
             ensures data security, integrity, and controlled access to database operations.
*/

/*
   IMPORTANT: Before solving the problems below, comment out the last two INSERT statements in inserts.sql.
   These INSERTs were added specifically for practicing LEFT and RIGHT JOINS in select.sql.

   Each business requirement in this file must be implemented using at least one of the specified components.
*/

USE MusicDB;

DELIMITER $$

/*
Business Requirement #1: Identify the most popular track in each state.
                         Display the track title and the state where it was purchased.

                         Assumptions:
                         (1) Popularity is determined by the highest number of sales per state.
                             Note that total sales is not a good indicator here, a good indicator to solve this problem.
                         (2) Customers can only purchase tracks in their state of residence.

*/

DROP PROCEDURE IF EXISTS POPULAR_TRACK_PER_STATE_PRC $$

CREATE PROCEDURE POPULAR_TRACK_PER_STATE_PRC ()
  BEGIN
      -- Our logic
   WITH ALL_DATA_CTE AS (SELECT Track.title           as TrackTitle,
                                Customer.state        as CustomerState,
                                -- RANK() ranks and when there is a tie the next rank is skipping one of the ranks
                                SUM(Invoice.quantity) AS SalesQuantity
                         FROM Invoice
                                  JOIN Track ON Track.track_id = Invoice.track
                                  JOIN Customer ON Customer.customer_id = Invoice.customer
                         GROUP BY TrackTitle, CustomerState
       ),
       RANKED_CTE AS (SELECT *,
                             RANK() OVER (PARTITION BY CustomerState ORDER BY SalesQuantity DESC) AS ranked
                      FROM ALL_DATA_CTE
       )
       SELECT * FROM RANKED_CTE WHERE ranked = 1
       ORDER BY SalesQuantity DESC;



  END $$



/*
Business Requirement #2: Update a customer's total purchases in the Sales table
                         each time a new invoice is created.
*/

DROP TRIGGER IF EXISTS COMPUTE_TOTAL_SALES_TRG $$

CREATE TRIGGER COMPUTE_TOTAL_SALES_TRG AFTER INSERT ON Invoice
  FOR EACH ROW
    BEGIN
        -- your logic here
        DECLARE tmp_sales DECIMAL(10,2) DEFAULT 0.00;
        DECLARE customer_exists BOOLEAN DEFAULT FALSE;
        SET tmp_sales = NEW.quantity * NEW.unit_price;

        -- IF the customer exists in the Sales table, then we update the actual total sales adding the
        -- new tmp_sales to this value. Otherwise, we insert this customer in the sales table including
        -- the new tmp_sales

        -- 1 way to do this
        -- SET customer_exists = (SELECT COUNT(customer) FROM Sales WHERE customer = NEW.customer);

        -- 2 way
        SELECT EXISTS (SELECT 1 FROM Sales WHERE customer = NEW.customer) INTO customer_exists;

        IF customer_exists THEN
           UPDATE Sales SET total_sales = total_sales + tmp_sales WHERE customer = NEW.customer;
        ELSE
           INSERT INTO Sales (customer, total_sales) VALUES (NEW.customer, tmp_sales);
        END IF;
    END $$


/*
Business Requirement #3: Ensure that when a customer is deleted from the database,
                         their associated sales data is preserved in the Company Sales table
                         for future statistical analysis and revenue tracking.


*/
DROP TRIGGER IF EXISTS BACKUP_CUSTOMER_SALES_TRG $$

CREATE TRIGGER BACKUP_CUSTOMER_SALES_TRG BEFORE DELETE ON Customer
    FOR EACH ROW
      BEGIN
          DECLARE new_sales DECIMAL(10,2) DEFAULT 0.00;
          SET new_sales = (SELECT total_sales FROM Sales WHERE customer = OLD.customer_id);
          INSERT INTO CompanySales (customer_id, name, zipcode, state, total_sales)
          VALUE (OLD.customer_id, OLD.name, OLD.zipcode, OLD.state, new_sales);
      END $$

/*
Business Requirement #4: The company needs to generate a sales report that summarizes
                         total sales per genre for albums released in a given year.
                         However, due to current performance concerns, the use of aggregate
                         functions (e.g., SUM, COUNT) is temporarily prohibited while the IT
                         department investigates. This report must be implemented without using
                         any aggregators for now.
*/

-- With Aggregator SUM()
DROP PROCEDURE IF EXISTS SalesReportWithAggregator;
CREATE PROCEDURE SalesReportWithAggregator (yearReleased INT)
    BEGIN
        SELECT Genre.description,
               SUM(Invoice.quantity * Invoice.unit_price) AS TotalSales
        FROM Invoice
        JOIN Track ON Track.track_id = Invoice.track
        JOIN Album ON Album.album_id = Track.album
        JOIN Genre ON Genre.genre_id = Track.genre
        WHERE Album.year_released = yearReleased
        GROUP BY Genre.description
        ORDER BY TotalSales DESC;

    END $$

-- Without SUM()
DROP PROCEDURE IF EXISTS SalesReportWithoutAggregator;
CREATE PROCEDURE SalesReportWithoutAggregator (yearReleased INT)
    BEGIN
        DECLARE tmp_genre VARCHAR(55);
        DECLARE tmp_sales DECIMAL(10,2) DEFAULT 0.00;
        DECLARE genre_exists BOOLEAN DEFAULT FALSE;
        DECLARE done BOOLEAN DEFAULT FALSE;

        DECLARE tmp_data_cursor CURSOR FOR
        SELECT Genre.description,
               Invoice.quantity * Invoice.unit_price AS TotalSales
        FROM Invoice
        JOIN Track ON Track.track_id = Invoice.track
        JOIN Album ON Album.album_id = Track.album
        JOIN Genre ON Genre.genre_id = Track.genre
        WHERE Album.year_released = yearReleased
        ORDER BY TotalSales DESC;

        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

        DROP TEMPORARY TABLE IF EXISTS FinalReport;

        CREATE TEMPORARY TABLE FinalReport (
            genre VARCHAR(55) PRIMARY KEY,
            total_sales DECIMAL(10,2) DEFAULT 0.00
        );

        OPEN tmp_data_cursor;
           -- logic iterating over the data is implemented here.
            my_for_loop:LOOP
                FETCH tmp_data_cursor INTO tmp_genre, tmp_sales;
                IF done THEN
                    LEAVE my_for_loop;
                END IF;

                SELECT EXISTS(SELECT 1 FROM FinalReport WHERE genre = tmp_genre) INTO genre_exists;

                IF genre_exists THEN
                    UPDATE FinalReport SET total_sales = total_sales + tmp_sales WHERE genre = tmp_genre;
                ELSE
                    INSERT INTO FinalReport (genre, total_sales) VALUES (tmp_genre, tmp_sales);
                END IF;

            END LOOP my_for_loop;

        -- In MySQL CLOSE <Cursor> is closing the cursor, but also it is deallocating the cursor.
        CLOSE tmp_data_cursor;

        SELECT * FROM FinalReport;

    END $$


/*
Business Requirement #5: Implement a feature to calculate and display the average sales amount
                         for a specific customer, identified by their customer ID, to support
                         personalized sales analysis.
*/

DROP FUNCTION IF EXISTS AVG_SALES_PER_CUSTOMER $$

CREATE FUNCTION  AVG_SALES_PER_CUSTOMER (customerID INT) RETURNS DECIMAL(10,2) DETERMINISTIC
  BEGIN
        DECLARE avg_sales DECIMAL(10, 2);
        SELECT AVG(Invoice.quantity * Invoice.unit_price)
        INTO avg_sales
        FROM Invoice
        WHERE customer = customerID;

        RETURN avg_sales;

  END $$



/*
Business Requirement #6: Implement a monthly aggregation of sales. Each month, the system
                         must summarize sales by state with a timestamp and insert it into
                         the MonthlySalesAggregation table.
*/

DROP TABLE IF EXISTS MonthlySalesAggregation;

CREATE TABLE MonthlySalesAggregation (
    state CHAR(2) PRIMARY KEY,
    total_sales DECIMAL(10, 2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP EVENT IF EXISTS ReportEvent;

CREATE EVENT ReportEvent
ON SCHEDULE EVERY 15 SECOND
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
COMMENT 'This event is creating a monthy report of total sales by state'
DO
    -- your event logic
    BEGIN
        TRUNCATE TABLE MonthlySalesAggregation;
        INSERT INTO MonthlySalesAggregation (state, total_sales)
        SELECT Customer.state,
               SUM(Invoice.quantity * Invoice.unit_price) AS TotalSales
        FROM Invoice
        JOIN Customer ON Customer.customer_id = Invoice.customer
        GROUP BY Customer.state
        ORDER BY TotalSales DESC;


    END $$

DELIMITER ;

-- CALL POPULAR_TRACK_PER_STATE_PRC();
-- INSERT INTO Invoice (invoice_id, track, customer, quantity, unit_price) VALUES (22,9,8,3,10);
-- DELETE FROM Customer WHERE customer_id = 3;
-- SELECT * FROM CompanySales;

-- SET @customerID = 4;

-- SELECT AVG_SALES_PER_CUSTOMER(@customerID) as AvgPerCustomer;

-- SELECT * FROM MonthlySalesAggregation;


SET @yearReleased = 1993;

CALL SalesReportWithAggregator(@yearReleased); -- with aggregator
CALL SalesReportWithoutAggregator(@yearReleased); -- without aggregator








