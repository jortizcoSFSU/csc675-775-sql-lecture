
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
                         (1) Popularity is determined by the highest number of sales in a state.
                             Note that total sales is not a good indicator here, number of invoices and quantity is.
                         (2) Customers can only purchase tracks in their state of residence.
*/

/*
Business Requirement #2: Update a customer's total purchases in the Sales table
                         each time a new invoice is created.
*/


/*
Business Requirement #3: Ensure that when a customer is deleted from the database,
                         their associated sales data is preserved in the Company Sales table
                         for future statistical analysis and revenue tracking.
*/

/*
Business Requirement #4: Your company needs to generate an annual sales report that summarizes
                         total sales for each genre by year. However, the use of aggregators
                         in queries has been temporarily banned due to performance issues,
                         and the IT department is investigating the cause. Therefore,
                         you must implement this feature without using aggregators for the time being.
*/

     -- 4.1 solve this problem with aggregators;

     -- 4.2 solve this problem without using aggregators;


/*
Business Requirement #5: Implement a feature to calculate and display the average sales amount
                         for a specific customer, identified by their customer ID, to support
                         personalized sales analysis.
*/


/*
Business Requirement #6: Implement a monthly aggregation of sales. Each month, the system
                         must summarize sales by state with a timestamp and insert it into
                         the MonthlySalesAggregation table.
*/












   

