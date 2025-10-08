DROP TABLE IF EXISTS anmeldungen;
DROP TABLE IF EXISTS kurse;
DROP TABLE IF EXISTS dozenten;
DROP TABLE IF EXISTS teilnehmer;
DROP TABLE IF EXISTS raeume;

DROP DATABASE IF EXISTS werkstattdb;

CREATE DATABASE werkstattdb;
USE werkstattdb;

CREATE TABLE dozenten (
	dozent_id INT PRIMARY KEY AUTO_INCREMENT,
    vorname VARCHAR(50) NOT NULL,
    nachname VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
    );
    
CREATE TABLE teilnehmer (
	teilnehmer_id INT PRIMARY KEY AUTO_INCREMENT,
	vorname VARCHAR(50) NOT NULL,
	nachname VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE
);

CREATE TABLE raeume (
	raum_id INT PRIMARY KEY AUTO_INCREMENT,
	bezeichnung VARCHAR(50) NOT NULL,
	kapazitaet INT NOT NULL
);

CREATE TABLE kurse (
	kurs_id INT PRIMARY KEY AUTO_INCREMENT,
	titel VARCHAR(100) NOT NULL,
	startdatum DATE NOT NULL,
	enddatum DATE NOT NULL,
	kapazitaet INT NOT NULL,
	dozent_id INT NOT NULL,
	raum_id INT,
	FOREIGN KEY (dozent_id) REFERENCES dozenten(dozent_id),
	FOREIGN KEY (raum_id) REFERENCES raeume(raum_id)
);

CREATE TABLE anmeldungen (
	kurs_id INT NOT NULL,
	teilnehmer_id INT NOT NULL,
	anmeldedatum DATE NOT NULL,
	status ENUM('teilgenommen','bestätigt', 'storniert') DEFAULT 'teilgenommen',
	PRIMARY KEY (kurs_id, teilnehmer_id),
	FOREIGN KEY (kurs_id) REFERENCES kurse(kurs_id),
	FOREIGN KEY (teilnehmer_id) REFERENCES teilnehmer(teilnehmer_id)
);

INSERT INTO dozenten(vorname,nachname,email) VALUES
('VornameDozent1', 'NachnameDozent1', 'VornameDozent1@gmail.com'),
('VornameDozent2', 'NachnameDozent2', 'VornameDozent2@gmail.com'),
('VornameDozent3', 'NachnameDozent3', 'VornameDozent3@gmail.com'),
('VornameDozent4', 'NachnameDozent4', 'VornameDozent4@gmail.com'),
('VornameDozent5', 'NachnameDozent5', 'VornameDozent5@gmail.com'),
('VornameDozent6', 'NachnameDozent6', 'VornameDozent6@gmail.com'),
('VornameDozent7', 'NachnameDozent7', 'VornameDozent7@gmail.com'),
('VornameDozent8', 'NachnameDozent8', 'VornameDozent8@gmail.com'),
('VornameDozent9', 'NachnameDozent9', 'VornameDozent9@gmail.com'),
('VornameDozent10', 'NachnameDozent10', 'VornameDozent10@gmail.com'),
('VornameDozent11', 'NachnameDozent11', 'VornameDozent11@gmail.com'),
('VornameDozent12', 'NachnameDozent12', 'VornameDozent12@gmail.com'),
('VornameDozent13', 'NachnameDozent13', 'VornameDozent13@gmail.com'),
('VornameDozent14', 'NachnameDozent14', 'VornameDozent14@gmail.com'),
('VornameDozent15', 'NachnameDozent15', 'VornameDozent15@gmail.com')
;


INSERT INTO teilnehmer(vorname,nachname,email) VALUES
('VornameStudent1', 'NachnameStudent1', 'VornameStudent1@gmail.com'),
('VornameStudent2', 'NachnameStudent2', 'VornameStudent2@gmail.com'),
('VornameStudent3', 'NachnameStudent3', 'VornameStudent3@gmail.com'),
('VornameStudent4', 'NachnameStudent4', 'VornameStudent4@gmail.com'),
('VornameStudent5', 'NachnameStudent5', 'VornameStudent5@gmail.com'),
('VornameStudent6', 'NachnameStudent6', 'VornameStudent6@gmail.com'),
('VornameStudent7', 'NachnameStudent7', 'VornameStudent7@gmail.com'),
('VornameStudent8', 'NachnameStudent8', 'VornameStudent8@gmail.com'),
('VornameStudent9', 'NachnameStudent9', 'VornameStudent9@gmail.com'),
('VornameStudent10', 'NachnameStudent10', 'VornameStudent10@gmail.com'),
('VornameStudent11', 'NachnameStudent11', 'VornameStudent11@gmail.com'),
('VornameStudent12', 'NachnameStudent12', 'VornameStudent12@gmail.com'),
('VornameStudent13', 'NachnameStudent13', 'VornameStudent13@gmail.com'),
('VornameStudent14', 'NachnameStudent14', 'VornameStudent14@gmail.com');


INSERT INTO raeume(bezeichnung,kapazitaet) VALUES
('Raum A',12),
('Raum B',10),
('Raum C',16),
('Raum D',14),
('Raum E',8),
('Raum F',10),
('Raum G',6),
('Raum H',6),
('Raum I',20),
('Raum J',12);


INSERT INTO kurse(titel,startdatum,enddatum,kapazitaet,dozent_id,raum_id) VALUES
('Kurs Titel 1','2025-10-01','2025-12-01',12,1,1),
('Kurs Titel 2','2025-10-01','2025-12-01',16,3,3),
('Kurs Titel 3','2025-10-01','2025-12-01',10,10,2),
('Kurs Titel 4','2025-10-01','2025-12-01',12,4,1),
('Kurs Titel 5','2025-10-01','2025-12-01',10,5,2),
('Kurs Titel 6','2025-11-01','2025-12-01',12,6,9),
('Kurs Titel 7','2025-12-01','2025-12-01',12,9,9),
('Kurs Titel 8','2025-12-01','2025-12-01',14,8,4),
('Kurs Titel 9','2025-12-01','2025-12-01',10,7,5),
('Kurs Titel 10','2025-12-01','2025-12-01',10,2,6);


INSERT INTO anmeldungen VALUES
(1,1,'2025-09-20','bestätigt'),
(1,2,'2025-09-21','storniert'),
(1,3,'2025-09-22','bestätigt'),
(2,1,'2025-09-25','teilgenommen'),
(2,4,'2025-09-26','bestätigt'),
(2,5,'2025-09-26','bestätigt'),
(2,6,'2025-09-27','bestätigt'),
(3,7,'2025-10-01','bestätigt'),
(3,8,'2025-10-01','storniert'),
(3,9,'2025-10-02','bestätigt'),
(4,1,'2025-10-05','bestätigt'),
(4,10,'2025-10-05','bestätigt'),
(5,2,'2025-10-10','storniert'),
(5,3,'2025-10-10','bestätigt'),
(6,4,'2025-10-25','bestätigt'),
(6,5,'2025-10-25','bestätigt'),
(6,6,'2025-10-26','bestätigt'),
(7,7,'2025-11-01','bestätigt'),
(7,8,'2025-11-02','bestätigt'),
(8,9,'2025-11-05','storniert'),
(8,10,'2025-11-05','bestätigt'),
(9,1,'2025-11-10','bestätigt'),
(9,2,'2025-11-10','bestätigt'),
(10,3,'2025-11-20','bestätigt');

