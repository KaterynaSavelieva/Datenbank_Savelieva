USE uebungsdatenbank;
CREATE TABLE kunden (
	kunden_id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(50),
    vorname varchar (50),
    email varchar (100),
    telefon varchar (20),
    geburtsdatum date
);
DESCRIBE Kunden;

DROP TABLE Kunden;