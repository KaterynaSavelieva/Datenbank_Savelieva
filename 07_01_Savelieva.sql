DROP TABLE IF EXISTS ausleihe;
DROP TABLE IF EXISTS fachbereichfachbuch;
DROP TABLE IF EXISTS fachbuch;
DROP TABLE IF EXISTS fachbereich;
DROP TABLE IF EXISTS verlag;
DROP DATABASE IF EXISTS bibliothek;

CREATE DATABASE bibliothek;
USE bibliothek;
SHOW TABLES;
CREATE TABLE verlag (
	verlagID INT PRIMARY KEY AUTO_INCREMENT,
	verlag VARCHAR(100)
);

CREATE TABLE fachbereich (
	fachbereichID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fachbereich VARCHAR(100)
);
CREATE TABLE fachbuch (
	fachbuchID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	isbn VARCHAR (13) NOT NULL,
	titel VARCHAR(100) NOT NULL,
	verlagID INT,
	FOREIGN KEY (verlagID) REFERENCES verlag(verlagID)
);
CREATE TABLE fachbereichfachbuch (
	fachbereichID INT,
	fachbuchID INT,
	PRIMARY KEY (fachbereichID, fachbuchID),
	FOREIGN KEY (fachbereichID) REFERENCES fachbereich(fachbereichID),
	FOREIGN KEY (fachbuchID) REFERENCES fachbuch(fachbuchID)
);

INSERT INTO verlag (verlag) VALUES 
	('Programmierer Verlag'),
	('IT Technik Verlag'),
	('Elektrotechnik Verlag'),
	('Automatisierung Verlag'),
	('Medien Verlag');

INSERT INTO fachbereich (fachbereich) VALUES
	('Applikationsentwicklung'),
	('IT Technik'),
	('Elektrotechnik'),
	('Automatisierungstechnik');
 
INSERT INTO fachbuch (isbn, titel, verlagID) VALUES
	(1111,'Applikationsentwicklung Fundamentals', 1),
	(2222,'Applikationsentwicklung Advanced', 1),
	(3333,'IT Technik - Betriebstechnik Fundamentals', 2),
	(4444,'IT Technik - Betriebstechnik Advanced',2),
	(5555,'IT Technik - Systemtechnik Fundamentals', 2),
	(6666,'IT Technik - Systemtechnik Advanced', 2),
	(7777,'Elektrotechnik I', 3),
	(8888,'Elektrotechnik II', 3),
	(9999,'Robotik', 4);
    
INSERT INTO fachbereichfachbuch (fachbereichID, fachbuchID) VALUES
	(1,1),
	(1,2),
	(2,3),
	(2,4),
	(2,5),
	(2,6),
	(3,7),
	(3,8),
	(4,9);

SELECT * FROM fachbuch;

/* -----------------------Punkt 1---------------------*/
SELECT fachbuch.titel, fachbuch.isbn, fachbuch.verlagID AS fachbuch_verlagID, verlag.verlag, verlag.verlagID
FROM fachbuch
INNER JOIN verlag 
ON verlag.verlagID= fachbuch.verlagID;

/* -----------------------Punkt 2---------------------*/
SELECT fachbuch.titel, fachbuch.isbn, fachbuch.verlagID AS fachbuch_verlagID, verlag.verlag, verlag.verlagID
FROM verlag
LEFT JOIN fachbuch 
ON verlag.verlagID= fachbuch.verlagID;	

/* -----------------------Punkt 3---------------------*/
SELECT fachbuch.titel, fachbuch.isbn, fachbuch.verlagID AS fachbuch_verlagID, verlag.verlag, verlag.verlagID
FROM verlag
CROSS JOIN fachbuch;

/* -----------------------Punkt 4---------------------*/
SELECT fachbuch.titel, fachbereich.fachbereich
FROM fachbuch
INNER JOIN fachbereichfachbuch 
	ON fachbuch.fachbuchID=fachbereichfachbuch.fachbuchID
INNER JOIN fachbereich 
	ON fachbereichfachbuch.fachbereichID=fachbereich.fachbereichID;
    
/* -----------------------Punkt 5---------------------*/
CREATE TABLE ausleihe (
	ausleiheID INT NOT NULL,
    exemplereID INT NOT NULL,
    von DATE,
    bis DATE,
    isbn VARCHAR (13),
    titel VARCHAR (100),
    fachbuchID 	INT,
    PRIMARY KEY (ausleiheID, exemplereID),
    FOREIGN KEY (fachbuchID) REFERENCES fachbuch(fachbuchID)
);

INSERT INTO ausleihe (ausleiheID, exemplereID, von, bis, isbn, titel, fachbuchID)
VALUES
(1, 1, '2025-10-01', '2025-10-15', '1111', 'Applikationsentwicklung Fundamentals', 1),
(2, 1, '2025-10-05', '2025-10-20', '3333', 'IT Technik - Betriebstechnik Fundamentals', 3),
(3, 2, '2025-10-10', '2025-10-25', '9999', 'Robotik', 9);

SELECT ausleihe.von, ausleihe.bis, fachbuch.isbn, fachbuch.titel, ausleihe.isbn AS ausleihe_isbn, ausleihe.titel AS ausleihe_titel
FROM fachbuch
INNER JOIN ausleihe
ON fachbuch.fachbuchID=ausleihe.fachbuchID;

SELECT ausleihe.von, ausleihe.bis, fachbuch.isbn, fachbuch.titel, ausleihe.isbn AS ausleihe_isbn, ausleihe.titel AS ausleihe_titel
FROM fachbuch
LEFT JOIN ausleihe
ON fachbuch.fachbuchID=ausleihe.fachbuchID;

SELECT ausleihe.von, ausleihe.bis, fachbuch.isbn, fachbuch.titel, ausleihe.isbn AS ausleihe_isbn, ausleihe.titel AS ausleihe_titel
FROM ausleihe
LEFT JOIN fachbuch
ON fachbuch.fachbuchID=ausleihe.fachbuchID;

