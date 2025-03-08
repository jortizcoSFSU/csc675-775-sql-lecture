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
/*

/*
    Retrieve all tracks from the database.
*/

/*
    Solve this problem using two approaches:
    - Joining tables in the WHERE SQL clause
    - Joining tables using JOIN SQL clause
    Find all tracks in the album "Objection Overruled".
*/


/*
    Find all tracks in the genres "Metal" and "Pop" but exclude "Jazz".
    Display the track title, album title, and genre name.
*/

/*
    Find all customers who purchased the track "Bury a Friend".
    Display the customer name and the invoice number for that track.
*/

/*
    Retrieve all tracks released before 1995.
    Order results by release year in descending order.
    Display the artist name, track title, and release date.
*/

/*
    Solve the following problem using three different approaches:
       - A Common Table Expression (CTE)
       - A View
       - A Subquery

    For each track, categorize its length as "Too Long," "Normal," or "Too Short."
    Display the track title, artist name, duration, and the category.
*/

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
    Find all customers who purchased the same track.
    Display the customer name and track title.
*/

/*
    Find the second most popular track based on total sales (most popular = highest sales).
    Display the track title and its total sales.
    Ensure you account for potential ties in the sales data.
*/


/*
    For each album, find the number of tracks where:
    - The track title contains 'o' at index position 1.
    - The average unit price of these tracks is greater than the overall average unit price of all invoices.

    Display the album title, count of tracks, and their average unit price.
*/














