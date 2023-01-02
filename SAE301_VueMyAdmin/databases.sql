-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 02 jan. 2023 à 17:52
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sae301_evaluation`
--
CREATE DATABASE IF NOT EXISTS `sae301_evaluation` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sae301_evaluation`;

-- --------------------------------------------------------

--
-- Structure de la table `partiel2a`
--

DROP TABLE IF EXISTS `partiel2a`;
CREATE TABLE IF NOT EXISTS `partiel2a` (
  `libellePartiel` varchar(30) NOT NULL,
  `matiere` varchar(20) NOT NULL,
  `dateDebPartiel` date NOT NULL,
  `dateFinPartiel` date NOT NULL,
  `sallePartiel` varchar(7) NOT NULL,
  PRIMARY KEY (`libellePartiel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `partiel2a`
--

INSERT INTO `partiel2a` (`libellePartiel`, `matiere`, `dateDebPartiel`, `dateFinPartiel`, `sallePartiel`) VALUES
('MATH1', 'Math Discrètes', '2023-06-14', '2023-06-14', 'Amphi A'),
('PROBA1', 'Probabilités', '2023-05-30', '2023-06-01', 'Amphi B'),
('PROGSYST1', 'Prog Système', '2023-06-06', '2023-06-06', 'B09'),
('QDEV1', 'Qualité Dév', '2023-06-02', '2023-06-02', 'Amphi A'),
('RESO1', 'Archi Réseau', '2023-05-17', '2023-05-17', 'F06');

-- --------------------------------------------------------

--
-- Structure de la table `partiel3a`
--

DROP TABLE IF EXISTS `partiel3a`;
CREATE TABLE IF NOT EXISTS `partiel3a` (
  `libellePartiel` varchar(30) NOT NULL,
  `matiere` varchar(20) NOT NULL,
  `dateDebPartiel` date NOT NULL,
  `dateFinPartiel` date NOT NULL,
  `sallePartiel` varchar(7) NOT NULL,
  PRIMARY KEY (`libellePartiel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `partiel3a`
--

INSERT INTO `partiel3a` (`libellePartiel`, `matiere`, `dateDebPartiel`, `dateFinPartiel`, `sallePartiel`) VALUES
('CRYPTO3', 'Cryptographie', '2024-05-12', '2024-05-13', 'Amphi B'),
('MANAGSI3', 'Management SI', '2024-06-01', '2024-06-01', 'Amphi B'),
('PROG3', 'Programmation', '2024-06-06', '2024-06-06', 'E37'),
('SECU3', 'Réseau Sécurité', '2024-05-30', '2024-05-30', 'Amphi A'),
('VIRT3', 'Virtualisation', '2024-05-28', '2024-05-28', 'E33');
--
-- Base de données : `sae301_lna`
--
CREATE DATABASE IF NOT EXISTS `sae301_lna` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sae301_lna`;

-- --------------------------------------------------------

--
-- Structure de la table `but2a`
--

DROP TABLE IF EXISTS `but2a`;
CREATE TABLE IF NOT EXISTS `but2a` (
  `idEtud` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `matiere` varchar(20) NOT NULL,
  `moyenne` float NOT NULL,
  PRIMARY KEY (`idEtud`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `but2a`
--

INSERT INTO `but2a` (`idEtud`, `nom`, `prenom`, `matiere`, `moyenne`) VALUES
(1, 'VELLA', 'Matteo', 'Qualite Dev', 19.95),
(2, 'DELLAERA', 'Brice', 'Analyse', 18.75),
(3, 'ARNU', 'Lucas', 'Droit Numérique', 3.14),
(4, 'ENEL', 'Louis', 'Anglais', 12.5);

-- --------------------------------------------------------

--
-- Structure de la table `but3a`
--

DROP TABLE IF EXISTS `but3a`;
CREATE TABLE IF NOT EXISTS `but3a` (
  `idEtud` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `matiere` varchar(20) NOT NULL,
  `moyenne` float NOT NULL,
  PRIMARY KEY (`idEtud`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `but3a`
--

INSERT INTO `but3a` (`idEtud`, `nom`, `prenom`, `matiere`, `moyenne`) VALUES
(1, 'LAROCHE', 'Pierre', 'Analyse', 18.95),
(2, 'ROKA', 'Zsuzsanna', 'DevWeb', 15.75),
(3, 'JOYEUX', 'Stéphane', 'QualiteDev', 13.14),
(4, 'GINOUX', 'Nicolas', 'Cryptographie', 16.75);
--
-- Base de données : `sae301_stages`
--
CREATE DATABASE IF NOT EXISTS `sae301_stages` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sae301_stages`;

-- --------------------------------------------------------

--
-- Structure de la table `stage2a`
--

DROP TABLE IF EXISTS `stage2a`;
CREATE TABLE IF NOT EXISTS `stage2a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `villeStage` varchar(100) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `datedeb` date NOT NULL,
  `datefin` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `stage2a`
--

INSERT INTO `stage2a` (`id`, `nom`, `prenom`, `villeStage`, `intitule`, `datedeb`, `datefin`) VALUES
(1, 'ARNU', 'Lucas', 'Morsbach', 'Developpeur Web', '2023-04-17', '2023-06-10'),
(2, 'LOPEZ', 'Valentin', 'Metz', 'Solutions SQL', '2023-04-17', '2023-06-10'),
(3, 'CARLOS', 'Josh', 'Nancy', 'Fullstack Web', '2023-04-17', '2023-06-10'),
(4, 'DELLAERA', 'Brice', 'Strasbourg', 'RéseauTelecom', '2023-04-17', '2023-06-10'),
(5, 'VELLA', 'Matteo', 'Metz', 'VueJS Master', '2023-04-17', '2023-06-10');

-- --------------------------------------------------------

--
-- Structure de la table `stage3a`
--

DROP TABLE IF EXISTS `stage3a`;
CREATE TABLE IF NOT EXISTS `stage3a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `villeStage` varchar(100) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `datedeb` date NOT NULL,
  `datefin` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `stage3a`
--

INSERT INTO `stage3a` (`id`, `nom`, `prenom`, `villeStage`, `intitule`, `datedeb`, `datefin`) VALUES
(1, 'SARGENT', 'Robert', 'Biarritz', 'Developpeur JS', '2024-04-17', '2024-06-10'),
(2, 'DAVIS', 'Michel', 'Toulouse', 'SystAIO', '2024-04-17', '2024-06-10'),
(3, 'LANGELIER', 'Armina', 'Nice', 'AutomateIA', '2024-04-17', '2024-06-10'),
(4, 'GUERETTE', 'Gaetan', 'Millau', 'ChefProjet', '2024-04-17', '2024-06-10'),
(5, 'LANG', 'Armand', 'Verdun', 'TechNode', '2024-04-17', '2024-06-10');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
