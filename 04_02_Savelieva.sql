USE uebungsdatenbank;

/* -----------------------Punkt 1---------------------*/
CREATE TABLE megaschenk (
	geschenkid SMALLINT PRIMARY KEY,
    artikel VARCHAR (200) NOT NULL,
    preis DECIMAL (5,2) NOT NULL,
    jahrzugehoerigkeit SMALLINT NOT NULL
);
DESCRIBE megaschenk;
DROP TABLE megaschenk;


/* ----------------------- Punkt 2 ---------------------*/
CREATE TABLE megaschenk (
	geschenkid SMALLINT PRIMARY KEY AUTO_INCREMENT,
    artikel VARCHAR (200) NOT NULL,
    preis DECIMAL (5,2) NOT NULL,
    jahrzugehoerigkeit SMALLINT NOT NULL,
    UNIQUE (artikel)
);
DESCRIBE megaschenk;
INSERT INTO megaschenk (artikel, preis, jahrzugehoerigkeit)
VALUES 
	('Armbanduhr', '10.50', 25),
    ('Kaffeemaschine', 40, 50);
SELECT * FROM megaschenk;

INSERT INTO megaschenk (artikel, preis, jahrzugehoerigkeit)
VALUES 
	('Armbanduhr', '20.50', 40);
/*  Error Code: 1062. Duplicate entry 'Armbanduhr' for key 'megaschenk.artikel'	0.016 sec */


/* ----------------------- Punkt 3 ---------------------*/
ALTER TABLE megaschenk
ALTER preis SET DEFAULT '0.00';

INSERT INTO megaschenk (artikel, jahrzugehoerigkeit)
VALUES 	('Termokanne',  25);

SELECT * FROM megaschenk;


/* ----------------------- Punkt 4 ---------------------*/

ALTER TABLE megaschenk
ADD CHECK (jahrzugehoerigkeit IN (5, 10, 15, 20));
/* 	Error Code: 3819. Check constraint 'megaschenk_chk_1' is violated.	*/

DROP TABLE megaschenk;
CREATE TABLE megaschenk (
	geschenkid SMALLINT PRIMARY KEY AUTO_INCREMENT,
    artikel VARCHAR (200) NOT NULL,
    preis DECIMAL (5,2) NOT NULL DEFAULT '0.00',
    jahrzugehoerigkeit SMALLINT NOT NULL,
    UNIQUE (artikel),
    CHECK (jahrzugehoerigkeit IN (5, 10, 15, 20))
);

INSERT INTO megaschenk (artikel, preis, jahrzugehoerigkeit)
VALUES 
	('Armbanduhr', '10.50', 5),
    ('Kaffeemaschine', 40, 10);

INSERT INTO megaschenk (artikel, jahrzugehoerigkeit)
VALUES 	('Termokanne',  20);

SELECT * FROM megaschenk;

INSERT INTO megaschenk (artikel, jahrzugehoerigkeit)
VALUES 	('Tastatur',  45);
/*		Error Code: 3819. Check constraint 'megaschenk_chk_1' is violated.	*/