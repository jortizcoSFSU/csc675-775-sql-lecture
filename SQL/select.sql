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


-- The following set of problems are specifically designed to learn every of the concepts mentioned above.

/* ===============  Problem 1 (Basic Query) ================
   Problem:
      Retrieve all tracks from the database.
*/
    

/* ===============  Problem 2 (Joining Tables) ================
    Problem:
       Find all tracks on the album "Objection Overruled".

    Solve the problem using the two following approaches:
       (1) Using WHERE with fully qualified references
       (2) Using INNER JOIN with alias-qualified references
*/


/* ===============  Problem 3 (Conditional Statement) ================
    Problem:
       Find all tracks in the genres "Metal" and 'Alternative & Punk' but exclude "Jazz".
       Display the track title, album title, and genre description.

*/


/* ===============  Problem 4 (Optimizations) ================
    Problem:
       Find all customers who purchased the track "Bury a Friend".
       Display the customer name and the invoice number for that track.

    Challenge:
       Create an optimization for this problem where you only use one table instead of two.

*/


/* ===============  Problem 5 (Ordering and Limiting) ================
    Problem:
       Retrieve all tracks released between years 1990 and 1995 (both inclusive).
       Order results by release year in descending order.
       Display the artist name, track title, and release date.

    Solve this problem using the following four approaches:
       (1) without column alias
       (2) with column alias
       (3) Show only the most recent released track
       (4) Show the oldest released track


*/


/* ===============  Problem 6 (Cases, CTEs, VIEWs, and Subqueries) ================
   Problem:
       For each track, categorize its length as "Too Long," "Normal," or "Too Short."
       such as:
           -- If the track length >= 6 minutes then categorize it as "Too long"
           -- If the track length < 6 and >= 4 minutes then categorize it as "Normal"
           -- If the track length <4 then categorize it as "Too Short"
       Display the track title, artist name, duration, and the category.

   Solve the following problem using four different approaches:
       (1) Brute forcing
       (2) A Common Table Expression (CTE)
       (3) A View
       (4) A Subquery
*/


/* ===============  Problem 7 (GROUP BY and HAVING)================
    Problem:
        Find the total track sales per state where total sales exceed $5.
        Order the results by total sales in descending order.
        Display the state and the corresponding total sales.
*/
  
/* ===============  Problem 8 (MATCHING)================
    Problem:
        Find all tracks in each album where the track title contains 'o' at index position 1.
        Display the album title and track title.
*/
    

/* ===============  Problem 9 (LENGTH)================
    Problem:
        Find the number of tracks per album where the track title length exceeds 9 characters.
        Display the album title and the count of such tracks.
*/

   
/* ===============  Problem 10 (JOINS TYPE) ================
    Solve the following problems:
       (1) Retrieve all invoices that have customers, and all customers who have invoices.
       (2) Retrieve all customers and their invoices, including customers without invoices.
       (3) Retrieve all invoices and their associated customers, including invoices without customers.
       (4) Retrieve all customers who have no invoices.
       (5) Retrieve all invoices that have no customers.
       (6) Retrieve all invoices and all customers.
       (7) Retrieve all invoices without customers and customers without invoices.
*/


/* ===============  Problem 11 (Challenge Problem) ================
    Problem:
        Find all customers who purchased the same track. Display the customer name and track title.

    Solve the problem using the following approaches:
        (1) Find an easy instance of the problem, and solve it.
        (2) Once you understand the problem - after solving part (1) - solve the original problem

    Challenge:
        Solve the problem using a subquery.

*/


/* ===============  Problem 12 (Recursive CTEs) ================
   Problem:
       Find the full referral chain for a given customer.
       For example, Customer 1 -> referred 2 -> referred 3 -> referred 4
*/


/* ===============  Problem 13 (Window Functions) ================
    Problem:
        Find the second most popular track based on total sales (most popular = highest sales).
        Display the track title and its total sales. Ensure you account for potential ties in the sales data.

    Solve the problem using the following approaches:
        (1) Using LIMIT
        (2) Using a Common Table Expression (CTE)
        (3) Using RANK function

*/

    
/* ===============  Problem 14 (Free Style) ================
   Testing your knowledge acquired from this lecture:
        For each album, find the number of tracks where:
            - The track title contains 'o' at index position 1.
            - The average unit price of these tracks is greater than the overall average unit price of all invoices.
        Display the album title, count of tracks, and their average unit price.
*/

















































