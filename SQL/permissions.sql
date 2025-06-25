/*
 This file will implement databases business requirements for the topic of SQL permissions
 */


/*
Business Requirement #1: Enable authorized employees in the
                         sales department to increase the price of tracks within a specified
                         genre (e.g., Jazz) by a given percentage. Note that this mechanism should
                         only be accessible to sales department employees who have granted permission
                         to access the Invoice table.

                         Algorithm: 
                         1. Create a HAS_PERMISSIONS(...) FUNCTION TO CHECK PERMISSIONS FOR ALL THE USERS THAT ATTEMPT TO RUN THE FUNCTION.
                         2. Once permissions are checked, then we create a procedure INCREASE_PRICES that will increase the unit_price for every track based on a percentage given and a genre.




*/


/*
 Business Requirement #2: Prevent a customer from being deleted if they have existing
                          sales in the Sales table.

                        Assumptions:
                        (1) If a customer has sales records in the Sales table, they should not be allowed to be deleted.
                        (2) The deletion attempt should be blocked with an error message to maintain data integrity.


 */

/*
Business Requirement #3: Automatically archive old customer data that hasn't made a purchase in the last two years.

                          Assumptions:
                         (1) The system should identify customers who have not made any purchases in the last two years.
                         (2) The data for these customers (including records in the `Customer` and `Invoice` tables)
                             should be moved to an `ArchivedCustomerData` table for historical purposes.
                         (3) The event should run once a month to ensure that inactive customer data is archived regularly.
                         (4) In the event that one or more customers who have been archived make a purchase after being archived,
                             their data should be returned to the original `Customer` and `Invoice` tables with their original customer ID.
                        (5) The process of reactivating archived customers should ensure their records are properly
                            re-associated with any new transactions.

                        Algorithm: 
                        1. First of all, we need to alter the table Invoice to add a 'date_created' attribute
                        2. Add archived column to Customer table
                        3. Create the event to archive and reactivating archived customers



*/
