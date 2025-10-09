USE konferenz2;
-- 
ALTER TABLE themen DROP COLUMN anmeldungen;
-- 
ALTER TABLE themen DROP COLUMN freie_plaetze;
-- 
ALTER TABLE themen DROP INDEX index_titel_referent;
SET SQL_SAFE_UPDATES = 0;

-- Zeigen Sie alle Teilnehmer*innen mit dem Namen des Themas, an dem sie teilnehmen.
SELECT themen.titel AS Thema, teilnehmende.name AS Teilnehmer
FROM teilnehmer_nach_themen
JOIN teilnehmende ON teilnehmende.teilnehmer_id=teilnehmer_nach_themen.teilnehmer_id
JOIN themen 	ON themen.thema_id=teilnehmer_nach_themen.thema_id;

-- Fügen Sie einen neuen Referenten hinzu:
SELECT * FROM referenten;
INSERT INTO referenten (name, email, organisation)
VALUES ('Dr. Bauer', 'bauer@uni.at', 'FH Graz');

-- Aktualisieren Sie die Organisation eines Teilnehmers
UPDATE teilnehmende
SET organisation = 'Data Academy'
WHERE name = 'Max Mayer';

-- Löschen Sie einen Eintrag in der Tabelle teilnehmer_nach_themen:
DELETE FROM teilnehmer_nach_themen
WHERE teilnehmer_id = 2 AND thema_id = 1;

-- Erstellen Sie einen Index:
CREATE INDEX index_titel_referent ON themen (titel, referent_id);
EXPLAIN SELECT * FROM themen
WHERE titel = 'KI in der Wirtschaft'  AND referent_id = 1;

-- Überprüfen Sie mit einer Abfrage, welche Teilnehmer mehr als 1 Thema besuchen:
SELECT 
    teilnehmende.name,
    COUNT(teilnehmer_nach_themen.thema_id) AS Anzahl_Themen
FROM teilnehmende 
JOIN teilnehmer_nach_themen ON teilnehmende.teilnehmer_id = teilnehmer_nach_themen.teilnehmer_id
GROUP BY teilnehmende.name
HAVING COUNT(teilnehmer_nach_themen.thema_id) > 1;


/*
/*          1) Реєстрація учасника на тему (усе або нічого)
Умова: додай запис у teilnehmer_nach_themen і збільш лічильник реєстрацій у теми. 
Якщо будь-що піде не так — відкотити.*/
ALTER TABLE themen ADD COLUMN anmeldungen INT NOT NULL DEFAULT 0; -- підготовка: (разово) додамо лічильник реєстрацій
SELECT * FROM themen;
START TRANSACTION;
INSERT INTO teilnehmer_nach_themen (teilnehmer_id, thema_id) VALUES (1, 3);
SELECT * FROM teilnehmer_nach_themen;
UPDATE themen SET anmeldungen = anmeldungen + 1 WHERE thema_id = 3;
-- ROLLBACK; -- якщо щось пішло не так
COMMIT;

/*        2) Перенести учасника з теми A на тему B атомарно */
START TRANSACTION;
UPDATE themen SET anmeldungen = anmeldungen - 1 WHERE thema_id = 3; -- зменшуємо лічильник у старій темі
UPDATE teilnehmer_nach_themen SET thema_id = 5 WHERE teilnehmer_id = 1 AND thema_id = 3; -- міняємо зв’язок
UPDATE themen SET anmeldungen = anmeldungen + 1 WHERE thema_id = 5;-- збільшуємо лічильник у новій темі
COMMIT;

/*         3) Бронювання місця з перевіркою кількості (запобігти переповненню)
Умова: у таблиці тем є колонка freie_plaetze. Зареєструвати лише якщо є вільні місця. */
ALTER TABLE themen ADD COLUMN freie_plaetze INT NOT NULL DEFAULT 50;-- підготовка: (разово)
START TRANSACTION;
SELECT freie_plaetze FROM themen WHERE thema_id = 6 FOR UPDATE; -- «блокуюче» читання, щоби ніхто паралельно не забрав останнє місце
UPDATE themen SET freie_plaetze = freie_plaetze - 1 WHERE thema_id = 6 AND freie_plaetze > 0;-- резервуємо місце 
-- перевірка: чи справді оновлено 1 рядок
-- (якщо не оновилось — ROLLBACK)
-- у Workbench вручну:
--   якщо rows affected = 0 -> ROLLBACK;
--   інакше -> вставляємо зв’язок і COMMIT.
INSERT INTO teilnehmer_nach_themen (teilnehmer_id, thema_id) VALUES (2, 6);
COMMIT; -- якщо rows affected = 0 на UPDATE: ROLLBACK;
-- FOR UPDATE ставить блокування рядка на час транзакції, UPDATE ... AND freie_plaetze > 0 гарантує, що значення не піде в мінус.



/*      4) SAVEPOINT: частковий відкат у середині транзакції */
START TRANSACTION;
INSERT INTO teilnehmende (name, email, organisation) VALUES ('Test User', 'test@demo.de', 'Demo GmbH');
SAVEPOINT nach_teilnehmer;
INSERT INTO teilnehmer_nach_themen (teilnehmer_id, thema_id) VALUES (LAST_INSERT_ID(), 8);
ROLLBACK TO SAVEPOINT nach_teilnehmer; -- передумали реєструвати на тему:
COMMIT;-- але самого учасника залишаємо

/*        5) Пакетне додавання даних з можливістю відкату */
START TRANSACTION;
INSERT INTO referenten (name, email, organisation) VALUES ('Dr. König', 'koenig@uni.de', 'Uni Köln');
INSERT INTO themen (titel, beschreibung, referent_id) 
VALUES ('Generative KI', 'LLMs in der Praxis', LAST_INSERT_ID());
-- якщо друга вставка впаде (FK/NOT NULL), робимо:
ROLLBACK;
COMMIT;
SELECT * FROM themen;
SELECT * FROM referenten;

SET SQL_SAFE_UPDATES = 1;