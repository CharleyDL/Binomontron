-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : ven. 28 oct. 2022 à 07:25
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `binomontron`
--

-- --------------------------------------------------------

--
-- Structure de la table `Eleves`
--

CREATE TABLE `Eleves` (
  `id_eleve` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `experience` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Eleves`
--

INSERT INTO `Eleves` (`id_eleve`, `nom`, `prenom`, `mail`, `experience`) VALUES
(1, 'LE GRAND', 'Kévin', 'kevin.le-grand@isen-ouest.yncrea.fr', 1),
(7, 'PETIARD', 'Harold', 'harold.petiard@isen-ouest.yncrea.fr', 1),
(8, 'SCANU', 'David', 'david.scanu@isen-ouest.yncrea.fr', 1),
(9, 'ANCELIN', 'Antoine', 'antoine.ancelin@isen-ouest.yncrea.fr', 1),
(10, 'JOURNAUX', 'Johann', 'johann.journaux@isen-ouest.yncrea.fr', 1),
(11, 'LEBARBIER', 'Charley', 'charley.lebarbier@isen-ouest.yncrea.fr', 1),
(12, 'DIABY', 'Amadou', 'amadou.diaby@isen-ouest.yncrea.fr', 1),
(13, 'DAUMER', 'Geoffrey', 'geoffroy.daumer@isen-ouest.yncrea.fr', 1),
(14, 'JULES', 'Dimitri', 'dimitri.jules@isen-ouest.yncrea.fr', 1),
(15, 'GUERIN', 'Basile', 'basile.guerin@isen-ouest.yncrea.fr', 1),
(16, 'OSWALD', 'Viacheslav', 'viacheslav.oswald@isen-ouest.yncrea.fr', 1),
(17, 'DUSSART', 'Ramata Soraya', 'ramata-soraya.dussart@isen-ouest.yncrea.fr', 1),
(18, 'ZOUITEN', 'Guinel', 'guinel.zouiten@isen-ouest.yncrea.fr', 1);

-- --------------------------------------------------------

--
-- Structure de la table `Eleves_Groupes`
--

CREATE TABLE `Eleves_Groupes` (
  `id_eleve` int NOT NULL,
  `id_groupe` int NOT NULL,
  `date_crea` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Experiences`
--

CREATE TABLE `Experiences` (
  `id_exp` int NOT NULL,
  `experience` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Experiences`
--

INSERT INTO `Experiences` (`id_exp`, `experience`) VALUES
(1, 'Débutant'),
(2, 'Intermédiaire'),
(3, 'Confirmé');

-- --------------------------------------------------------

--
-- Structure de la table `Groupes`
--

CREATE TABLE `Groupes` (
  `id_groupe` int NOT NULL,
  `libelle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Eleves`
--
ALTER TABLE `Eleves`
  ADD PRIMARY KEY (`id_eleve`),
  ADD KEY `eleve_exp` (`experience`);

--
-- Index pour la table `Eleves_Groupes`
--
ALTER TABLE `Eleves_Groupes`
  ADD KEY `id_eleve` (`id_eleve`),
  ADD KEY `id_groupe` (`id_groupe`);

--
-- Index pour la table `Experiences`
--
ALTER TABLE `Experiences`
  ADD PRIMARY KEY (`id_exp`);

--
-- Index pour la table `Groupes`
--
ALTER TABLE `Groupes`
  ADD PRIMARY KEY (`id_groupe`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Eleves`
--
ALTER TABLE `Eleves`
  MODIFY `id_eleve` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `Experiences`
--
ALTER TABLE `Experiences`
  MODIFY `id_exp` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Groupes`
--
ALTER TABLE `Groupes`
  MODIFY `id_groupe` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Eleves`
--
ALTER TABLE `Eleves`
  ADD CONSTRAINT `eleve_exp` FOREIGN KEY (`experience`) REFERENCES `Experiences` (`id_exp`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `Eleves_Groupes`
--
ALTER TABLE `Eleves_Groupes`
  ADD CONSTRAINT `Eleves_Groupes_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `Eleves` (`id_eleve`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `Eleves_Groupes_ibfk_2` FOREIGN KEY (`id_groupe`) REFERENCES `Groupes` (`id_groupe`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
