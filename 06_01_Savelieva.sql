/* -----------------------Punkt 1---------------------*/
CREATE USER 'kateryna'@'localhost' 
IDENTIFIED BY 'secret';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON uebungsdatenbank.artikel 
TO 'kateryna'@'localhost';


/* -----------------------Punkt 2---------------------*/
SHOW GRANTS FOR 'kateryna'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'kateryna'@'localhost';
DROP USER IF EXISTS 'kateryna'@'localhost';


/* -----------------------Punkt 3---------------------*/
CREATE ROLE IF NOT EXISTS 'vertrieb';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON uebungsdatenbank.artikel
TO 'vertrieb';

CREATE USER IF NOT EXISTS 'franz'@'localhost' IDENTIFIED BY 'secret';
CREATE USER IF NOT EXISTS 'maria'@'localhost' IDENTIFIED BY 'secret';

GRANT 'vertrieb' TO 'franz'@'localhost', 'maria'@'localhost';

-- Standardrolle aktivieren, damit sie automatisch beim Login gilt
SET DEFAULT ROLE 'vertrieb' TO 'franz'@'localhost', 'maria'@'localhost';

REVOKE INSERT, UPDATE, DELETE
ON uebungsdatenbank.artikel
FROM vertrieb;

REVOKE vertrieb FROM 'franz'@'localhost', 'maria'@'localhost';
DROP ROLE IF EXISTS vertrieb;


















SHOW PROCESSLIST;
SHOW GRANTS FOR 'vertrieb';
