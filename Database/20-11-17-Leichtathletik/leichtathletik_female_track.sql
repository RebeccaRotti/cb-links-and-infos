-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 17. Nov 2020 um 19:53
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `leichtathletik_female_track`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `athlete`
--

CREATE TABLE `athlete` (
  `athlete_id` int(100) NOT NULL,
  `nation` varchar(3) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `athlete`
--

INSERT INTO `athlete` (`athlete_id`, `nation`, `first_name`, `last_name`) VALUES
(1, 'AUT', 'Sarah', 'Baumann'),
(2, 'GER', 'Martin', 'Weger'),
(3, 'AUT', 'Hansi', 'Hinterseer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `discipline`
--

CREATE TABLE `discipline` (
  `discipline_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `discipline`
--

INSERT INTO `discipline` (`discipline_name`) VALUES
('100-METER-LAUF'),
('HOCHSPRUNG'),
('WEITSPRUNG');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event`
--

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL,
  `disciplin` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `location_id` int(11) DEFAULT 999
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `event`
--

INSERT INTO `event` (`event_id`, `disciplin`, `date`, `location_id`) VALUES
(3, 'Weitsprung', '2020-11-25', 1),
(4, 'Weitsprung', '2020-11-25', 2),
(7, 'Hochsprung', '2020-11-30', 1),
(8, '100-Meter-Lauf', '2020-11-28', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event_location`
--

CREATE TABLE `event_location` (
  `location_id` int(11) NOT NULL,
  `city` varchar(30) DEFAULT NULL,
  `postal_code` varchar(30) NOT NULL,
  `address` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `event_location`
--

INSERT INTO `event_location` (`location_id`, `city`, `postal_code`, `address`) VALUES
(1, 'Linz', '4020', 'Stadionstraße 1'),
(2, 'Vienna', '1010', 'Olympiastraße 10');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event_registrations`
--

CREATE TABLE `event_registrations` (
  `event_id` int(11) NOT NULL,
  `athlete_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `event_registrations`
--

INSERT INTO `event_registrations` (`event_id`, `athlete_id`) VALUES
(4, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `helper`
--

CREATE TABLE `helper` (
  `helper_id` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `helper`
--

INSERT INTO `helper` (`helper_id`, `first_name`, `last_name`) VALUES
(1, 'Lisa', 'Baumann'),
(2, 'Paul', 'Weger');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `helper_list`
--

CREATE TABLE `helper_list` (
  `helper_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `helper_list`
--

INSERT INTO `helper_list` (`helper_id`, `event_id`, `type`) VALUES
(1, 3, 'Schiedsrichter'),
(1, 8, 'Ordner'),
(2, 3, 'Schiedsrichter'),
(2, 7, 'Ordner'),
(2, 8, 'Schiedsrichter');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `helper_type`
--

CREATE TABLE `helper_type` (
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `helper_type`
--

INSERT INTO `helper_type` (`type`) VALUES
('Ordner'),
('Schiedsrichter');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `result`
--

CREATE TABLE `result` (
  `result_id` int(11) NOT NULL,
  `ranking` int(11) DEFAULT NULL,
  `value` varchar(30) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `athlete_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `result`
--

INSERT INTO `result` (`result_id`, `ranking`, `value`, `event_id`, `athlete_id`) VALUES
(1, 1, '5m', 7, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `athlete`
--
ALTER TABLE `athlete`
  ADD PRIMARY KEY (`athlete_id`);

--
-- Indizes für die Tabelle `discipline`
--
ALTER TABLE `discipline`
  ADD PRIMARY KEY (`discipline_name`);

--
-- Indizes für die Tabelle `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `disciplin` (`disciplin`);

--
-- Indizes für die Tabelle `event_location`
--
ALTER TABLE `event_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indizes für die Tabelle `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD PRIMARY KEY (`event_id`,`athlete_id`),
  ADD KEY `athlete_id` (`athlete_id`);

--
-- Indizes für die Tabelle `helper`
--
ALTER TABLE `helper`
  ADD PRIMARY KEY (`helper_id`);

--
-- Indizes für die Tabelle `helper_list`
--
ALTER TABLE `helper_list`
  ADD PRIMARY KEY (`helper_id`,`event_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indizes für die Tabelle `helper_type`
--
ALTER TABLE `helper_type`
  ADD PRIMARY KEY (`type`);

--
-- Indizes für die Tabelle `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `athlete_id` (`athlete_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `athlete`
--
ALTER TABLE `athlete`
  MODIFY `athlete_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `event_location`
--
ALTER TABLE `event_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `helper`
--
ALTER TABLE `helper`
  MODIFY `helper_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `result`
--
ALTER TABLE `result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `event_location` (`location_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`disciplin`) REFERENCES `discipline` (`discipline_name`);

--
-- Constraints der Tabelle `event_registrations`
--
ALTER TABLE `event_registrations`
  ADD CONSTRAINT `event_registrations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_registrations_ibfk_2` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`athlete_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `helper_list`
--
ALTER TABLE `helper_list`
  ADD CONSTRAINT `helper_list_ibfk_1` FOREIGN KEY (`helper_id`) REFERENCES `helper` (`helper_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `helper_list_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`athlete_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
