create schema HP;
SET search_path TO HP;
-- Exercice 1 :  Creation de tables --
-- # Question 1--

--Partie II : Langage de définition de données--
-- # Question 4--
----creation table client----

CREATE TABLE HP.CLIENT (
    NUMCLIENT INT NOT NULL,
	CIV VARCHAR(20),
    PRENOMCLIENT VARCHAR(100),
    NOMCLIENT VARCHAR(100), 
	DATENAISSANCE DATE, 
	ADRESSE VARCHAR(100),
	TELPROF VARCHAR(20), 
	TELPRIV VARCHAR(20), 
	FAX VARCHAR(20),
	CONSTRAINT PK_NUMCLIENT PRIMARY KEY (NUMCLIENT)
);
----creation table EMPLOYE----
CREATE TABLE HP.CLIENT (
    NUMCLIENT INT NOT NULL,
	CIV VARCHAR(20),
    PRENOMCLIENT VARCHAR(100),
    NOMCLIENT VARCHAR(100), 
	DATENAISSANCE DATE, 
	ADRESSE VARCHAR(100),
	TELPROF VARCHAR(20), 
	TELPRIV VARCHAR(20), 
	FAX VARCHAR(20),
	CONSTRAINT PK_NUMCLIENT PRIMARY KEY (NUMCLIENT)
);


CREATE TABLE HP.EMPLOYE (
	NUMEMPLOYE INT,
	NOMEMP VARCHAR(100),
	PRENOMEMP VARCHAR(100), 
	CATEGORIE VARCHAR(100),
	SALAIRE DECIMAL(10, 2));
ALTER TABLE HP.EMPLOYE 
ADD CONSTRAINT PK_EMPLOYE PRIMARY KEY (NUMEMPLOYE);
;
--Creation table marque--

CREATE TABLE HP.MARQUE (
	NUMMARQUE INT,
	MARQUE VARCHAR(100), 
	PAYS VARCHAR(100));
ALTER TABLE HP.MARQUE 
ADD CONSTRAINT PK_MARQUE PRIMARY KEY (NUMMARQUE);
;
--Creation table MODELE--
CREATE TABLE HP.MODELE (
NUMMODELE INT, 
NUMMARQUE INT,
MODELE VARCHAR(50),
CONSTRAINT PK_MODELE PRIMARY KEY (NUMMODELE),
CONSTRAINT FK_NUMMARQUE FOREIGN KEY (NUMMARQUE) REFERENCES HP.MARQUE(NUMMARQUE)); 

--Creation table VEHICULE--

CREATE TABLE HP.VEHICULE (
	NUMVEHICULE INT, 
	NUMCLIENT INT,
	NUMMODELE INT,
	NUMIMMAT INT,
	ANNEE DATE,
	CONSTRAINT PK_NUMVEHICULE PRIMARY KEY (NUMVEHICULE),
	CONSTRAINT FKNUMCLIENT FOREIGN KEY (NUMCLIENT) REFERENCES HP.CLIENT(NUMCLIENT),
	CONSTRAINT FKNUMMODELE FOREIGN KEY (NUMMODELE) REFERENCES HP.MODELE(NUMMODELE));

ALTER TABLE HP.VEHICULE
ALTER COLUMN ANNEE TYPE INTEGER USING EXTRACT(YEAR FROM ANNEE);

ALTER TABLE HP.VEHICULE
DROP CONSTRAINT FKNUMCLIENT,
DROP CONSTRAINT FKNUMMODELE,
ADD CONSTRAINT FK_NUMCLIENT FOREIGN KEY (NUMCLIENT) REFERENCES HP.CLIENT(NUMCLIENT),
ADD CONSTRAINT FK_NUMMODELE FOREIGN KEY (NUMMODELE) REFERENCES HP.MODELE(NUMMODELE);

ALTER TABLE HP.VEHICULE
ALTER COLUMN NUMIMMAT TYPE BIGINT;
--Creation table INTERVENTIONS--

CREATE TABLE HP.INTERVENTIONS (
	NUMINTERVENTION INT, 
	NUMVEHICULE INT,
	TYPEINTERVENTION VARCHAR(100),
	DATEDEBINTERV DATE,
	DATEFININTERV DATE,
	COUTINTERV DECIMAL(10, 2),
	CONSTRAINT PK_NUMINTERVENTION PRIMARY KEY (NUMINTERVENTION),
	CONSTRAINT FK_NUMVEHICULE FOREIGN KEY (NUMVEHICULE) REFERENCES HP.VEHICULE(NUMVEHICULE));

--Creation table INTERVENTIONS--

CREATE TABLE HP.INTERVENANTS (
	NUMINTERVENTION INT, 
	NUMEMPLOYE INT,
	DATEDEBUT DATE,
	DATEFIN DATE,
	CONSTRAINT PK_NUMINTERV_EMP PRIMARY KEY (NUMINTERVENTION, NUMEMPLOYE),
	CONSTRAINT FK_NUMINTERVENTION FOREIGN KEY (NUMINTERVENTION) REFERENCES HP.INTERVENTIONS(NUMINTERVENTION),
	CONSTRAINT FK_NUMEMPLOYE FOREIGN KEY (NUMEMPLOYE) REFERENCES HP.EMPLOYE(NUMEMPLOYE));


INSERT INTO CLIENT VALUES 
(1, 'Mme', 'Cherifa', 'MAHBOUBA', '1957-08-08', 'CITE 1013 LOGTS BT 61 Alger', '0561381813', '0562458714', NULL),
(2, 'Mme', 'Lamia', 'TAHMI', '1955-12-31', 'CITE BACHEDJARAH BATIMENT 38 -Bach Djerrah-Alger', '0562467849', '0561392487', NULL),
(3, 'Mle', 'Ghania ', 'DIAF AMROUNI', '1955-12-31', '43, RUE ABDERRAHMANE SBAA BELLE VUE-EL HARRACH-ALGER', '0523894562', '0619430945', '0562784254'),
(4, 'Mle', 'Chahinaz', 'MELEK', '1955-06-27', 'HLM AISSAT IDIR CAGE 9 3EME ETAGE-EL HARRACH ALGER', '0634613493', '0562529463', NULL),
(5, 'Mme', 'Noura', 'TECHTACHE', '1949-03-22', '16, ROUTE EL DJAMILA-AIN BENIAN-ALGER', '0562757834', NULL, '0562757843'),
(6, 'Mme', 'Widad', 'TOUATI', '1965-08-14', '14 RUE DES FRERES AOUDIA-EL MOURADIA-ALGER', '0561243967', '0561401836', NULL),
(7, 'Mle', 'Faiza', 'ABLOUL', '1967-10-28', 'CITE DIPLOMATIQUE BT BLEU 14B N 3 DERGANA- ALGER', '0562935427', '0561486203', NULL),
(8, 'Mme', 'Assia', 'HORRA', '1963-12-08', '32 RUE AHMED OUAKED-DELY BRAHIM-ALGER', '0561038500', NULL, '0562466733'),
(9, 'Mle', 'Souad', 'MESBAH', '1972-08-30', 'RESIDENCE CHABANI-HYDRA-ALGER', '0561024358', NULL, NULL),
(10, 'Mme', 'Houda', 'GROUDA', '1950-02-20', 'EPSP THNIET ELABED BATNA', '0562939495', '0561218456', NULL),
(11, 'Mle', 'Saida', 'FENNICHE', NULL, 'CITE DE L’INDEPENDANCE LARBAA BLIDA', '0645983165', '0562014784', NULL),
(12, 'Mme', 'Samia', 'OUALI', '1966-11-17', 'CITE 200 LOGEMENTS BT1 N1-JIJEL', '0561374812', '0561277013', NULL),
(13, 'Mme', 'Fatiha', 'HADDAD', '1980-09-20', 'RUE BOUFADA LAKHDARAT-AIN OULMANE-SETIF', '0647092453', '0562442700', NULL),
(14, 'M', 'Djamel', 'MATI', NULL, 'DRAA KEBILA HAMMAM GUERGOUR SETIF', '0561033663', '0561484259', NULL),
(15, 'M', 'Mohamed', 'GHRAIR', '1950-06-24', 'CITE JEANNE D’ARC ECRAN B5-GAMBETTA – ORAN', '0561390288', NULL, '0562375849'),
(16, 'M', 'Ali', 'LAAOUAR', NULL, 'CITE 1ER MAI EX 137 LOGEMENTS-ADRAR', '0639939410', '0561255412', NULL),
(17, 'M', 'Messoud', 'AOUIZ', '1958-11-24', 'RUE SAIDANI ABDESSLAM -AIN BESSEM-BOUIRA', '0561439256', '0561473625', NULL),
(18, 'M', 'Farid', 'AKIL', '1961-05-06', '3 RUE LARBI BEN MHIDI-DRAA EL MIZAN-TIZI OUZOU', '0562349254', '0561294268', NULL),
(19, 'Mme', 'Dalila', 'MOUHTADI', NULL, '6, BD TRIPOLI ORAN', '0506271459', '0506294186', NULL),
(20, 'M', 'Younes', 'CHALAH', NULL, 'CITE DES 60 LOGTS BT D N 48-NACIRIA-BOUMERDES', NULL, '0561358279', NULL),
(21, 'M', 'Boubeker', 'BARKAT', '1935-11-08', 'CITE MENTOURI N 71 BT AB SMK Constantine', '0561824538', '0561326179', NULL),
(22, 'M', 'Seddik', 'HMIA', NULL, '25 RUE BEN YAHIYA-JIJEL', '0562379513', NULL, '0562493627'),
(23, 'M', 'Lamine', 'MERABAT', '1965-09-13', 'CITE JEANNE D’ARC ECRAN B2-GAMBETTA – ORAN', '0561724538', '0561724538', NULL);


INSERT INTO EMPLOYE VALUES 
(53, 'LACHEMI', 'Bouzid', 'Mecanicien', 25000),
(54, 'BOUCHEMLA', 'Elias', 'Assistant', 10000),
(55, 'HADJ', 'Zouhir', 'Assistant', 12000),
(56, 'OUSSEDIK', 'Hakim', 'Mecanicien', 20000),
(57, 'ABAD', 'Abdelhamid', 'Assistant', 13000),
(58, 'BABACI', 'Tayeb', 'Mecanicien', 21300),
(59, 'BELHAMIDI', 'Mourad', 'Mecanicien', 19500),
(60, 'IGOUDJIL', 'Redouane', 'Assistant', 15000),
(61, 'KOULA', 'Bahim', 'Mecanicien', 23100),
(62, 'RAHALI', 'Ahcene', 'Mecanicien', 24000),
(63, 'CHAOUI', 'Ismail', 'Assistant', 13000),
(64, 'BADI', 'Hatem', 'Assistant', 14000),
(65, 'MOHAMMEDI', 'Mustapha', 'Mecanicien', 24000),
(66, 'FEKAR', 'Abdelaziz', 'Assistant', 13500),
(67, 'SAIDOUNI', 'Wahid', 'Mecanicien', 25000),
(68, 'BOULARAS', 'Farid', 'Assistant', 14000),
(69, 'CHAKER', 'Nassim', 'Mecanicien', 26000),
(71, 'TERKI', 'Yacine', 'Mecanicien', 23000),
(72, 'TEBIBEL', 'Ahmed', 'Assistant', 17000),
(80, 'LARDJOUNE', 'Karim', 'Assistant', 25000);


INSERT INTO MARQUE VALUES
(1, 'LAMBORGHINI', 'ITALIE'),
(2, 'AUDI', 'ALLEMAGNE'),
(3, 'ROLLS-ROYCE', 'GRANDE-BRETAGNE'),
(4, 'BMW', 'ALLEMAGNE'),
(5, 'CADILLAC', 'ETATS-UNIS'),
(6, 'CHRYSLER', 'ETATS-UNIS'),
(7, 'FERRARI', 'ITALIE'),
(8, 'HONDA', 'JAPON'),
(9, 'JAGUAR', 'GRANDE-BRETAGNE'),
(10, 'ALFA-ROMEO', 'ITALIE'),
(11, 'LEXUS', 'JAPON'),
(12, 'LOTUS', 'GRANDE-BRETAGNE'),
(13, 'MASERATI', 'ITALIE'),
(14, 'MERCEDES', 'ALLEMAGNE'),
(15, 'PEUGEOT', 'FRANCE'),
(16, 'PORSCHE', 'ALLEMAGNE'),
(17, 'RENAULT', 'FRANCE'),
(18, 'SAAB', 'SUEDE'),
(19, 'TOYOTA', 'JAPON'),
(20, 'VENTURI', 'FRANCE'),
(21, 'VOLVO', 'SUEDE');


INSERT INTO MODELE VALUES
(2, 1, 'Diablo'),
(3, 2, 'Série 5'),
(4, 10, 'NSX'),
(5, 14, 'Classe C'),
(6, 17, 'Safrane'),
(7, 20, '400 GT'),
(8, 12, 'Esprit'),
(9, 15, '605'),
(10, 19, 'Prévia'),
(11, 7, '550 Maranello'),
(12, 3, 'Bentley-Continental'),
(13, 10, 'Spider'),
(14, 13, 'Evoluzione'),
(15, 16, 'Carrera'),
(16, 16, 'Boxter'),
(17, 21, 'S 80'),
(18, 6, '300 M'),
(19, 4, 'M 3'),
(20, 9, 'XJ 8'),
(21, 15, '406 Coupé'),
(22, 20, '300 Atlantic'),
(23, 14, 'Classe E'),
(24, 11, 'GS 300'),
(25, 5, 'Séville'),
(26, 18, '95 Cabriolet'),
(27, 2, 'TT Coupé'),
(28, 7, 'F 355');

INSERT INTO VEHICULE VALUES 
(1, 2, 6, '0012519216', 1992),
(2, 9, 20, '0124219316', 1993),
(3, 17, 8, '1452318716', 1987),
(4, 6, 12, '3145219816', 1998),
(5, 16, 23, '1278919816', 1998),
(6, 20, 6, '3853319735', 1997),
(7, 7, 8, '1453119816', 1998),
(8, 16, 14, '8365318601', 1986),
(9, 13, 15, '3087319233', 1992),
(10, 20, 22, '9413119935', 1999),
(11, 9, 16, '1572319801', 1998),
(12, 14, 20, '6025319733', 1997),
(13, 19, 17, '5205319736', 1997),
(14, 22, 21, '7543119207', 1992),
(15, 4, 19, '6254319916', 1999),
(16, 16, 21, '9831419701', 1997),
(17, 12, 11, '4563117607', 1976),
(18, 1, 2, '7973318216', 1982),
(20, 22, 2, '1234319707', 1997),
(21, 3, 19, '8429318516', 1985),
(22, 8, 19, '1245619816', 1998),
(23, 7, 25, '1678918516', 1985),
(25, 13, 5, '1278919833', 1998),
(26, 3, 10, '1458919316', 1993),
(27, 10, 7, '1256019804', 1998),
(28, 10, 3, '1986219904', 1999);

INSERT INTO INTERVENTIONS VALUES 
(1, 3, 'Réparation', '2006-02-25 09:00:00', '2006-02-26 12:00:00', 30000),
(2, 21, 'Réparation', '2006-02-23 09:00:00', '2006-02-24 18:00:00', 10000),
(3, 25, 'Réparation', '2006-04-06 14:00:00', '2006-04-09 12:00:00', 42000),
(5, 6, 'Réparation', '2006-02-22 09:00:00', '2006-02-25 18:00:00', 40000),
(6, 14, 'Entretien', '2006-03-03 14:00:00', '2006-03-04 18:00:00', 7500),
(8, 17, 'Entretien', '2006-05-11 14:00:00', '2006-05-12 18:00:00', 9000),
(10, 2, 'Entretien et Réparation', '2006-04-08 09:00:00', '2006-04-09 18:00:00', 45000),
(11, 28, 'Réparation', '2006-03-08 14:00:00', '2006-03-17 12:00:00', 36000),
(12, 20, 'Entretien et Réparation', '2006-05-03 09:00:00', '2006-05-05 18:00:00', 27000),
(14, 1, 'Réparation', '2006-05-10 14:00:00', '2006-05-12 12:00:00', 39000);



INSERT INTO INTERVENANTS VALUES
(1, 54, '2006-02-26 09:00:00', '2006-02-26 12:00:00'),
(1, 59, '2006-02-25 09:00:00', '2006-02-25 18:00:00'),
(2, 57, '2006-02-24 14:00:00', '2006-02-24 18:00:00'),
(2, 59, '2006-02-23 09:00:00', '2006-02-24 12:00:00'),
(3, 60, '2006-04-09 09:00:00', '2006-04-09 12:00:00'),
(3, 65, '2006-04-06 14:00:00', '2006-04-08 18:00:00'),
(5, 56, '2006-02-22 09:00:00', '2006-02-25 12:00:00'),
(5, 60, '2006-02-23 09:00:00', '2006-02-25 18:00:00'),
(6, 53, '2006-03-03 14:00:00', '2006-03-04 12:00:00'),
(6, 57, '2006-03-04 14:00:00', '2006-03-04 18:00:00'),
(8, 54, '2006-05-12 09:00:00', '2006-05-12 18:00:00'),
(8, 62, '2006-05-11 14:00:00', '2006-05-12 12:00:00'),
(10, 63, '2006-04-09 14:00:00', '2006-04-09 18:00:00'),
(10, 67, '2006-04-08 09:00:00', '2006-04-09 12:00:00'),
(11, 59, '2006-03-09 09:00:00', '2006-03-11 18:00:00'),
(11, 64, '2006-03-09 09:00:00', '2006-03-17 12:00:00'),
(11, 53, '2006-03-08 14:00:00', '2006-03-16 18:00:00'),
(12, 55, '2006-05-05 09:00:00', '2006-05-05 18:00:00'),
(12, 56, '2006-05-03 09:00:00', '2006-05-05 12:00:00');

--Partie II : Langage de définition de données--
-- # Question 5--
ALTER TABLE HP.EMPLOYE
ADD COLUMN DATEINSTALLATION DATE;
-- # Question 6--
ALTER TABLE HP.EMPLOYE
ALTER COLUMN CATEGORIE SET NOT NULL,
ALTER COLUMN SALAIRE SET NOT NULL;
-- # Question 7--
ALTER TABLE HP.EMPLOYE
ALTER COLUMN PRENOMEMP TYPE VARCHAR(150);

ALTER TABLE HP.EMPLOYE
ALTER COLUMN PRENOMEMP TYPE VARCHAR(50);

-- # Question 8--
ALTER TABLE HP.EMPLOYE
DROP COLUMN DATEINSTALLATION;
-- # Question 9--
ALTER TABLE HP.CLIENT
RENAME COLUMN ADRESSE TO ADRESSECLIENT;
-- # Question 10--
ALTER TABLE HP.INTERVENTIONS
ADD CONSTRAINT CHK_DATE_INTERVENTION CHECK (DATEDEBINTERV < DATEFININTERV);

-- Partie III : Langage de manipulation de données :Question 12--
UPDATE HP.EMPLOYE
SET SALAIRE = SALAIRE + 5000
WHERE NOMEMP = 'BADI' AND PRENOMEMP = 'Hatem';

SELECT *
FROM HP.EMPLOYE
WHERE NOMEMP = 'BADI' AND PRENOMEMP = 'Hatem';

--Question 13--
ALTER TABLE HP.INTERVENTIONS
DROP CONSTRAINT CHK_DATE_INTERVENTION;

UPDATE HP.INTERVENTIONS
SET DATEDEBINTERV = DATEDEBINTERV + INTERVAL '5 days'
WHERE EXTRACT(MONTH FROM DATEDEBINTERV) = 2;

--Question 14--

DELETE FROM HP.INTERVENANTS
WHERE NUMINTERVENTION IN (
    SELECT NUMINTERVENTION 
    FROM HP.INTERVENTIONS
    WHERE NUMVEHICULE IN (SELECT NUMVEHICULE FROM HP.VEHICULE WHERE NUMMODELE IN (SELECT NUMMODELE FROM HP.MODELE WHERE MODELE = 'Série 5'))
);

DELETE FROM HP.INTERVENTIONS
WHERE NUMVEHICULE IN (SELECT NUMVEHICULE FROM HP.VEHICULE WHERE NUMMODELE IN (SELECT NUMMODELE FROM HP.MODELE WHERE MODELE = 'Série 5'));

DELETE FROM HP.VEHICULE
WHERE NUMMODELE IN (SELECT NUMMODELE FROM HP.MODELE WHERE MODELE = 'Série 5');



--Partie IV : Langage d’interrogation de données :Question 15--

SELECT 
    M.MODELE,
    B.MARQUE
FROM 
    HP.MODELE M
JOIN 
    HP.MARQUE B ON M.NUMMARQUE = B.NUMMARQUE;
--Question 16--
SELECT DISTINCT 
    V.NUMVEHICULE, 
    V.NUMCLIENT, 
    V.NUMMODELE, 
    V.NUMIMMAT, 
    V.ANNEE
FROM 
    HP.VEHICULE V
JOIN 
    HP.INTERVENTIONS I ON V.NUMVEHICULE = I.NUMVEHICULE;

--Question 17--
SELECT 
    AVG(DATEFININTERV - DATEDEBINTERV) AS DureeMoyenneIntervention
FROM 
    HP.INTERVENTIONS;


--Question 18--	

SELECT SUM(COUTINTERV) AS MontantGlobalInterventions
FROM 
    HP.INTERVENTIONS
WHERE 
    COUTINTERV > 30000;



