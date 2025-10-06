USE uebungsdatenbank;
SHOW FULL TABLES;
SELECT * FROM mitarbeiter;
DESCRIBE mitarbeiter;

/* -----------------------Punkt 1---------------------*/
CREATE OR REPLACE VIEW v_urlaub AS
	SELECT name, vorname, urlaubstage, urlaubgenommen FROM mitarbeiter;
SELECT * FROM v_urlaub;

/* -----------------------Punkt 2---------------------*/

DESCRIBE sachpraemie;
SELECT * FROM sachpraemie;
CREATE OR REPLACE VIEW v_praemie AS
SELECT mitarbeiter.name, mitarbeiter.vorname, sachpraemie.praemie, sachpraemie.preis
FROM mitarbeiter, sachpraemie
WHERE mitarbeiter.mitarbeiterid=sachpraemie.mitarbeiterid;
SELECT * FROM v_praemie;


CREATE OR REPLACE VIEW v_praemie AS
SELECT mitarbeiter.name, mitarbeiter.vorname, sachpraemie.praemie, sachpraemie.preis
FROM mitarbeiter 
JOIN sachpraemie ON mitarbeiter.mitarbeiterid=sachpraemie.mitarbeiterid;

/* -----------------------Punkt 3---------------------*/
DESCRIBE bonus;
SELECT * FROM bonus;

CREATE OR REPLACE VIEW v_mitarbeiterbonus AS
SELECT mitarbeiter.name, mitarbeiter.vorname, SUM(bonus.bonuszahlung) AS bonus
FROM mitarbeiter 
JOIN bonus ON mitarbeiter.mitarbeiterid=bonus.mitarbeiterid
GROUP BY mitarbeiter.name, mitarbeiter.vorname
ORDER BY bonus;
SELECT * FROM v_mitarbeiterbonus;


CREATE OR REPLACE VIEW v_mitarbeiterbonus AS
SELECT 
	m.name, 
    m.vorname, 
    SUM(b.bonuszahlung) AS bonus
FROM mitarbeiter AS m
JOIN bonus AS b
	ON m.mitarbeiterid=b.mitarbeiterid
GROUP BY m.name, m.vorname
ORDER BY bonus ASC;

/* -----------------------Punkt 4---------------------*/
SELECT * FROM mitarbeiter;
DESCRIBE mitarbeiter;
CREATE OR REPLACE VIEW v_mitarbeiterkrankenkasse AS
SELECT name, vorname, krankenversicherung FROM mitarbeiter;

ALTER TABLE mitarbeiter MODIFY mitarbeiterid INT NOT NULL AUTO_INCREMENT;

INSERT INTO v_mitarbeiterkrankenkasse  (name, vorname, krankenversicherung) VALUES 
	('Sav', 'Kat', 'ÖGK');

SELECT * FROM v_mitarbeiterkrankenkasse;
DESCRIBE v_mitarbeiterkrankenkasse;


DELETE FROM v_mitarbeiterkrankenkasse WHERE name ='Sav';
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;


/* -----------------------Punkt 5---------------------*/
DROP VIEW IF EXISTS v_mitarbeiterkrankenkasse;
