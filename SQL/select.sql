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

ORDER OF EXECUTION
1. FROM
2. JOIN ON
3. WHERE
4. GROUP BY
5. HAVING
6. SELECT
7. DISTINCT
8. ORDER BY DESC OR ASC
9. LIMIT
 */

/* =============================== PRACTICE PROBLEMS =================================================================*/


-- The following set of problems are specifically designed to learn every of the concepts mentioned above.

/* ===============  Problem 1 (Basic Query) ================
   Problem:
      Retrieve all tracks from the database.
      1. What to show? *
      2. Where to find this? Track
      3. Any conditions to filter? None

      SELECT <what to show> FROM <where to find it> WHERE <conditions>
*/

SELECT * FROM Track;



    

/* ===============  Problem 2 (Joining Tables) ================
    Problem:
       Find all tracks on the album "Objection Overruled".

    Solve the problem using the two following approaches:
       (1) Using WHERE with fully qualified references
       (2) Using INNER JOIN with alias-qualified references
*/
-- What to show? *
-- Where to find it? Track, Album
-- Any condition? Album.title = "Objection Overruled"

-- (1)
SELECT * FROM Track, Album
WHERE Album.album_id = Track.album
      AND Album.title = 'Objection Overruled';

-- (2)
SELECT *
FROM Track
INNER JOIN Album ON Album.album_id = Track.album
WHERE Album.title = 'Objection Overruled';


/* ===============  Problem 3 (Conditional Statement) ================
    Problem:
       Find all tracks in the genres "Metal" and 'Alternative & Punk' but exclude "Jazz".
       Display the track title, album title, and genre description.
*/
-- With OR
SELECT Track.title, Album.title, Genre.description
FROM Track
INNER JOIN Album ON Album.album_id = Track.album
INNER JOIN Genre ON Genre.genre_id = Track.genre
WHERE Genre.description = 'Metal' OR Genre.description = 'Alternative & Punk';

-- With IN
SELECT Track.title, Album.title, Genre.description
FROM Track
INNER JOIN Album ON Album.album_id = Track.album
INNER JOIN Genre ON Genre.genre_id = Track.genre
WHERE Genre.description IN ('Metal', 'Alternative & Punk');


/* ===============  Problem 4 (Optimizations) ================
    Problem:
       Find all customers who purchased the track "Bury a Friend".
       Display the customer name and the invoice number for that track.

    Challenge:
       Create an optimization for this problem, but now you only need to
       display the customer id and the invoice number

*/
-- Original Problem
SELECT Customer.name, Invoice.invoice_id
FROM Invoice
INNER JOIN Track ON Track.track_id = Invoice.track
INNER JOIN Customer ON Customer.customer_id = Invoice.customer
WHERE Track.title = 'Bury a Friend';

-- Follow up
SELECT Invoice.customer AS 'Customer ID', Invoice.invoice_id AS 'Invoice ID'
FROM Invoice
WHERE Invoice.track = 1 AND Invoice.customer IS NOT NULL;


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

-- Without column alias
SELECT Artist.name, Track.title,
       Album.year_released
FROM Track
INNER JOIN Album ON Album.album_id = Track.album
INNER JOIN Artist ON Artist.artist_id = Track.artist
WHERE Album.year_released BETWEEN 1990 AND 1995
ORDER BY Album.year_released DESC;


-- With column alias
SELECT Artist.name AS 'Artist', Track.title AS 'Track',
       Album.year_released AS AlbumYearReleased
FROM Track
INNER JOIN Album ON Album.album_id = Track.album
INNER JOIN Artist ON Artist.artist_id = Track.artist
WHERE Album.year_released BETWEEN 1990 AND 1995
ORDER BY AlbumYearReleased DESC;

-- Show only the most recent released track
SELECT Artist.name AS 'Artist', Track.title AS 'Track',
       Album.year_released AS AlbumYearReleased
FROM Track
INNER JOIN Album ON Album.album_id = Track.album
INNER JOIN Artist ON Artist.artist_id = Track.artist
WHERE Album.year_released BETWEEN 1990 AND 1995
ORDER BY AlbumYearReleased DESC
LIMIT 1;

-- Show the oldest released track
SELECT Artist.name AS 'Artist', Track.title AS 'Track',
       Album.year_released AS AlbumYearReleased
FROM Track
INNER JOIN Album ON Album.album_id = Track.album
INNER JOIN Artist ON Artist.artist_id = Track.artist
WHERE Album.year_released BETWEEN 1990 AND 1995
ORDER BY AlbumYearReleased ASC
LIMIT 1;


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

-- (1)
SELECT Track.title,
       Artist.name,
       (Track.length/60),
       CASE
           -- you implement the logic for the condition
           WHEN (Track.length/60) >= 6 THEN 'Too Long'
           WHEN (Track.length/60) < 6 AND (Track.length/60) >= 4 THEN 'Normal'
           WHEN (Track.length/60) < 4 THEN 'Too Short'

       END AS 'category'
FROM Track
INNER JOIN Artist ON Artist.artist_id = Track.artist;

-- (2) Common Table Expression (CTE)
WITH DURATION_CTE AS (
    -- you will implement the logic of the data that you want to reuse in memory
    SELECT Track.title,
           Artist.name,
           (Track.length/60) AS duration
    FROM Track
    INNER JOIN Artist ON Artist.artist_id = Track.artist
)
SELECT *,
       CASE
           -- you implement the logic for the condition
           WHEN duration >= 6 THEN 'Too Long'
           WHEN duration < 6 AND duration >= 4 THEN 'Normal'
           WHEN duration < 4 THEN 'Too Short'

       END AS 'category'
FROM DURATION_CTE;


-- (3) Views hold data globally until you drop the view

CREATE VIEW DURATION_CTE AS
    SELECT Track.title,
           Artist.name,
           (Track.length/60) AS duration
    FROM Track
    INNER JOIN Artist ON Artist.artist_id = Track.artist;

SELECT *,
       CASE
           -- you implement the logic for the condition
           WHEN duration >= 6 THEN 'Too Long'
           WHEN duration < 6 AND duration >= 4 THEN 'Normal'
           WHEN duration < 4 THEN 'Too Short'

       END AS 'category'
FROM DURATION_CTE;

-- Subqueries (bad for performance, but some companies only want to use them)
SELECT *,
       CASE
           -- you implement the logic for the condition
           WHEN duration >= 6 THEN 'Too Long'
           WHEN duration < 6 AND duration >= 4 THEN 'Normal'
           WHEN duration < 4 THEN 'Too Short'

       END AS 'category'
FROM (SELECT Track.title,
           Artist.name,
           (Track.length/60) AS duration
    FROM Track
    INNER JOIN Artist ON Artist.artist_id = Track.artist) AS subquery1;











/* ===============  Problem 7 (GROUP BY and HAVING)================
    Problem:
        Find the total track sales per state where total sales exceed $5.
        Order the results by total sales in descending order.
        Display the state and the corresponding total sales.
*/


-- WHERE: supports any attribute as long as were not computed from aggregators, it
--        also supports iterators. Important, where can also use attributes that
--        where not defined in the SELECT
-- HAVING: supports aggregators, but can only filter on GROUP BY. Having does not support
--         attributes that are not in the select unless they are part of an aggregator

SELECT Customer.state, SUM(Invoice.quantity * Invoice.unit_price) AS TotalSales
FROM Invoice
JOIN Customer ON Customer.customer_id = Invoice.customer
GROUP BY Customer.state
HAVING TotalSales > 5
ORDER BY TotalSales DESC;




  
/* ===============  Problem 8 (MATCHING)================
    Problem:
        Find all tracks in each album where the track title contains 'o' at index position 1.
        Display the album title and track title.
*/

-- LIKE: activates regular expressions but an implementation of them that is
--       easy to handle, and memory wise has good performance for simple matches

-- REGEXP: activates regular expressions as learned in your degree

-- LIKE
SELECT Album.title AS 'Album', Track.title AS 'Track'
FROM Track
INNER JOIN Album ON Album.album_id = Track.album
WHERE Track.title LIKE '_o%';

-- REGEXP
SELECT Album.title AS 'Album', Track.title AS 'Track'
FROM Track
INNER JOIN Album ON Album.album_id = Track.album
WHERE Track.title REGEXP '^.o';


/* ===============  Problem 9 (LENGTH)================
    Problem:
        Find the number of tracks per album where the track title length exceeds 9 characters.
        Display the album title and the count of such tracks.
*/
SELECT Album.title AS 'Album', COUNT(Track.track_id) AS NumberOfTracks
FROM Track
INNER JOIN Album ON Album.album_id = Track.album
WHERE LENGTH(Track.title) > 9
GROUP BY Album.title;


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

-- (1)
SELECT Customer.name, Invoice.invoice_id
FROM Invoice
INNER JOIN Customer ON Customer.customer_id = Invoice.customer;

-- (2)
SELECT Customer.name, Invoice.invoice_id
FROM Customer
LEFT JOIN Invoice ON Customer.customer_id = Invoice.customer;

-- (3)
SELECT Customer.name, Invoice.invoice_id
FROM Invoice
LEFT JOIN Customer ON Customer.customer_id = Invoice.customer;
-- (4)
SELECT Customer.name, Invoice.invoice_id
FROM Customer
LEFT JOIN Invoice ON Customer.customer_id = Invoice.customer
WHERE Invoice.invoice_id IS NULL;

-- (5)
SELECT Customer.name, Invoice.invoice_id
FROM Invoice
LEFT JOIN Customer ON Customer.customer_id = Invoice.customer
WHERE Customer.name IS NULL;



-- (7)

SELECT Customer.name, Invoice.invoice_id
FROM Customer
LEFT JOIN Invoice ON Customer.customer_id = Invoice.customer
WHERE Invoice.invoice_id IS NULL
UNION
SELECT Customer.name, Invoice.invoice_id
FROM Invoice
LEFT JOIN Customer ON Customer.customer_id = Invoice.customer
WHERE Customer.name IS NULL;

/* ===============  Problem 11 (Challenge Problem) ================
    Problem:
        Find all customers who purchased the same track.
        Display the customer name and track title.

    Solve the problem using the following approaches:
        (1) Find an easy instance of the problem, and solve it.
        (2) Once you understand the problem - after solving part (1) - solve the original problem

    Challenge:
        Solve the problem using a subquery.

*/

-- (1) Basic Instance: easy to solve
SELECT Customer.name AS 'Customer', Track.title AS 'Track'
FROM Invoice
JOIN Customer ON Customer.customer_id = Invoice.customer
JOIN Track ON Track.track_id = Invoice.track
WHERE Track.title = 'Bury a Friend';

-- (2) Now do the same as (1) for all the tracks.
SELECT DISTINCT Customer.name AS 'Customer', Track.title AS 'Track'
FROM Invoice inv1
JOIN Customer ON Customer.customer_id = inv1.customer
JOIN Track ON Track.track_id = inv1.track
JOIN Invoice inv2 ON inv1.track = inv2.track -- checks which customers bought the same track
WHERE inv1.customer <> inv2.customer
ORDER BY Track.title DESC;

-- (3) Challenge: using a subquery
SELECT DISTINCT Customer.name AS 'Customer', Track.title AS 'Track'
FROM Invoice inv1
JOIN Customer ON Customer.customer_id = inv1.customer
JOIN Track ON Track.track_id = inv1.track
WHERE inv1.track IN (
    SELECT inv2.track
    FROM Invoice inv2
    WHERE inv1.customer <> inv2.customer
    )
ORDER BY Track.title DESC;

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




















































