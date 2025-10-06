USE uebungsdatenbank;
DESCRIBE qualifikationen;

/* Punkt 1*/
TRUNCATE TABLE qualifikationen;
SELECT * FROM qualifikationen;

ALTER TABLE qualifikationen
MODIFY COLUMN qid INT NOT NULL AUTO_INCREMENT;
referentenidnameemail
INSERT INTO qualifikationen (bezeichnung, kuerzel, kategorie)
VALUES ('SQL', 'ITE', 'Informatik');
SELECT * FROM qualifikationen;

/* Punkt 2*/
INSERT INTO qualifikationen (bezeichnung, kuerzel, kategorie)
VALUES ('Sys-Admin', 'ADA', 'Support');
SELECT * FROM qualifikationen;

/* Punkt 3*/
INSERT INTO qualifikationen (bezeichnung)
VALUES ('Projektleitung');
SELECT * FROM qualifikationen;


/* Punkt 4*/
DESCRIBE qualglobal;
SELECT * FROM qualglobal;
UPDATE qualglobal
SET bezeichnung = 'First Level Support', kuerzel ='FLS'
WHERE qid =2;

UPDATE qualglobal
SET bezeichnung = 'Second Level Support', kuerzel ='SLS'
WHERE qid =3;

/* Punkt 5*/
UPDATE qualglobal
SET kuerzel = 'DBE'
WHERE qid IN (
  SELECT qid 
  FROM (SELECT qid FROM qualglobal WHERE kuerzel = 'DAT') t  /*allias: AS t*/
);
SELECT * FROM qualglobal;

/* Punkt 6*/
DESCRIBE qualglobalarchiv;
DELETE FROM qualglobalarchiv 
WHERE qid = 2;
SELECT * FROM qualglobalarchiv;

/* Punkt 7*/
DELETE FROM qualglobalarchiv 
WHERE qid BETWEEN 5 AND 7;
SELECT * FROM qualglobalarchiv;


/* Punkt 8*/
DELETE FROM qualglobalarchiv
WHERE 	qid>0;
SELECT * FROM qualglobalarchiv;