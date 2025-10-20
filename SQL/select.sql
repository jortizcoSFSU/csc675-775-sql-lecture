USE MusicDB;


/*
-- This script contains various SELECT statement practice problems.
-- In these practice problems, students will develop the following SQL skills:

-- 1. Basic Data Retrieval: Learn how to retrieve data from a database using basic SELECT statements.
-- 2. Table Joins: Understand how to join multiple tables using the `WHERE` clause and the `JOIN` clause,
      including inner and outer joins.
-- 3. Filtering Data: Apply conditions with the `WHERE` clause to filter data, including excluding specific values
      and combining multiple conditions.
-- 4. Sorting Data: Sort query results using the `ORDER BY` clause, both in ascending and descending order.
-- 5. Grouping and Aggregations: Use aggregate functions like `SUM()`, `COUNT()`, and `AVG()` to summarize data,
      and group the results with the `GROUP BY` clause.
-- 6. Subqueries and Nested Queries: Solve complex problems using subqueries and nested queries, including filtering,
      calculating, and comparing data.
-- 7. Advanced Techniques: Implement advanced SQL techniques such as Common Table Expressions (CTEs), Views,
      and handling ties in ranked data.
-- 8. Handling NULLs and OUTER JOINS: Master the use of various types of joins (e.g., `LEFT JOIN`, `RIGHT JOIN`,
      `FULL OUTER JOIN`) to handle missing or incomplete data.
-- 9. Pattern Matching and String Manipulation: Use SQL string functions to filter and manipulate data based on patterns
      (e.g., using `LIKE` or `SUBSTRING`).
-- 10. Multi-Table Relationships: Work with complex relationships between tables and retrieve related data effectively
       using joins.
-- 11. Ranking Functions: Use ranking functions like `RANK()` and `ROW_NUMBER()` to find specific positions in ordered
       datasets (e.g., second-highest sales).
-- 12. Advanced Data Analysis: Conduct complex analyses involving averages, comparisons, and conditional
       calculations across multiple tables.

-- What is SQL Language: SQL Language is a declarative language. This means that you only need to worry about which data needs
to be retrieved. But not how to retrieve it. The HOW to retrieve the data is already handled by the engine and optimizer.



*/


/* =============================== PRACTICE PROBLEMS =================================================================*/


/*
    Retrieve all tracks from the database.


 */
    









/*
   
    Find all tracks on the album "Objection Overruled".

*/

-- (1) Using WHERE with fully qualified references


-- (2) Using INNER JOIN with alias-qualified references



/*
    Find all tracks in the genres "Metal" and 'Alternative & Punk' but exclude "Jazz".
    Display the track title, album title, and genre description.

    
*/



/*
    -- (1) Find all customers who purchased the track "Bury a Friend".
    Display the customer name and the invoice number for that track.


    -- (2) Find all customers who purchased track number #1.
    Display the customer name and the invoice number for that track.
*/

    -- (1) We need the customer, the track and the invoice


    -- (2) How can we optimize this query in order for it to do less work? not joining the track table because we don't need it.



/*
    Retrieve all tracks released between years 1990 and 1995 (both inclusive).
    Order results by release year in descending order.
    Display the artist name, track title, and release date.
*/

-- (1) without column alias





-- (2) with column alias




-- (3) Show only the most recent released track



-- (4) Show the oldest released track



/*
    Solve the following problem using four different approaches:
       - Multiple Computations for the same value
       - A Common Table Expression (CTE)
       - A View
       - A Subquery

    For each track, categorize its length as "Too Long," "Normal," or "Too Short."
    Display the track title, artist name, duration, and the category.

    If the track length >= 6 minutes then categorize it as "Too long"
    If the track length < 6 and >= 4 minutes then categorize it as "Normal"
    If the track length <4 then categorize it as "Too Short"

*/

-- (1) Brute Forcing Repeated Computations



-- (2) Optimizing with a Common Table Expression. (CTE)
   



-- (3) Optimizing with a View




-- (4) Another version of this problem with a Subquery
    





/*
    Find the total track sales per state where total sales exceed $5.
    Order the results by total sales in descending order.
    Display the state and the corresponding total sales.
*/
  




/*
    Find all tracks in each album where the track title contains 'o' at index position 1.
    Display the album title and track title.
*/
    

/*
    Find the number of tracks per album where the track title length exceeds 9 characters.
    Display the album title and the count of such tracks.
*/

   



/*
    Retrieve all customers and their invoices, including customers without invoices.
*/

 



/*
    Retrieve all invoices and their associated customers, including invoices without customers.
*/



/*
    Retrieve all invoices that have customers, and all customers who have invoices.
*/



/*
    Retrieve all customers who have no invoices.
*/




/*
    Retrieve all invoices that have no customers.
*/


/*
    Retrieve all invoices and all customers.
*/



/*
    Retrieve all invoices without customers and customers without invoices.
*/




/*
    Find all customers who purchased the same track.(instead of the same track, customer that purchased the track 'Bury a Friend')
    Display the customer name and track title.

    
*/

-- (1) Easiest Instance of the problem: Find all customers who purchased track 'Bury a Friend'






-- (2) Solution for the hard problem



-- (3) Follow up: Solve the problem using a subquery



/*
   Find the full referral chain for a given customer (for example, Customer 1 -> referred 2 -> referred 3 -> referred 4)

*/






/*
    Find the second most popular track based on total sales (most popular = highest sales).
    Display the track title and its total sales.
    Ensure you account for potential ties in the sales data.

*/

-- (1) Why this problem can't be solved with a regular LIMIT or limit with OFFSET?



-- (2) Why this problem can't be solved with a regular Common Table Expression (CTE)







-- (3) Solve with a windows function: RANK()
    




/*
    For each album, find the number of tracks where:
    - The track title contains 'o' at index position 1.
    - The average unit price of these tracks is greater than the overall average unit price of all invoices.

    Display the album title, count of tracks, and their average unit price.
*/

















































