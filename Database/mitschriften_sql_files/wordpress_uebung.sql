## Erstelle eine Wordpressdatenbank
create database wordpress;
create schema wordpress; #in mysql ist kein unterschied zwischen shema und datenbank

## Erstelle einen User mit allen Rechten ausschließlich für die Wordpressdatenbank
create user wordpressuser@localhost identified by '12345';
grant all privileges on wordpress.* to wordpressuser@localhost;

## Ändere das Passwort deines Wordpressdatenbankusers
set password for wordpressuser@localhost = PASSWORD ('12345');
## ACHTUNG: Unterschied zwischen Backend und Datenbankuser!!

## Finde heraus in welchem Wordpress-File du das Passwort ändern musst, um die Datenbankverbindung wieder aufzubauen
## wp-config.php

## Du hast das Passwort deines Wordpressbackendusers vergessen. Zum Glück kannst du dich auf die Datenbank verbinden. Wie könntest du vorgehen, um das Passwort über die Datenbank zu ändern?
## Kleiner Tipp: Verwende ein Tool dieser Art: http://scriptserver.mainframe8.com/wordpress_password_hasher.php
select * FROM wp_users;
update wp_users set user_pass='$P$Bs1X/m72wKBRQNIWibis0KPIFRbaam/' where user_login LIKE '%admin%';

## Erstelle einen Beitrag mit einem beliebigen Foto über das Wordpress-Backend.


## Suche den Beitrag in deiner Wordpressdatenbank.
select * from wp_posts;

## Du siedelst deine Wordpressseite um und legst sie nun in einen Ordner, den du ‚neu‘ nennst. Sieh dir nun das Wordpress-Frontend an. Wie kannst du deine Beiträge und Bilder wieder sichtbar machen?
### Link in wp-options ändern
select * from wp_options;
update wp_options set option_value='http://localhost/neuewordpress_seite' where option_id = 1 OR option_id = 2;

## Links in wp-posts ändern (post_content, guid):
select * from wp_posts;
UPDATE wp_posts SET post_content = replace(post_content, 'http://localhost/wp/wordpress', 'http://localhost/neuewordpress_seite');

UPDATE wp_posts SET guid = replace(guid, 'http://localhost/wp/wordpress', 'http://localhost/neuewordpress_seite');

# COMMENTS
select * FROM wp_comments;
UPDATE wp_comments SET comment_content = replace (comment_content,'http://localhost/wp/wordpress', 'http://localhost/neuewordpress_seite');

# LINKS
select * FROM wp_links;
UPDATE wp_links SET link_image = replace (link_image,'http://localhost/wp/wordpress', 'http://localhost/neuewordpress_seite');

# USERMETA
select * FROM wp_usermeta;
UPDATE wp_usermeta SET meta_value = replace (meta_value,'http://localhost/wp/wordpress', 'http://localhost/neuewordpress_seite');

# POSTMETA
select * FROM wp_postmeta;
UPDATE wp_postmeta SET meta_value = replace (meta_value,'http://localhost/wp/wordpress', 'http://localhost/neuewordpress_seite');


