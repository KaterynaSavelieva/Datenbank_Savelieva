create database IF NOT EXISTS uebungsdatenbank CHARACTER SET latin1 COLLATE latin1_german1_ci;
use le02_01;

/* Lege Tabelle kreditinstitut_auszug an*/
CREATE TABLE kreditinstitut_auszug (
  bankid integer NOT NULL,
  bankleitzahl integer DEFAULT NULL,
  bezeichnung varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  plz integer DEFAULT NULL,
  ort varchar(120) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (bankid)
) ;


/*Lege Tabelle sachpraemie an */
CREATE TABLE sachpraemie(
praemieid integer primary key,
praemie varchar(300),
grund varchar(40),
preis decimal(5,2),
mitarbeiterid integer
);

/* Lege Tabelle auszubildender_alt an*/
CREATE TABLE auszubildender_alt
(
  id integer NOT NULL,
  name character varying(120),
  vorname character varying(120),
  gebdatum date,
  CONSTRAINT auszubildender_pkey PRIMARY KEY (id)
);

/* Lege Tabelle umsatzausgaben an */

create table umsatzausgaben(

id integer primary key,
jahr integer,
q1 decimal(15,3),
q2 decimal(15,3),
q3 decimal(15,3),
q4 decimal(15,3),
miete decimal(10,3),
nebkosten decimal(10,3),
personal decimal(10,3),
invest decimal(10,3)
);

/*Lege Tabelle kunde_inter an */
CREATE TABLE kunde_intern(
	kostenstelle INT PRIMARY KEY,
	abteilung VARCHAR(30) NOT NULL
);

/* Lege Tabelle anforderung_intern an */
CREATE TABLE anforderung_intern(
	anforderungnr INT PRIMARY KEY,
	datum DATE NOT NULL,
	kostenstelle_key INT,
	CONSTRAINT kostenstelle_FK
		FOREIGN KEY (kostenstelle_key)
		REFERENCES kunde_intern (kostenstelle)

);

/* Lege Tabelle material_intern an */
CREATE TABLE material_intern(
	materialnr INT PRIMARY KEY,
	materialbezeichnung VARCHAR(120) NOT NULL,
	preis DECIMAL(10,2)

);

/* Lege Tabelle anforderung_material an */
CREATE TABLE anforderung_material (
	anforderungnr_key INT,
	materialnr_key INT,
	CONSTRAINT anforderungnr_FK
		FOREIGN KEY (anforderungnr_key)
			REFERENCES anforderung_intern (anforderungnr),
	CONSTRAINT materialnr_FK
		FOREIGN KEY (materialnr_key)
			REFERENCES material_intern (materialnr)
);

/* Lege Tabelle anforderung_intern_neu an */
CREATE TABLE anforderung_intern_neu (
  anforderungnr INT primary key,
  datum DATE NOT NULL,
  sammelanforderung INT NULL,
    CONSTRAINT sammelanforderung
		FOREIGN KEY (sammelanforderung)
		REFERENCES anforderung_intern_neu (anforderungnr)
);

/* Lege Tabelle kunde_intern an */
CREATE TABLE kunde_intern_d(
	kostenstelle INT PRIMARY KEY,
	abteilung VARCHAR(30) NOT NULL
);

/* Lege Tabelle anforderung_intern_d an*/
CREATE TABLE anforderung_intern_d(
	anforderungnr INT PRIMARY KEY,
	datum DATE NOT NULL,
	kostenstelle_key INT,
	CONSTRAINT kostenstelle_FK2
		FOREIGN KEY (kostenstelle_key)
		REFERENCES kunde_intern_d (kostenstelle)

);

/* Lege Tabelle produkt an */
create table produkt(
artikelid integer primary key,
artikelbezeichnung varchar(300),
preis decimal(8,2),
kategorie varchar(200),
legierung varchar(300)
);

/* Lege Tabelle produktleerzeichen an */
create table produktleerzeichen(
artikelid integer primary key,
artikelbezeichnung varchar(300),
preis decimal(8,2),
kategorie varchar(200),
legierung varchar(300)
);

/* Lege Tabelle produktarchiv an */
create table produktarchiv(
artikelid integer primary key,
artikelbezeichnung varchar(300),
preis decimal(8,2),
kategorie varchar(200),
legierung varchar(300)

);

/* Lege Tabelle auszubildender_c an */
CREATE TABLE auszubildender_c(
id INTEGER PRIMARY KEY,
name VARCHAR(120),
vorname VARCHAR(120),
gebdatum DATE
);

/* Lege Tabelle wohnort_c an */
CREATE TABLE wohnort_c(
idadresse INTEGER PRIMARY KEY,
strasse VARCHAR(120),
hausnummer VARCHAR(120),
plz integer,
ort VARCHAR(120),
auszubildenderid INTEGER,
CONSTRAINT auszubildenderid_FK2 
FOREIGN KEY (auszubildenderid)
REFERENCES auszubildender_c(id) ON UPDATE CASCADE
);

/* Lege Tabelle auszubildender_d an */
CREATE TABLE auszubildender_d(
id INTEGER PRIMARY KEY,
name VARCHAR(120),
vorname VARCHAR(120),
gebdatum DATE
);

/* Lege Tabelle wohnort_d an */
CREATE TABLE wohnort_d(
idadresse INTEGER PRIMARY KEY,
strasse VARCHAR(120),
hausnummer VARCHAR(120),
plz integer,
ort VARCHAR(120),
auszubildenderid INTEGER,
CONSTRAINT auszubildenderid_FK3 
FOREIGN KEY (auszubildenderid)
REFERENCES auszubildender_d(id) ON DELETE CASCADE
);

/* Lege Tabelle eltern_1 an */
CREATE TABLE eltern_1(
id INTEGER PRIMARY KEY,
name VARCHAR(120),
vorname VARCHAR(120),
gebdatum DATE
);

/* Lege Tabelle kind_1 an */
CREATE TABLE kind_1(
idadresse INTEGER PRIMARY KEY,
strasse VARCHAR(120),
hausnummer VARCHAR(120),
plz integer,
ort VARCHAR(120),
auszubildenderid INTEGER,
CONSTRAINT auszubildenderid_FK4 
FOREIGN KEY (auszubildenderid)
REFERENCES eltern_1(id) ON DELETE CASCADE
);

/* Lege Tabelle personalhierarchie an */
create table personalhierarchie(
mitarbeiterid integer primary key,
name varchar(30),
vorname varchar(30),
vorgesetzterid integer,
constraint vorgesetzteridFK foreign key (vorgesetzterid) references personalhierarchie(mitarbeiterid)
);

/* Lege Tabelle ausbilder_alt an */
create table ausbilder_alt(
	id INTEGER PRIMARY KEY,
	name VARCHAR(30),
	vorname VARCHAR(30),
	gebdatum DATE,
	idauszubildender INTEGER,
	CONSTRAINT idauszubildender_FK FOREIGN KEY (idauszubildender) REFERENCES auszubildender_alt (id)
);

/* Lege Tabelle niederlassungholland an */
create table niederlassungholland(
mitarbeiterid integer primary key,
name varchar(30), 
vorname varchar(30),
status varchar(30)
);

/* Lege Tabelle niederlassungbelgien an*/
create table niederlassungbelgien(
mitarbeiterid integer primary key,
name varchar(30), 
vorname varchar(30),
status varchar(30)
);

/* Lege Tabelle niederlassungschweiz an */
create table niederlassungschweiz(
mitarbeiterid integer primary key,
name varchar(30), 
vorname varchar(30),
status varchar(30)
);

/* Lege Tabelle bonus an */
create table bonus(
bonusid integer primary key,
bonuszahlung numeric(10,2) ,
mitarbeiterid integer ,
auszahlungsdatum date

);

/* Lege Tabelle mengea an */
create table mengea(
elementid tinyint primary key,
element tinyint
);

/* Lege Tabelle mengeb an */
create table mengeb(
elementid tinyint primary key,
element tinyint
);

/* Lege Tabelle umsatz2 an */
create table umsatz2(
jahr integer,
quartal integer,
monat integer,
umsatz numeric(12,2),
constraint pk_umsatz primary key (jahr,quartal,monat)
);

/* Lege Tabelle qualifikationen an */
create table qualifikationen(
qid int primary key,
bezeichnung varchar(500),
kuerzel varchar(4),
kategorie varchar(200)

);

/* Lege Tabelle qualglobal an */
create table qualglobal(
qid int primary key,
bezeichnung varchar(500),
kuerzel varchar(4),
kategorie varchar(200)

);

/* Lege Tabelle qualglobalarchiv an */
create table qualglobalarchiv(
qid int primary key,
bezeichnung varchar(500),
kuerzel varchar(4),
kategorie varchar(200)

);

/* Lege Tabelle hardwarearchiv an */
create table hardwarearchiv(
hardwareid int primary key,
hardwarebezeichnung varchar(400),
name varchar(120),
vorname varchar(120)

);

/* Lege Tabelle hardare an */
create table hardware(
hardwareid int primary key,
hardwarebezeichnung varchar(400),
name varchar(120),
vorname varchar(120)

);

/* Lege Tabelle umsatz an */
create table umsatz(
quartal smallint primary key,
umsatz numeric(10,2)
);
/* Lege Tabelle artikel3 an*/
create table artikel3(
artikelid integer primary key,
artikelbezeichnung varchar(300),
geschmack varchar(1000)
);

/* Lege Tabelle anrede an*/
create table anrede(
geschlecht char(1) primary key,
anrede varchar(4)
);

/* Lege Tabelle artikel2 an*/
create table artikel2(
artikelid integer primary key,
artikelbezeichnung varchar(300),
geschmack varchar(1000)
);

/* Lege Tabelle artikelarchiv an*/
create table artikelarchiv(
artikelid integer primary key,
artikelbezeichnung varchar(300),
geschmack varchar(1000)
);

/* Lege Tabelle zutaten an */
create table zutaten(
zutatenid integer primary key,
zutat varchar(300)
);

/* Lege Tabelle zutatenarchiv an*/
create table zutatenarchiv(
zutatenid integer primary key,
zutat varchar(300)
);

/* Lege Tabelle mitarbeiter an*/
create table mitarbeiter(
mitarbeiterid integer primary key, 
name varchar(30), 
vorname varchar(30), 
gebdatum date,
eintrittsdatum date, 
austrittsdatum date null,
austrittsgrund varchar(30) ,
strasse varchar(40), 
hausnummer varchar(10), 
ort varchar(120), 
plz integer, 
festnetz varchar(30) null,
mobilnetz varchar(30) null,
email varchar(300) null,
umsatz numeric(10,2) null, 
bonus numeric(10,2) null, 
geschlecht char(1) null, 
abteilung varchar(120), 
krankenversicherung varchar(120), 
verheiratet char(4), 
anzahlkinder smallint, 
stundenlohn numeric(5,2), 
ueberstunden smallint,
stundenpromonat smallint,
urlaubstage smallint,
urlaubgenommen smallint,
steuerklasse varchar(40), 
bankinstitut varchar(120), 
bankleitzahl integer, 
kontonummer integer, 
monatslohn numeric(10,2) 


);


/* Lege Tabelle krankenkasse an */

create table krankenkasse(
krankenkassenid smallint primary key,
krankenkasse varchar(200),
beitragssatz decimal(4,2)
);

/* Lege Tabelle steuerklasse an*/
create table steuerklasse(
steuerklasseid smallint primary key,
steuerklasse varchar(60),
steuerklassezahl varchar(1),
infosteuerklasse varchar(3000)
);

/* Lege Tabelle kreditinstitut an */
create table kreditinstitut(
bankid integer primary key,
bankleitzahl integer,
bezeichnung varchar(120),
plz integer,
ort varchar(120)
);







/*Lege Tabelle kreditinstitutneu an*/
create table kreditinstitutneu(
id integer not null primary key auto_increment,
bankid integer,
bankleitzahl integer,
bezeichnung varchar(120),
plz integer,
ort varchar(120)
);

/* Lege Tabelle abteilung an*/
create table abteilung(
abteilungid integer primary key,
abteilunguebergeordnet integer,
abteilung varchar(120),
kostenstelle varchar(120)
);

/* Lege Tabelle konto an*/
create table konto(
	kontoid integer primary key,
	kontonummer varchar(120),
	bankid integer
);

/* Lege Tabelle mitarbeiter2 an */
create table mitarbeiter2(
mitarbeiterid integer primary key, 
name varchar(30), 
vorname varchar(30), 
gebdatum date,
abteilungid integer,
vorgesetzterid integer,
steuerklasseid smallint,
krankenkassenid integer,
kontoid integer,
eintrittsdatum date, 
austrittsdatum date null,
austrittsgrund varchar(30)
);

/* Lege Tabelle abwesendheit an */
create table abwesendheit(
abwesendheitid integer primary key,
abwesendvon date,
abwesendbis	date,
abwesendgrund varchar(200),
mitarbeiterid integer
);


/*Lege Tabelle arbeitszeit an*/
create table arbeitszeit(
arbeitszeitid integer AUTO_INCREMENT primary key,
arbeitstag date,
jahr integer,
monat integer,
tag integer,
kommen time,
gehen time,
anzahlstunden integer,
mitarbeiterid integer
);

/*Lege Tabelle arbeitszeit_auszug an*/



create table arbeitszeit_auszug(
arbeitszeitid integer AUTO_INCREMENT primary key,
arbeitstag date,
jahr integer,
monat integer,
tag integer,
kommen time,
gehen time,
anzahlstunden integer,
mitarbeiterid integer
);



/*Lege Tabelle kontakt an*/
create table kontakt(
	kontaktid integer primary key,
	festnetz varchar(30) null,
	mobilnetz varchar(30) null,
	email varchar(300) null,
	fax varchar(30) null,
	mitarbeiterid integer
);

/*Lege Tabelle urlaub an*/
create table urlaub(
urlaubid integer primary key,
urlaubstage smallint,
urlaubgenommen smallint,
mitarbeiterid integer
);

/*Lege Tabelle mitarbeiterdoppelt an*/
create table mitarbeiterdoppelt(
	name varchar(30), 
	vorname varchar(30), 
	strasse varchar(30), 
	hausnummer varchar(10), 
	ort varchar(120), 
	plz integer 
);

/*Lege Tabelle mitarbeitergleich an*/
create table mitarbeitergleich(
	name varchar(30), 
	vorname varchar(30)
);

/* Lege Tabelle produktgleich*/
create table produktgleich(
	produkt varchar(30),
	beschreibung varchar(30),
	marktbewertung tinyint

);

/* Kapitel XXX*/

CREATE TABLE infokunde (
  infoid INT NOT NULL,
  informationkunde VARCHAR(120) NULL,
  firma VARCHAR(120) NULL,
  informationkunde2 VARCHAR(120) NULL,
  bewertung TINYINT NULL
);

CREATE TABLE dsgvo (
  dsgvoid INT NOT NULL,
  firma VARCHAR(120) NULL,
  status VARCHAR(20) NULL,
  
  PRIMARY KEY (dsgvoid));
  
  CREATE TABLE premiumkunde (
  kundeid INT NOT NULL,
  firma VARCHAR(120) NULL,
  gewerblich TINYINT NULL,
  premiumstatus TINYINT NULL,
  PRIMARY KEY (kundeid));
  
   CREATE TABLE anschrift (
  anschriftid INT NOT NULL,
  strasse VARCHAR(120) NULL,
  hausnummer VARCHAR(5) NULL,
  ort VARCHAR(120) NULL,
  plz INT NULL,
  fk_kundeid INT NULL,
  PRIMARY KEY (anschriftid));
  
  /* Tabellen für Übungen*/
CREATE TABLE artikel (
  artikelid INT NOT NULL,
  bezeichnung_artikel VARCHAR(300) NOT NULL,
  hoehe DECIMAL(8,2) NOT NULL,
  breite DECIMAL(8,2) NOT NULL,
  tiefe DECIMAL(8,2) NULL,
  gewicht DECIMAL(8,2) NOT NULL,
  preis DECIMAL(8,2) NOT NULL,
  status VARCHAR(1) NULL);

CREATE TABLE artikelinfo (
  artikelid INT NOT NULL,
  bezeichnung VARCHAR(300) NOT NULL,
  hoehe DECIMAL(8,2) NOT NULL,
  breite DECIMAL(8,2) NOT NULL,
  tiefe DECIMAL(8,2) NOT NULL,
  gewicht DECIMAL(8,2) NOT NULL,
  preis DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (artikelid));
  
CREATE TABLE positionartikel (
  positionid INT NOT NULL,
  menge INT NULL,
  einheit CHAR(10) NULL,
  fk_artikelinfo_artikelid INT NULL,
  PRIMARY KEY (positionid));


/* Füge Daten in Tabelle anrede ein */
insert into anrede (geschlecht,anrede) values ('m','Herr');
insert into anrede (geschlecht,anrede) values ('w','Frau');

/* Füge Daten in Tabelle sachpraemie ein */
insert into sachpraemie values (1,'Goldende Uhr Typ 1','40 Jahre',500.00,5);
insert into sachpraemie values (2,'Goldende Uhr Typ 2','30 Jahre',300.00,5);
insert into sachpraemie values (3,'Goldende Uhr Typ 3','20 Jahre',200.00,5);
insert into sachpraemie values (4,'Goldende Uhr Typ 1','40 Jahre',500.00,10);
insert into sachpraemie values (5,'Goldende Uhr Typ 2','30 Jahre',300.00,10);
insert into sachpraemie values (6,'Goldende Uhr Typ 3','20 Jahre',200.00,10);
insert into sachpraemie values (7,'Goldende Uhr Typ 4','10 Jahre',178.00,8);
insert into sachpraemie values (8,'Goldende Uhr Typ 4','10 Jahre',178.00,8);
insert into sachpraemie values (9,'Goldende Uhr Typ 3','5 Jahre',200.00,11);




/* Füge Daten in Tabelle auszubildender_alt ein */

INSERT INTO auszubildender_alt VALUES (1,'Meier','Jörg','1970-05-03');
INSERT INTO auszubildender_alt VALUES (2,'Birkenbaum','Ralf','1985-07-20');
INSERT INTO auszubildender_alt VALUES (3,'Stern','Vladimir','1997-05-01');
INSERT INTO auszubildender_alt VALUES (4,'Sonnenschein','Max','1999-07-08');
INSERT INTO auszubildender_alt VALUES (5,'Mondschein','Karim','1969-08-01');

/* Füge Daten in Tabelle umsatzausgaben ein */


insert into umsatzausgaben values (1,2000,223000.89,148217.21,210000.53,267832.64,400000,100000,500000,5000000);
insert into umsatzausgaben values (2,2001,275000.11,150716.44,222893.21,199054.21,400500,122000,550000,500000);
insert into umsatzausgaben values (3,2002,298000.34,210898.21,318055.44,320780.94,401600,130000,600000,800000);
insert into umsatzausgaben values (4,2003,270456.32,201888.34,343567.21,301298.89,4025000,140000,650000,900000);


/* Füge Daten in Tabelle kunde_intern ein */
insert into kunde_intern values (1,'Produktion Sechskant 15mm');
insert into kunde_intern values (2,'Produktion Inbusschraube 8mm');
insert into kunde_intern values (3,'Instandsetzung Elektrik');
insert into kunde_intern values (4,'Instandsetzung Pneumatik');
insert into kunde_intern values (5,'Einkauf');
insert into kunde_intern values (6,'Controlling');
insert into kunde_intern values (7,'Qualitätsmanagment');


/* Füge Daten in Tabelle anforderung_intern ein */
insert into anforderung_intern values (1,'2000-08-01',1);
insert into anforderung_intern values (2,'2000-08-01',1);
insert into anforderung_intern values (3,'2000-08-01',1);
insert into anforderung_intern values (4,'2000-08-01',1);
insert into anforderung_intern values (5,'2000-08-01',4);
insert into anforderung_intern values (6,'2000-08-01',4);
insert into anforderung_intern values (7,'2000-08-01',4);
insert into anforderung_intern values (8,'2000-08-01',4);

insert into anforderung_intern values (9,'2000-08-01',NULL);
insert into anforderung_intern values (10,'2000-08-01',NULL);
insert into anforderung_intern values (11,'2000-08-01',NULL);


/* Füge Daten in Tabelle material_intern ein */
insert into material_intern values (1,'Öl 20L',20.50);
insert into material_intern values (2,'Schraubenzieher',5.50);
insert into material_intern values (3,'Voltmessgerät',80.50);
insert into material_intern values (4,'Luftdruckmessgerät',120.70);
insert into material_intern values (5,'Rohling Imbusschraube 100',70.50);
insert into material_intern values (6,'Rohling Sechskant 100',20.90);
insert into material_intern values (7,'Seitenschneider',15.00);



/* Füge Daten in Tabelle anforderung_material ein */
insert into anforderung_material values (1,1);
insert into anforderung_material values (2,2);
insert into anforderung_material values (3,3);
insert into anforderung_material values (4,4);
insert into anforderung_material values (5,5);
insert into anforderung_material values (6,6);
insert into anforderung_material values (7,7);
insert into anforderung_material values (8,1);
insert into anforderung_material values (1,2);
insert into anforderung_material values (2,3);
insert into anforderung_material values (3,4);
insert into anforderung_material values (4,5);
insert into anforderung_material values (5,6);
insert into anforderung_material values (6,7);
insert into anforderung_material values (7,1);
insert into anforderung_material values (8,2);


/* Füge Daten in Tabelle anforderung_intern ein */
insert into anforderung_intern_neu values (1,'2014-10-05',NULL);
insert into anforderung_intern_neu values (2,'2014-10-05',1);
insert into anforderung_intern_neu values (3,'2014-10-05',1);
insert into anforderung_intern_neu values (4,'2014-10-05',1);
insert into anforderung_intern_neu values (5,'2014-10-05',1);
insert into anforderung_intern_neu values (6,'2014-05-01',NULL);
insert into anforderung_intern_neu values (7,'2014-05-01',6);
insert into anforderung_intern_neu values (8,'2014-05-01',6);
insert into anforderung_intern_neu values (9,'2014-05-01',6);
insert into anforderung_intern_neu values (10,'2014-05-01',6);
insert into anforderung_intern_neu values (11,'2014-05-01',6);
insert into anforderung_intern_neu values (12,'2014-07-20',NULL);
insert into anforderung_intern_neu values (13,'2014-07-20',12);
insert into anforderung_intern_neu values (14,'2014-07-20',12);
insert into anforderung_intern_neu values (15,'2014-07-20',12);
insert into anforderung_intern_neu values (16,'2014-04-18',NULL);
insert into anforderung_intern_neu values (17,'2014-04-18',16);
insert into anforderung_intern_neu values (18,'2014-04-18',16);
insert into anforderung_intern_neu values (19,'2014-04-18',16);


/* Füge Daten in Tabelle kunde_intern_d ein */
insert into kunde_intern_d values (1,'Produktion Sechskant 15mm');
insert into kunde_intern_d values (2,'Produktion Imbusschraube 8mm');
insert into kunde_intern_d values (3,'Instandsetzung Elektrik');
insert into kunde_intern_d values (4,'Instandsetzung Pneumatik');
insert into kunde_intern_d values (5,'Einkauf');
insert into kunde_intern_d values (6,'Controlling');
insert into kunde_intern_d values (7,'Qualitätsmanagment');

/* Füge Daten in Tabelle anforderung_intern_d ein */
insert into anforderung_intern_d values (1,'2000-08-01',1);
insert into anforderung_intern_d values (2,'2000-08-01',1);
insert into anforderung_intern_d values (3,'2000-08-01',1);
insert into anforderung_intern_d values (4,'2000-08-01',1);
insert into anforderung_intern_d values (5,'2000-08-01',4);
insert into anforderung_intern_d values (6,'2000-08-01',4);
insert into anforderung_intern_d values (7,'2000-08-01',4);
insert into anforderung_intern_d values (8,'2000-08-01',4);


/* Füge Daten in Tabelle produkt ein */
insert into produkt values (1,'Schraube 1',2.56,'Schrauben','Zink/Eisen');
insert into produkt values (2,'Schraube 2',2.30,'Schrauben','Kupfer/Eisen');
insert into produkt values (3,'Schraube 3',2.21,'Schrauben','Nickel/Eisen');
insert into produkt values (4,'Schraube 4',2.11,'Schrauben','Gold/Eisen');
insert into produkt values (5,'Schraube 5',1.50,'Schrauben','Silber/Eisen');



/* Füge Daten in Tabelle produktleerzeichen ein */
insert into produktleerzeichen values (1,'      Schraube 1',2.56,'Schrauben','      Zink/Eisen    ');
insert into produktleerzeichen values (2,'Schraube 2        ',2.30,'Schrauben','    Kupfer/Eisen');
insert into produktleerzeichen values (3,'      Schraube 3      ',2.21,'Schrauben','Nickel/Eisen    ');
insert into produktleerzeichen values (4,'	Schraube 4',2.11,'Schrauben','    Gold/Eisen');
insert into produktleerzeichen values (5,'	Schraube 5	',1.50,'Schrauben','    Silber/Eisen    ');




/* Füge Daten in Tabelle produktarchiv ein */
insert into produktarchiv values (100,'Schraube A',2.56,'Schrauben','Zink/Eisen');
insert into produktarchiv values (101,'Schraube 2',2.30,'Schrauben','Kupfer/Eisen');
insert into produktarchiv values (102,'Schraube B',2.21,'Schrauben','Nickel/Eisen');
insert into produktarchiv values (103,'Schraube 4',2.11,'Schrauben','Gold/Eisen');
insert into produktarchiv values (104,'Schraube C',1.50,'Schrauben','Silber/Eisen');



/* Füge Daten in Tabelle auszubildender_c ein */
INSERT INTO auszubildender_c VALUES (1,'Meier','Jörg','1970-05-03');
INSERT INTO auszubildender_c VALUES (2,'Birkenbaum','Ralf','1985-07-20');
INSERT INTO auszubildender_c VALUES (3,'Stern','Vladimir','1997-05-01');
INSERT INTO auszubildender_c VALUES (4,'Sonnenschein','Max','1999-07-08');
INSERT INTO auszubildender_c VALUES (5,'Mondschein','Karim','1969-08-01');

/* Füge Daten in Tabelle wohnort_c ein */
INSERT INTO wohnort_c VALUES (1,'Plutostraße','8A',50000,'Bonn',1);
INSERT INTO wohnort_c VALUES (2,'Marsstraße','757C',50000,'Köln',2);
INSERT INTO wohnort_c VALUES (3,'Mondstraße','3',50000,'Bonn',NULL);
INSERT INTO wohnort_c VALUES (4,'Mondstraße','3',50000,'Bonn',3);
INSERT INTO wohnort_c VALUES (5,'Sonnestraße', '8',50000,'Bonn',5);
INSERT INTO wohnort_c VALUES (6,'Sternstraße','54',51000,'Köln',4);
INSERT INTO wohnort_c VALUES (7,'Komentenweg','33',50000,'Bonn',5);



/* Füge Daten in Tabelle auszubildender_d ein */
INSERT INTO auszubildender_d VALUES (1,'Meier','Jörg','1970-05-03');
INSERT INTO auszubildender_d VALUES (2,'Birkenbaum','Ralf','1985-07-20');
INSERT INTO auszubildender_d VALUES (3,'Stern','Vladimir','1997-05-01');
INSERT INTO auszubildender_d VALUES (4,'Sonnenschein','Max','1999-07-08');
INSERT INTO auszubildender_d VALUES (5,'Mondschein','Karim','1969-08-01');


/* Füge Daten in Tabelle wohnort_d ein */
INSERT INTO wohnort_d VALUES (1,'Plutostraße','8A',50000,'Bonn',1);
INSERT INTO wohnort_d VALUES (2,'Marsstraße','757C',50000,'Köln',2);
INSERT INTO wohnort_d VALUES (3,'Mondstraße','3',50000,'Bonn',NULL);
INSERT INTO wohnort_d VALUES (4,'Mondstraße','3',50000,'Bonn',3);
INSERT INTO wohnort_d VALUES (5,'Sonnestraße', '8',50000,'Bonn',5);
INSERT INTO wohnort_d VALUES (6,'Sternstraße','54',51000,'Köln',4);
INSERT INTO wohnort_d VALUES (7,'Komentenweg','33',50000,'Bonn',5);



/* Füge Daten in Tabelle eltern_1 ein */
INSERT INTO eltern_1 VALUES (1,'Meier','Jörg','1970-05-03');
INSERT INTO eltern_1 VALUES (2,'Birkenbaum','Ralf','1985-07-20');
INSERT INTO eltern_1 VALUES (3,'Stern','Vladimir','1997-05-01');
INSERT INTO eltern_1 VALUES (4,'Sonnenschein','Max','1999-07-08');
INSERT INTO eltern_1 VALUES (5,'Mondschein','Karim','1969-08-01');


/* Füge Daten in Tabelle kind_1 ein */
INSERT INTO kind_1 VALUES (1,'Plutostraße','8A',50000,'Bonn',1);
INSERT INTO kind_1 VALUES (2,'Marsstraße','757C',50000,'Köln',2);
INSERT INTO kind_1 VALUES (3,'Mondstraße','3',50000,'Bonn',NULL);
INSERT INTO kind_1 VALUES (4,'Mondstraße','3',50000,'Bonn',3);
INSERT INTO kind_1 VALUES (5,'Sonnestraße', '8',50000,'Bonn',5);
INSERT INTO kind_1 VALUES (6,'Sternstraße','54',51000,'Köln',4);
INSERT INTO kind_1 VALUES (7,'Komentenweg','33',50000,'Bonn',5);



/* Füge Daten in Tabelle personalhierarchie ein */
insert into personalhierarchie values(19,'Heier','Peter',NULL);
insert into personalhierarchie values(1,'Müller','Ralf',19);
insert into personalhierarchie values(2,'Schneider','Petra',1);
insert into personalhierarchie values(3,'Klein','Thomas',1);
insert into personalhierarchie values(4,'Lang','Ute',1);
insert into personalhierarchie values(5,'Eisenhof','Frank',1);
insert into personalhierarchie values(8,'Müller','Iris',19);
insert into personalhierarchie values(6,'Lupin','Anja',1);
insert into personalhierarchie values(7,'Lempe','Dirk',8);

insert into personalhierarchie values(9,'Ludwig','Heinz',8);
insert into personalhierarchie values(10,'Klarfeld','Simone',8);
insert into personalhierarchie values(11,'Schmidt','Werner',8);
insert into personalhierarchie values(12,'Funke','Doris',8);
insert into personalhierarchie values(18,'Sebastiansen','Inge',19);
insert into personalhierarchie values(13,'Nolte','Reinhard',18);
insert into personalhierarchie values(14,'Jule','Stefanie',18);
insert into personalhierarchie values(15,'Engels','Karl',18);
insert into personalhierarchie values(16,'Franke','Elisabeth',19);
insert into personalhierarchie values(17,'Petersen','Hans',18);


insert into personalhierarchie values(20,'Steinmacher','Ilse',19);
insert into personalhierarchie values(23,'Stein','Rolf',19);
insert into personalhierarchie values(21,'Überall','Georg',23);
insert into personalhierarchie values(22,'Klein','Bärbel',23);

insert into personalhierarchie values(24,'Groß','Vera',23);
insert into personalhierarchie values(25,'Funke','Andreas',23);
insert into personalhierarchie values(26,'Engels','Sabine',23);
insert into personalhierarchie values(27,'Paulus','Sebastian',23);
insert into personalhierarchie values(28,'Winscheidt','Elke',23);
insert into personalhierarchie values(29,'Blume','Siegmar',23);
insert into personalhierarchie values(30,'Mey','Tanja',23);
insert into personalhierarchie values(46,'Dorsten','Klaus',19);
insert into personalhierarchie values(31,'Gelz','Oliver',46);
insert into personalhierarchie values(32,'Lorenz','Tina',46);
insert into personalhierarchie values(33,'Maier','Tim',46);
insert into personalhierarchie values(34,'Winter','Elise',46);
insert into personalhierarchie values(35,'Obendorf','Karl',46);
insert into personalhierarchie values(36,'Sommer','Werner',46);
insert into personalhierarchie values(37,'Trost','Elvira',46);
insert into personalhierarchie values(38,'Friedrichs','Martin',46);
insert into personalhierarchie values(39,'Ludowig','Carmen',46);
insert into personalhierarchie values(40,'Serenius','Ingo',46);
insert into personalhierarchie values(41,'Mey','Lisa',46);
insert into personalhierarchie values(42,'Sonnenfeld','Udo',46);
insert into personalhierarchie values(43,'Kanis','Herbert',46);
insert into personalhierarchie values(44,'Santus','Cornelia',46);
insert into personalhierarchie values(45,'Oberscheidt','Michael',46);

insert into personalhierarchie values(53,'Hirsch','Thomas',19);
insert into personalhierarchie values(47,'Meier','Jörg',53);
insert into personalhierarchie values(48,'Birkenbaum','Ralf',53);
insert into personalhierarchie values(49,'Stern','Vladimir',53);
insert into personalhierarchie values(50,'Sonnenschein','Max',53);
insert into personalhierarchie values(51,'Mondschein','Karim',53);
insert into personalhierarchie values(52,'Meier','Heinz',53);



/* Füge Daten in Tabelle ausbilder_alt ein */
insert into ausbilder_alt values (1,'Meier','Heinz','1968-05-02',3);
insert into ausbilder_alt values (2,'Meier','Heinz','1968-05-02',2);
insert into ausbilder_alt values (3,'Meier','Heinz','1968-05-02',4);
insert into ausbilder_alt values (4,'Hirsch','Thomas','1969-01-11',1);
insert into ausbilder_alt values (5,'Hirsch','Thomas','1969-01-11',5);

/* Füge Daten in Tabelle niederlassungholland ein */
insert into niederlassungholland values (1,'Müller','Ralf','aktiv');
insert into niederlassungholland values (2,'Klein','Thomas','inaktiv');
insert into niederlassungholland values (3,'Lang','Ute','aktiv');
insert into niederlassungholland values (4,'Eisenhof','Frank','aktiv');
insert into niederlassungholland values (5,'Schneider','Petra','inaktiv');
insert into niederlassungholland values (6,'Lupin','Anja','aktiv');

/* Füge Daten in Tabelle niederlassungbelgien ein */
insert into niederlassungbelgien values (1,'Klein','Thomas','aktiv');
insert into niederlassungbelgien values (2,'Eisenhof','Frank','inaktiv');
insert into niederlassungbelgien values (3,'Lang','Ute','inaktiv');
insert into niederlassungbelgien values (4,'Lempe','Dirk','aktiv');
insert into niederlassungbelgien values (5,'Müller','Iris','inaktiv');
insert into niederlassungbelgien values (6,'Ludiwig','Heinz','aktiv');

/* Füge Daten in Tabelle niederlassungschweiz ein */
insert into niederlassungschweiz values (1,'Müller','Iris','aktiv');
insert into niederlassungschweiz values (2,'Ludiwig','Heinz','inaktiv');
insert into niederlassungschweiz values (3,'Lempe','Dirk','inaktiv');
insert into niederlassungschweiz values (4,'Klarfeld','Simone','aktiv');
insert into niederlassungschweiz values (5,'Schmidt','Wernder','aktiv');
insert into niederlassungschweiz values (6,'Funke','Doris','inaktiv');
insert into niederlassungschweiz values (7,'Lupin','Anja','inaktiv');




/* Füge Daten in Tabelle mengea ein */

insert into mengea values(1,1);
insert into mengea values(2,2);
insert into mengea values(3,3);
insert into mengea values(4,4);
insert into mengea values(5,5);
insert into mengea values(6,6);
insert into mengea values(7,8);

/* Füge Daten in Tabelle mengeb ein */
insert into mengeb values(1,2);
insert into mengeb values(2,5);
insert into mengeb values(3,6);
insert into mengeb values(4,7);
insert into mengeb values(5,8);
insert into mengeb values(6,9);
insert into mengeb values(7,10);




/* Füge Daten in Tabelle qualglobal ein */
insert into qualglobal values (1,'Datenbankprogrammierung','DAT','Informatik');
insert into qualglobal values (2,'Second Level Support','SLS','Informatik');
insert into qualglobal values (3,'First Level Support','FLS','Informatik');
insert into qualglobal values (4,'SAP Help Desk','SHD','Office');
insert into qualglobal values (5,'Excel','EXC','Office');
insert into qualglobal values (6,'Word','WOR','Office');
insert into qualglobal values (7,'Power Point','POW','Office');


/* Füge Daten in Tabelle qualglobalarchiv ein */
insert into qualglobalarchiv values (1,'Projektsoftware','PRO','Office');
insert into qualglobalarchiv values (2,'E-Mail','EMA','Office');
insert into qualglobalarchiv values (3,'Datenbankzugriff','DAT','Office');
insert into qualglobalarchiv values (4,'Kalender','KAL','Office');
insert into qualglobalarchiv values (5,'Tabellenkalkulation','TKA','Office');
insert into qualglobalarchiv values (6,'Textverarbeitung','TEX','Office');
insert into qualglobalarchiv values (7,'Präsentationssoftware','PRÄ','Office');



/* Füge Daten in Tabelle hardwarearchiv ein */
insert into hardwarearchiv values (1,'Drucker','Lempe','Dirk');
insert into hardwarearchiv values (2,'PC','Lempe','Dirk');
insert into hardwarearchiv values (3,'Notebook','Lempe','Dirk');
insert into hardwarearchiv values (4,'Drucker','Müller','Ralf');
insert into hardwarearchiv values (5,'PC','Müller','Ralf');
insert into hardwarearchiv values (6,'Notebook','Müller','Ralf');



/* Füge Daten in Tabelle hardware ein */
insert into hardware values (1,'Drucker','Lempe','Dirk');
insert into hardware values (2,'PC','Lempe','Dirk');
insert into hardware values (3,'Notebook','Lempe','Dirk');
insert into hardware values (4,'Drucker','Müller','Ralf');
insert into hardware values (5,'PC','Müller','Ralf');


/* Füge Daten in Tabelle umsatz2 ein */
insert into umsatz2 values (2000,1,1,200000);
insert into umsatz2 values (2000,1,2,340000);
insert into umsatz2 values (2000,1,3,500000);
insert into umsatz2 values (2000,2,4,60000000);
insert into umsatz2 values (2000,2,5,450000);
insert into umsatz2 values (2000,2,6,80000000);
insert into umsatz2 values (2000,3,7,430000);
insert into umsatz2 values (2000,3,8,200000);
insert into umsatz2 values (2000,3,9,6890000);
insert into umsatz2 values (2000,4,10,4500);
insert into umsatz2 values (2000,4,11,6000000);
insert into umsatz2 values (2000,4,12,8500000);

/* Füge Daten in Tabelle bonus ein */
insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(1,5000.00,1,'2012.08.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(2,7000.00,8,'2012.01.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(3,4000.00,12,'2012.02.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(4,12000.00,26,'2012.03.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(5,8000.00,30,'2012.04.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(6,15000.00,38,'2012.09.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(7,9000.00,40,'2012.12.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(8,3000.00,45,'2012.08.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(9,6000.00,44,'2012.01.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(10,1800.00,1,'2012.02.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(11,3800.00,8,'2012.03.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(12,4500.00,12,'2012.03.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(13,8900.00,26,'2012.09.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(14,2500.00,30,'2012.12.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(15,6800.00,38,'2012.08.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(16,7200.00,40,'2012.01.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(17,6800.00,44,'2012.02.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(18,4300.00,45,'2012.03.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(19,1000.00,1,'2012.04.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(21,1800.00,8,'2012.09.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(22,6700.00,12,'2012.12.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(23,18000.00,26,'2012.08.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(24,4200.00,30,'2012.01.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(25,4100.00,38,'2012.02.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(26,5700.00,40,'2012.04.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(27,4300.00,44,'2012.04.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(28,6980.00,45,'2012.09.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(29,8000.00,1,'2012.12.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(30,3000.00,8,'2012.08.01');

insert into  bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(31,4440.00,12,'2012.01.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(32,5800.00,26,'2012.02.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(33,1200.00,30,'2012.03.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(34,8980.00,38,'2012.04.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(35,9800.00,40,'2012.09.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(36,4670.00,44,'2012.12.01');

insert into  bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(37,7800.00,45,'2012.08.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(38,2000.00,1,'2012.01.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(39,1600.00,8,'2012.02.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(40,2500.00,12,'2012.03.01');


insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(41,3200.00,26,'2012.04.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(42,1600.00,30,'2012.09.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(43,15000.00,38,'2012.12.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(44,15000.00,40,'2012.08.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(45,7100.00,44,'2012.01.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(46,8500.00,45,'2012.02.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(47,9000.00,1,'2012.03.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(48,1200.00,8,'2012.04.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(49,2500.00,12,'2012.09.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(50,5500.00,26,'2012.12.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(51,6800.00,30,'2012.08.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(52,7100.00,38,'2012.01.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(53,3300.00,40,'2012.02.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(54,2300.00,44,'2012.03.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(55,6800.00,45,'2012.04.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(56,11700.00,1,'2012.09.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(57,14800.00,8,'2012.12.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(58,17800.00,12,'2012.08.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(59,20000.00,26,'2012.01.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(60,3400.00,30,'2012.02.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(61,30000000,23,'2013.08.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(62,45000000,10,'2013.02.01');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(63,10000,NULL,'2012.05.12');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(64,5000,NULL,'2014.06.20');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(65,20000,NULL,'2015.04.18');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(66,25000,NULL,'2012.11.06');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(67,18000,NULL,'2013.01.23');


insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(68,NULL,10,'2014.10.11');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(69,NULL,10,'2011.03.11');

insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(70,NULL,10,'2012.02.20');
insert into bonus (bonusid,bonuszahlung,mitarbeiterid,auszahlungsdatum)
values(71,2000000,10,'2013.04.10');



/* Füge Daten in Tabelle umsatz ein */
insert into umsatz (quartal,umsatz) values(1,5455000.23);
insert into umsatz (quartal,umsatz) values(2,12678000.50);
insert into umsatz (quartal,umsatz) values(3,2160000.83);
insert into umsatz (quartal,umsatz) values(4,17566000.78);

/* Füge Daten in Tabelle artikel3 ein */
insert into artikel3 (artikelid,artikelbezeichnung,geschmack) values (1,'Frucht Color Tux Pinguine','Extrem fruchtig');
insert into artikel3 (artikelid,artikelbezeichnung,geschmack) values (2,'Süsse Fruchtgummi Pinguine','Sehr süße Pinguine');
insert into artikel3 (artikelid,artikelbezeichnung,geschmack) values (3,'Lakritz Pinguine','Schmeckt sehr intensiv nach Lakritz');
insert into artikel3 (artikelid,artikelbezeichnung,geschmack) values (4,'Pinguinschnecken','Fruchtig und süß mit Rollerlebnis');
insert into artikel3 (artikelid,artikelbezeichnung,geschmack) values (5,'Saure Pinguin Tux Stäbchen','Sauer und bissfest');


/* Füge Daten in Tabelle artikel2 ein */
insert into artikel2 (artikelid,artikelbezeichnung,geschmack) values (1,'        Frucht Color Tux Pinguine ','Extrem fruchtig                                ');
insert into artikel2 (artikelid,artikelbezeichnung,geschmack) values (2,'           Süsse Fruchtgummi Pinguine               ','       Sehr süssee Pinguine');
insert into artikel2 (artikelid,artikelbezeichnung,geschmack) values (3,'Lakritz Pinguine','Schmeckt sehr intensiv nach Lakritz');
insert into artikel2 (artikelid,artikelbezeichnung,geschmack) values (4,'Pinguinschnecken                   ','               Fruchtig und süß mit Rollerlebnis');
insert into artikel2 (artikelid,artikelbezeichnung,geschmack) values (5,'         Saure Pinguin Tux Stäbchen      ','Sauer und bissfest			');




/* Füge Daten in Tabelle artikelarchvi ein */
insert into artikelarchiv (artikelid,artikelbezeichnung,geschmack) values (1,'Frucht Color Tux Pinguine','Extrem fruchtig');
insert into artikelarchiv (artikelid,artikelbezeichnung,geschmack) values (2,'Süsse Fruchtgummi Pinguine','Sehr süße Pinguine');
insert into artikelarchiv (artikelid,artikelbezeichnung,geschmack) values (3,'Lakritz Pinguine','Schmeckt sehr intensiv nach Lakritz');
insert into artikelarchiv (artikelid,artikelbezeichnung,geschmack) values (4,'Pinguinschnecken','Fruchtig und süß mit Rollerlebnis');
insert into artikelarchiv (artikelid,artikelbezeichnung,geschmack) values (5,'Saure Pinguin Tux Stäbchen','Sauer und bissfest');
insert into artikelarchiv (artikelid,artikelbezeichnung,geschmack) values (6,'Eisbären Fruchtgummi','Sehr erfrischend fruchtig');
insert into artikelarchiv (artikelid,artikelbezeichnung,geschmack) values (7,'Robben Ingwer Lakritz ','Laktitzgeschmack mit einem Hauch Ingwer');
insert into artikelarchiv (artikelid,artikelbezeichnung,geschmack) values (8,'Wahlrossschnecken','Süß und sauer');
insert into artikelarchiv (artikelid,artikelbezeichnung,geschmack) values (9,'Rentierdrops','Kernig sauer');
insert into artikelarchiv (artikelid,artikelbezeichnung,geschmack) values (10,'Polarhasen Flummi','Extrem salzig');

/* Füge Daten in Tabelle zutaten ein */
insert into zutaten (zutatenid,zutat) values (1,'Zitronensaft');
insert into zutaten (zutatenid,zutat) values (2,'Honig');
insert into zutaten (zutatenid,zutat) values (3,'Apfelsirup');
insert into zutaten (zutatenid,zutat) values (4,'Orangensirup');
insert into zutaten (zutatenid,zutat) values (5,'Waldmeistersirup');
insert into zutaten (zutatenid,zutat) values (6,'Kirschsirup');
insert into zutaten (zutatenid,zutat) values (7,'Wasser');
insert into zutaten (zutatenid,zutat) values (8,'Gelatine');
insert into zutaten (zutatenid,zutat) values (9,'Speisestärke');

/* Füge Daten in Tabelle zutatenarchiv ein */
insert into zutatenarchiv (zutatenid,zutat) values (5,'Waldmeistersirup');
insert into zutatenarchiv (zutatenid,zutat) values (6,'Kirschsirup');
insert into zutatenarchiv (zutatenid,zutat) values (7,'Wasser');
insert into zutatenarchiv (zutatenid,zutat) values (8,'Gelatine');
insert into zutatenarchiv (zutatenid,zutat) values (9,'Speisestärke');
insert into zutatenarchiv (zutatenid,zutat) values (20,'Senfsirup');
insert into zutatenarchiv (zutatenid,zutat) values (21,'Pfeffersirup');
insert into zutatenarchiv (zutatenid,zutat) values (33,'Kohlrabisirup');
insert into zutatenarchiv (zutatenid,zutat) values (41,'Grühnkohlsirup');
insert into zutatenarchiv (zutatenid,zutat) values (53,'Sauerkrautsirup');
insert into zutatenarchiv (zutatenid,zutat) values (65,'Blumenkohlsirup');
insert into zutatenarchiv (zutatenid,zutat) values (70,'Wirsingsirup');
insert into zutatenarchiv (zutatenid,zutat) values (82,'Rotkohlsirup');
insert into zutatenarchiv (zutatenid,zutat) values (91,'Weißkohlsirup');


/* Füge Daten in Tabelle krankenkasse ein */
insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(1,'AOK Baden-Württemberg',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(2,'AOK Bayern',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(3,'AOK Bremen/Bremerhaven',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(4,'AOK Hessen',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(5,'AOK Niedersachsen',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(6,'AOK Nordost',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(7,'AOK Nordwest',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(8,'AOK PLUS',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(9,'AOK Rheinland-Pfalz/Saarland',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(10,'AOK Rheinland/Hamburg',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(11,'AOK Sachsen-Anhalt',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(12,'BARMER GEK',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(13,'DAK Gesundheit',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(14,'HEK - Hanseatische Krankenkasse',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(15,'hkk Krankenkasse',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(16,'KKH-Allianz',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(17,'Knappschaft',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(18,'Techniker Krankenkasse - TK',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(19,'BIG direkt gesund',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(20,'IKK Brandenburg und Berlin',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(21,'IKK classic',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(22,'IKK gesund plus',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(23,'IKK Nord',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(24,'IKK Südwest',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(25,'Actimonda Krankenkasse',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(26,'atlas BKK ahlmann',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(27,'Audi BKK',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(28,'BAHN-BKK',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(29,'BERGISCHE Krankenkasse',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(30,'Bertelsmann BKK',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(31,'BKK A.T.U.',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(32,'BKK Achenbach Buschhütten',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(33,'BKK advita',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(34,'BKK Aesculap',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(35,'BKK Akzo Nobel Bayern',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(36,'BKK AXEL SPRINGER - jezt: DAK Gesundheit',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(37,'BKK B. Braun',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(38,'BKK Basell',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(39,'BKK Beiersdorf AG',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(40,'BKK BJB',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(41,'BKK BMW',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(42,'BKK BPW Wiehl',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(43,'BKK Braun-Gillette',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(44,'BKK Demag Krauss-Maffei',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(45,'BKK der SIEMAG',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(46,'BKK der Thüringer Energieversorgung',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(47,'BKK Diakonie',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(48,'BKK Ernst & Young',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(49,'BKK ESSANELLE',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(50,'BKK EUREGIO',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(51,'BKK EWE',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(52,'BKK exklusiv',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(53,'BKK Faber-Castell & Partner',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(54,'BKK firmus',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(55,'BKK Freudenberg',15.5);

insert into krankenkasse 
(krankenkassenid,krankenkasse,beitragssatz)
values
(56,'mhplus Krankenkasse',15.5);







/* Füge Daten in Tabelle steuerklasse ein */
insert into steuerklasse (steuerklasseid,steuerklasse,steuerklassezahl,infosteuerklasse)
values (1,'Steuerklasse 1','1','Ledig, oder in einer Lebensgemeinschaft');

insert into steuerklasse (steuerklasseid,steuerklasse,steuerklassezahl,infosteuerklasse)
values (2,'Steuerklasse 2','2','Alleinerziehend');

insert into steuerklasse (steuerklasseid,steuerklasse,steuerklassezahl,infosteuerklasse)
values (3,'Steuerklasse 3','3','Verheiratet, ein Ehepartner ist nicht berufstätig');

insert into steuerklasse (steuerklasseid,steuerklasse,steuerklassezahl,infosteuerklasse)
values (4,'Steuerklasse 4','4','Verheiratet, beide Ehepartner sind berufstätig');

insert into steuerklasse (steuerklasseid,steuerklasse,steuerklassezahl,infosteuerklasse)
values (5,'Steuerklasse 5','5','Verheiratet, beide Ehepartner sind berufstätig, es wurden die Steuerklassen 3 und 5 gewählt');
insert into steuerklasse (steuerklasseid,steuerklasse,steuerklassezahl,infosteuerklasse)
values (6,'Steuerklasse 6','6','Der Arbeitnehmer ist führ mehrere Arbeitgeber tätig');




/* Füge Daten in Tabelle abteilung ein */


insert into abteilung(abteilungid,abteilunguebergeordnet,abteilung,kostenstelle) values (1,7,'Einkauf','x57g');
insert into abteilung(abteilungid,abteilunguebergeordnet,abteilung,kostenstelle) values (2,7,'Vertrieb','x68g');
insert into abteilung(abteilungid,abteilunguebergeordnet,abteilung,kostenstelle) values (3,6,'Controlling','x82g');
insert into abteilung(abteilungid,abteilunguebergeordnet,abteilung,kostenstelle) values (4,7,'Verkauf','x92g');
insert into abteilung(abteilungid,abteilunguebergeordnet,abteilung,kostenstelle) values (5,6,'Personal','x92g');
insert into abteilung(abteilungid,abteilunguebergeordnet,abteilung,kostenstelle) values (6,8,'Unternehmensentwicklung','5ag7');
insert into abteilung(abteilungid,abteilunguebergeordnet,abteilung,kostenstelle) values (7,8,'operations','zu87');
insert into abteilung(abteilungid,abteilunguebergeordnet,abteilung,kostenstelle) values (8,null,'Unternehmensleitung','bh89');



/* Füge Daten in Tabelle konto ein */
insert into konto(kontoid,kontonummer,bankid) values (1,'a00000000000',55);
insert into konto(kontoid,kontonummer,bankid) values (2,'b00000000000',110);
insert into konto(kontoid,kontonummer,bankid) values (3,'c00000000000',1555);
insert into konto(kontoid,kontonummer,bankid) values (4,'d00000000000',5468);
insert into konto(kontoid,kontonummer,bankid) values (5,'e00000000000',10455);
insert into konto(kontoid,kontonummer,bankid) values (6,'f00000000000',15455);
insert into konto(kontoid,kontonummer,bankid) values (7,'g00000000000',16456);
insert into konto(kontoid,kontonummer,bankid) values (8,'h00000000000',17546);
insert into konto(kontoid,kontonummer,bankid) values (9,'i00000000000',18321);
insert into konto(kontoid,kontonummer,bankid) values (10,'j00000000000',11020);
insert into konto(kontoid,kontonummer,bankid) values (11,'k00000000000',12713);
insert into konto(kontoid,kontonummer,bankid) values (12,'l00000000000',11111);
insert into konto(kontoid,kontonummer,bankid) values (13,'m00000000000',11112);
insert into konto(kontoid,kontonummer,bankid) values (14,'n00000000000',12424);
insert into konto(kontoid,kontonummer,bankid) values (15,'o00000000000',12154);
insert into konto(kontoid,kontonummer,bankid) values (16,'p00000000000',14732);
insert into konto(kontoid,kontonummer,bankid) values (17,'q00000000000',15554);
insert into konto(kontoid,kontonummer,bankid) values (18,'r00000000000',17231);
insert into konto(kontoid,kontonummer,bankid) values (19,'s00000000000',17444);
insert into konto(kontoid,kontonummer,bankid) values (20,'t00000000000',3332);
insert into konto(kontoid,kontonummer,bankid) values (21,'u00000000000',987);
insert into konto(kontoid,kontonummer,bankid) values (22,'v00000000000',1256);
insert into konto(kontoid,kontonummer,bankid) values (23,'w00000000000',1378);
insert into konto(kontoid,kontonummer,bankid) values (24,'x00000000000',1813);
insert into konto(kontoid,kontonummer,bankid) values (25,'y00000000000',1645);
insert into konto(kontoid,kontonummer,bankid) values (26,'z00000000000',14387);
insert into konto(kontoid,kontonummer,bankid) values (27,'A00000000000',982);
insert into konto(kontoid,kontonummer,bankid) values (28,'B00000000000',6532);
insert into konto(kontoid,kontonummer,bankid) values (29,'C00000000000',7812);
insert into konto(kontoid,kontonummer,bankid) values (30,'D00000000000',3210);
insert into konto(kontoid,kontonummer,bankid) values (31,'E00000000000',16329);
insert into konto(kontoid,kontonummer,bankid) values (32,'F00000000000',256);
insert into konto(kontoid,kontonummer,bankid) values (33,'G00000000000',512);
insert into konto(kontoid,kontonummer,bankid) values (34,'H00000000000',1024);
insert into konto(kontoid,kontonummer,bankid) values (35,'I00000000000',2048);
insert into konto(kontoid,kontonummer,bankid) values (36,'J00000000000',4096);
insert into konto(kontoid,kontonummer,bankid) values (37,'K00000000000',7832);
insert into konto(kontoid,kontonummer,bankid) values (38,'L00000000000',155);
insert into konto(kontoid,kontonummer,bankid) values (39,'M00000000000',6325);
insert into konto(kontoid,kontonummer,bankid) values (40,'N00000000000',9523);
insert into konto(kontoid,kontonummer,bankid) values (41,'O00000000000',5428);
insert into konto(kontoid,kontonummer,bankid) values (42,'P00000000000',4582);
insert into konto(kontoid,kontonummer,bankid) values (43,'Q00000000000',3214);
insert into konto(kontoid,kontonummer,bankid) values (44,'R00000000000',3218);
insert into konto(kontoid,kontonummer,bankid) values (45,'S00000000000',1412);
insert into konto(kontoid,kontonummer,bankid) values (46,'T00000000000',800);


/* Füge Daten in Tabelle mitarbeiter2 ein */
insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(1,'Müller','Ralf','1970.12.20',1,19,3,3,1,'1990.01.13',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(2,'Schneider','Petra','1965.03.07',1,1,null,null,2,'1995.8.27','2000.07.31','ruhestand');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(3,'Klein','Thomas','1970.12.20',1,1,3,10,3,'1990.01.13',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(4,'Lang','Ute','1985.07.19',1,1,1,null,4,'2005.06.7',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(5,'Eisenhof','Frank','1962.5.15',1,1,null,11,5,'1982.07.8','1995.05.31','ruhestand');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(6,'Lupin','Anja','1967.03.07',1,1,2,null,6,'1998.02.17',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(7,'Lempe','Dirk','1987.02.18',5,8,null,33,7,'2000.07.21','2002.01.31','veränderung');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(8,'Müller','Iris','1953.08.22',5,19,3,null,8,'1970.03.15',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(9,'Ludwig','Heinz','1955.09.27',5,8,null,null,null,'1978.07.18','1995.02.05','ruhestand');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(10,'Klarfeld','Simone','1968.08.17',5,8,null,null,10,'1989.04.15','1997.01.31','veränderung');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(11,'Schmidt','Werner','1948.05.31',5,8,null,33,11,'1970.03.01','1975.03.31','ruhestand');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(12,'Funke','Doris','1954.09.3',5,8,1,27,null,'1980.05.01',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(13,'Nolte','Reinhard','1984.01.31',2,18,null,null,13,'2005.01.01','2008.05.07',null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(14,'Jule','Stefanie','1954.06.18',2,18,null,8,14,'1975.01.05','1985.04.20','ruhestand');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(15,'Engels','Karl','1989.02.27',2,18,1,null,15,'2011.03.08',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(16,'Franke','Elisabeth','1958.04.22',2,19,null,17,16,'1985.01.01','2010.09.30','ruhestand');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(17,'Petersen','Hans','1960.05.11',2,18,null,null,17,'1984.09.7','2011.07.31','abfindungsprogramm');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(18,'Sebastiansen','Inge','1961.07.31',2,18,3,23,18,'1978.05.22',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(19,'Heier','Peter','1968.03.15',2,null,1,null,19,'1996.10.22',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(20,'Steinmacher','Ilse','1967.07.18',2,19,1,null,20,'1996.06.19',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(21,'Überall','Georg','1923.03.12',3,23,null,29,21,'1980.08.12','1985.01.31','ruhestand');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(22,'Klein','Bärbel','1977.08.14',3,23,null,null,null,'2000.07.01','2005.03.31','veränderung');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(23,'Stein','Rolf','1965.07.17',3,19,3,33,23,'1985.02.14',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(24,'Groß','Vera','1970.08.27',3,23,3,null,24,'1991.05.01',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(25,'Funke','Andreas','1955.02.18',3,23,null,38,25,'1985.01.01','1992.04.25','ruhestand');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(26,'Engels','Sabine','1955.03.24',3,23,3,null,null,'1978.09.01',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(27,'Paulus','Sebastian','1961.01.15',3,23,null,42,27,'1982.02.12','2010.01.31','ruhestand');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(28,'Winscheidt','Elke','1971.09.20',3,23,null,null,28,'1995.08.23','1997.03.31','veränderung');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(29,'Blume','Siegmar','1978.07.11',3,23,3,46,29,'2002.08.01',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(30,'Mey','Tanja','1980.08.22',3,23,3,null,30,'2005.05.11',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(31,'Gelz','Oliver','1963.04.05',4,46,3,50,31,'1979.12.01',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(32,'Lorenz','Tina','1956.07.12',4,46,3,null,32,'1986.04.01',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(33,'Maier','Tim','1965.10.25',4,46,3,47,33,'1988.06.01',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(34,'Winter','Elise','1968.04.11',4,46,3,null,34,'1990.08.10',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(35,'Obendorf','Karl','1954.05.15',4,46,3,43,35,'1985.07.11',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(36,'Sommer','Werner','1975.07.05',4,46,3,null,36,'1996.07.18',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(37,'Trost','Elvira','1950.11.09',4,46,null,39,37,'1972.04.11','2011.05.31','ruhestand');

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(38,'Friedrichs','Martin','1980.05.31',4,46,1,null,38,'2005.11.22',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(39,'Ludowig','Carmen','1976.07.25',4,46,3,35,39,'1998.06.12',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(40,'Serenius','Ingo','1965.10.11',4,46,3,null,40,'1984.10.15',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(41,'Mey','Lisa','1968.12.11',4,46,3,31,41,'1992.05.22',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(42,'Sonnenfeld','Udo','1967.02.08',4,46,1,null,42,'1984.07.31',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(43,'Kanis','Herbert','1970.07.17',4,46,2,27,43,'1997.04.21',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(44,'Santus','Cornelia','1951.10.5',4,46,2,null,44,'1978.01.01',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(45,'Oberscheidt','Michael','1950.02.18',4,46,3,23,45,'1972.09.28',null,null);

insert into mitarbeiter2 (mitarbeiterid,name,vorname,gebdatum,abteilungid,vorgesetzterid,steuerklasseid,krankenkassenid,kontoid,eintrittsdatum,austrittsdatum,austrittsgrund)
values(46,'Dorsten','Klaus','1953.05.28',4,19,3,null,46,'1971.03.30',null,null);






/* Füge Daten in Tabelle kontakt ein */
insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (1,'0123/8888888888888','01234/0000000000','ralfmueller@rumpsteakserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (2,'0123/1111111111','4566/0000000000000000','petraschneider@kalbshaxenserver.appetit',2);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (3,'0123/77777777777777','01234/4444444444444','thomasklein@forellenserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (4,'8977/9999999999999','2345/55555555555555','utelang@bohnenserver.appetit',4);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (5,'0123/222222222222222','7890/111111111111111','frankeisenhof@lammrueckenserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (6,'2345/33333333333333','3456/666666666666','anjalupin@heilbuttserver.appetit',6);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (7,'3456/22222222222222','4567/7777777777777','dirklempe@spargelserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (8,'3456/11111111111111','2345/99999999999999','irismueller@kotelettserver.appetit',8);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (9,'4567/666666666666666','7891/222222222222222','heinzludiwig@karpfenserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (10,'5678/333333333333333','6789/22222222222222','simoneklarfeld@fenchelserver.appetit',10);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (11,'1234/999999999999','2345/444444444444','wernerschmidt@kalbsschulterserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (12,'2345/11111111111111','3456/222222222222','dorisfunke@schollenserver.apettit',12);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (13,'4567/99999999999','5678/333333333333','reinhardnolte@kürbissserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (14,'6789/1111111111111','7891/555555555555','stefaniejule@lammkronenserver.appetit',14);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (15,'9123/4444444444444','6789/33333333333','hanspeterson@makrelenserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (16,'5678/77777777777','7890/55555555555','ingesebastiansen@tomatenserver.appetit',16);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (17,'0123/333333333333','2345/6666666666666','peterhaier@lammsteakserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (18,'4567/33333333333','7890/1111111111111','ilsesteinmacher@heringserver.appetit',18);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (19,'3456/888888888888','6789/333333333333','georgueberall@paprikaserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (20,'4567/3333333333','8901/555555555555','baerbelklein@gansserver.appetit',20);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (21,'012345/888888888888','45677/3333333333333','rolfstein@schellfischserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (22,'2345/111111111111','3456/000000000000','veragross@auberginenserver.appetit',22);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (23,'2345/000000000000','00000/999999999999','andreasfunke@entenserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (24,'11111/555555555555','2222222/77777777777','sabineengels@zanderserver.appetit',24);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (25,'1234/33333333333','2345/888888888888','sebastianpaulus@zucchiniserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (26,'6789/11111111111','7890/77777777777','elkewinscheidt@rehrückenserver.appetit',26);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (27,'9012/11111111111111','012345/8888888888','siegmarblume@sardellenserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (28,'2345/1111111111111','3456/6666666666','tanjamay@kaninchenkeulenserver.appetit',28);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (29,'3456/44444444444444','4567/8888888888','olivergelz@welsserver@appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (30,'6789/22222222222','7890/3333333333333','tinalorenz@chicoreeserver.appetit',30);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (31,'8901/333333333333','1234/1111111111111','timmaier@kürbisserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (32,'2345/222222222222','123456/7777777777','elisewinter@rumpsteakserver.appetit',32);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (33,'45678/66666666666','56789/2222222222222','wernersommer@heilbuttserver@appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (34,'123456/88888888888','23456/333333333333333','elviratrost@paprikaserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (35,'34567/7777777777','345678/6666666666666','martinfriedrichs@cayenneserver.appetit',35);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (36,'23456/666666666666','012345/55555555555','carmenludowig@serranoserver@appetit',36);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (37,'67890/444444444444','890123/55555555','ingoserenius@hirschserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (38,'90123/55555555555555','67890/333333333333','lisamay@hirschserver.appetit',38);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (39,'456789/333333333333','901234/22222222222222','udosonnenfeld@zwibelserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (40,'789012/44444444444','456789/55555555555','herbertkanis@rehserver.appetit',40);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (41,'23456/22222222222222222','56789/1111111111111','corneliasantus@thunfischserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (42,'56789/2222222222','7890123/4444444444444','michaeloberscheidt@gurkenserver.appetit',42);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (43,'9012345/333333333333333','123456/6666666666666','klausdorsten@fenchelserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (44,'111111111/777777777777','55555/44444444444','herbertbuecher@hirschserver.appetit',44);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (45,'4444444444/88888888','000000/11111111','marlenesternental@delphinserver.appetit',null);

insert into kontakt (kontaktid,festnetz,mobilnetz,email,mitarbeiterid)
values (46,'00000000/11111111','77777/999999999','hansheinrich@forellenserver.appetit',46);

/* Füge Daten in Tabelle urlaub ein */


insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(1,40,15,1);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(2,40,20,2);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(3,40,28,3);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(4,40,2,4);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(5,40,14,5);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(6,40,20,6);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(7,40,26,7);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(8,40,25,8);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(9,40,30,9);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(10,40,11,10);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(11,40,39,11);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(12,40,28,12);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(13,40,32,13);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(14,40,32,14);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(15,40,32,15);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(16,40,36,16);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(17,40,23,17);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(18,40,23,18);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(19,40,24,19);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(20,40,12,20);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(21,40,24,21);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(22,40,25,22);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(23,40,32,23);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(24,40,21,24);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(25,40,25,25);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(26,40,27,26);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(27,40,22,27);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(28,40,29,28);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(29,40,22,29);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(30,40,22,30);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(31,40,40,31);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(32,40,36,32);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(33,40,22,33);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(34,40,35,34);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(35,40,14,35);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(36,40,18,36);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(37,40,22,37);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(38,40,36,38);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(39,40,22,39);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(40,40,18,40);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(41,40,28,41);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(42,40,15,42);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(43,40,37,43);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(44,40,37,44);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(45,43,40,45);

insert into urlaub (urlaubid,urlaubstage,urlaubgenommen,mitarbeiterid)
values(46,20,40,46);





/* Füge Daten in Tabelle mitarbeiter ein */
insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (1,'Müller','Ralf','1970.12.20','1990.01.13',null,null,'Mondstraße','13a','Salzhausen',50000,'0123/8888888888888','01234/0000000000','ralfmueller@rumpsteakserver.appetit',null,500.00,'m','Einkauf','AOK Köln','ja',4,20.8,3,160,30,20,'3','Stadtsparkasse Köln',37050198,0000000000,4000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (2,'Schneider','Petra','1965.03.07','1995.8.27','2000.07.31','ruhestand','Sonnenstraße','189','Pfefferstadt',70000,'0123/1111111111','4566/0000000000000000','petraschneider@kalbshaxenserver.appetit',null,500.00,'w','Einkauf','MH Plus Bonn','ja',3,28.5,-7,180,30,20,'3','Stadtsparkasse Köln',37050198,0000000000,4000.00);



insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (3,'Klein','Thomas','1970.12.20','1990.01.13',null,null,'Mondstraße','13a','Salzhausen',50000,'0123/77777777777777','01234/4444444444444','thomasklein@forellenserver.appetit',null,500.00,'m','Einkauf','AOK Köln','ja',4,20.8,-5,165,30,28,'3','Stadtsparkasse Köln',37050198,0000000000,4000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (4,'Lang','Ute','1985.07.19','2005.06.7',null,null,'Marsstraße','789a','Zuckerhausen',50000,'8977/9999999999999','2345/55555555555555','utelang@bohnenserver.appetit',null,280.50,'w','Einkauf','AOK Köln','nein',0,20,2,170,30,25,'1','Stadtsparkasse Köln',37050198,0000000000,2800.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (5,'Eisenhof','Frank','1962.5.15','1982.07.8','1995.05.31','ruhestand','Jupiterstraße','270','Nelkendorf',50000,'0123/222222222222222','7890/111111111111111','frankeisenhof@lammrueckenserver.appetit',null,888.00,'m','Einkauf','AOK Köln','ja',4,20.8,-12,165,30,20,'3','Stadtsparkasse Köln',37050198,0000000000,1750.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (6,'Lupin','Anja','1967.03.07','1998.02.17',null,null,'Saturnweg','1','Koreanderstadt',50000,'2345/33333333333333','3456/666666666666','anjalupin@heilbuttserver.appetit',null,2000.00,'w','Einkauf','AOK Köln','nein',2,98.85,15,200,30,20,'2','Stadtsparkasse Köln',37050198,0000000000,6125.00);



insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (7,'Lempe','Dirk','1987.02.18','2000.07.21','2002.01.31','veränderung','Venusweg','100','Currystadt',70000,'3456/22222222222222','4567/7777777777777','dirklempe@spargelserver.appetit',null,1800.00,'m','Personal','MH Plus Bonn','ja',2,67.00,-18,160,30,26,'1','Stadtsparkasse Köln',37050198,0000000000,3800.00);



insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (8,'Müller','Iris','1953.08.22','1970.03.15',null,null,'Merkurweg','770','Anisstadt',70000,'3456/11111111111111','2345/99999999999999','irismueller@kotelettserver.appetit',null,7800.00,'w','Personal','MH Plus Bonn','ja',2,125.00,80,210,30,25,'3','Stadtsparkasse Köln',37050198,0000000000,7000.00);



insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (9,'Ludiwig','Heinz','1955.09.27','1978.07.18','1995.02.05','ruhestand','Uranus','27c','Zimtdorf',70000,'4567/666666666666666','7891/222222222222222','heinzludiwig@karpfenserver.appetit',null,127.45,'m','Personal','MH Plus Bonn','ja',1,18.50,-21,165,30,30,'3','Stadtsparkasse Köln',37050198,0000000000,1300.00);



insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (10,'Klarfeld','Simone','1968.08.17','1989.04.15','1997.01.31','veränderung','Neptunweg','67','Muskatdorf',70000,'5678/333333333333333','6789/22222222222222','simoneklarfeld@fenchelserver.appetit',null,4000.00,'w','Personal','MH Plus Bonn','ja',1,35.00,-18,180,30,20,'3','Stadtsparkasse Köln',37050198,0000000000,5000.00);



insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (11,'Schmidt','Werner','1948.05.31','1970.03.01','1975.03.31','ruhestand','Erdweg','300','Bärlauchstadt',70000,'1234/999999999999','2345/444444444444','wernerschmidt@kalbsschulterserver.appetit',null,800.00,'m','Personal','MH Plus Bonn','nein',0,40.00,3,175,30,30,'1','Stadtsparkasse Köln',37050198,0000000000,5500.00);



insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (12,'Funke','Doris','1954.09.3','1980.05.01',null,null,'Spiralstraße','75','Ingwerdorf',70000,'2345/11111111111111','3456/222222222222','dorisfunke@schollenserver.apettit',null,2000.00,'w','Personal','MH Plus Bonn','nein',0,55.00,-17,160,30,28,'1','Stadtsparkasse Köln',37050198,0000000000,7000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (13,'Nolte','Reinhard','1984.01.31','2005.01.01','2008.05.07',null,'Sombrerostraße','34z','Gewürznelkenstadt',80000,'4567/99999999999','5678/333333333333','reinhardnolte@kürbissserver.appetit',355000.80,1700.00,'m','Vertrieb','MH Plus Bonn','ja',2,34.00,-8,176,15,10,'3','Stadtsparkasse Köln',37050198,0000000000,5000.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (14,'Jule','Stefanie','1954.06.18','1975.01.05','1985.04.20','ruhestand','Black Eye Galaxistraße','189','Kardamondorf',80000,'6789/1111111111111','7891/555555555555','stefaniejule@lammkronenserver.appetit',700000.00,10000.00,'w','Vertrieb','MH Plus Bonn','ja',1,120,21,160,30,22,'3','Stadtsparkasse Köln',37050198,0000000000,6000.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (15,'Petersen','Hans','1989.02.27','2011.03.08',null,null,'Centaurusstraße','20','Safrandorf',80000,'9123/4444444444444','6789/33333333333','hanspeterson@makrelenserver.appetit',156000.00,1200.00,'m','Vertrieb','MH Plus Bonn','nein',0,45.00,4,167,30,22,'1','Stadtsparkasse Köln',37050198,0000000000,5600.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (16,'Sebastiansen','Inge','1958.04.22','1985.01.01','2010.09.30','ruhestand','Doradusstraße','150a','Vanillestadt',90000,'5678/77777777777','7890/55555555555','ingesebastiansen@tomatenserver.appetit',570000.00,2500.00,'w','Vertrieb','MH Plus Bonn','ja',3,55,-2,180,15,10,'3','Stadtsparkasse Köln',37050198,0000000000,4000.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (17,'Haier','Peter','1960.05.11','1984.09.7','2011.07.31','abfindungsprogramm','Galax Cluster Straße','444','Zitronenstadt',90000,'0123/333333333333','2345/6666666666666','peterhaier@lammsteakserver.appetit',347000.89,1800.00,'m','Vertrieb','Barmer GEK','nein',0,67.00,-9,170,30,23,'3','Stadtsparkasse Köln',37050198,0000000000,7000.00);




insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (18,'Steinmacher','Ilse','1961.07.31','1978.05.22',null,null,'Supernovastraße','346','Paprikapulverdorf',90000,'4567/33333333333','7890/1111111111111','ilsesteinmacher@heringserver.appetit',700898.03,4000.00,'w','Vertrieb','Barmer GEK','ja',1,70.00,10,160,30,23,'3','Stadtsparkasse Köln',37050198,0000000000,6000.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (19,'Überall','Georg','1968.03.15','1996.10.22',null,null,'Quasarstraße','456','Kurkumadorf',90000,'3456/888888888888','6789/333333333333','georgueberall@paprikaserver.appetit',678000.54,3000.00,'m','Vertrieb','Barmer GEK','nein',0,50.8,-8,168,30,24,'1','Stadtsparkasse Köln',37050198,0000000000,4000.00);




insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (20,'Klein','Bärbel','1967.07.18','1996.06.19',null,null,'Challangerstraße','987','Nelkendorf',90000,'4567/3333333333','8901/555555555555','baerbelklein@gansserver.appetit',234000.00,1200.00,'w','Vertrieb','Barmer GEK','nein',0,50.00,3,180,30,27,'1','Stadtsparkasse Köln',37050198,0000000000,7000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (21,'Stein','Rolf','1923.03.12','1980.08.12','1985.01.31','ruhestand','Columbiastraße','57','ChiliHofen',90000,'012345/888888888888','45677/3333333333333','rolfstein@schellfischserver.appetit',null,3000.00,'m','Controlling','BKK Pfalz','ja',2,50.8,2,170,30,24,'3','Stadtsparkasse Köln',37050198,0000000000,5000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (22,'Groß','Vera','1977.08.14','2000.07.01','2005.03.31','veränderung','Atlantisstraße','783','Birnendorf',90000,'2345/111111111111','3456/000000000000','veragross@auberginenserver.appetit',null,1500.00,'w','Controlling','Techniker Krankenkasse - TK','ja',1,50.00,-10,160,30,19,'3','Stadtsparkasse Köln',37050198,0000000000,5000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (23,'Funke','Andreas','1965.07.17','1985.02.14',null,null,'Lunarstraße','111','Zuckerstadt',10000,'2345/000000000000','00000/999999999999','andreasfunke@entenserver.appetit',null,2300.00,'m','Controlling','BKK Faber-Castell & Partner','ja',2,85.00,12,180,30,30,'3','Stadtsparkasse Köln',37050198,0000000000,6000.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (24,'Engels','Sabine','1970.08.27','1991.05.01',null,null,'Appollostraße','176','Avocadodorf',10000,'11111/555555555555','2222222/77777777777','sabineengels@zanderserver.appetit',null,10000.00,'w','Controlling','AOK Nordwest','ja',1,120.00,-5,180,30,21,'3','Stadtsparkasse Köln',37050198,0000000000,10000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (25,'Paulus','Sebastian','1955.02.18','1985.01.01','1992.04.25','ruhestand','Curiositystraße','361','Limmetenstadt',10000,'1234/33333333333','2345/888888888888','sebastianpaulus@zucchiniserver.appetit',null,5000.00,'m','Controlling','IKK gesund plus','nein',1,80.00,2,165,30,25,'1','Stadtsparkasse Köln',37050198,0000000000,10000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (26,'Winscheidt','Elke','1955.03.24','1978.09.01',null,null,'Spiritweg','98','Pinienstadt',10000,'6789/11111111111','7890/77777777777','elkewinscheidt@rehrückenserver.appetit',null,8000.00,'w','Controlling',' IKK gesund plus','ja',1,70.00,5,200,30,27,'3','Stadtsparkasse Köln',37050198,0000000000,10000.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (27,'Blume','Siegmar','1961.01.15','1982.02.12','2010.01.31','ruhestand','Opportunity Straße','8','Aceto Balsamico Stadt',10000,'9012/11111111111111','012345/8888888888','siegmarblume@sardellenserver.appetit',null,10000.00,'m','Controlling','IKK gesund plus','ja',2,120.00,-4,190,30,22,'3','Stadtsparkasse Köln',37050198,0000000000,10000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (28,'Mey','Tanja','1971.09.20','1995.08.23','1997.03.31','veränderung','Phoenix Weg','24','Parmesan Dorf',10000,'2345/1111111111111','3456/6666666666','tanjamay@kaninchenkeulenserver.appetit',null,8000.00,'w','Controlling','IKK gesund plus','nein',0,110.00,10,160,30,29,'1','Stadtsparkasse Köln',37050198,0000000000,8000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (29,'Gelz','Oliver','1978.07.11','2002.08.01',null,null,'Arianestraße','75','Schallotten Dorf',10000,'3456/44444444444444','4567/8888888888','olivergelz@welsserver@appetit',null,7500.00,'m','Controlling','IKK gesund plus','ja',1,89.00,12,160,30,22,'3','Stadtsparkasse Köln',37050198,0000000000,5000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (30,'Lorenz','Tina','1980.08.22','2005.05.11',null,null,'ISS Weg','176','Mascarpone Dorf',10000,'6789/22222222222','7890/3333333333333','tinalorenz@chicoreeserver.appetit',null,500.00,'w','Controlling','IKK gesund plus','ja',2,50.00,-7,160,30,22,'3','Stadtsparkasse Köln',37050198,0000000000,5000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (31,'Maier','Tim','1963.04.05','1979.12.01',null,null,'Euklid Weg','7','Meersalz Stadt',10000,'8901/333333333333','1234/1111111111111','timmaier@kürbisserver.appetit',80000.00,500.00,'m','Verkauf','IKK gesund plus','ja',1,60.00,3,165,30,30,'3','Stadtsparkasse Köln',37050198,0000000000,6000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (32,'Winter','Elise','1956.07.12','1986.04.01',null,null,'Mir Straße','198','Lorber Village',20000,'2345/222222222222','123456/7777777777','elisewinter@rumpsteakserver.appetit',120000.00,800.00,'w','Verkauf','IKK gesund plus','ja',2,80.00,2,170,30,26,'3','Stadtsparkasse Köln',37050198,0000000000,8000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (33,'Sommer','Werner','1965.10.25','1988.06.01',null,null,'Titan Weg','7','Broccoli Dorf',20000,'45678/66666666666','56789/2222222222222','wernersommer@heilbuttserver@appetit',170000.00,1200.00,'m','Verkauf','IKK gesund plus','ja',1,120.00,15,180,15,8,'3','Stadtsparkasse Köln',37050198,0000000000,9000.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (34,'Trost','Elvira','1968.04.11','1990.08.10',null,null,'Dione Straße','133','Dijon Village',20000,'123456/88888888888','23456/333333333333333','elviratrost@paprikaserver.appetit',123300.00,1234.00,'w','Verkauf','IKK gesund plus','ja',2,90.00,3,160,30,25,'3','Stadtsparkasse Köln',37050198,0000000000,5000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (35,'Friedrichs','Martin','1954.05.15','1985.07.11',null,null,'Epimetheus Weg','9','Walnußöl Village',20000,'34567/7777777777','345678/6666666666666','martinfriedrichs@cayenneserver.appetit',333000.00,2000.00,'m','Verkauf','IKK gesund plus','ja',5,110.00,4,160,30,14,'3','Stadtsparkasse Köln',37050198,0000000000,5000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (36,'Ludowig','Carmen','1975.07.05','1996.07.18',null,null,'Iapetus Straße','48','Pinienkernöl Village',20000,'23456/666666666666','012345/55555555555','carmenludowig@serranoserver@appetit',500000.00,3000.00,'w','Verkauf','IKK gesund plus','ja',7,120.00,10,80,30,25,'3','Stadtsparkasse Köln',37050198,0000000000,1200.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (37,'Serenius','Ingo','1950.11.09','1972.04.11','2011.05.31','ruhestand','Rhea Weg','10','Sherry Essig Village',20000,'67890/444444444444','890123/55555555','ingoserenius@hirschserver.appetit',230000.00,2000.00,'m','Verkauf','IKK gesund plus','nein',7,120.00,-14,80,15,10,'1','Stadtsparkasse Köln',37050198,0000000000,1300.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (38,'Mey','Lisa','1980.05.31','2005.11.22',null,null,'Enceladus Weg','18a','Zuckererbsen Village',20000,'90123/55555555555555','67890/333333333333','lisamay@hirschserver.appetit',1000000.00,50000.00,'w','Verkauf','IKK gesund plus','nein',0,230.00,-5,170,30,26,'1','Stadtsparkasse Köln',37050198,0000000000,6000.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (39,'Sonnenfeld','Udo','1976.07.25','1998.06.12',null,null,'Rosetta Straße','5','Soja Village',30000,'456789/333333333333','901234/22222222222222','udosonnenfeld@zwibelserver.appetit',650000.00,4000.00,'m','Verkauf','IKK gesund plus','ja',5,120.00,10,50,30,22,'3','Stadtsparkasse Köln',37050198,0000000000,5000.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (40,'Kanis','Herbert','1965.10.11','1984.10.15',null,null,'Sofiaweg','9','Apfelessig Village',30000,'789012/44444444444','456789/55555555555','herbertkanis@rehserver.appetit',500000.00,2800.00,'m','Verkauf','IKK gesund plus','ja',2,98.00,2,160,30,18,'3','Stadtsparkasse Köln',37050198,0000000000,4000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (41,'Santus','Cornelia','1968.12.11','1992.05.22',null,null,'Justin Straße','15','Rettich Stadt',30000,'23456/22222222222222222','56789/1111111111111','corneliasantus@thunfischserver.appetit',700000.00,3000.00,'w','Verkauf','IKK gesund plus','ja',3,95.00,-13,165,30,28,'3','Stadtsparkasse Köln',37050198,0000000000,5000.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (42,'Oberscheidt','Michael','1967.02.08','1984.07.31',null,null,'Sojus Weg','20','Tabasco Dorf',30000,'56789/2222222222','7890123/4444444444444','michaeloberscheidt@gurkenserver.appetit',150000.00,200000.00,'m','Verkauf','IKK gesund plus','nein',0,80.00,-5,120,15,7,'3','Stadtsparkasse Köln',37050198,0000000000,1800.00);


insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (43,'Dorsten','Klaus','1970.07.17','1997.04.21',null,null,'Marsgesicht Straße','16','Piment Dorf',30000,'9012345/333333333333333','123456/6666666666666','klausdorsten@fenchelserver.appetit',600000.00,1200.00,'m','Verkauf','IKK gesund plus','nein',3,90.00,2,160,30,27,'3','Stadtsparkasse Köln',37050198,0000000000,1800.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (44,'Bücher','Herbert','1951.10.5','1978.01.01',null,null,'Kosmonauten Weg','27a','Trauben Dorf',50000,'111111111/777777777777','55555/44444444444','herbertbuecher@hirschserver.appetit',1200000.80,2000.00,'m','Verkauf','MH Plus','nein',1,120.00,48,160,30,27,'10','Stadtsparkasse Köln',37050198,0000000000,5000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (45,'Sternental','Marlene','1950.02.18','1972.09.28',null,null,'Weltstraße','97','Orangen City',70000,'4444444444/88888888','000000/11111111','marlenesternental@delphinserver.appetit',600000,10000.00,'w','Verkauf','IKK gesund plus','ja',3,105.00,5,180,30,30,'3','Stadtsparkasse Köln',37050198,0000000000,7500.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (46,'Heinrich','Hans','1953.05.28','1971.03.30',null,null,'Geltstraße','65','Haselnuß City',40000,'00000000/11111111','77777/999999999','hansheinrich@forellenserver.appetit',1200000.80,5000.00,'m','Verkauf','MH Plus','ja',2,130.00,10,160,15,8,'3','Stadtsparkasse Köln',37050198,0000000000,6000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (47,'Blume','Tanja','1970.05.25','1982.03.30','2010.02.15','ruhestand','Opportunity Straße','8','Aceto Balsamico Stadt',10000,'9012/11111111111111','012345/8888888888','siegmarblume@sardellenserver.appetit',null,10000.00,'m','Controlling','IKK gesund plus','ja',2,120.00,-4,190,30,22,'3','Stadtsparkasse Köln',37050198,0000000000,10000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (48,'Bücher','Ilse','1955.01.11','1975.06.07',null,null,'Kosmonauten Weg','27a','Trauben Dorf',50000,'111111111/777777777777','55555/44444444444','herbertbuecher@hirschserver.appetit',80000.80,3000.00,'m','Verkauf','MH Plus','nein',1,140.00,48,160,30,27,'10','Stadtsparkasse Köln',37050198,0000000000,5000.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (49,'Dorsten','Stephanie','1968.10.21','1995.06.19',null,null,'Marsgesicht Straße','16','Piment Dorf',30000,'9012345/333333333333333','123456/6666666666666','klausdorsten@fenchelserver.appetit',600000.00,1200.00,'m','Verkauf','IKK gesund plus','nein',3,90.00,2,160,30,27,'3','Stadtsparkasse Köln',37050198,0000000000,1800.00);

insert into mitarbeiter (mitarbeiterid,name,vorname,gebdatum,eintrittsdatum,austrittsdatum,austrittsgrund,strasse,hausnummer,ort,plz,festnetz,mobilnetz,email,umsatz,bonus,geschlecht,abteilung,krankenversicherung,verheiratet,anzahlkinder,stundenlohn,ueberstunden,stundenpromonat,urlaubstage,urlaubgenommen,steuerklasse,bankinstitut,bankleitzahl,kontonummer,monatslohn)
values (50,'Eisenhof','Linda','1958.07.15','1970.08.07','2010.11.01','ruhestand','Jupiterstraße','270','Nelkendorf',50000,'0123/222222222222222','7890/111111111111111','frankeisenhof@lammrueckenserver.appetit',null,888.00,'m','Einkauf','AOK Köln','ja',4,20.8,-12,165,30,20,'3','Stadtsparkasse Köln',37050198,0000000000,1750.00);



/* Füge Daten in Tabelle mitarbeiterdoppelt ein */
insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Müller','Ralf','Mondstraße','13a','Salzhausen',50000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Müller','Ralf','Mondstraße','13a','Salzhausen',50000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Müller','Ralf','Mondstraße','13a','Salzhausen',50000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Müller','Ralf','Starbust Galay M82 Weg','220','Frühlingszwiebelhausen',70000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Müller','Ralf','Centaurus A Straße','177','Champingin Stadt',40000);


insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Schneider','Petra','Sonnenstraße','189','Pfefferstadt',70000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Schneider','Petra','Sonnenstraße','189','Pfefferstadt',70000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Schneider','Petra','Sonnenstraße','189','Pfefferstadt',70000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Schneider','Petra','Perseusstraße','345','Cranberrie Dorf',23000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Schneider','Petra','Hydrastraße','652','Erdnusölhausen',70000);


insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Klein','Thomas','Merkurweg','770','Anisstadt',70000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Klein','Thomas','Merkurweg','770','Anisstadt',70000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Klein','Thomas','Merkurweg','770','Anisstadt',70000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Klein','Thomas','Polarsternstraße','77','Emmentaler Stadt',40000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Klein','Thomas','Aquilastraße','76','Apfelvillage',45000);


insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lang','Ute','Supernovastraße','346','Paprikapulverdorf',90000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lang','Ute','Supernovastraße','346','Paprikapulverdorf',90000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lang','Ute','Supernovastraße','346','Paprikapulverdorf',90000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lang','Ute','Perseusweg','33a','Melonenvillage',30000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lang','Ute','Piscesstraße','44','Liebstöckeldorf',20000);


insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Eisenhof','Frank','Quasarstraße','456','Kurkumadorf',90000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Eisenhof','Frank','Quasarstraße','456','Kurkumadorf',90000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Eisenhof','Frank','Quasarstraße','456','Kurkumadorf',90000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Eisenhof','Frank','Columbastraße','56','Meerrettichvillage',40000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Eisenhof','Frank','Cygnusweg','73','Orangendorf',80000);



insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lupin','Anja','Lunarstraße','111','Zuckerstadt',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lupin','Anja','Lunarstraße','111','Zuckerstadt',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lupin','Anja','Lunarstraße','111','Zuckerstadt',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lupin','Anja','Eridanusweg','48','Austernvillage',50000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lupin','Anja','Carinastraße','65','Lorbeervillage',40000);


insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lempe','Dirk','Appollostraße','176','Avocadodorf',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lempe','Dirk','Appollostraße','176','Avocadodorf',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lempe','Dirk','Appollostraße','176','Avocadodorf',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lempe','Dirk','Herculesweg','4a','Wallnusdorf',20000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Lempe','Dirk','Aquilaweg','67','Weizendorf',40000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Müller','Iris','Curiositystraße','361','Limmetenstadt',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Müller','Iris','Curiositystraße','361','Limmetenstadt',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Müller','Iris','Curiositystraße','361','Limmetenstadt',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Müller','Iris','Pictorstraße','456','Lollorossostadt',30000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Müller','Iris','Lynxweg','77','Garnelenvillage',70000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Ludwig','Heinz','Spiritweg','98','Pinienstadt',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Ludwig','Heinz','Spiritweg','98','Pinienstadt',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Ludwig','Heinz','Spiritweg','98','Pinienstadt',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Ludwig','Heinz','Andromedastraße','66','Erdbeerstadt',40000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Ludwig','Heinz','Taurusstraße','35','Rosmarinvillage',70000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Klarfeld','Simone','Arianestraße','75','Schallotten Dorf',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Klarfeld','Simone','Arianestraße','75','Schallotten Dorf',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Klarfeld','Simone','Arianestraße','75','Schallotten Dorf',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Klarfeld','Simone','Dracoweg','44','Aritschockenvillage',70000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Klarfeld','Simone','Sculptorstraße','67','Mangoldvillage',40000);


insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Schmidt','Werner','ISS Weg','176','Mascarpone Dorf',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Schmidt','Werner','ISS Weg','176','Mascarpone Dorf',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Schmidt','Werner','ISS Weg','176','Mascarpone Dorf',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Schmidt','Werner','Delphinusplatz','8a','Shiiatakedorf',46000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Schmidt','Werner','Pavostraße','46','Muskatvillage',47000);


insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Piaff','Edit','Euklid Weg','7','Meersalz Stadt',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Piaff','Edit','Euklid Weg','7','Meersalz Stadt',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Piaff','Edit','Euklid Weg','7','Meersalz Stadt',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Piaff','Edit','Geministraße','560','Blätterteigvillage',10000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Piaff','Edit','Perseusweg','47','Bugundervillage',10000);


insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Funke','Doris','Mir Straße','198','Lorber Village',20000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Funke','Doris','Mir Straße','198','Lorber Village',20000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Funke','Doris','Mir Straße','198','Lorber Village',20000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Funke','Doris','Doradoweg','7','Pesto Dorf',40000);

insert into mitarbeiterdoppelt (name,vorname,strasse,hausnummer,ort,plz)
values ('Funke','Doris','Lupusweg','20','Mozzarellavillage',66000);


/* Fügt Zeilen in die Tabelle mitarbeitergleich ein */

insert into mitarbeitergleich (name,vorname)
values ('Müller','Ralf');

insert into mitarbeitergleich (name,vorname)
values ('Müller','Ralf');

insert into mitarbeitergleich (name,vorname)
values ('Müller','Ralf');


insert into mitarbeitergleich (name,vorname)
values ('Klein','Thomas');

insert into mitarbeitergleich (name,vorname)
values ('Klein','Thomas');

insert into mitarbeitergleich (name,vorname)
values ('Klein','Thomas');

/* Fügt Zeilen in die Tabelle produktgleich ein */
/*produkt varchar(30),
	beschreibung varchar(30),
	marktbewertung tinyint
*/

insert into produktgleich (produkt,beschreibung,marktbewertung)
values ('Schraube 1','3x20',1);

insert into produktgleich (produkt,beschreibung,marktbewertung)
values ('Schraube 1','3x20',1);

insert into produktgleich (produkt,beschreibung,marktbewertung)
values ('Schraube 1','3x20',2);

insert into produktgleich (produkt,beschreibung,marktbewertung)
values ('Schraube 2','5x30',2);

insert into produktgleich (produkt,beschreibung,marktbewertung)
values ('Schraube 2','5x30',2);

insert into produktgleich (produkt,beschreibung,marktbewertung)
values ('Schraube 2','5x30',2);



/* Füge Daten in Tabelle arbeitszeit ein */
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-02',2012,7,2,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-02',2012,7,2,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-03',2012,7,3,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-03',2012,7,3,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-04',2012,7,4,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-04',2012,7,4,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-05',2012,7,5,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-05',2012,7,5,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-06',2012,7,6,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-06',2012,7,6,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-09',2012,7,9,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-09',2012,7,9,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-10',2012,7,10,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-10',2012,7,10,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-11',2012,7,11,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-11',2012,7,11,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-12',2012,7,12,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-12',2012,7,12,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-13',2012,7,13,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-13',2012,7,13,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-16',2012,7,16,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-16',2012,7,16,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-17',2012,7,17,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-17',2012,7,17,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-18',2012,7,18,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-18',2012,7,18,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-19',2012,7,19,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-19',2012,7,19,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-20',2012,7,20,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-20',2012,7,20,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-23',2012,7,23,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-23',2012,7,23,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-24',2012,7,24,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-24',2012,7,24,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-25',2012,7,25,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-25',2012,7,25,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-26',2012,7,26,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-26',2012,7,26,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-27',2012,7,27,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-27',2012,7,27,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-30',2012,7,30,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-30',2012,7,30,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-31',2012,7,31,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-07-31',2012,7,31,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-01',2013,3,1,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-01',2013,3,1,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-04',2013,3,4,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-04',2013,3,4,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-05',2013,3,5,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-05',2013,3,5,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-06',2013,3,6,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-06',2013,3,6,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-07',2013,3,7,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-07',2013,3,7,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-08',2013,3,8,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-08',2013,3,8,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-11',2013,3,11,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-11',2013,3,11,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-12',2013,3,12,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-12',2013,3,12,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-13',2013,3,13,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-13',2013,3,13,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-14',2013,3,14,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-14',2013,3,14,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-15',2013,3,15,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-15',2013,3,15,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-18',2013,3,18,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-18',2013,3,18,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-19',2013,3,19,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-19',2013,3,19,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-20',2013,3,20,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-20',2013,3,20,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-21',2013,3,21,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-21',2013,3,21,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-22',2013,3,22,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-22',2013,3,22,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-25',2013,3,25,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-25',2013,3,25,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-26',2013,3,26,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-26',2013,3,26,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-27',2013,3,27,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-27',2013,3,27,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-28',2013,3,28,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-28',2013,3,28,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-29',2013,3,29,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-03-29',2013,3,29,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-01',2013,8,1,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-01',2013,8,1,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-02',2013,8,2,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-02',2013,8,2,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-05',2013,8,5,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-05',2013,8,5,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-06',2013,8,6,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-06',2013,8,6,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-07',2013,8,7,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-07',2013,8,7,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-08',2013,8,8,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-08',2013,8,8,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-09',2013,8,9,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-09',2013,8,9,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-12',2013,8,12,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-12',2013,8,12,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-13',2013,8,13,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-13',2013,8,13,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-14',2013,8,14,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-14',2013,8,14,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-15',2013,8,15,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-15',2013,8,15,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-16',2013,8,16,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-16',2013,8,16,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-19',2013,8,19,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-19',2013,8,19,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-20',2013,8,20,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-20',2013,8,20,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-21',2013,8,21,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-21',2013,8,21,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-22',2013,8,22,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-22',2013,8,22,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-23',2013,8,23,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-23',2013,8,23,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-26',2013,8,26,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-26',2013,8,26,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-27',2013,8,27,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-27',2013,8,27,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-28',2013,8,28,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-28',2013,8,28,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-29',2013,8,29,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-29',2013,8,29,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-30',2013,8,30,'08:00:00','16:00:00',8,6);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-08-30',2013,8,30,'08:00:00','16:00:00',8,8);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-01',2012,8,1,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-01',2012,8,1,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-02',2012,8,2,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-02',2012,8,2,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-03',2012,8,3,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-03',2012,8,3,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-06',2012,8,6,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-06',2012,8,6,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-07',2012,8,7,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-07',2012,8,7,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-08',2012,8,8,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-08',2012,8,8,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-09',2012,8,9,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-09',2012,8,9,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-10',2012,8,10,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-10',2012,8,10,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-13',2012,8,13,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-13',2012,8,13,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-14',2012,8,14,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-14',2012,8,14,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-15',2012,8,15,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-15',2012,8,15,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-16',2012,8,16,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-16',2012,8,16,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-17',2012,8,17,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-17',2012,8,17,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-20',2012,8,20,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-20',2012,8,20,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-21',2012,8,21,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-21',2012,8,21,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-22',2012,8,22,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-22',2012,8,22,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-23',2012,8,23,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-23',2012,8,23,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-24',2012,8,24,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-24',2012,8,24,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-27',2012,8,27,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-27',2012,8,27,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-28',2012,8,28,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-28',2012,8,28,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-29',2012,8,29,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-29',2012,8,29,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-30',2012,8,30,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-30',2012,8,30,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-31',2012,8,31,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-08-31',2012,8,31,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-01',2013,1,1,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-01',2013,1,1,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-02',2013,1,2,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-02',2013,1,2,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-03',2013,1,3,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-03',2013,1,3,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-04',2013,1,4,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-04',2013,1,4,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-07',2013,1,7,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-07',2013,1,7,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-08',2013,1,8,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-08',2013,1,8,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-09',2013,1,9,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-09',2013,1,9,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-10',2013,1,10,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-10',2013,1,10,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-11',2013,1,11,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-11',2013,1,11,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-14',2013,1,14,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-14',2013,1,14,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-15',2013,1,15,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-15',2013,1,15,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-16',2013,1,16,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-16',2013,1,16,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-17',2013,1,17,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-17',2013,1,17,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-18',2013,1,18,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-18',2013,1,18,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-21',2013,1,21,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-21',2013,1,21,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-22',2013,1,22,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-22',2013,1,22,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-23',2013,1,23,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-23',2013,1,23,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-24',2013,1,24,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-24',2013,1,24,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-25',2013,1,25,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-25',2013,1,25,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-28',2013,1,28,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-28',2013,1,28,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-29',2013,1,29,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-29',2013,1,29,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-30',2013,1,30,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-30',2013,1,30,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-31',2013,1,31,'08:00:00','16:00:00',8,1);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-31',2013,1,31,'08:00:00','16:00:00',8,3);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-03',2012,12,3,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-04',2012,12,4,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-05',2012,12,5,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-06',2012,12,6,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-07',2012,12,7,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-10',2012,12,10,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-11',2012,12,11,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-12',2012,12,12,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-13',2012,12,13,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-14',2012,12,14,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-17',2012,12,17,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-18',2012,12,18,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-19',2012,12,19,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-20',2012,12,20,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-21',2012,12,21,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-24',2012,12,24,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-25',2012,12,25,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-26',2012,12,26,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-27',2012,12,27,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-28',2012,12,28,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2012-12-31',2012,12,31,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-01',2013,1,1,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-02',2013,1,2,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-03',2013,1,3,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-04',2013,1,4,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-07',2013,1,7,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-08',2013,1,8,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-09',2013,1,9,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-10',2013,1,10,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-11',2013,1,11,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-14',2013,1,14,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-15',2013,1,15,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-16',2013,1,16,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-17',2013,1,17,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-18',2013,1,18,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-21',2013,1,21,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-22',2013,1,22,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-23',2013,1,23,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-24',2013,1,24,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-25',2013,1,25,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-28',2013,1,28,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-29',2013,1,29,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-30',2013,1,30,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-01-31',2013,1,31,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-02',2013,12,2,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-03',2013,12,3,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-04',2013,12,4,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-05',2013,12,5,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-06',2013,12,6,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-09',2013,12,9,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-10',2013,12,10,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-11',2013,12,11,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-12',2013,12,12,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-13',2013,12,13,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-16',2013,12,16,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-17',2013,12,17,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-18',2013,12,18,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-19',2013,12,19,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-20',2013,12,20,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-23',2013,12,23,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-24',2013,12,24,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-25',2013,12,25,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-26',2013,12,26,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-27',2013,12,27,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-30',2013,12,30,'08:00:00','16:00:00',0,19);
INSERT INTO arbeitszeit_auszug (arbeitstag,jahr,monat,tag,kommen,gehen,anzahlstunden,mitarbeiterid) VALUES ('2013-12-31',2013,12,31,'08:00:00','16:00:00',0,19);




create view mitarbeiterkrankenkasse as
select m.mitarbeiterid, m.name,m.vorname,k.krankenkasse,k.beitragssatz
from mitarbeiter2 m inner join krankenkasse k
on m.krankenkassenid=k.krankenkassenid;










/*Kapitel xxx ALTER TABLE*/
/* Datensätze in die Tabelle infokunde einfügen*/


insert into infokunde values(1,'Sehr guter Kunde!','Schrauben Meier GmbH','Sehr guter Kunde!',5);
insert into infokunde values(2,'Guter Kunde!','Schrauben Peter GmbH','Guter Kunde!',4);
insert into infokunde values(3,'Nicht so guter Kunde!','Schrauben Klein GmbH','Nicht so guter Kunde!',1);


  
  INSERT INTO dsgvo values(1,'Schrauben Meier GmbH',NULL);
  INSERT INTO dsgvo values(2,'Schrauben Peter GmbH',NULL);
  INSERT INTO dsgvo values(3,'Schrauben Klein GmbH',NULL);


  
INSERT INTO premiumkunde VALUES (1,'Schrauben Karl',1,'6');
INSERT INTO premiumkunde VALUES (2,'Schrauben Meier',1,'4');
INSERT INTO premiumkunde VALUES (3,'Schrauben Peters',1,'1');
  
 
  
INSERT INTO anschrift VALUES (1,'Mondstraße','8','Köln',50000,1);
INSERT INTO anschrift VALUES (2,'Saturnstraße','10','Koblenz',50100,1);
INSERT INTO anschrift VALUES (3,'Venusstraße','5','Bonn',50200,1);
INSERT INTO anschrift VALUES (4,'Marsstraße','7','Düsseldorf',50150,2);
INSERT INTO anschrift VALUES (5,'Saturnstraße','3','Aachen',50158,2);
INSERT INTO anschrift VALUES (6,'Uranusstraße','6','Hamburg',12000,2);
INSERT INTO anschrift VALUES (7,'Plutostraße','1','Bremen',50222,3);
INSERT INTO anschrift VALUES (8,'Merkurstraße','8','Bonn',50150,3);
INSERT INTO anschrift VALUES (9,'Jupiterstraße','6','Düsseldorf',50266,3);




INSERT INTO artikel values (1,'Schraube 5',4.0,4.0,10.0,8.0,0.10,'');
INSERT INTO artikel values (2,'Schraube 3',2.0,2.0,3.0,2.0,0.05,'');
INSERT INTO artikel values (3,'Schraube 4',7.0,7.0,4.0,10.0,1.0,'');



  
INSERT INTO artikelinfo values (1,'Schraube 5',4.0,4.0,10.0,8.0,0.10);
INSERT INTO artikelinfo values (2,'Schraube 3',2.0,2.0,3.0,2.0,0.05);
INSERT INTO artikelinfo values (3,'Schraube 4',7.0,7.0,4.0,10.0,1.0);



  
  INSERT INTO positionartikel VALUES (1,5,'Stck',1);
  INSERT INTO positionartikel VALUES (2,20,'Stck',1);
  INSERT INTO positionartikel VALUES (3,4,'Stck',2);
  INSERT INTO positionartikel VALUES (4,30,'Stck',2);
  INSERT INTO positionartikel VALUES (5,11,'Stck',3);
  INSERT INTO positionartikel VALUES (6,7,'Stck',3);
  
  
  INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (1,10000000,'Bundesbank',10591,'Berlin');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (2,10010010,'Postbank',10916,'Berlin');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (3,10010111,'SEB',10789,'Berlin');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (4,10010222,'The Royal Bank of Scotland, Niederlassung Deutschland',10105,'Berlin');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (11,10020890,'UniCredit Bank - HypoVereinsbank',10896,'Berlin');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (12,10020890,'UniCredit Bank - HypoVereinsbank',14532,'Kleinmachnow');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (13,10020890,'UniCredit Bank - HypoVereinsbank',16515,'Oranienburg');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (14,10020890,'UniCredit Bank - HypoVereinsbank',14776,'Brandenburg an der Havel');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (15,10020890,'UniCredit Bank - HypoVereinsbank',15711,'Königs Wusterhausen');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (16,10020890,'UniCredit Bank - HypoVereinsbank',15517,'Fürstenwalde /Spree');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (44,10070000,'Deutsche Bank Fil Berlin',10883,'Berlin');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (45,10070000,'Deutsche Bank Fil Berlin Gf P2',10883,'Berlin');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (108,10090603,'apoBank',10593,'Berlin');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (109,10090603,'apoBank',19061,'Schwerin, Meckl');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (110,10090603,'apoBank',1099,'Dresden');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (111,10090603,'apoBank',4129,'Leipzig');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (112,10090603,'apoBank',9111,'Chemnitz, Sachs');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (113,10090603,'apoBank',99084,'Erfurt');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (114,10090603,'apoBank',39104,'Magdeburg');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (115,10090603,'apoBank',14467,'Potsdam');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (116,10090603,'apoBank',18057,'Rostock');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (133,12030000,'Deutsche Kreditbank Berlin',10117,'Berlin');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (134,12030000,'Deutsche Kreditbank',9111,'Chemnitz, Sachs');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (135,12030000,'Deutsche Kreditbank',4109,'Leipzig');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (136,12030000,'Deutsche Kreditbank',1069,'Dresden');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (137,12030000,'Deutsche Kreditbank',98527,'Suhl');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (138,12030000,'Deutsche Kreditbank',7545,'Gera');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (139,12030000,'Deutsche Kreditbank',99084,'Erfurt');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (140,12030000,'Deutsche Kreditbank',6122,'Halle (Saale)');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (141,12030000,'Deutsche Kreditbank',39104,'Magdeburg');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (142,12030000,'Deutsche Kreditbank',3046,'Cottbus');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (143,12030000,'Deutsche Kreditbank',15230,'Frankfurt (Oder)');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (144,12030000,'Deutsche Kreditbank',14471,'Potsdam');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (145,12030000,'Deutsche Kreditbank',17034,'Neubrandenburg, Meckl');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (146,12030000,'Deutsche Kreditbank',19053,'Schwerin, Meckl');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (147,12030000,'Deutsche Kreditbank',18057,'Rostock');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (148,12030000,'Deutsche Kreditbank (Gf P2)',10117,'Berlin');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (5333,44040060,'Commerzbank CC',44137,'Dortmund');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (5334,44040061,'Commerzbank CC',44137,'Dortmund');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (5373,44130000,'HKB Bank',60311,'Frankfurt am Main');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (5441,45030000,'HKB Bank',60311,'Frankfurt am Main');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (5442,45030000,'Handel und Kredit Bankhaus Altena',58095,'Hagen, Westf');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (9913,60069670,'Raiffeisenbank Ehingen-Hochsträß',89143,'Blaubeuren');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (9914,60069670,'Raiffeisenbank Ehingen-Hochsträß',89134,'Blaustein, Württ');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (9915,60069670,'Raiffeisenbank Ehingen-Hochsträß',89155,'Erbach, Donau');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (9916,60069670,'Raiffeisenbank Ehingen-Hochsträß (Gf P2)',89143,'Blaubeuren');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (9997,60069971,'Raiffeisenbank Ehingen-Hochsträß',89610,'Oberdischingen');
INSERT INTO kreditinstitut_auszug (bankid,bankleitzahl,bezeichnung,plz,ort) VALUES (9998,60069971,'Raiffeisenbank Ehingen-Hochsträß',89155,'Erbach, Donau');