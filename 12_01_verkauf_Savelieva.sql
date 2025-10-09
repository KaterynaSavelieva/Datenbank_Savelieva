-- Durchführung einer Transaktion, um den Lagerbestand eines Artikels zu reduzieren und einen Verkauf zu protokollieren
DROP PROCEDURE IF EXISTS verkauf;
USE Shop_DB_Savelieva;
SELECT * FROM v_kunden WHERE artikelID =2 ORDER BY Datum;
SELECT * FROM artikel WHERE artikelID =2;

DELIMITER //
CREATE PROCEDURE verkauf (
    IN p_kunde INT,
    IN p_lieferant INT,
    IN p_artikel INT,
    IN p_menge INT
)

BEGIN
	DECLARE v_bestand INT;
	START TRANSACTION;    
    SELECT lagerbestand INTO v_bestand FROM artikel WHERE artikelID=p_artikel FOR UPDATE;
    
    IF v_bestand IS NULL THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Artikel nicht gefunden';	
    ELSEIF v_bestand < p_menge THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nicht genügend Lagerbestand';
    ELSE     
		UPDATE artikel SET lagerbestand = lagerbestand - p_menge WHERE artikelID =p_artikel;
		INSERT INTO verkauf (kundenID, lieferantenID, artikelID, menge, datum) 
        VALUES (p_kunde, p_lieferant, p_artikel, p_menge, CURDATE());
        COMMIT;
        SELECT 'Verkauf erfolgreich abgeschlossen.' AS Ergebnis;
        SELECT * FROM v_kunden WHERE artikelID =p_artikel ORDER BY Datum;
        SELECT * FROM artikel WHERE artikelID =p_artikel;
	END IF;
 END //   
DELIMITER ;

CALL verkauf (1, 1, 2, 5);

