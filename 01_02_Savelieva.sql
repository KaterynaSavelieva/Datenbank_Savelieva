DROP DATABASE IF EXISTS konferenz2;
CREATE DATABASE konferenz2;
USE  konferenz2;

DROP TABLE IF EXISTS teilnehmer_nach_themen;
DROP TABLE IF EXISTS themen;
DROP TABLE IF EXISTS teilnehmende;
DROP TABLE IF EXISTS referenten;

CREATE TABLE teilnehmende (
    teilnehmer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    organisation VARCHAR(100)
);

CREATE TABLE referenten (
    referent_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    organisation VARCHAR(100)
);

CREATE TABLE themen (
    thema_id INT AUTO_INCREMENT PRIMARY KEY,
    titel VARCHAR(100) NOT NULL,
    beschreibung TEXT,
    referent_id INT,
    FOREIGN KEY (referent_id) REFERENCES referenten(referent_id)
);
    
CREATE TABLE teilnehmer_nach_themen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    teilnehmer_id INT,
    thema_id INT,
    FOREIGN KEY (teilnehmer_id) REFERENCES teilnehmende(teilnehmer_id),
    FOREIGN KEY (thema_id) REFERENCES themen(thema_id)
);
	
INSERT INTO referenten (name, email, organisation)
VALUES
('Dr. Müller', 'mueller@uni.de', 'Uni Berlin'),
('Frau Schmidt', 'schmidt@firma.at', 'Firma AT'),
('Herr Wagner', 'wagner@tech.de', 'Tech Solutions GmbH'),
('Prof. Bauer', 'bauer@fh.at', 'FH Wien'),
('Dr. Novak', 'novak@company.com', 'DataVision GmbH');

INSERT INTO themen (titel, beschreibung, referent_id)
VALUES
('KI in der Wirtschaft', 'Einsatz von KI in Unternehmen', 1),
('Datenschutz', 'Neue DSGVO-Regeln', 2),
('Cloud Computing', 'Sichere Cloud-Lösungen für Firmen', 3),
('Big Data', 'Analyse großer Datenmengen', 4),
('Cybersecurity', 'Schutz vor digitalen Angriffen', 5),
('Machine Learning', 'Grundlagen des maschinellen Lernens', 1),
('Business Intelligence', 'Berichtssysteme und Analysen', 4),
('Blockchain', 'Anwendung in der Industrie', 3);

INSERT INTO teilnehmende (name, email, organisation)
VALUES
('Max Mayer', 'max.mayer@mail.de', 'Tech GmbH'),
('Lisa Klein', 'lisa.klein@mail.at', 'Data Experts'),
('Anna Schwarz', 'anna.schwarz@mail.de', 'Smart Solutions'),
('Peter Huber', 'peter.huber@mail.at', 'FinCorp'),
('Sabine Leitner', 'sabine.leitner@mail.de', 'EduSoft'),
('Michael Hofer', 'michael.hofer@mail.at', 'ITWorks'),
('Claudia Meier', 'claudia.meier@mail.de', 'Innovatech'),
('Thomas Berger', 'thomas.berger@mail.at', 'ConsultX');

INSERT INTO teilnehmer_nach_themen (teilnehmer_id, thema_id)
VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 5),
(3, 1),
(3, 6),
(4, 4),
(4, 7),
(5, 2),
(6, 3),
(6, 8),
(7, 5),
(8, 6),
(8, 1);


SELECT * FROM teilnehmer_nach_themen;

CREATE VIEW v_konferenzuebersicht AS
SELECT teilnehmende.name AS teilnehmer, themen.titel AS thema, referenten.name AS referent
FROM teilnehmer_nach_themen 
JOIN teilnehmende ON teilnehmer_nach_themen.teilnehmer_id = teilnehmende.teilnehmer_id
JOIN themen ON teilnehmer_nach_themen.thema_id = themen.thema_id
JOIN referenten ON themen.referent_id = referenten.referent_id;

SELECT * FROM v_konferenzuebersicht;









	