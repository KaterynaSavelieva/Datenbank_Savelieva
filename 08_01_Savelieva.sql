DROP DATABASE IF EXISTS banks;
CREATE DATABASE IF NOT EXISTS banks;
USE banks;
DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
	kontonummer INT NOT NULL PRIMARY KEY,
    kontoinhaber VARCHAR (100) NOT NULL,
	kontostand DECIMAL (10,2) NOT NULL
);
INSERT INTO accounts VALUES
	(1001,'John Doe', 1000.00),
    (1002,'Jane Doe', 500.00);
SELECT * FROM accounts;

DELIMITER //

CREATE PROCEDURE ueberweisung (
	IN p_absender INT,
    IN p_empfaenger INT,
    IN p_betrag DECIMAL (10,2)
)
BEGIN
	START TRANSACTION;
    
    UPDATE accounts
		SET kontostand = kontostand - p_betrag
	WHERE kontonummer = p_absender;
    
    UPDATE accounts
		SET kontostand = kontostand + p_betrag
	WHERE kontonummer = p_empfaenger;
    
    IF (SELECT kontostand FROM accounts WHERE kontonummer = p_absender)< 0 THEN
		ROLLBACK;
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Transaktion abgebrochen: unzureichendes Guthaben!';
	ELSE
		COMMIT;
        SELECT 'Transaktion erfolgreich abgeschlossen.' AS Ergebnis;
	END IF;
END //
DELIMITER ;

CALL ueberweisung (1001, 1002, 500.30);
SELECT * FROM accounts;


CALL ueberweisung (1001, 1002, 10025.30);
SELECT * FROM accounts;


	