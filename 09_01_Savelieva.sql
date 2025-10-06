USE uebungsdatenbank;
SHOW TABLES; 

/* -----------------------Punkt 1---------------------*/
RENAME TABLE artikel TO artikelaktuell;

/* -----------------------Punkt 2---------------------*/
DESCRIBE artikelaktuell;
ALTER TABLE artikelaktuell
	CHANGE COLUMN bezeichnung_artikel bezeichnung VARCHAR (300);
    
/* -----------------------Punkt 3---------------------*/    
ALTER TABLE artikelaktuell MODIFY status VARCHAR(300);

/* -----------------------Punkt 4---------------------*/    
ALTER TABLE artikelaktuell ADD PRIMARY KEY (artikelid);
SELECT * FROM artikelaktuell;

/* -----------------------Punkt 5---------------------*/    
ALTER TABLE artikelinfo DROP PRIMARY KEY;

/* -----------------------Punkt 6---------------------*/  
ALTER TABLE artikelaktuell MODIFY tiefe DECIMAL (8,2) NOT NULL;

/* -----------------------Punkt 7---------------------*/  
ALTER TABLE artikelaktuell MODIFY tiefe DECIMAL (8,2);

/* -----------------------Punkt 8---------------------*/  
ALTER TABLE artikelaktuell ALTER preis SET DEFAULT 0.0;

/* -----------------------Punkt 9--------------------*/  
ALTER TABLE artikelaktuell ALTER preis DROP DEFAULT;

/* -----------------------Punkt 10--------------------*/  
ALTER TABLE artikelaktuell ADD UNIQUE (bezeichnung);

/* -----------------------Punkt 11--------------------*/  
ALTER TABLE artikelaktuell ADD CHECK (preis <1000);

/* -----------------------Punkt 12--------------------*/  
SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'artikelaktuell' AND CONSTRAINT_TYPE = 'CHECK';
ALTER TABLE artikelaktuell  DROP CHECK artikelaktuell_chk_1; 

/* -----------------------Punkt 13--------------------*/  
ALTER TABLE artikelaktuell ADD COLUMN kommentar VARCHAR (300); 

/* -----------------------Punkt 14--------------------*/  
ALTER TABLE artikelaktuell DROP COLUMN kommentar; 

/* -----------------------Punkt 15--------------------*/  
DESCRIBE positionartikel;
DESCRIBE artikelinfo;
ALTER TABLE artikelinfo ADD PRIMARY KEY (artikelid);
ALTER TABLE positionartikel ADD FOREIGN KEY (fk_artikelinfo_artikelid) REFERENCES artikelinfo(artikelid);


/* -----------------------Punkt 16--------------------*/  
DESCRIBE artikelinfo;
DESCRIBE bestellposition;
SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'positionartikel'
  AND CONSTRAINT_TYPE = 'FOREIGN KEY';
  
ALTER TABLE positionartikel DROP FOREIGN KEY positionartikel_ibfk_1;





SET SQL_SAFE_UPDATES = 0;
DELETE FROM artikelaktuell WHERE bezeichnung = '2';
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE positionartikel
ADD CONSTRAINT fk_positionartikel_artikelinfo
FOREIGN KEY (fk_artikelinfo_artikelid)
REFERENCES artikelinfo(artikelid)
ON UPDATE CASCADE
ON DELETE RESTRICT;