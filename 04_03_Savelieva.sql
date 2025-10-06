USE uebungsdatenbank;

/* ----------------------- Punkt 1 ---------------------*/
CREATE TABLE produktionsmaschinen (
	maschinenid INT NOT NULL,
    variante INT NOT NULL,
    bezeichung VARCHAR(200),
    CONSTRAINT PK_maschinen PRIMARY KEY (maschinenid,variante)
);
DESCRIBE produktionsmaschinen;
INSERT INTO produktionsmaschinen (maschinenid, variante)
VALUES 
	(101, 1),
    (102, 2);
SELECT  * FROM produktionsmaschinen;



/* ----------------------- Punkt 2 ---------------------*/
SELECT  * FROM produktionsmaschinen;
DESCRIBE produktionsmaschinen;
ALTER TABLE produktionsmaschinen DROP PRIMARY KEY;

ALTER TABLE produktionsmaschinen 
ADD globalid INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE produktionsmaschinen 
MODIFY globalid INT NOT NULL AUTO_INCREMENT FIRST;

ALTER TABLE produktionsmaschinen 
ADD CONSTRAINT PK_maschinen UNIQUE (maschinenid,variante);

INSERT INTO produktionsmaschinen (maschinenid,variante)
VALUE 
	(101, 45),
    (105, 45);
SELECT  * FROM produktionsmaschinen;


/* ----------------------- Punkt 2/2 ---------------------*/    
DROP TABLE IF EXISTS produktionsmaschinen;
CREATE TABLE produktionsmaschinen (
	globalid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    maschinenid INT NOT NULL,
    variante INT NOT NULL,
    bezeichung VARCHAR (200),
    CONSTRAINT PK_maschinen UNIQUE (maschinenid, variante)
);
DESCRIBE produktionsmaschinen;
INSERT INTO produktionsmaschinen (maschinenid, variante)
VALUES
	(101, 1),
    (102, 2),
	(101, 45),
    (105, 45);
SELECT  * FROM produktionsmaschinen;

/* ----------------------- Punkt 3 ---------------------*/    
DROP TABLE IF EXISTS produktionsmaschinen;
CREATE TABLE produktionsmaschinen (
	globalid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    laufzeit INT,
    maxlaufzeit INT,
    maschinenid INT,
    variante INT,
    bezeichung VARCHAR (200),
    CONSTRAINT PK_maschinen UNIQUE (maschinenid, variante),
    CHECK (laufzeit<=maxlaufzeit)
);
DESCRIBE produktionsmaschinen;
INSERT INTO produktionsmaschinen (laufzeit, maxlaufzeit, maschinenid, variante)
VALUES
	(100, 150, 101, 1),
    (120, 140, 101, 2);
SELECT  * FROM produktionsmaschinen;
INSERT INTO produktionsmaschinen (laufzeit, maxlaufzeit, maschinenid, variante)
VALUES
	(160, 150, 103, 1);
   	/* ---- Error Code: 3819. Check constraint 'produktionsmaschinen_chk_1' is violated.------*/  
INSERT INTO produktionsmaschinen (laufzeit, maxlaufzeit, maschinenid, variante)
VALUES
	(150, 150, 103, 1);
SELECT  * FROM produktionsmaschinen;


    