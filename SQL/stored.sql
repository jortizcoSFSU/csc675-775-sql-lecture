-- Stored SQL Components 

/*

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

*/


-- Practice Problems:
USE MusicDB;




/*
Business Requirement #1: Update a customer's total purchases in the Sales table 
                         each time a new invoice is created.
*/


/*
Business Requirement #2: Display the most popular genres by region (state). 
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



/*
Business Requirement #5: Implement a feature to calculate and display the average sales amount 
                         for a specific customer, identified by their customer ID, to support 
                         personalized sales analysis.
*/


   



/*
Business Requirement #6: Enable authorized employees in the  
                         sales department to increase the price of tracks within a specified 
                         genre (e.g., Jazz) by a given percentage. Note that this mechanism should 
                         only be accessible to sales department employees who have granted permission 
                         to access the Invoice table.
*/





/*
Business Requirement #7: Implement a monthly aggregation of sales. Each month, the system 
                         must summarize sales by state with a timestamp and insert it into 
                         the MontlySalesAggregation table.
*/






   

