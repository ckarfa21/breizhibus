-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8082
-- Généré le : lun. 14 déc. 2020 à 17:22
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `breizhibus`
--

-- --------------------------------------------------------

--
-- Structure de la table `breizhibus_arrets`
--

CREATE TABLE `breizhibus_arrets` (
  `nom` varchar(20) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `id_arret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `breizhibus_arrets`
--

INSERT INTO `breizhibus_arrets` (`nom`, `adresse`, `id_arret`) VALUES
('korrigan', '1 impasse du korrigan', 1),
('Morgana', '2 plage morgana', 2),
('L\'ankou', '3 place de la morgue', 3),
('ys', '4 rue de l\'ile d\'ys', 4),
('viviane', '5 avenue de viviane', 5),
('Guenole', '6 rue saint guenole', 6);

-- --------------------------------------------------------

--
-- Structure de la table `breizhibus_arrets_lignes`
--

CREATE TABLE `breizhibus_arrets_lignes` (
  `id_ligne` int(11) NOT NULL,
  `id_arret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `breizhibus_arrets_lignes`
--

INSERT INTO `breizhibus_arrets_lignes` (`id_ligne`, `id_arret`) VALUES
(0, 0),
(0, 0),
(0, 0),
(0, 0),
(0, 0),
(0, 0),
(0, 0),
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 4),
(2, 6),
(3, 4),
(3, 5),
(3, 6),
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `breizhibus_bus`
--

CREATE TABLE `breizhibus_bus` (
  `id_bus` int(11) NOT NULL,
  `immatriculation` varchar(20) NOT NULL,
  `nombre_place` int(11) NOT NULL,
  `id_ligne` int(11) NOT NULL,
  `numero` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `breizhibus_bus`
--

INSERT INTO `breizhibus_bus` (`id_bus`, `immatriculation`, `nombre_place`, `id_ligne`, `numero`) VALUES
(1, 'RE 123 PA', 30, 1, 'BB04'),
(2, 'CA 123 DO', 20, 1, 'BB01'),
(3, 'NO 123 EL', 30, 2, 'BB02'),
(4, 'JE 123 UX', 20, 3, 'BB03');

-- --------------------------------------------------------

--
-- Structure de la table `breizhibus_lignes`
--

CREATE TABLE `breizhibus_lignes` (
  `nom` varchar(20) NOT NULL,
  `id_ligne` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `breizhibus_lignes`
--

INSERT INTO `breizhibus_lignes` (`nom`, `id_ligne`) VALUES
('rouge', 1),
('vert', 2),
('bleu', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `breizhibus_arrets`
--
ALTER TABLE `breizhibus_arrets`
  ADD PRIMARY KEY (`id_arret`);

--
-- Index pour la table `breizhibus_arrets_lignes`
--
ALTER TABLE `breizhibus_arrets_lignes`
  ADD KEY `id_ligne` (`id_ligne`),
  ADD KEY `id_arret` (`id_arret`);

--
-- Index pour la table `breizhibus_bus`
--
ALTER TABLE `breizhibus_bus`
  ADD PRIMARY KEY (`id_bus`),
  ADD KEY `id_ligne` (`id_ligne`);

--
-- Index pour la table `breizhibus_lignes`
--
ALTER TABLE `breizhibus_lignes`
  ADD PRIMARY KEY (`id_ligne`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `breizhibus_arrets`
--
ALTER TABLE `breizhibus_arrets`
  MODIFY `id_arret` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `breizhibus_bus`
--
ALTER TABLE `breizhibus_bus`
  MODIFY `id_bus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `breizhibus_lignes`
--
ALTER TABLE `breizhibus_lignes`
  MODIFY `id_ligne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `breizhibus_arrets`
--
ALTER TABLE `breizhibus_arrets`
  ADD CONSTRAINT `breizhibus_arrets_ibfk_1` FOREIGN KEY (`id_arret`) REFERENCES `breizhibus_arrets_lignes` (`id_arret`);

--
-- Contraintes pour la table `breizhibus_bus`
--
ALTER TABLE `breizhibus_bus`
  ADD CONSTRAINT `breizhibus_bus_ibfk_1` FOREIGN KEY (`id_ligne`) REFERENCES `breizhibus_lignes` (`id_ligne`);

--
-- Contraintes pour la table `breizhibus_lignes`
--
ALTER TABLE `breizhibus_lignes`
  ADD CONSTRAINT `breizhibus_lignes_ibfk_1` FOREIGN KEY (`id_ligne`) REFERENCES `breizhibus_arrets_lignes` (`id_ligne`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
