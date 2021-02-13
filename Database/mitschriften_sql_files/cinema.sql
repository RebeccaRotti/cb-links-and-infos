-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 19. Jan 2021 um 16:36
-- Server-Version: 10.4.16-MariaDB
-- PHP-Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cinema`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cinema`
--

CREATE TABLE `cinema` (
  `cinema_id` int(11) NOT NULL,
  `cinema_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `cinema`
--

INSERT INTO `cinema` (`cinema_id`, `cinema_name`) VALUES
(1, 'Stadtkino Zentrum'),
(2, 'Kleines Kino');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_first_name` varchar(30) DEFAULT NULL,
  `customer_last_name` varchar(30) DEFAULT NULL,
  `customer_email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_first_name`, `customer_last_name`, `customer_email`) VALUES
(1, 'Greta', 'Feichtinger', 'gretfei@gmail.com'),
(2, 'Hans', 'Klopfer', 'hansklopf@gmx.at');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `svnr` bigint(20) DEFAULT NULL,
  `employee_first_name` varchar(30) DEFAULT NULL,
  `employee_last_name` varchar(30) DEFAULT NULL,
  `cinema_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_id`, `svnr`, `employee_first_name`, `employee_last_name`, `cinema_id`) VALUES
(1, 6895180580, 'David', 'Burgstaller', 1),
(2, 7896300379, 'Sonja', 'Mayer', 1),
(3, 8695020391, 'Petra', 'Jax', 1),
(4, 9687081574, 'Renate', 'Hochreiter', 2),
(5, 8368070692, 'Marlene', 'Klug', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `film`
--

CREATE TABLE `film` (
  `film_code` varchar(15) NOT NULL,
  `film_title` varchar(30) NOT NULL,
  `duration` time NOT NULL,
  `fsk` int(11) DEFAULT 0 COMMENT 'the fsk is notated as simple integer and stands for the age'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `film`
--

INSERT INTO `film` (`film_code`, `film_title`, `duration`, `fsk`) VALUES
('FG01', 'Forest Gump', '02:22:00', 0),
('PAT01', 'Der Pate', '02:55:00', 0),
('SL01', 'Stirb langsam', '02:06:00', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `film_show`
--

CREATE TABLE `film_show` (
  `show_id` int(11) NOT NULL,
  `show_date` date DEFAULT NULL,
  `show_start_time` time DEFAULT NULL,
  `show_end_time` time DEFAULT NULL,
  `film_code` varchar(15) NOT NULL,
  `hall_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `film_show`
--

INSERT INTO `film_show` (`show_id`, `show_date`, `show_start_time`, `show_end_time`, `film_code`, `hall_id`) VALUES
(1, '2021-02-01', '20:00:00', '23:00:00', 'PAT01', 1),
(2, '2021-02-02', '20:00:00', '23:00:00', 'PAT01', 1),
(3, '2021-02-03', '20:00:00', '23:00:00', 'PAT01', 1),
(4, '2021-02-04', '20:00:00', '23:00:00', 'PAT01', 1),
(5, '2021-02-01', '18:00:00', '21:00:00', 'PAT01', 2),
(6, '2021-02-02', '18:00:00', '21:00:00', 'PAT01', 2),
(7, '2021-02-03', '18:00:00', '21:00:00', 'PAT01', 2),
(8, '2021-02-04', '18:00:00', '21:00:00', 'PAT01', 2),
(9, '2021-02-01', '20:15:00', '23:15:00', 'PAT01', 5),
(10, '2021-02-05', '20:15:00', '23:15:00', 'PAT01', 5),
(11, '2021-02-01', '20:00:00', '23:00:00', 'FG01', 3),
(12, '2021-02-03', '20:00:00', '23:00:00', 'FG01', 3),
(13, '2021-02-05', '20:00:00', '23:00:00', 'FG01', 3),
(14, '2021-02-01', '20:30:00', '23:00:00', 'SL01', 4),
(15, '2021-02-02', '20:30:00', '23:00:00', 'SL01', 4),
(16, '2021-02-03', '20:30:00', '23:00:00', 'SL01', 4),
(17, '2021-02-04', '20:30:00', '23:00:00', 'SL01', 4),
(18, '2021-02-05', '20:30:00', '23:00:00', 'SL01', 4),
(19, '2021-02-04', '20:30:00', '23:00:00', 'SL01', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hall`
--

CREATE TABLE `hall` (
  `hall_id` int(11) NOT NULL,
  `hall_name` varchar(30) DEFAULT NULL,
  `cinema_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `hall`
--

INSERT INTO `hall` (`hall_id`, `hall_name`, `cinema_id`) VALUES
(1, 'James Bond', 1),
(2, 'Indiana Jones', 1),
(3, 'Robin Hood', 1),
(4, 'Asterix', 1),
(5, 'Alice', 2),
(6, 'Rapunzel', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `reservation_date` date DEFAULT NULL,
  `sales_person_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `reservation_date`, `sales_person_id`, `customer_id`) VALUES
(1, '2021-01-02', 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sales_person`
--

CREATE TABLE `sales_person` (
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `sales_person`
--

INSERT INTO `sales_person` (`employee_id`) VALUES
(2),
(3),
(4),
(5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seat`
--

CREATE TABLE `seat` (
  `seat_id` int(11) NOT NULL,
  `row` int(11) NOT NULL,
  `seat_number` int(11) NOT NULL,
  `hall_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `seat`
--

INSERT INTO `seat` (`seat_id`, `row`, `seat_number`, `hall_id`) VALUES
(1, 10, 1, 1),
(2, 10, 2, 1),
(3, 10, 3, 1),
(4, 10, 4, 1),
(5, 10, 5, 1),
(6, 11, 1, 1),
(7, 11, 2, 1),
(8, 11, 3, 1),
(9, 11, 4, 1),
(10, 11, 5, 1),
(11, 10, 1, 2),
(12, 10, 2, 2),
(13, 10, 3, 2),
(14, 10, 4, 2),
(15, 10, 5, 2),
(16, 11, 1, 2),
(17, 11, 2, 2),
(18, 11, 3, 2),
(19, 11, 4, 2),
(20, 11, 5, 2),
(21, 10, 1, 3),
(22, 10, 2, 3),
(23, 10, 3, 3),
(24, 10, 4, 3),
(25, 10, 5, 3),
(26, 11, 1, 3),
(27, 11, 2, 3),
(28, 11, 3, 3),
(29, 11, 4, 3),
(30, 11, 5, 3),
(31, 10, 1, 4),
(32, 10, 2, 4),
(33, 10, 3, 4),
(34, 10, 4, 4),
(35, 10, 5, 4),
(36, 11, 1, 4),
(37, 11, 2, 4),
(38, 11, 3, 4),
(39, 11, 4, 4),
(40, 11, 5, 4),
(41, 8, 1, 5),
(42, 8, 2, 5),
(43, 8, 3, 5),
(44, 9, 1, 5),
(45, 9, 2, 5),
(46, 9, 3, 5),
(47, 8, 1, 6),
(48, 8, 2, 6),
(49, 8, 3, 6),
(50, 9, 1, 6),
(51, 9, 2, 6),
(52, 9, 3, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seat_in_show`
--

CREATE TABLE `seat_in_show` (
  `show_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `seat_in_show`
--

INSERT INTO `seat_in_show` (`show_id`, `seat_id`, `ticket_id`, `reservation_id`) VALUES
(1, 1, 4, NULL),
(1, 2, NULL, 1),
(5, 11, 5, NULL),
(19, 49, 6, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `ticket_date` date DEFAULT current_timestamp(),
  `ticket_status` varchar(1) DEFAULT NULL COMMENT 'A active, I inactive',
  `ticket_price` decimal(10,0) DEFAULT NULL,
  `sales_person_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `ticket_attendant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `ticket_date`, `ticket_status`, `ticket_price`, `sales_person_id`, `customer_id`, `ticket_attendant_id`) VALUES
(4, '2021-01-18', 'A', '13', 2, 1, NULL),
(5, '2021-01-18', 'A', '15', 3, 2, NULL),
(6, '2021-01-18', 'A', '13', 5, 2, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ticket_attendant`
--

CREATE TABLE `ticket_attendant` (
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `ticket_attendant`
--

INSERT INTO `ticket_attendant` (`employee_id`) VALUES
(1),
(4),
(5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `voucher`
--

CREATE TABLE `voucher` (
  `voucher_id` int(11) NOT NULL,
  `voucher_price` decimal(10,0) DEFAULT NULL,
  `voucher_date` date DEFAULT NULL,
  `sales_person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `voucher`
--

INSERT INTO `voucher` (`voucher_id`, `voucher_price`, `voucher_date`, `sales_person_id`) VALUES
(1, '20', '2021-01-01', 2),
(2, '30', '2021-01-01', 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`cinema_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_email` (`customer_email`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `cinema_id` (`cinema_id`);

--
-- Indizes für die Tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`film_code`);

--
-- Indizes für die Tabelle `film_show`
--
ALTER TABLE `film_show`
  ADD PRIMARY KEY (`show_id`),
  ADD KEY `film_code` (`film_code`),
  ADD KEY `hall_id` (`hall_id`);

--
-- Indizes für die Tabelle `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`hall_id`),
  ADD KEY `cinema_id` (`cinema_id`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `sales_person_id` (`sales_person_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indizes für die Tabelle `sales_person`
--
ALTER TABLE `sales_person`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indizes für die Tabelle `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `hall_id` (`hall_id`);

--
-- Indizes für die Tabelle `seat_in_show`
--
ALTER TABLE `seat_in_show`
  ADD PRIMARY KEY (`show_id`,`seat_id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indizes für die Tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `sales_person_id` (`sales_person_id`),
  ADD KEY `ticket_attendant_id` (`ticket_attendant_id`);

--
-- Indizes für die Tabelle `ticket_attendant`
--
ALTER TABLE `ticket_attendant`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indizes für die Tabelle `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucher_id`),
  ADD KEY `sales_person_id` (`sales_person_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `cinema`
--
ALTER TABLE `cinema`
  MODIFY `cinema_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `film_show`
--
ALTER TABLE `film_show`
  MODIFY `show_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT für Tabelle `hall`
--
ALTER TABLE `hall`
  MODIFY `hall_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `seat`
--
ALTER TABLE `seat`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT für Tabelle `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`);

--
-- Constraints der Tabelle `film_show`
--
ALTER TABLE `film_show`
  ADD CONSTRAINT `film_show_ibfk_1` FOREIGN KEY (`film_code`) REFERENCES `film` (`film_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `film_show_ibfk_2` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`hall_id`);

--
-- Constraints der Tabelle `hall`
--
ALTER TABLE `hall`
  ADD CONSTRAINT `hall_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`sales_person_id`) REFERENCES `sales_person` (`employee_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `sales_person`
--
ALTER TABLE `sales_person`
  ADD CONSTRAINT `sales_person_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints der Tabelle `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`hall_id`) REFERENCES `hall` (`hall_id`);

--
-- Constraints der Tabelle `seat_in_show`
--
ALTER TABLE `seat_in_show`
  ADD CONSTRAINT `seat_in_show_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`),
  ADD CONSTRAINT `seat_in_show_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints der Tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`sales_person_id`) REFERENCES `sales_person` (`employee_id`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`ticket_attendant_id`) REFERENCES `ticket_attendant` (`employee_id`);

--
-- Constraints der Tabelle `voucher`
--
ALTER TABLE `voucher`
  ADD CONSTRAINT `voucher_ibfk_1` FOREIGN KEY (`sales_person_id`) REFERENCES `sales_person` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
