-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 20 déc. 2022 à 12:01
-- Version du serveur : 10.5.15-MariaDB-0+deb11u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `SAE301_EVALUATION`
--
CREATE DATABASE IF NOT EXISTS `SAE301_EVALUATION` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `SAE301_EVALUATION`;

-- --------------------------------------------------------

--
-- Structure de la table `Partiel2A`
--

CREATE TABLE `Partiel2A` (
  `libellePartiel` varchar(30) NOT NULL,
  `matiere` varchar(20) NOT NULL,
  `dateDebPartiel` date NOT NULL,
  `dateFinPartiel` date NOT NULL,
  `sallePartiel` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Partiel2A`
--

INSERT INTO `Partiel2A` (`libellePartiel`, `matiere`, `dateDebPartiel`, `dateFinPartiel`, `sallePartiel`) VALUES
('MATH1', 'Math Discrètes', '2023-06-14', '2023-06-14', 'Amphi A'),
('PROBA1', 'Probabilités', '2023-05-30', '2023-06-01', 'Amphi B'),
('PROGSYST1', 'Prog Système', '2023-06-06', '2023-06-06', 'B09'),
('QDEV1', 'Qualité Dév', '2023-06-02', '2023-06-02', 'Amphi A'),
('RESO1', 'Archi Réseau', '2023-05-17', '2023-05-17', 'F06');

-- --------------------------------------------------------

--
-- Structure de la table `Partiel3A`
--

CREATE TABLE `Partiel3A` (
  `libellePartiel` varchar(30) NOT NULL,
  `matiere` varchar(20) NOT NULL,
  `dateDebPartiel` date NOT NULL,
  `dateFinPartiel` date NOT NULL,
  `sallePartiel` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Partiel3A`
--

INSERT INTO `Partiel3A` (`libellePartiel`, `matiere`, `dateDebPartiel`, `dateFinPartiel`, `sallePartiel`) VALUES
('CRYPTO3', 'Cryptographie', '2024-05-12', '2024-05-13', 'Amphi B'),
('MANAGSI3', 'Management SI', '2024-06-01', '2024-06-01', 'Amphi B'),
('PROG3', 'Programmation', '2024-06-06', '2024-06-06', 'E37'),
('SECU3', 'Réseau Sécurité', '2024-05-30', '2024-05-30', 'Amphi A'),
('VIRT3', 'Virtualisation', '2024-05-28', '2024-05-28', 'E33');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Partiel2A`
--
ALTER TABLE `Partiel2A`
  ADD PRIMARY KEY (`libellePartiel`);

--
-- Index pour la table `Partiel3A`
--
ALTER TABLE `Partiel3A`
  ADD PRIMARY KEY (`libellePartiel`);
--
-- Base de données : `SAE301_LNA`
--
CREATE DATABASE IF NOT EXISTS `SAE301_LNA` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `SAE301_LNA`;

-- --------------------------------------------------------

--
-- Structure de la table `BUT2A`
--

CREATE TABLE `BUT2A` (
  `idEtud` int(11) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `matiere` varchar(20) NOT NULL,
  `moyenne` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `BUT2A`
--

INSERT INTO `BUT2A` (`idEtud`, `nom`, `prenom`, `matiere`, `moyenne`) VALUES
(1, 'VELLA', 'Matteo', 'Qualite Dev', 19.95),
(2, 'DELLAERA', 'Brice', 'Analyse', 18.75),
(3, 'ARNU', 'Lucas', 'Droit Numérique', 3.14),
(4, 'ENEL', 'Louis', 'Anglais', 12.5);

-- --------------------------------------------------------

--
-- Structure de la table `BUT3A`
--

CREATE TABLE `BUT3A` (
  `idEtud` int(11) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `matiere` varchar(20) NOT NULL,
  `moyenne` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `BUT3A`
--

INSERT INTO `BUT3A` (`idEtud`, `nom`, `prenom`, `matiere`, `moyenne`) VALUES
(1, 'LAROCHE', 'Pierre', 'Analyse', 18.95),
(2, 'ROKA', 'Zsuzsanna', 'DevWeb', 15.75),
(3, 'JOYEUX', 'Stéphane', 'QualiteDev', 13.14),
(4, 'GINOUX', 'Nicolas', 'Cryptographie', 16.75);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `BUT2A`
--
ALTER TABLE `BUT2A`
  ADD PRIMARY KEY (`idEtud`);

--
-- Index pour la table `BUT3A`
--
ALTER TABLE `BUT3A`
  ADD PRIMARY KEY (`idEtud`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `BUT2A`
--
ALTER TABLE `BUT2A`
  MODIFY `idEtud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `BUT3A`
--
ALTER TABLE `BUT3A`
  MODIFY `idEtud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Base de données : `SAE301_STAGES`
--
CREATE DATABASE IF NOT EXISTS `SAE301_STAGES` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `SAE301_STAGES`;

-- --------------------------------------------------------

--
-- Structure de la table `Stage2A`
--

CREATE TABLE `Stage2A` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `villeStage` varchar(100) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `datedeb` date NOT NULL,
  `datefin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Stage2A`
--

INSERT INTO `Stage2A` (`id`, `nom`, `prenom`, `villeStage`, `intitule`, `datedeb`, `datefin`) VALUES
(1, 'ARNU', 'Lucas', 'Morsbach', 'Developpeur Web', '2023-04-17', '2023-06-10'),
(2, 'LOPEZ', 'Valentin', 'Metz', 'Solutions SQL', '2023-04-17', '2023-06-10'),
(3, 'CARLOS', 'Josh', 'Nancy', 'Fullstack Web', '2023-04-17', '2023-06-10'),
(4, 'DELLAERA', 'Brice', 'Strasbourg', 'RéseauTelecom', '2023-04-17', '2023-06-10'),
(5, 'VELLA', 'Matteo', 'Metz', 'VueJS Master', '2023-04-17', '2023-06-10');

-- --------------------------------------------------------

--
-- Structure de la table `Stage3A`
--

CREATE TABLE `Stage3A` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) NOT NULL,
  `prenom` varchar(10) NOT NULL,
  `villeStage` varchar(100) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `datedeb` date NOT NULL,
  `datefin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Stage3A`
--

INSERT INTO `Stage3A` (`id`, `nom`, `prenom`, `villeStage`, `intitule`, `datedeb`, `datefin`) VALUES
(1, 'SARGENT', 'Robert', 'Biarritz', 'Developpeur JS', '2024-04-17', '2024-06-10'),
(2, 'DAVIS', 'Michel', 'Toulouse', 'SystAIO', '2024-04-17', '2024-06-10'),
(3, 'LANGELIER', 'Armina', 'Nice', 'AutomateIA', '2024-04-17', '2024-06-10'),
(4, 'GUERETTE', 'Gaetan', 'Millau', 'ChefProjet', '2024-04-17', '2024-06-10'),
(5, 'LANG', 'Armand', 'Verdun', 'TechNode', '2024-04-17', '2024-06-10');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Stage2A`
--
ALTER TABLE `Stage2A`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Stage3A`
--
ALTER TABLE `Stage3A`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Stage2A`
--
ALTER TABLE `Stage2A`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `Stage3A`
--
ALTER TABLE `Stage3A`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
