USE werkstattdb;

SELECT * FROM kurse;
SELECT * FROM anmeldungen;
SELECT * FROM raeume;
SELECT * FROM teilnehmer;
SELECT * FROM dozenten;

/*------------- Erstellen Sie eine VIEW, die alle Kurse mit den zugehörigen Teilnehmern zeigt.-------*/
CREATE OR REPLACE VIEW v_kurse_teilnehmenden AS
SELECT
  kurse.kurs_id, kurse.titel,
  CONCAT(dozenten.nachname, ', ', dozenten.vorname) AS Dozent,
  raeume.bezeichnung AS Raum,
  teilnehmer.teilnehmer_id,
  CONCAT(teilnehmer.nachname, ', ', teilnehmer.vorname) AS teilnehmer,
  anmeldungen.status
FROM kurse
LEFT JOIN dozenten ON dozenten.dozent_id = kurse.dozent_id
LEFT JOIN raeume ON raeume.raum_id = kurse.raum_id
LEFT JOIN anmeldungen ON anmeldungen.kurs_id = kurse.kurs_id
LEFT JOIN teilnehmer  ON teilnehmer.teilnehmer_id = anmeldungen.teilnehmer_id;

SELECT * FROM v_kurse_teilnehmenden;


/*---------------------Abfrage 1 – Kursübersicht
● Erstellen Sie eine Abfrage, die alle Kurse mit den dazugehörigen
Dozent:innen und – falls vorhanden – den zugeordneten Raum anzeigt*/ 
SELECT
  kurse.kurs_id, kurse.titel AS Kurs,
  CONCAT(dozenten.nachname, ', ', dozenten.vorname) AS Dozent,
  raeume.bezeichnung AS Raum
FROM kurse
LEFT JOIN dozenten ON dozenten.dozent_id = kurse.dozent_id
LEFT JOIN raeume ON raeume.raum_id = kurse.raum_id;


/* -----------------Abfrage 2 – Auslastung pro Kurs
● Ermitteln Sie für alle Kurse die Auslastung in Prozent*/
SELECT 
  kurse.kurs_id,
  kurse.titel,
  COUNT(anmeldungen.teilnehmer_id) AS belegte_plaetze,
  kurse.kapazitaet,
  (COUNT(anmeldungen.teilnehmer_id) / kurse.kapazitaet * 100) AS auslastung_prozent
FROM kurse
LEFT JOIN anmeldungen
  ON kurse.kurs_id = anmeldungen.kurs_id
  AND anmeldungen.status IN ('bestätigt','teilgenommen')
GROUP BY kurse.kurs_id;


/* ----------------Abfrage 3 – Dozent:innen-Ranking (Top 3)
● Erstellen Sie ein Ranking der Dozent:innen nach der Anzahl der bestätigten
oder teilgenommenen Anmeldungen.
● Begrenzen Sie die Ausgabe auf die Top 3 Dozenten.*/
SELECT 
  dozenten.dozent_id,
  CONCAT(dozenten.vorname, ' ', dozenten.nachname) AS Dozent,
  COUNT(anmeldungen.teilnehmer_id) AS Anzahl_anmeldungen,
  anmeldungen.status
FROM dozenten
JOIN kurse ON kurse.dozent_id = dozenten.dozent_id
JOIN anmeldungen ON anmeldungen.kurs_id = kurse.kurs_id AND anmeldungen.status IN ('bestätigt','teilgenommen')
GROUP BY dozenten.dozent_id, anmeldungen.status
ORDER BY anzahl_anmeldungen DESC
LIMIT 3;



/* ---------------Abfrage 4 – Kurse mit freier Kapazität im Zeitraum
● Listen Sie alle Kurse zwischen zwei frei wählbaren Daten (z. B.
01.10.2025–30.11.2025) auf, die noch freie Plätze haben. */
SELECT * FROM kurse;
SELECT 
  kurse.kurs_id,
  kurse.titel,
  kurse.startdatum,
  kurse.kapazitaet,
  COUNT(anmeldungen.teilnehmer_id) AS belegte_plaetze,
(kurse.kapazitaet - COUNT(anmeldungen.teilnehmer_id)) AS freie_plaetze
FROM kurse
LEFT JOIN anmeldungen
  ON kurse.kurs_id = anmeldungen.kurs_id
  AND anmeldungen.status IN ('bestätigt','teilgenommen')
GROUP BY kurse.kurs_id
HAVING freie_plaetze > 0
AND kurse.startdatum BETWEEN '2025-10-01' AND '2025-11-30';


/* ------------Abfrage 5 – Teilnehmerhistorie
● Geben Sie für eine bestimmte Person (Teilnehmer) alle abgeschlossenen
Kurse der Person aus.
*/

SELECT 
  teilnehmer.vorname,
  teilnehmer.nachname,
  kurse.titel,
  kurse.startdatum,
  kurse.enddatum,
  anmeldungen.status
FROM teilnehmer
JOIN anmeldungen ON anmeldungen.teilnehmer_id = teilnehmer.teilnehmer_id
JOIN kurse ON kurse.kurs_id = anmeldungen.kurs_id
WHERE teilnehmer.teilnehmer_id =3
AND anmeldungen.status IN ('bestätigt','teilgenommen')
AND kurse.enddatum < CURDATE();

-- Abfrage 6 - Ändern von Kursdaten
SELECT * FROM kurse;
UPDATE kurse SET titel = 'Kurs Titel 111', startdatum = '2025-10-08' WHERE kurs_id = 2
