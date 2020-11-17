### LEICHTATHLETIK WM ###

CREATE DATABASE leichtathletik_female_track;
# CREATE SCHEMA und CREATE DATABASE sind in MYSQL gleich zu behandeln

# Wenn ich nicht auf der richtigen DB mit der Query Console bin, springe ich
# mit diesem Statement auf die richtige DB
USE leichtathletik_female_track;

# Zum Löschen von einer DB
DROP DATABASE leichtathletik_female_track;

# Erzeugen der Tabellen, die keinen Fremdschlüssel haben
# AUTOINCREMENT muss man sich am ANFANG überlegen, wo man es benötigt!
CREATE TABLE event_location (
    location_id int auto_increment NOT NULL, -- PK
    city varchar(30),
    postal_code varchar(30) NOT NULL,
    address varchar(30),
    PRIMARY KEY (location_id)
);
#um die Tabelle noch einmal anzusehen, können diese Statements verwendet werden:
DESCRIBE event_location;
SHOW CREATE TABLE event_location;

CREATE TABLE athlete (
    athlete_id int auto_increment NOT NULL,
    nation varchar(3) NOT NULL,
    start_number int,
    first_name varchar(30),
    last_name varchar(30) NOT NULL,
    PRIMARY KEY (athlete_id)
);

# Wenn ich noch etwas verändern möchte, dann lösche ich die Tabelle nochmals und ändere
# das Statement und führe es neu aus.
DROP TABLE athlete;

## Wenn ich über MODIFY etwas verändere, dann hole ich mir über das SHOW CREATE TABLE STATEMENT die Zeile heraus,
# damit ich nichts vergesse oder versehentlich lösche
SHOW CREATE TABLE athlete;
ALTER TABLE athlete MODIFY athlete_id int(100) auto_increment NOT NULL;
DESCRIBE athlete;

CREATE TABLE event (
    event_id int auto_increment NOT NULL,
    disciplin varchar(30),
    date date,
    location_id int, -- FK (muss ich auch anlegen, damit ich nacher darauf referenzieren kann
    PRIMARY KEY (event_id),
    CONSTRAINT event_location_FK FOREIGN KEY (location_id) REFERENCES event_location(location_id) -- CONSTRAINT nur dann, wenn man unbedingt einen eigenen Namen vergeben möchte
);

SHOW CREATE TABLE event;

# KEY = INDEX - wird automatisch erstellt, wenn ich einen Fredschlüssel erzeuge

/* Zweite Variante

 */
CREATE TABLE event (
    event_id int auto_increment NOT NULL,
    disciplin varchar(30),
    date date,
    location_id int DEFAULT '999', -- FK (muss ich auch anlegen, damit ich nacher darauf referenzieren kann
    PRIMARY KEY (event_id)
);

ALTER TABLE event ADD FOREIGN KEY (location_id) REFERENCES event_location(location_id) ON DELETE RESTRICT;

DROP TABLE event;
# FOREIGN KEY löschen
ALTER TABLE event DROP foreign key event_ibfk_1;
ALTER TABLE event DROP key location_id;

# WENN ICH ELTERNTEIL LÖSCHE WAS SOLL MIT KIND PASSIEREN
# 1. DER FREMDSCHLÜSSEL (location_id) SOLL EINFACH AUF NULL gesetzt werden
ALTER TABLE event ADD FOREIGN KEY (location_id) REFERENCES event_location(location_id) ON DELETE SET NULL;
# 2. SOLL das Kind mitgelöscht werden?
ALTER TABLE event ADD FOREIGN KEY (location_id) REFERENCES event_location(location_id) ON DELETE CASCADE;
# 3. SOLL es verboten sein? RESTRICT
ALTER TABLE event ADD FOREIGN KEY (location_id) REFERENCES event_location(location_id) ON DELETE RESTRICT;
# 4. oder SOLL ein DEFAULT WERT eingestragen werden?
ALTER TABLE event ADD FOREIGN KEY (location_id) REFERENCES event_location(location_id) ON DELETE SET DEFAULT; -- MUSS ICH NOCH AUSFINDIG MACHEN

CREATE TABLE result (
    result_id int auto_increment NOT NULL,
    ranking int,
    value varchar(30),
    event_id int NOT NULL, -- da ein schwache Beziehung darf das resultat nur existieren wenn eine Veranstaltung existiert
    athlete_id int,
    PRIMARY KEY (result_id),
    FOREIGN KEY (event_id) REFERENCES event(event_id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (athlete_id) REFERENCES athlete(athlete_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE helper (
    helper_id int auto_increment NOT NULL,
    first_name varchar(30),
    last_name varchar(30) NOT NULL,
    PRIMARY KEY (helper_id)
);

DROP TABLE helper;
DROP TABLE helper_list;

# PRIMARY KEY bei KREUZTABELLE IST IMMER ZUSAMMENGESETZT

CREATE TABLE helper_list (
    helper_id int NOT NULL,
    event_id int NOT NULL,
    type varchar(30),
    PRIMARY KEY (helper_id,event_id), -- zusammengesetzter Primarykey
    FOREIGN KEY (helper_id) REFERENCES helper(helper_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (event_id) REFERENCES event(event_id) ON DELETE CASCADE ON UPDATE CASCADE
);

#VERANSTALTUNGORTE ANLEGEN
# STEP 1: mit DESCRIBE ansehen was ich angeben muss
# STEP 2: INSERT INTO formulieren
# STEP 3: mit SELECT überprüfen, was ich eingefügt habe

DESCRIBE event_location;
INSERT INTO event_location(city, postal_code, address) VALUES ('Linz', '4020', 'Stadionstraße 1'), ('Vienna', '1010', 'Olympiastraße 10');
SELECT * FROM event_location;

#ATHLETEN EINFÜGEN
DESCRIBE athlete;
# Nachträgliches Löschen der Startnummer
ALTER TABLE athlete DROP start_number;

INSERT INTO athlete(nation, first_name, last_name) VALUES ('AUT', 'Sarah', 'Baumann'), ('GER', 'Martin', 'Weger');
SELECT * FROM athlete;

#HELFER ANLEGEN
DESCRIBE helper;
INSERT INTO helper(first_name, last_name) VALUES ('Lisa', 'Baumann'), ('Paul', 'Weger');
SELECT * FROM helper;

#EVENT
DESCRIBE event;
SELECT * from event_location;
INSERT INTO event(disciplin, date, location_id) VALUES ('Weitsprung', '2020-11-25', 1),('Weitsprung', '2020-11-25', 2);
INSERT INTO event(disciplin, date, location_id) VALUES ('Weit-sprung', '2020-11-25', 1),('Weitsprungevent', '2020-11-25', 2);
DELETE FROM event -- Eigentlich sollte man ein WHERE-Statement formulieren (z.b. WHERE event_id=1) das machen wir aber jetzt bei unserem Testen nicht - wir löschen gleich alles aus der Tabelle EVENT!;

# Um sicherzugehen, dass die Diziplin einheitlich geschrieben wird und nur Disziplinen angegeben werden, die auch exisiteren erzeugen wir eine weitere Tabelle:
CREATE TABLE discipline(
    discipline_name varchar(30) NOT NULL,
    PRIMARY KEY (discipline_name)
);
INSERT INTO discipline(discipline_name) VALUES ('WEITSPRUNG'), ('HOCHSPRUNG'), ('100-METER-LAUF');
SELECT * FROM discipline;
ALTER TABLE event ADD FOREIGN KEY (disciplin) REFERENCES discipline(discipline_name);
INSERT INTO event(disciplin, date, location_id) VALUES ('Hochsprung', '2020-11-30', 1),('100-Meter-Lauf', '2020-11-28', 2);

# RESULTATE ANLEGEN
DESCRIBE result;
SELECT * FROM athlete;
SELECT * FROM event;
INSERT INTO result(ranking, value, event_id, athlete_id) VALUES (1,'5m',7,1);
SELECT * FROM result;

# HELFER-ZUORDNUNG
DESCRIBE helper_list;
SELECT * FROM event;
SELECT * FROM helper;

# WIR erzeugen wieder eine weitere Tabelle, damit wir sichergehen können, dass die Einträge einheitlich sind
CREATE TABLE helper_type (
    type varchar(30) NOT NULL,
    PRIMARY KEY (type)
);

INSERT INTO helper_type (type) VALUES ('Schiedsrichter'), ('Ordner');

INSERT INTO helper_list(helper_id, event_id, type) VALUES (1, 8,'Ordner'), (2, 7,'Ordner'), (2,8, 'Schiedsrichter');--
SELECT * FROM helper_list;

########
# ANFORDERUNGEN AN UNSER SYSTEM:
# Es soll ein Webformular geben, womit sich die Athleten zu einer Veranstaltung anmelden können

# Wir haben ein Problem ein Athlet kann keiner Veranstaltung zugewiesen werden, solange noch kein Ergebnis vorhanden ist.
# Wir brauchen eine direkte Verbindung (Beziehung) zwischen Athleten und Veranstaltung
# Hier handelt es sich um eine N zu M Beziehung und aus diesem Grund erstellen wir eine KREUZTABELLE

CREATE TABLE event_registrations (
    event_id int,
    athlete_id int,
    PRIMARY KEY (event_id,athlete_id),
    FOREIGN KEY (event_id) REFERENCES event(event_id) ON DELETE CASCADE ON UPDATE CASCADE ,
    FOREIGN KEY (athlete_id) REFERENCES athlete(athlete_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO athlete (nation, first_name, last_name) VALUES ('AUT', 'Hansi', 'Hinterseer');
SELECT * FROM athlete;
SELECT * FROM event;
INSERT INTO event_registrations (event_id, athlete_id) VALUES (4,3);

#Liste mit Name von Athlet und dem Namen der Veranstaltung + der Disziplin
SELECT first_name, last_name, event.event_id, disciplin, city FROM athlete
JOIN event_registrations
ON athlete.athlete_id = event_registrations.athlete_id
JOIN event
ON event_registrations.event_id = event.event_id
JOIN event_location
ON event.location_id = event_location.location_id
WHERE last_name LIKE '%Hint%'
;

# ANFORDERUNGEN AN UNSER SYSTEM:
# Es soll ein Webformular geben, womit sich die Helfer zu einer Veranstaltung anmelden können
SELECT * FROM helper;
SELECT * FROM event;
INSERT INTO helper_list(helper_id, event_id, type) VALUES(2,3, 'Schiedsrichter');

SELECT * FROM helper_list;

# NAME von Helfer, DIZPLIN von Event, Ort von Event, Type von Helfer

SELECT helper.last_name, event_location.city, event.disciplin, helper_list.type FROM helper
JOIN helper_list
ON helper.helper_id = helper_list.helper_id
JOIN event
ON helper_list.event_id = event.event_id
JOIN event_location
ON event.location_id=event_location.location_id;



