-- Please do not modify this file. It is intended for execution only.

DROP DATABASE IF EXISTS MusicDB;
CREATE DATABASE IF NOT EXISTS MusicDB;
USE MusicDB;


-- TABLE Genre
DROP TABLE IF EXISTS Genre;
CREATE TABLE IF NOT EXISTS Genre 
(
 genre_id TINYINT PRIMARY KEY,
 description VARCHAR(255) NOT NULL
);

-- TABLE Album
DROP TABLE IF EXISTS Album;
CREATE TABLE IF NOT EXISTS Album 
(
 album_id TINYINT PRIMARY KEY,
 title VARCHAR(255) NOT NULL,
 year_released INT NOT NULL
);

-- TABLE Artist
DROP TABLE IF EXISTS Artist;
CREATE TABLE IF NOT EXISTS Artist  
(
 artist_id TINYINT PRIMARY KEY,
 name VARCHAR(100) NOT NULL
);

-- Table Customer
DROP TABLE IF EXISTS Customer;
CREATE TABLE IF NOT EXISTS Customer 
(
 customer_id TINYINT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 zipcode INT(5) NOT NULL, 
 state CHAR(2) NOT NULL
 -- we are suppose to create an attribute referred_by
);

-- TABLE Track
DROP TABLE IF EXISTS Track;
CREATE TABLE IF NOT EXISTS Track
(
 track_id TINYINT PRIMARY KEY,
 genre TINYINT, -- FK
 album TINYINT, -- FK
 artist TINYINT, -- FK 
 title VARCHAR(255) NOT NULL,
 length INT, -- seconds
 FOREIGN KEY (album) REFERENCES Album(album_id)
 ON DELETE SET NULL ON UPDATE CASCADE,
 FOREIGN KEY (genre) REFERENCES Genre(genre_id)
 ON DELETE SET NULL ON UPDATE CASCADE,
 FOREIGN KEY (artist) REFERENCES Artist(artist_id)
 ON DELETE SET NULL ON UPDATE CASCADE
);

-- TABLE Invoice
DROP TABLE IF EXISTS Invoice;
CREATE TABLE IF NOT EXISTS Invoice
(
 invoice_id TINYINT PRIMARY KEY,
 track TINYINT NOT NULL, -- FK
 customer TINYINT, -- FK
 quantity INT DEFAULT 0, 
 unit_price DECIMAL (5,2),
 FOREIGN KEY (track) REFERENCES Track(track_id)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (customer) REFERENCES Customer(customer_id)
 ON DELETE CASCADE ON UPDATE CASCADE
);

-- These two tables will not be used in the select.sql problems
DROP TABLE IF EXISTS Sales;
CREATE TABLE IF NOT EXISTS Sales (
sales_id TINYINT PRIMARY KEY AUTO_INCREMENT,
customer TINYINT NOT NULL,
total_sales DECIMAL(8,2) DEFAULT 0.00, 
FOREIGN KEY (customer) REFERENCES Customer(customer_id)
ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS CompanySales;
CREATE TABLE IF NOT EXISTS CompanySales (
sales_id TINYINT PRIMARY KEY AUTO_INCREMENT,
customer_id TINYINT NOT NULL,
name VARCHAR(100) NOT NULL,
zipcode INT(5) NOT NULL, 
state CHAR(2) NOT NULL,
total_sales DECIMAL(8,2) DEFAULT 0.00
);

