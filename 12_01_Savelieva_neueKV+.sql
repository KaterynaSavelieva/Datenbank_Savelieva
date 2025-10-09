USE shop_db_savelieva;
DROP PROCEDURE IF EXISTS neuer_kunde_verkauf;

DELIMITER //
CREATE PROCEDURE neuer_kunde_verkauf (
	-- IN p_kunde INT,
 IN p_kunde_vorname VARCHAR (50),
 IN p_kunde_nachname VARCHAR (50),
 IN p_kunde_email VARCHAR (256),
 IN p_lieferant INT,
 IN p_artikel INT,
 IN p_menge INT
)
main: BEGIN
	DECLARE v_lagerbestand INT;
	DECLARE p_kunde INT;
    
     /* Універсальний хендлер: при будь-якій помилці — ROLLBACK + повідомлення */
    DECLARE sqlx CONDITION FOR SQLSTATE 'HY000'; 
    DECLARE EXIT HANDLER FOR sqlx 
    BEGIN 
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction abgebrochen';
	END;
    
	START TRANSACTION;
    
    IF EXISTS (SELECT 1 FROM kunden WHERE email = p_kunde_email) THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Kunde mit dieser E-Mail existiert bereits (nur neue Kunden erlaubt)';
        LEAVE main;
	END IF;

	SELECT lagerbestand INTO v_lagerbestand FROM artikel WHERE artikelID = p_artikel FOR UPDATE;
 
	IF v_lagerbestand IS NULL THEN
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Artikel nicht gefunden';
        -- LEAVE neuer_kunde_verkauf;
	ELSEIF v_lagerbestand < p_menge THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nicht genügend Lagerbestand';
        -- LEAVE neuer_kunde_verkauf;
	END IF;

	INSERT INTO kunden (vorname, nachname, email) VALUES (p_kunde_vorname, p_kunde_nachname, p_kunde_email);
	UPDATE artikel SET lagerbestand = lagerbestand - p_menge WHERE artikelID = p_artikel;        
	SET p_kunde = LAST_INSERT_ID();
	INSERT INTO verkauf (kundenID, lieferantenID, artikelID, menge, datum) VALUES (p_kunde, p_lieferant, p_artikel, p_menge, CURDATE());
	COMMIT;
        
	SET @v_verkauf = LAST_INSERT_ID();
	SELECT ('Neuer Kunde und Verkauf hinzugefuegt') AS Meldung;
        
	SELECT
		v.verkaufID AS Verkauf_ID,
        k.kundenID AS Kunden_ID,
		CONCAT(k.nachname, ' ', k.vorname) AS Kunde,
        k.email AS 'E-Mail',
		a.bezeichnung AS Artikelname,l.name AS Lieferant,a.preis AS `Einzelpreis (€)`,
		(a.preis * v.menge) AS `Gesamtpreis (€)`,
		v.datum AS Verkaufsdatum,
		a.lagerbestand + COALESCE((SELECT SUM(v2.menge) FROM verkauf v2 WHERE v2.artikelID = v.artikelID AND v2.verkaufID >= v.verkaufID), 0) AS `Lagerbestand vor Verkauf`, -- залишок ПЕРЕД цим продажем (динамічно)
		v.menge AS `Verkaufte Menge`,
		a.lagerbestand + COALESCE((SELECT SUM(v2.menge) FROM verkauf v2 WHERE v2.artikelID = v.artikelID AND v2.verkaufID > v.verkaufID), 0) AS `Lagerbestand nach Verkauf`,-- залишок одразу ПІСЛЯ цього продажу (динамічно)
		a.lagerbestand AS `Aktueller Lagerbestand (gesamt)`,
		CASE WHEN v.verkaufID = @v_verkauf THEN '➕Neu hinzugefügt' ELSE'' END AS Status
	FROM verkauf v
	JOIN artikel a ON a.artikelID = v.artikelID
	JOIN kunden k ON k.kundenID = v.kundenID
	JOIN lieferanten l ON l.lieferantenID = v.lieferantenID
	ORDER BY v.verkaufID DESC;	
END  //
DELIMITER ;

call neuer_kunde_verkauf ('Kat', 'Sav', 'kat11111@g.at', 1, 5, 2); 
-- SELECT * FROM kunden;





