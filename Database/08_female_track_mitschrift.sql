#1 Aufgabe
show create table fairysales_female_track.f_instances;
alter table f_instances modify instanceName varchar(42) NOT NULL;
describe fairysales_female_track.f_instances;
show full columns from f_instances;
#2. Aufgabe
select * from f_files;
show create table f_files;
ALTER TABLE f_files MODIFY storageName varchar(30) NOT NULL;
#3. Aufgabe
SELECT * from f_entries
WHERE headline="Casestudy1";
SELECT * from f_fileusage
WHERE entryID=33;
SHOW CREATE TABLE f_fileusage;
DELETE from f_entries WHERE headline="Casestudy1";
#4. Aufgabe
SELECT * from f_log
WHERE scope='File deletion';
#5. Aufgabe
SELECT * from f_files;
ALTER TABLE f_files DROP COLUMN numOfPics;
#6. Aufgabe
SELECT * from f_files;
SELECT * from f_users;
ALTER TABLE f_files ADD FOREIGN KEY (uploadedBy) REFERENCES f_users(id) ON DELETE CASCADE ON UPDATE CASCADE;
SHOW CREATE TABLE f_files;
/*falls man vergessen hat, das CASCADE beim foreign key einzustellen, dann noch einmal droppen und neu anlegen*/
ALTER TABLE f_files DROP FOREIGN KEY f_files_ibfk_1;
#7. Aufgabe
SELECT * from f_users;
SELECT * from f_instance_permissions;
SELECT * from f_instances;
SELECT username, CONCAT(prename, ' ', surname) AS 'Name',f_instances.instanceName from f_users
JOIN f_instance_permissions ON f_users.id = f_instance_permissions.userID
JOIN f_instances ON f_instance_permissions.instanceID = f_instances.id
WHERE instanceName ='World #2';
#8. Aufgabe
#Generieren Sie eine Liste, auf der ersichtlich ist, welche Datei auf welcher Instanz liegt. Zeigen Sie dabei nur den StorageName sowie den Instanznamen an.
SELECT * from f_files;
SELECT * from f_instances;
SELECT storageName, instanceName FROM f_files
JOIN f_users ON f_files.uploadedBy = f_users.id
JOIN f_instances ON f_users.currentInstance = f_instances.id;

#9. Aufgabe
# In der Log-Tabelle befinden sich ca. 9000 Einträge. Finden Sie heraus, wie viele unterschiedlichen Nachrichten (message) es im Log gibt.
SELECT count(DISTINCT message) FROM f_log;

#10.Stellen Sie für das System ein, dass Benutzer maximal 3 Versuche haben, sich einzuloggen.
SELECT  * from f_options;
UPDATE f_options SET value='3' WHERE id='max-login-attempts';

#11.Der Datenschutzexperte konsultiert Sie und würde gerne in Erfahrung bringen, welche Benutzungtypen für Mediendateien vorgesehen sind, und wie viele Dateien für den jeweiligen Typ im Datenbestand sind
SELECT * FROM f_fileusage;
SELECT count(*), usageType FROM f_fileusage GROUP BY usageType;

#12. Fügen Sie eine neue Instanz hinzu. Sie soll „World #CB“ heißen und „Coders.Bay“ als Beschreibung beinhalten.
SELECT * from f_instances;
DESCRIBE f_instances;
INSERT INTO f_instances(instancename, instancedescription, updatetime) VALUES ('World #CB', 'Coders.Bay', NOW());

#13 Erweitern Sie die Informationen über die Benutzer (f_users) um Straße, Postleitzahl und Ort. Achten Sie darauf, dass die Datenbank danach noch der 3. Normalform entspricht.
SELECT * FROM f_users;
ALTER TABLE f_users ADD street varchar(60), ADD ZIP int(4), ADD city varchar(25);
#oder so:
ALTER TABLE f_users ADD streetname varchar(50);
ALTER TABLE f_users ADD PLZ int;
ALTER TABLE f_users ADD city varchar(30);
#zum Überprüfen
DESCRIBE f_users;

#14 Legen Sie einen neuen Benutzer (f_users) für sich selbst an. Vergeben Sie sich selbst Rechte für alle Instanzen. Ihre Aktuelle Instanz soll „World #CB“ sein. Hinweis: Achten Sie darauf, dass ihr Passwort ebenso wie alle anderen SHA1 verschlüsselt in der Datenbank abgelegt wird.
SELECT * FROM f_users;
INSERT INTO f_users(username, password, prename, surname, currentInstance, lastLogin) VALUES ('Jasmin', sha1('12345'), 'Jasmin', 'Weismann', 4, NOW());

#15 Sorgen Sie dafür, dass alle Einträge (f_entries) mit dem Namen „Applications“ nunmehr auf der neu angelegten Instanz laufen.
SELECT * from f_instances;
SELECT * from f_entries WHERE name='Applications';
UPDATE f_entries SET instanceID=4 WHERE name ='Applications';

#16 Löschen Sie danach alle übrigen Einträge, die noch auf der Instanz „World #2“ liegen.
SELECT e.id, instanceName FROM f_instances
JOIN f_entries e
ON f_instances.id = e.instanceID
WHERE instanceName='World #2';

#einfache Variante
DELETE FROM f_entries WHERE instanceID=3;

#Zusatz: komplizierte Variante
DELETE FROM f_entries WHERE (SELECT id FROM f_instances WHERE instanceName='World #2');
USE fairysales_female;

#17 Generieren Sie eine Liste aller Einträge mit einem Hintergrundbild, die vom user „frischluft“ angelegt wurden.
SELECT name, fu.username, backgroundImage FROM f_entries
JOIN f_users fu
ON f_entries.createdBy = fu.id
WHERE fu.username='frischluft';

SELECT name, username from f_entries
JOIN f_users
ON f_entries.createdBy = f_users.id
WHERE backgroundImage IS NOT NULL AND f_users.username='frischluft';

SELECT * FROM f_entries;

#17 Generieren Sie eine Liste aller Einträge mit einem Hintergrundbild, die vom user „frischluft“ angelegt wurden.
SELECT name, fu.username, backgroundImage FROM f_entries
JOIN f_users fu
ON f_entries.createdBy = fu.id
WHERE fu.username='frischluft'
AND backgroundImage IS NOT NULL;

#18.) Generieren Sie eine Liste, die den Namen und die Überschrift aller Einträge zeigt. Auf dieser Liste sollen ebenso der Benutzername als „Autor“ sowie der Instanzname als „Server“ ausgegeben werden.
SELECT name, headline, f_users.username as Autor, f_instances.instanceName as Server FROM f_entries
JOIN f_users
ON f_entries.createdBy = f_users.id
JOIN f_instances
ON f_entries.instanceID = f_instances.id;

#19. Wählen sie alle Log-Einträge aus, deren Scope entweder „LOGIN“ oder „general“ ist. Von den Log-Einträgen sollten Sie die ID, den Scope und den Benutzernamen ausgeben.
SELECT f_log.id, username, scope FROM f_log
JOIN f_users
ON f_log.userID = f_users.id
WHERE scope='general' OR scope='LOGIN';

#20
SELECT f_log.id, username, scope FROM f_log
JOIN f_users
ON f_log.userID = f_users.id
WHERE scope IN ('general','LOGIN');


SHOW CREATE TABLE f_entries;
ALTER TABLE f_entries
MODIFY COLUMN `id` int(11) NOT NULL AUTO_INCREMENT;

SELECT USER();

/*USERRECHTE
USAGE - einloggen
INSERT, SELECT, UPDATE, DELETE
ALL PRIVILEGES
WITH GRANT OPTIONS
*/

SELECT * FROM mysql.user;

CREATE DATABASE privileges;

USE privileges;

CREATE TABLE mytable (
    id int auto_increment,
    name varchar(30),
    primary key (id)
);

CREATE TABLE forbiddentable (
    id int auto_increment,
    name varchar(30),
    primary key (id)
);

INSERT INTO mytable(name) VALUES('test');
INSERT INTO forbiddentable(name) VALUES('test');

CREATE USER db_user@localhost identified by '12345';
SELECT host, user FROM mysql.user;
GRANT SELECT ON privileges.* to db_user@localhost;
REVOKE SELECT ON privileges.* FROM db_user@localhost;
GRANT SELECT ON privileges.mytable to db_user@localhost;
SHOW GRANTS FOR db_user@localhost;

CREATE USER superuser@localhost;
GRANT ALL PRIVILEGES ON *.* to superuser@localhost with grant option;

DROP USER superuser@localhost;
RENAME USER db_user@localhost TO my_user@localhost;
SET PASSWORD FOR db_user@localhost = PASSWORD('123456');

CREATE DATABASE wordpress;
CREATE USER wordpress_user@localhost identified by '12345';
GRANT ALL PRIVILEGES ON wordpress.* to wordpress_user@localhost with grant option;
SHOW GRANTS FOR wordpress_user@localhost;
