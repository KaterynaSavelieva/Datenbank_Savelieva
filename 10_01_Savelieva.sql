USE uebungsdatenbank;

/* -----------------------Punkt 1---------------------*/
DESCRIBE sachpraemie;
DESCRIBE mitarbeiter;
SELECT * FROM sachpraemie;
SELECT * FROM mitarbeiter;

SELECT * FROM mitarbeiter 
WHERE mitarbeiterid = ANY (SELECT mitarbeiterid FROM sachpraemie);

SELECT name, vorname FROM mitarbeiter
WHERE mitarbeiterid IN (SELECT mitarbeiterid FROM sachpraemie);

SELECT sachpraemie.*, mitarbeiter.name, mitarbeiter.vorname
FROM sachpraemie
LEFT JOIN mitarbeiter
ON sachpraemie.mitarbeiterid = mitarbeiter.mitarbeiterid;


/* -----------------------Punkt 2---------------------*/
SELECT m.mitarbeiterid, m.name, m.vorname, s.sum
FROM 
(SELECT  mitarbeiterid, SUM(preis) AS sum FROM sachpraemie GROUP BY mitarbeiterid) s
LEFT JOIN 
(SELECT mitarbeiter.name, mitarbeiter.vorname, mitarbeiter.mitarbeiterid FROM mitarbeiter
WHERE mitarbeiterid IN (SELECT mitarbeiterid FROM 
	(SELECT  mitarbeiterid, SUM(preis) AS sum  FROM sachpraemie GROUP BY mitarbeiterid)t
))m
ON s.mitarbeiterid = m.mitarbeiterid;


SELECT m.mitarbeiterid, m.name, m.vorname, SUM(s.preis) AS sum
FROM mitarbeiter AS m
JOIN sachpraemie AS s
	ON s.mitarbeiterid = m.mitarbeiterid
GROUP BY m.mitarbeiterid, m.name, m.vorname;


/* -----------------------Punkt 3---------------------*/
SELECT * FROM steuerklasse;
DESCRIBE steuerklasse;
DESCRIBE mitarbeiter;

SELECT mitarbeiterid, name, vorname, steuerklasse FROM mitarbeiter
WHERE steuerklasse NOT IN (SELECT steuerklasseid FROM steuerklasse);


/* -----------------------Punkt 4---------------------*/
SELECT m.mitarbeiterid, m.name, m.vorname, m.steuerklasse 
FROM mitarbeiter AS m
WHERE NOT EXISTS (
	SELECT 1
    FROM steuerklasse AS s
    WHERE s.steuerklasseid = m.steuerklasse
);