-- ALL ALTER CODE GOES HERE

USE MusicDB;

SET @yearReleased = 1995;
SELECT Genre.description, SUM(Invoice.quantity * Invoice.unit_price) AS TotalSales
FROM Invoice
JOIN Track ON Track.track_id = Invoice.track
JOIN Genre ON Genre.genre_id = Track.genre
JOIN Album ON Album.album_id = Track.album
WHERE Album.year_released = @yearReleased
GROUP BY Genre.description
ORDER BY TotalSales DESC;


-- Procedure

CALL SalesReport(@yearReleased);


