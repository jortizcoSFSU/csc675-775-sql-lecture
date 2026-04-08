USE MusicDB;

DROP TABLE IF EXISTS Referrals;

CREATE TABLE Referrals (
    referral_id TINYINT PRIMARY KEY,
    referred_by TINYINT,
    CONSTRAINT FK_REFERRALS_REFERREDBY FOREIGN KEY (referred_by)
        REFERENCES Customer(customer_id)
);

INSERT INTO Referrals (referral_id, referred_by)
VALUES (2,1), -- level 1
       (3, 2), -- level 2
       (5, 2), -- level 2
       (4, 3), -- level 3
       (6, 5); -- level 3