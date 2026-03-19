

-- TestDB;

DROP DATABASE IF EXISTS TestDB;

CREATE DATABASE IF NOT EXISTS TestDB;

USE TestDB; -- this line here needs to be on the top of every sql file.

DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    user_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    email VARCHAR(55) UNIQUE NOT NULL,
    name VARCHAR(55) NOT NULL,
    last_name VARCHAR(55) NOT NULL,
    age INT CHECK(age >= 18),
    full_name VARCHAR(115) GENERATED ALWAYS AS (CONCAT(name, ' ', last_name))
);


DROP TABLE IF EXISTS Roles;

CREATE TABLE Roles (
    role_id TINYINT UNSIGNED PRIMARY KEY,
    type ENUM('admin', 'customer', 'employee') DEFAULT 'customer'
);

DROP TABLE IF EXISTS UserRoles;

CREATE TABLE UserRoles (
    userroleid INT UNSIGNED PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    role_id TINYINT UNSIGNED NOT NULL,
    CONSTRAINT FK_USEROLES_USERID FOREIGN KEY (user_id) REFERENCES Users(user_id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT FK_USEROLES_ROLEID FOREIGN KEY (role_id) REFERENCES Roles(role_id)
    ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS Bank_accounts;

CREATE TABLE  Bank_accounts (
    account_id INT PRIMARY KEY,
    user_id1 INT UNSIGNED,
    user_id2 INT UNSIGNED,
    CONSTRAINT FK_BACKACCOUNT_USER1 FOREIGN KEY (user_id1) REFERENCES Users(user_id)
    ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT FK_BACKACCOUNT_USER2 FOREIGN KEY (user_id2) REFERENCES Users(user_id)
    ON DELETE SET NULL ON UPDATE CASCADE


);

INSERT INTO Users (email, name, last_name, age ) VALUES ('NULL', 'Jose', 'Ortiz', 18),
                                                        ('john@sfsu.edu', 'John',  'Parra', 19);
SELECT * FROM Users;