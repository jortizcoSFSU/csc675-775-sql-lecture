USE MusicDB;

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



DELIMITER $$


/*
Business Requirement #1: Identify the most popular track in each state.
                         Display the track title and the state where it was purchased.

                         Assumptions:
                         (1) Popularity is determined by the highest number of sales per state.
                             Note that total sales is not a good indicator here, a good indicator to solve this problem.
                         (2) Customers can only purchase tracks in their state of residence.

*/

DROP PROCEDURE IF EXISTS MOST_POPULAR_TRACK;

CREATE PROCEDURE MOST_POPULAR_TRACK ()
BEGIN
    WITH CTE_RAW_DATA AS (
    -- logic to get the data
        SELECT Track.title AS TrackTitle,
           Customer.state AS CustomerState,
           SUM(Invoice.quantity) AS TrackQuantity
        FROM Invoice
        JOIN Track ON Track.track_id = Invoice.track
        JOIN Customer ON Customer.customer_id = Invoice.customer
        GROUP BY TrackTitle, CustomerState
        ORDER BY TrackQuantity DESC
    ),
    RANKING_CTE AS (
        SELECT *,
               RANK() OVER(PARTITION BY CustomerState ORDER BY TrackQuantity DESC) AS ranked
        FROM CTE_RAW_DATA
    )
    SELECT TrackTitle, CustomerState, TrackQuantity
    FROM RANKING_CTE
    WHERE ranked = 1
    ORDER BY TrackQuantity DESC ;
END $$


/*
Business Requirement #2: Update a customer's total purchases in the Sales table
                         each time a new invoice is created.
*/
DROP TRIGGER IF EXISTS CUSTOMER_TOTAL_SALES $$
CREATE TRIGGER CUSTOMER_TOTAL_SALES AFTER INSERT ON Invoice
FOR EACH ROW
    BEGIN
        -- your code here
        DECLARE tmp_sales DECIMAL(10,2) DEFAULT 0.00; -- initializing
        DECLARE customer_exists BOOL DEFAULT FALSE;
        SET tmp_sales = NEW.quantity * NEW.unit_price;

        SELECT EXISTS(SELECT 1 FROM Sales WHERE customer = NEW.customer) INTO customer_exists;

        IF EXISTS(SELECT 1 FROM Sales WHERE customer = NEW.customer) THEN
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

DROP TRIGGER IF EXISTS BACKUP_CUSTOMER_DATA $$

CREATE TRIGGER  BACKUP_CUSTOMER_DATA BEFORE DELETE ON Customer
FOR EACH ROW
    BEGIN
        DECLARE customer_total_sales DECIMAL(10,2) DEFAULT 0.00;
        DECLARE customer_exists BOOLEAN DEFAULT FALSE;

        SELECT EXISTS(SELECT 1 FROM Sales WHERE customer = OLD.customer_id) INTO customer_exists;
        SET customer_total_sales = (SELECT total_sales FROM Sales WHERE customer = OLD.customer_id);

        IF customer_exists THEN
            SET customer_total_sales = (SELECT total_sales FROM Sales WHERE customer = OLD.customer_id);
        END IF;

        INSERT INTO CompanySales (customer_id, name, zipcode, state, total_sales)
            VALUES (OLD.customer_id, OLD.name, OLD.zipcode, OLD.state, customer_total_sales);

    END $$





/*
Business Requirement #4: The company needs to generate a sales report that summarizes
                         total sales per genre for albums released in a given year.
                         However, due to current performance concerns, the use of aggregate
                         functions (e.g., SUM, COUNT) is temporarily prohibited while the IT
                         department investigates. This report must be implemented without using
                         any aggregators for now.
*/

DROP PROCEDURE IF EXISTS TOTAL_SALES_PER_GENRE_WITH_AGGREGATORS;

CREATE PROCEDURE TOTAL_SALES_PER_GENRE_WITH_AGGREGATORS (IN year INT)
BEGIN
    SELECT Genre.description AS GenreDescription,
           SUM(Invoice.quantity * Invoice.unit_price) AS TotalSales
    FROM Invoice
    JOIN Track ON Track.track_id = Invoice.track
    JOIN Genre ON Genre.genre_id = Track.genre
    JOIN Album ON Album.album_id = Track.album
    WHERE Album.year_released = year
    GROUP BY GenreDescription
    ORDER BY TotalSales DESC;


END $$


DROP PROCEDURE IF EXISTS TOTAL_SALES_PER_GENRE_WITHOUT_AGGREGATORS;

CREATE PROCEDURE TOTAL_SALES_PER_GENRE_WITHOUT_AGGREGATORS (IN year INT)
BEGIN
    -- properties
    DECLARE tmp_genre VARCHAR(50);
    DECLARE tmp_sales DECIMAL(10,2) DEFAULT 0.00;
    DECLARE genre_exists BOOLEAN DEFAULT FALSE;
    DECLARE done BOOLEAN DEFAULT FALSE; -- will be set to TRUE by the HANDLER

    -- cursor and handler
    DECLARE cursor_report CURSOR FOR
        SELECT Genre.description AS GenreDescription,
               Invoice.quantity * Invoice.unit_price AS TotalSales
        FROM Invoice
        JOIN Track ON Track.track_id = Invoice.track
        JOIN Genre ON Genre.genre_id = Track.genre
        JOIN Album ON Album.album_id = Track.album
        WHERE Album.year_released = year
        ORDER BY TotalSales DESC;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Create temporary table

    DROP TABLE IF EXISTS report;

    CREATE TEMPORARY TABLE report (
        genre VARCHAR(50) PRIMARY KEY,
        totalsales DECIMAL(10,2) DEFAULT 0.00

    );


    OPEN cursor_report;

    my_for_loop:LOOP
        FETCH cursor_report INTO tmp_genre, tmp_sales;
        IF done THEN
            LEAVE my_for_loop;
        END IF;

        SELECT EXISTS(SELECT 1 FROM report WHERE genre = tmp_genre) INTO  genre_exists;

        IF genre_exists THEN
            UPDATE report SET totalsales = totalsales + tmp_sales WHERE genre = tmp_genre;
        ELSE
            INSERT INTO report (genre, totalsales) VALUES (tmp_genre, tmp_sales);
        END IF;

    END LOOP my_for_loop;

    CLOSE cursor_report;

    SELECT * FROM report ORDER BY tmp_sales DESC;



END $$




/*
Business Requirement #5: Implement a feature to calculate and display the average sales amount
                         for a specific customer, identified by their customer ID, to support
                         personalized sales analysis.
*/

DROP FUNCTION IF EXISTS AVG_TOTAL_SALES_FOR $$

CREATE FUNCTION AVG_TOTAL_SALES_FOR (customerid INT)
   RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
       DECLARE avg_sales DECIMAL(10,2) DEFAULT 0.00;

       SELECT AVG(quantity * unit_price)
       INTO avg_sales
       FROM Invoice
       WHERE customer = customerid;

       RETURN avg_sales;

END $$






/*
Business Requirement #6: Implement a monthly aggregation of sales. Each month, the system
                         must summarize sales by state with a timestamp and insert it into
                         the MonthlySalesAggregation table.
*/

DROP TABLE IF EXISTS MonthySales;

CREATE TABLE MonthySales (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    state CHAR(2) NOT NULL,
    totalsales DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP EVENT IF EXISTS create_report_event;

CREATE EVENT create_report_event
    ON SCHEDULE EVERY 15 SECOND
    STARTS CURRENT_TIMESTAMP
    ENDS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
    COMMENT 'This event has been set to run every 15 seconds because my students do not want to wait for one month to see the results'
    DO
      BEGIN
          TRUNCATE TABLE MonthySales;

          INSERT INTO MonthySales (state, totalsales)
              SELECT Customer.state AS CustomerState,
                     SUM(Invoice.quantity * Invoice.unit_price) AS TotalSales
              FROM Invoice
              JOIN Customer ON Customer.customer_id = Invoice.customer
              GROUP BY CustomerState
              ORDER BY TotalSales DESC;


      END $$






DELIMITER ;

SET @year = 1993; -- the scope of this variable is only for this script.

CALL TOTAL_SALES_PER_GENRE_WITH_AGGREGATORS(@year);
CALL TOTAL_SALES_PER_GENRE_WITHOUT_AGGREGATORS(@year);


SELECT * FROM MonthySales;
