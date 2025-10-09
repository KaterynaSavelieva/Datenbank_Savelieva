USE Shop_DB_Savelieva;

CREATE OR REPLACE VIEW v_verkauf AS
SELECT a.artikelID, a.bezeichnung, k.nachname, v.menge, v.datum, l.name, a.preis, (a.preis*v.menge) AS Gesamtpreis 
FROM verkauf v
JOIN kunden k ON k.kundenID=v.verkaufID
JOIN lieferanten l ON l.lieferantenID=v.lieferantenID
JOIN artikel a ON a.artikelID=v.artikelID
ORDER BY artikelID;

START TRANSACTION;
SELECT * FROM v_verkauf;
UPDATE artikel SET preis= preis + 10 WHERE artikelID = 1;
SELECT * FROM v_verkauf;
COMMIT;
