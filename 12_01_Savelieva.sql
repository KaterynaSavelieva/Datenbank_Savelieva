USE Shop_DB_Savelieva;
DROP TABLE IF EXISTS verkauf;
DROP TABLE IF EXISTS artikel;
DROP TABLE IF EXISTS lieferanten;
DROP TABLE IF EXISTS kunden;
DROP PROCEDURE IF EXISTS verkauf;
DROP DATABASE IF EXISTS Shop_DB_Savelieva;
CREATE DATABASE Shop_DB_Savelieva;
USE Shop_DB_Savelieva;

CREATE TABLE kunden (
	kundenID INT AUTO_INCREMENT PRIMARY KEY,
    vorname VARCHAR (50),
    nachname VARCHAR (50),
    straße VARCHAR (50),
    hausnummer  VARCHAR (10),
    postleitzahl INT,
    stadt  VARCHAR (50),
    telefonnummer VARCHAR (20),
    email  VARCHAR (256) UNIQUE
);    

CREATE TABLE lieferanten (
	lieferantenID INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (50),
    straße VARCHAR (50),
    hausnummer  VARCHAR (10),
    postleitzahl INT,
    stadt  VARCHAR (50),
    telefonnummer VARCHAR (20),
    email  VARCHAR (256) UNIQUE
);

CREATE TABLE artikel (
	artikelID INT AUTO_INCREMENT PRIMARY KEY,
    bezeichnung VARCHAR (100) NOT NULL,
    beschreibung VARCHAR (200),
    preis DECIMAL(10,2) NOT NULL,
    lagerbestand INT DEFAULT 0
    -- lieferantenID INT,
    -- FOREIGN KEY (lieferantenID) REFERENCES lieferanten(lieferantenID)
);

CREATE TABLE verkauf (
	verkaufID INT AUTO_INCREMENT PRIMARY KEY,
	kundenID INT,
    lieferantenID INT,
    artikelID INT,
    menge INT NOT NULL,
    datum DATE,
    FOREIGN KEY (kundenID) REFERENCES kunden(kundenID),
    CONSTRAINT fk_vk_lieferanten FOREIGN KEY (lieferantenID) REFERENCES lieferanten(lieferantenID) ON DELETE CASCADE,
    CONSTRAINT fk_vk_artikel FOREIGN KEY (artikelID) REFERENCES artikel(artikelID) ON DELETE CASCADE
);



/* CREATE TABLE verkauf_artikel  (
	verkaufID  INT,
    artikelID INT,
    menge INT,
    CONSTRAINT verkauf_artikel_ID PRIMARY KEY (verkaufID , artikelID),
    FOREIGN KEY (verkaufID) REFERENCES verkauf(verkaufID),
    FOREIGN KEY (artikelID) REFERENCES artikel(artikelID)
); */

INSERT INTO kunden (vorname, nachname, straße, hausnummer, postleitzahl, stadt, telefonnummer, email)
VALUES
('Max', 'Müller', 'Hauptstraße', '12A', 8010, 'Graz', 436601234567, 'max.mueller@mail.at'),
('Lisa', 'Schmidt', 'Bahnhofweg', '7', 8700, 'Leoben', 436701234568, 'lisa.schmidt@mail.at'),
('Tobias', 'Huber', 'Ringstraße', '45', 8720, 'Knittelfeld', 436761234569, 'tobias.huber@mail.at'),
('Anna', 'Leitner', 'Parkgasse', '9', 8600, 'Bruck', 436641234570, 'anna.leitner@mail.at');


INSERT INTO lieferanten (name, straße, hausnummer, postleitzahl, stadt, telefonnummer, email)
VALUES
('TechImport GmbH', 'Industriestraße', '11', 8051, 'Graz', 436631234500, 'office@techimport.at'),
('MediSupplies KG', 'Handelsweg', '22', 8700, 'Leoben', 436641234501, 'info@medisupplies.at'),
('OfficePro OG', 'Werkstraße', '8', 8605, 'Kapfenberg', 436661234502, 'office@officepro.at');

INSERT INTO artikel (bezeichnung, beschreibung, preis, lagerbestand)
VALUES
('Laptop Lenovo', 'ThinkPad E15',  899.99, 25),
('Monitor Dell', 'UltraSharp 27"',  319.50, 40),
('Maus Logitech', 'MX Master 3',  99.90, 100),
('Tastatur Microsoft', 'Ergo Keyboard', 79.00, 60),
('Drucker HP', 'LaserJet M110we', 149.99, 35);


INSERT INTO verkauf (kundenID, lieferantenID, artikelID, menge, datum)
VALUES
(1, 1, 1, 1, '2025-10-01'),
(1, 1, 2, 1, '2025-10-02'),
(2, 2, 3, 2, '2025-10-03'),
(3, 3, 5, 1, '2025-10-04'),
(4, 1, 4, 1, '2025-10-05'),
(2, 2, 1, 1, '2025-10-06');
