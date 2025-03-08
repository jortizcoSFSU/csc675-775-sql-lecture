USE MusicDB;


-- Part 1: The basics of SELECT  ---------------------------------------------------------------------------------------

-- (1) Find all the tracks
 
 
 


-- (2) Find all the tracks in the album "Objection overruled" without JOINS 




-- (3) Find all the tracks in the album "Objection overruled" with INNER JOIN


-- (4) Find all the tracks in the genre of "Metal" and "Pop" but not "Jazz". Show the title of the track, the album of the track, and the genre of the track.




-- (5) Find all the customers that purchased the track 'Bury a Friend' . Show the name of the customer and the invoice number for that track. 





-- (6) Find all the tracks that were released before 1995. Order by year released in descending order. Show artist name, the title of the track, and date it was created


-- (7) For each track, determine whether the track's length is "too long", "normal" or "too short" witht he following rules. Show the track title, the artist, 
--     the duration of the track, and its description as stated:
       -- "too long" >= 6 minutes 
       -- 6 minutes > "normal" >= 4 minute 
       -- "too short" < 4 minute
       

-- Part 2: Grouping Attributes   ----------------------------------------------------------------------------------------
-- (1) For each state, find the total sales of tracks purchased where the total sales is more than 5 dollars. Order total sales in descending order. Show state and the total sales for each state.



-- (2) For each album find all the tracks where track's title has 'o' in character index number 1. Show album's title and track title's 



-- (3) For each album find the number of tracks where track's title is greater than 9 characters.  Show album's title and number of tracks


-- Part 3: JOINS --------------------------------------------------------------------------------------------------------------------------------------------------

-- (1) Find all the customers and their invoices, including customers who have no invoices 


-- (2) Find all the invoices and their customers, including invoices that with no customers.

-- (3) Find all the invoices that have customers, and all the customers who have invoices

-- (4) Find all the costumers who have no invoices 

-- (5) Find all the invoices that have no customers

-- (6) Find all the invoices and all the customers.
 




-- Part 4: Challenging your logic  ----------------------------------------------------------------------------------------

-- (1) Find all the customers that purchased the same track. Show the name of the customer and the title of the track.

-- (2) Find all the second highest total sales. Show the track's title, and total_sales for that track 

-- (3) Find all the invoices with no customers, and customers with no invoices. 






 
 
 
 -- Part 5: Inner Queries  ---------------------------------------------------------------------------------------------

-- For each album find the number of tracks where track's title has 'o' in character index number 1, and which track's average unit price is greater than the average unit price of all the invoices. Show album's title and number of tracks, and avg unit price 


-- Solve this problem with a subquery. You are not allowed to use CTE or View components 

    -- For each track, determine whether the track's length is "too long", "normal" or "too short" witht he following rules. 
    -- Show the track title, the artist, 
	-- "too long" >= 6 minutes 
       -- 6 minutes > "normal" >= 4 minute 
       -- "too short" < 4 minute










