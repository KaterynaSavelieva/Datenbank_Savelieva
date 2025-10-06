USE uebungsdatenbank;

/* -----------------------Punkt 1---------------------*/
DESCRIBE niederlassungbelgien; 
DESCRIBE niederlassungholland;	
SELECT * FROM niederlassungbelgien;
SELECT * FROM niederlassungholland;

SELECT name, vorname FROM niederlassungbelgien
UNION
SELECT name, vorname FROM niederlassungholland;

/* -----------------------Punkt 2---------------------*/
SELECT name, vorname FROM niederlassungbelgien
UNION ALL	
SELECT name, vorname FROM niederlassungholland;


/* -----------------------Punkt 3---------------------*/
SELECT name, vorname FROM niederlassungbelgien
UNION 	
SELECT name, vorname FROM niederlassungholland
UNION 	
SELECT name, vorname FROM niederlassungschweiz;


/* -----------------------Punkt 4---------------------*/
SELECT name, vorname FROM niederlassungbelgien
UNION	
SELECT name, vorname FROM niederlassungholland;


SELECT name, vorname, COUNT(*) cnt
FROM (
  SELECT name, vorname FROM niederlassungbelgien
  UNION ALL
  SELECT name, vorname FROM niederlassungholland
) t
GROUP BY name, vorname
HAVING COUNT(*) >= 2;

SELECT DISTINCT niederlassungbelgien.name, niederlassungbelgien.vorname 
/*DISTINCT прибирає можливі дублікати 
(на випадок, якщо співробітник кілька разів зустрічається).*/
FROM niederlassungbelgien
JOIN niederlassungholland 
	ON niederlassungholland.name = niederlassungbelgien.name
    AND niederlassungholland.vorname = niederlassungbelgien.vorname;
 
 /* -----------------------Punkt 5---------------------*/
SELECT name, vorname FROM niederlassungbelgien
UNION 	
SELECT name, vorname FROM niederlassungholland;

SELECT niederlassungholland.name, niederlassungholland.vorname
FROM niederlassungholland
LEFT JOIN niederlassungbelgien
	ON niederlassungholland.name=niederlassungbelgien.name
    AND niederlassungholland.vorname=niederlassungbelgien.vorname
WHERE niederlassungbelgien.name IS NULL;

 /* -----------------------Punkt 6---------------------*/
SELECT name, vorname, status FROM niederlassungbelgien WHERE status = 'aktiv'
UNION 	
SELECT name, vorname, status FROM niederlassungholland WHERE status = 'aktiv'
ORDER BY name;

 /* -----------------------Punkt 7---------------------*/
SELECT name, vorname FROM niederlassungbelgien
UNION 	
SELECT name, vorname FROM niederlassungholland
ORDER BY name;


