-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 17, 2025 alle 18:10
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE RouteTableEngine;
USE RouteTableEngine;

--
-- Database: `routetableengine`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `bus`
--

CREATE TABLE `bus` (
  `ID` int(11) NOT NULL,
  `Posti` int(11) DEFAULT NULL,
  `ID_Linea` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `bus`
--

INSERT INTO `bus` (`ID`, `Posti`, `ID_Linea`) VALUES
(1, 50, 1),
(2, 50, 2),
(3, 50, 3),
(4, 50, 4),
(5, 50, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `cambio`
--

CREATE TABLE `cambio` (
  `ID` int(11) NOT NULL,
  `ID_Linea1` int(11) DEFAULT NULL,
  `ID_Linea2` int(11) DEFAULT NULL,
  `ID_Città` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `cambio`
--

INSERT INTO `cambio` (`ID`, `ID_Linea1`, `ID_Linea2`, `ID_Città`) VALUES
(1, 1, 2, 4),
(2, 1, 3, 4),
(3, 4, 5, 4),
(4, 4, 6, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `città`
--

CREATE TABLE `città` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `città`
--

INSERT INTO `città` (`ID`, `Nome`) VALUES
(1, 'Bari'),
(2, 'Pescara'),
(3, 'Ancona'),
(4, 'Bologna'),
(5, 'Genova'),
(6, 'Torino'),
(7, 'Milano'),
(8, 'Trento');

-- --------------------------------------------------------

--
-- Struttura della tabella `fermata`
--

CREATE TABLE `fermata` (
  `ID` int(11) NOT NULL,
  `ID_Linea` int(11) DEFAULT NULL,
  `ID_Città` int(11) DEFAULT NULL,
  `Orario` time DEFAULT NULL,
  `Durata_viaggio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `fermata`
--

INSERT INTO `fermata` (`ID`, `ID_Linea`, `ID_Città`, `Orario`, `Durata_viaggio`) VALUES
(1, 1, 1, '08:00:00', 1),
(2, 1, 2, '09:00:00', 1),
(3, 1, 3, '10:00:00', 1),
(4, 1, 4, '11:00:00', 1),
(5, 2, 5, '12:00:00', 1),
(6, 2, 6, '13:00:00', 1),
(7, 3, 7, '10:00:00', 1),
(8, 3, 8, '12:00:00', 2),
(9, 4, 6, '08:00:00', 1),
(10, 4, 5, '09:00:00', 1),
(11, 4, 4, '10:00:00', 1),
(12, 5, 3, '11:00:00', 1),
(13, 5, 2, '12:00:00', 1),
(14, 5, 1, '13:00:00', 1),
(15, 4, 6, '08:00:00', 1),
(16, 4, 5, '09:00:00', 1),
(17, 4, 4, '10:00:00', 1),
(18, 6, 7, '11:00:00', 1),
(19, 6, 8, '13:00:00', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `linea`
--

CREATE TABLE `linea` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `linea`
--

INSERT INTO `linea` (`ID`, `Nome`) VALUES
(1, 'Linea BA-BO/A'),
(2, 'Linea BO-TO/A'),
(3, 'Linea BO-MI/A'),
(4, 'Linea TO-BO/R'),
(5, 'Linea BO-BA/R'),
(6, 'Linea BO-MI/A');

-- --------------------------------------------------------

--
-- Struttura della tabella `passeggero`
--

CREATE TABLE `passeggero` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Cognome` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `passeggero`
--

INSERT INTO `passeggero` (`ID`, `Nome`, `Cognome`, `Email`) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@unipegaso.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE `prenotazione` (
  `ID` int(11) NOT NULL,
  `ID_Passeggero` int(11) DEFAULT NULL,
  `Data_Partenza` date DEFAULT NULL,
  `ID_Fermata_Partenza` int(11) DEFAULT NULL,
  `Posto` int(11) DEFAULT NULL,
  `Posto_Cambio` int(11) DEFAULT NULL,
  `ID_Fermata_Arrivo` int(11) DEFAULT NULL,
  `Prezzo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `prenotazione`
--

INSERT INTO `prenotazione` (`ID`, `ID_Passeggero`, `Data_Partenza`, `ID_Fermata_Partenza`, `Posto`, `Posto_Cambio`, `ID_Fermata_Arrivo`, `Prezzo`) VALUES
(1, 1, '2025-04-10', 1, 10, 20, 6, '80.00'),
(2, 1, '2025-04-15', 9, 34, 28, 14, '80.00');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Linea` (`ID_Linea`);

--
-- Indici per le tabelle `cambio`
--
ALTER TABLE `cambio`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Linea1` (`ID_Linea1`),
  ADD KEY `ID_Linea2` (`ID_Linea2`),
  ADD KEY `ID_Città` (`ID_Città`);

--
-- Indici per le tabelle `città`
--
ALTER TABLE `città`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `fermata`
--
ALTER TABLE `fermata`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Linea` (`ID_Linea`),
  ADD KEY `ID_Città` (`ID_Città`);

--
-- Indici per le tabelle `linea`
--
ALTER TABLE `linea`
  ADD PRIMARY KEY (`ID`);

--
-- Indici per le tabelle `passeggero`
--
ALTER TABLE `passeggero`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Passeggero` (`ID_Passeggero`),
  ADD KEY `ID_Fermata_Partenza` (`ID_Fermata_Partenza`),
  ADD KEY `ID_Fermata_Arrivo` (`ID_Fermata_Arrivo`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`ID_Linea`) REFERENCES `linea` (`ID`);

--
-- Limiti per la tabella `cambio`
--
ALTER TABLE `cambio`
  ADD CONSTRAINT `cambio_ibfk_1` FOREIGN KEY (`ID_Linea1`) REFERENCES `linea` (`ID`),
  ADD CONSTRAINT `cambio_ibfk_2` FOREIGN KEY (`ID_Linea2`) REFERENCES `linea` (`ID`),
  ADD CONSTRAINT `cambio_ibfk_3` FOREIGN KEY (`ID_Città`) REFERENCES `città` (`ID`);

--
-- Limiti per la tabella `fermata`
--
ALTER TABLE `fermata`
  ADD CONSTRAINT `fermata_ibfk_1` FOREIGN KEY (`ID_Linea`) REFERENCES `linea` (`ID`),
  ADD CONSTRAINT `fermata_ibfk_2` FOREIGN KEY (`ID_Città`) REFERENCES `città` (`ID`);

--
-- Limiti per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `prenotazione_ibfk_1` FOREIGN KEY (`ID_Passeggero`) REFERENCES `passeggero` (`ID`),
  ADD CONSTRAINT `prenotazione_ibfk_2` FOREIGN KEY (`ID_Fermata_Partenza`) REFERENCES `fermata` (`ID`),
  ADD CONSTRAINT `prenotazione_ibfk_3` FOREIGN KEY (`ID_Fermata_Arrivo`) REFERENCES `fermata` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
