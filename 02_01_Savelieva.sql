USE le02_01;
SHOW TABLES;
DESCRIBE mitarbeiter;
DESCRIBE mitarbeiter2;

/* Punkt 1*/
SELECT name, eintrittsdatum, austrittsdatum
FROM mitarbeiter;

/* Punkt 2*/
SELECT name, eintrittsdatum, austrittsdatum, austrittsgrund
FROM mitarbeiter;

/* Punkt 3*/
SELECT *
FROM mitarbeiter;

/* Punkt 4*/
SELECT *
FROM mitarbeiter
WHERE abteilung = 'Vertrieb';

/* Punkt 5*/
SELECT *
FROM mitarbeiter
WHERE urlaubgenommen >= 30;

/* Punkt 6*/
SELECT *
FROM mitarbeiter
WHERE anzahlkinder >= 1;

/* Punkt 7*/
SELECT *
FROM mitarbeiter
WHERE eintrittsdatum BETWEEN '1990-01-01' AND '2000-01-01';

/* Punkt 8*/
SELECT *
FROM mitarbeiter
WHERE abteilung = 'Vertrieb' AND geschlecht='w';

/* Punkt 9*/
SELECT *
FROM mitarbeiter
WHERE krankenversicherung IN ('MH Plus Bonn','IKK gesund plus');

/* Punkt 10*/
SELECT *
FROM mitarbeiter
WHERE anzahlkinder >= 1 AND geschlecht='w'AND verheiratet='nein';

/* Punkt 11*/
SELECT krankenversicherung
FROM mitarbeiter
GROUP BY krankenversicherung
LIMIT 10;

DESCRIBE krankenkasse;

/* Punkt 11*/
SELECT *
FROM krankenkasse
LIMIT 10;

/* Punkt 12*/
SELECT name, vorname, abteilung
FROM mitarbeiter
ORDER BY abteilung, name, vorname;

/* Punkt 13*/
SELECT name, vorname, abteilung, bonus
FROM mitarbeiter
ORDER BY abteilung, bonus;

/* Punkt 14*/
SELECT name AS Name, vorname AS Vorname, strasse AS Strasse, hausnummer AS Hausnummer, plz AS Postleitzahl, ort AS Ort
FROM mitarbeiter;

/* Punkt 15*/
SELECT ort AS Ort, COUNT(ort) AS Anzahl
FROM mitarbeiter
GROUP BY ort
ORDER BY Anzahl DESC, ort ASC;

