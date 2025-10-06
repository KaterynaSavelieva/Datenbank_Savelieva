USE uebungsdatenbank;
SHOW TABLES;

/* -----------------------Punkt 1---------------------*/
DESCRIBE arbeitszeit;
SELECT * FROM arbeitszeit;

CREATE INDEX index_arbeitszeit_mitarbeiter 
ON arbeitszeit (anzahlstunden, mitarbeiterid);

DROP INDEX index_arbeitszeit_mitarbeiter ON arbeitszeit;

/* -----------------------Punkt 2---------------------*/
DESCRIBE kreditinstitutneu;
SELECT * FROM kreditinstitutneu;
CREATE INDEX index_plzort
ON kreditinstitutneu (plz, ort);

EXPLAIN SELECT * FROM kreditinstitutneu WHERE ort ='Berlin' AND plz = 10789;

SHOW INDEXES FROM kreditinstitutneu;

DROP INDEX index_plzort ON kreditinstitutneu;
