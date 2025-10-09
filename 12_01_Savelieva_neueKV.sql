USE shop_db_savelieva;
DROP PROCEDURE IF EXISTS neuer_kunde_verkauf;

SELECT * FROM artikel;

DELIMITER //
CREATE PROCEDURE neuer_kunde_verkauf (
	IN p_kunde_vorname VARCHAR (50),
    IN p_kunde_nachname VARCHAR (50),
    IN p_lieferant INT,
    IN p_artikel INT,
    IN p_menge INT
)
 BEGIN
	DECLARE v_lagerbestand INT;
    DECLARE p_kunde INT;
	START TRANSACTION;
    SELECT lagerbestand INTO v_lagerbestand FROM artikel WHERE artikelID = p_artikel FOR UPDATE;
    
    IF v_lagerbestand IS NULL THEN
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Artikel nicht gefunden';
	ELSEIF v_lagerbestand < p_menge THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nicht genügend Lagerbestand';
	ELSE 
		INSERT INTO kunden (vorname, nachname) 
        VALUES (p_kunde_vorname, p_kunde_nachname);
        UPDATE artikel SET lagerbestand = lagerbestand - p_menge WHERE artikelID = p_artikel;
        SET p_kunde = LAST_INSERT_ID();
        INSERT INTO verkauf (kundenID, lieferantenID, artikelID, menge, datum) 
        VALUES (p_kunde, p_lieferant, p_artikel, p_menge, CURDATE());
		COMMIT;
        SET @v_verkauf = LAST_INSERT_ID();
        SELECT ('Neuer Kunde und Verkauf hinzugefuegt') AS Meldung;
        SELECT verkauf.verkaufID AS Verkauf_ID, 
			CONCAT(kunden.nachname,' ', kunden.vorname) AS Kunde,
            artikel.bezeichnung AS Artikelname,
            lieferanten.name AS Lieferant,
            verkauf.menge AS 'Verkaufte Menge',
			artikel.preis AS 'Einzelpreis (€)',
            (artikel.preis*verkauf.menge) AS 'Gesamtpreis (€)',
            verkauf.datum AS Verkaufsdatum,
            artikel.lagerbestand AS 'Aktueller Lagerbestand (gesamt)',   
            CASE WHEN verkauf.verkaufID = @v_verkauf THEN '➕Neu hinzugefügt' ELSE'' END AS Status            
		FROM verkauf 
        JOIN artikel ON artikel.artikelID=verkauf.artikelID 
        JOIN lieferanten ON lieferanten.lieferantenID=verkauf.lieferantenID 
        JOIN kunden ON kunden.kundenID=verkauf.kundenID 
        -- WHERE kunden.kundenID = p_kunde
        ORDER BY verkaufID DESC;
	END IF;
END //
DELIMITER ;

call neuer_kunde_verkauf ('Kat', 'Sav', 2, 5, 2);  
call neuer_kunde_verkauf ('Kat', 'Sav', 2, 5, -3);  



