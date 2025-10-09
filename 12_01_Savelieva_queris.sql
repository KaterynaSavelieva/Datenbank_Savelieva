USE Shop_DB_Savelieva;

-- Abfrage aller Kunden
SELECT kundenID, CONCAT (nachname,' ',vorname)  AS Kunde
FROM kunden;

-- Abfrage aller Lieferanten
SELECT lieferantenID, name AS Lieferant FROM lieferanten;

-- Abfrage aller Artikel
SELECT artikelID, bezeichnung AS Bezeichnung FROM artikel;

-- Abfrage des Lagerbestands eines bestimmten Artikels
SELECT * FROM artikel;
SELECT bezeichnung, lagerbestand FROM artikel WHERE bezeichnung='Maus Logitech';

-- Abfrage aller Verkäufe eines bestimmten Kunden
SELECT CONCAT(kunden.nachname,' ', kunden.vorname) AS Kunde, lieferanten.name AS lieferant, artikel.bezeichnung, verkauf.menge, verkauf.datum
FROM verkauf
JOIN kunden ON kunden.kundenID=verkauf.kundenID
JOIN lieferanten ON lieferanten.lieferantenID=verkauf.lieferantenID
JOIN artikel ON artikel.artikelID=verkauf.artikelID
WHERE kunden.nachname = 'Müller';

-- Abfrage aller Verkäufe eines bestimmten Lieferanten
SELECT lieferanten.name AS lieferant, CONCAT(kunden.nachname,' ', kunden.vorname) AS Kunde,  
		artikel.bezeichnung, verkauf.menge, artikel.preis, (verkauf.menge * artikel.preis) AS Gesamtpreis, verkauf.datum
FROM verkauf
JOIN kunden ON kunden.kundenID=verkauf.kundenID
JOIN lieferanten ON lieferanten.lieferantenID=verkauf.lieferantenID
JOIN artikel ON artikel.artikelID=verkauf.artikelID
WHERE lieferanten.name = 'TechImport GmbH'
ORDER BY verkauf.datum;

-- Abfrage aller Artikel, die unter einem bestimmten Preis liegen
SELECT bezeichnung, preis FROM artikel WHERE preis < 500;

-- Abfrage des Gesamtumsatzes des Shops
SELECT CONCAT(kunden.nachname,' ', kunden.vorname) AS Kunde, lieferanten.name AS lieferant,  
		artikel.bezeichnung, verkauf.menge, artikel.preis, (verkauf.menge * artikel.preis) AS Gesamtpreis, verkauf.datum
FROM verkauf
JOIN kunden ON kunden.kundenID=verkauf.kundenID
JOIN lieferanten ON lieferanten.lieferantenID=verkauf.lieferantenID
JOIN artikel ON artikel.artikelID=verkauf.artikelID
ORDER BY verkauf.datum;

SELECT SUM(verkauf.menge * artikel.preis) AS Gesamtumsatz
FROM verkauf
JOIN artikel ON verkauf.artikelID = artikel.artikelID;

-- Abfrage zum Ändern des Lagerbestands eines Artikels um eine bistimmte Menge
SELECT * FROM artikel;
UPDATE artikel SET lagerbestand = lagerbestand + 2 WHERE artikelID =2;

-- Abfrage zum Löschen eines Kunden und aller zugehörigen Verkäufe
START TRANSACTION;
SET SQL_SAFE_UPDATES = 0;
SELECT kunden.nachname, verkauf.* FROM verkauf JOIN kunden ON kunden.kundenID=verkauf.kundenID;
DELETE verkauf FROM verkauf	JOIN kunden ON kunden.kundenID=verkauf.kundenID WHERE kunden.nachname = 'Müller';
DELETE FROM kunden WHERE kunden.nachname = 'Müller';
SELECT kunden.nachname, verkauf.* FROM verkauf LEFT JOIN kunden ON kunden.kundenID=verkauf.kundenID;
SET SQL_SAFE_UPDATES = 1;
-- 
ROLLBACK;
-- COMMIT;

-- Abfrage zum Löschen eines Artikels und aller zugehörigen Verkäufe
START TRANSACTION;
SET SQL_SAFE_UPDATES = 0;

SELECT artikel.bezeichnung, verkauf.* FROM verkauf JOIN artikel ON artikel.artikelID=verkauf.artikelID;
DELETE verkauf FROM verkauf	 JOIN artikel ON artikel.artikelID=verkauf.artikelID WHERE artikel.artikelID = 1;
DELETE FROM artikel WHERE artikel.artikelID = 1;
SELECT artikel.bezeichnung, verkauf.* FROM verkauf JOIN artikel ON artikel.artikelID=verkauf.artikelID;
SET SQL_SAFE_UPDATES = 1;
-- 
ROLLBACK;
-- COMMIT;

-- Abfrage aller Verkäüfe mit den Informationen zu Kunde, Lieferant und Artikel
SELECT 
    CONCAT(kunden.nachname, ' ', kunden.vorname) AS Kunde,
    lieferanten.name AS Lieferant,
    artikel.bezeichnung AS Artikel,
    verkauf.menge AS Menge,
    artikel.preis AS Einzelpreis,
    (verkauf.menge * artikel.preis) AS Gesamtpreis,
    verkauf.datum AS Datum
FROM verkauf
JOIN kunden ON kunden.kundenID = verkauf.kundenID
JOIN lieferanten ON lieferanten.lieferantenID = verkauf.lieferantenID
JOIN artikel ON artikel.artikelID = verkauf.artikelID
ORDER BY Datum;

-- Abfrage aller Artikel und  ihrer Lieferanten
SELECT lieferanten.name AS Lieferant, artikel.*
FROM verkauf 
JOIN artikel ON artikel.artikelID=verkauf.artikelID
JOIN lieferanten ON lieferanten.lieferantenID=verkauf.lieferantenID
ORDER BY lieferanten.name;


-- Erstellung einer View, die alle Kunden und deren Umsätze listet
CREATE OR REPLACE VIEW v_kunden AS 
SELECT 
    CONCAT(kunden.nachname, ' ', kunden.vorname) AS Kunde,
    lieferanten.name AS Lieferant,
    artikel.artikelID AS ArtikelID,
    artikel.bezeichnung AS Artikel,
    verkauf.menge AS Menge,
    artikel.preis AS Einzelpreis,
    (verkauf.menge * artikel.preis) AS Gesamtpreis,
    verkauf.datum AS Datum
FROM verkauf
JOIN kunden ON kunden.kundenID = verkauf.kundenID
JOIN lieferanten ON lieferanten.lieferantenID = verkauf.lieferantenID
JOIN artikel ON artikel.artikelID = verkauf.artikelID;
SELECT * FROM v_kunden ORDER BY Datum;