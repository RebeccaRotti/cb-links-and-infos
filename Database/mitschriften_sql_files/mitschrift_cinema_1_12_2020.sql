/*
Um eine saubere Datenbank zu erhalten, machen wir alles gleich auf Englisch und bemühen uns einheitlich zu benennen

1.Normalform: jedes Attribut soll atomar sein - keine Werte die mit Beistrich getrennt
2.Normalform: Nichtschlüsselattribute vom ganzen Primary Key abhängig
3.Normalform: KEINE Abhängigkeit zwischen Nichtschlüsselattributen

cinema {(cinema_id:int not null auto_increment (PK), cinema_name:varchar(100) NOT NULL)}
hall {(hall_id:int not null auto_increment (PK), hall_name: varchar(30), cinema_id:int (FK))}
seat (seat_id:int not null auto_increment (PK), row: int not null, seat_number:int not null, hall_id: int (FK))
film (film_code: varchar(15) not null (PK), film_title: varchar(30) not null, duration:time not null, FSK: int DEFAULT 0)
show (show_id: int not null auto_increment (PK), show_date: DATE, show_start_time: TIME, show_end_time: TIME,  film_code: varchar(15) not null(FK), hall_id: int (FK) )
customer (customer_id:int not null auto_increment (PK), customer_name:varchar(30), customer_email:varchar(50) UNIQUE )
seat_in_show (show_id:int not null (PK), seat_id: int not null (PK), ticket_id:int (FK), reservation_id:int (FK) )
sales_person (sales_person_id: int not null auto_increment (PK), employee_id:int(FK))
ticket_attendant (ticket_attendant:int not null auto_increment (PK), employee_id:int(FK))
employee (employee_id: int auto_increment not null (PK), SVNR: bigint, employee_first_name: varchar(30), employee_last_name: varchar(30), cinema_id:int(FK))
voucher (voucher_id: int not null auto_increment (PK), voucher_price:decimal, voucher_date:DATE, sales_person_id:int(FK))
reservation (reservation_id:int not null auto_increment (PK), reservation_date: DATE, sales_person_id:int(FK), customer_id:int(FK))
ticket (ticket_id:int not null auto_increment (PK), ticket_date: DATE, ticket_status:varchar(1), ticket_price: decimal, sales_person_id:int(FK), customer_id:int (FK), ticket_attendant_id:int (FK))
)
 */

##DB erstellen:

CREATE DATABASE cinema;
USE cinema;

CREATE TABLE database_info (
    id int auto_increment,
    text text,
    PRIMARY KEY (id)
);

INSERT INTO database_info (text) VALUES ('cinema {(cinema_id:int not null auto_increment (PK), cinema_name:varchar(100) NOT NULL)}
hall {(hall_id:int not null auto_increment (PK), hall_name: varchar(30), cinema_id:int (FK))}
seat (seat_id:int not null auto_increment (PK), row: int not null, seat_number:int not null, hall_id: int (FK))
film (film_code: varchar(15) not null (PK), film_title: varchar(30) not null, duration:time not null, FSK: int DEFAULT 0)
show (show_id: int not null auto_increment (PK), show_date: DATE, show_start_time: TIME, show_end_time: TIME,  film_code: varchar(15) not null(FK), hall_id: int (FK) )
customer (customer_id:int not null auto_increment (PK), customer_name:varchar(30), customer_email:varchar(50) UNIQUE )
seat_in_show (show_id:int not null (PK), seat_id: int not null (PK), ticket_id:int (FK), reservation_id:int (FK) )
sales_person (sales_person_id: int not null auto_increment (PK), employee_id:int(FK))
ticket_attendant (ticket_attendant:int not null auto_increment (PK), employee_id:int(FK))
employee (employee_id: int auto_increment not null (PK), SVNR: bigint, employee_first_name: varchar(30), employee_last_name: varchar(30), cinema_id:int(FK))
voucher (voucher_id: int not null auto_increment (PK), voucher_price:decimal, voucher_date:DATE, sales_person_id:int(FK))
reservation (reservation_id:int not null auto_increment (PK), reservation_date: DATE, sales_person_id:int(FK), customer_id:int(FK))
ticket (ticket_id:int not null auto_increment (PK), ticket_date: DATE, ticket_status:varchar(1), ticket_price: decimal, sales_person_id:int(FK), customer_id:int (FK), ticket_attendant_id:int (FK))
)');

SELECT * FROM database_info;

/*
cinema {(cinema_id:int not null auto_increment (PK), cinema_name:varchar(100) NOT NULL)}
*/

CREATE TABLE cinema (
    cinema_id int NOT NULL AUTO_INCREMENT,
    cinema_name varchar(100) NOT NULL,
    PRIMARY KEY (cinema_id)
);

/*
hall {(hall_id:int not null auto_increment (PK), hall_name: varchar(30), cinema_id:int (FK))}
*/

CREATE TABLE hall (
    hall_id int NOT NULL AUTO_INCREMENT,
    hall_name varchar(30),
    cinema_id int,
    PRIMARY KEY (hall_id),
    FOREIGN KEY (cinema_id) REFERENCES cinema(cinema_id) ON DELETE CASCADE ON UPDATE CASCADE
);

/*
seat (seat_id:int not null auto_increment (PK), row: int not null, seat_number:int not null, hall_id: int (FK))*/


/*
film (film_code: varchar(15) not null (PK), film_title: varchar(30) not null, duration:time not null, FSK: int DEFAULT 0)
*/

CREATE TABLE film(
    film_code varchar(15) NOT NULL,
    film_title varchar(30) NOT NULL,
    duration time NOT NULL,
    fsk int DEFAULT 0 COMMENT 'the fsk is notated as simple integer and stands for the age',
    PRIMARY KEY (film_code)
);

/*
show (show_id: int not null auto_increment (PK), show_date: DATE, show_start_time: TIME, show_end_time: TIME,  film_code: varchar(15) not null(FK), hall_id: int (FK) )
customer (customer_id:int not null auto_increment (PK), customer_name:varchar(30), customer_email:varchar(50) UNIQUE )
seat_in_show (show_id:int not null (PK), seat_id: int not null (PK), ticket_id:int (FK), reservation_id:int (FK) )
sales_person (sales_person_id: int not null auto_increment (PK), employee_id:int(FK))
ticket_attendant (ticket_attendant:int not null auto_increment (PK), employee_id:int(FK))
employee (employee_id: int auto_increment not null (PK), SVNR: bigint, employee_first_name: varchar(30), employee_last_name: varchar(30), cinema_id:int(FK))
voucher (voucher_id: int not null auto_increment (PK), voucher_price:decimal, voucher_date:DATE, sales_person_id:int(FK))
reservation (reservation_id:int not null auto_increment (PK), reservation_date: DATE, sales_person_id:int(FK), customer_id:int(FK))
ticket (ticket_id:int not null auto_increment (PK), ticket_date: DATE, ticket_status:varchar(1), ticket_price: decimal, sales_person_id:int(FK), customer_id:int (FK), ticket_attendant_id:int (FK))
)
 */
