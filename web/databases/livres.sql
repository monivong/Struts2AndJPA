-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 15, 2015 at 06:00 AM
-- Server version: 5.6.20-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `livres`
--

-- --------------------------------------------------------

--
-- Table structure for table `cours`
--

CREATE TABLE IF NOT EXISTS `cours` (
  `numero` varchar(15) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `duree` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cours`
--

INSERT INTO `cours` (`numero`, `nom`, `duree`) VALUES
('420-026-RO', 'Programmation structurée', 90),
('420-046-RO', 'Programmation orientée objets', 90),
('420-353-RO', 'Programmation réseau', 45),
('420-AV4-RO', 'Conception d''applications hypermédias', 60),
('420-AW6-RO', 'Développement de projets informatiques', 90),
('420-AX4-RO', 'Développement en environnement graphique', 60);

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE IF NOT EXISTS `evaluation` (
`id` int(11) NOT NULL,
  `idProf` varchar(20) NOT NULL,
  `idLivre` varchar(20) NOT NULL,
  `note` tinyint(4) NOT NULL,
  `commentaire` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `evaluation`
--

INSERT INTO `evaluation` (`id`, `idProf`, `idLivre`, `note`, `commentaire`) VALUES
(1, 'adupont', '978-1-4302-2889-9', 8, 'Très bon livre couvrant une bonne partie de la technologie Java-EE avec une étude assez approfondie de JPA. Le livre couvre aussi le framework JSF ainsi que les services web (SOAP et Restful).Le seul reproche que je peux lui faire est qu''il ne couvre pas les fondements de la programmation web (servlets et JSP).'),
(2, 'sduvet', '978-1-4302-2889-9', 7, 'Assez bon livre sur la technologie Java-EE. La couverture de JSF et JPA est appréciée. Par contre, je regrette qu''il ne couvre pas des frameworks très populaires tels que Struts et Hibernate.'),
(3, 'adupont', '2-89377-250-1', 7, 'Bon et gros livre couvrant beaucoup de sujets relatifs au développement de systèmes d''informations. On s''y perd un peu dans les nombreux sujets quelques fois antagonistes (exemple : approche structurée et approche objet).'),
(4, 'alapointe', '9781430239307', 7, 'Très bon livre pour découvrir le développement d''applications Android avec Java.'),
(5, 'samnang', '978-1-4302-2889-9', 6, 'sexy');

-- --------------------------------------------------------

--
-- Table structure for table `evaluationcours`
--

CREATE TABLE IF NOT EXISTS `evaluationcours` (
`id` int(11) NOT NULL,
  `idLivre` varchar(20) NOT NULL,
  `idProf` varchar(20) NOT NULL,
  `idCours` varchar(15) NOT NULL,
  `note` tinyint(4) NOT NULL,
  `commentaire` tinytext NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `evaluationcours`
--

INSERT INTO `evaluationcours` (`id`, `idLivre`, `idProf`, `idCours`, `note`, `commentaire`) VALUES
(1, '2-89377-250-1', 'alapointe', '420-AW6-RO', 5, 'Pour ce cours sur le développement de projets selon l''approche objet, ce livre ne peut servir que de référence aux étudiants dans le volet de gestion de projet (surtout sa planification). UML et les processus de développement objet ne sont pas couverts ad'),
(2, '978-1-4302-2889-9', 'alapointe', '420-AW6-RO', 5, 'Dans ce cours, ce livre peut être utile pour des étudiants qui développent leur projet en Java-EE s''ils utilisent un des éléments suivants : JSF, JPA, seervices web.');

-- --------------------------------------------------------

--
-- Table structure for table `exemplaire`
--

CREATE TABLE IF NOT EXISTS `exemplaire` (
  `isbn` varchar(20) NOT NULL,
  `numero` tinyint(4) NOT NULL,
  `proprietaire` varchar(20) NOT NULL,
  `detenteur` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exemplaire`
--

INSERT INTO `exemplaire` (`isbn`, `numero`, `proprietaire`, `detenteur`) VALUES
('0-201-73733-7', 1, 'adupont', 'moumene'),
('0-201-73733-7', 2, 'moumene', 'samnang');

-- --------------------------------------------------------

--
-- Table structure for table `livre`
--

CREATE TABLE IF NOT EXISTS `livre` (
  `ISBN` varchar(20) NOT NULL DEFAULT '',
  `Titre` tinytext NOT NULL,
  `Edition` varchar(20) DEFAULT NULL,
  `Annee` mediumint(9) DEFAULT NULL,
  `MotsCles` tinytext,
  `NomAuteur` varchar(30) DEFAULT NULL,
  `etat` varchar(15) DEFAULT 'Disponible',
  `Description` text NOT NULL,
  `NbPages` int(11) NOT NULL,
  `note` double NOT NULL DEFAULT '0',
  `nbEvaluations` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Informations sur les livres';

--
-- Dumping data for table `livre`
--

INSERT INTO `livre` (`ISBN`, `Titre`, `Edition`, `Annee`, `MotsCles`, `NomAuteur`, `etat`, `Description`, `NbPages`, `note`, `nbEvaluations`) VALUES
('0-201-73733-7', 'Object-Oriented Software Development Using Java', 'Addison Wesley', 2003, 'Développement objet, programmation java, design patterns', 'Jia, Xiaoping', 'Disponible', 'Livre très pédagogique axé sur la conception d''application et l''exploitation des principaux patrons de conception.', 677, 0, 0),
('2-7440-1962-3', 'Au coeur de Java 2, vol. 2 Fonctions avancées, JDK', 'CampusPress', 2005, 'Programmation multithread, accès aux bases de données avec JDBC, programmation réseau avec les sockets, RMI.', 'Horstmann, Cay S., Cornell, Ga', 'Disponible', 'Livre couvrant des concepts avancés de la programmation avec l''édition standard de Java (Java-SE).', 858, 0, 0),
('2-7440-7090-4', 'UML 2 et les design patterns, 3e edition', 'Pearson education', 2005, 'UML, RUP, processus unifié, développement itératif et incrémental', 'Craig Larman', 'Disponible', 'Livre abordant l''analyse et la conception de système selon l''approche objet d''un point de vue mise en oeuvre. L''auteur nous fait partager son expérience pratique.', 655, 0, 0),
('2-7440-7312-1', 'Au coeur de Java, 8e édition', 'Pearson France', 2008, 'Programmation en Java, Swing, Programmation objets.', 'Horstmann, Cay S., Cornell, Ga', 'Disponible', 'Très bon livre d''introduction à Java mais pour des personnes ayant déjà programmé.', 928, 0, 0),
('2-89377-250-1', 'Analyse et conception de systèmes d''information', 'Reynald Goulet eds.', 2003, 'Analyse et conception de systèmes, Approche structurée, Approche objet, Gestion de projets.', 'Satzinger et al.', 'usagé', 'Analyse et conception de systèmes selon les approches structurée et objet. Rôle de l''analyste et gestion de projets.', 1000, 7, 0),
('2895937591, ', 'Java Structuré', 'Groupe Modulo Incorp', 2007, 'Introduction à la programmation structurée, algorithmique, Java', 'Jo Ann Smith, Aicha Mebarek', 'Disponible', 'Initiation à la programmation structurée avec le langage Java.', 158, 0, 0),
('978-1-4302-2889-9', 'Begining Java EE 6 Platform with GlassFish 3', 'APress', 2010, 'Java, Web, JSF, GlassFish, Application d''entreprise, JPA, Persistence, Services web, Java-EE, JPA', 'Antonio Goncalves', 'Neuf', 'Développement avec Java-EE. Gestion de persistence avec JPA. Le framework JSF. Les services web.', 508, 7.5, 0),
('9780132149181', 'Java Software Solutions: Foundations of Program Development, 7Ed', 'Addison-Wesley', 2011, 'programmation objet, java, initiation à la programmation', 'John Lewis, William Loftus', 'Disponible', 'Livre très pédagogique d''introduction à la programmation en Java.', 832, 0, 0),
('9781430239307', 'Pro Android 4', 'APress', 2012, 'Android, Java, Applications mobiles, Développement.', 'Satya Komatineni, Dave MacLean', 'Disponible', 'Développement d''applications en Java pour Android.', 991, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(20) NOT NULL,
  `nom_prenom` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `nom_prenom`, `password`) VALUES
('adupont', 'Alain Dupont', 'dupont'),
('alapointe', 'Ali Lapointe', 'lapointe'),
('alex', 'alex_caumartin', 'caumartin'),
('jmarois', 'Jean Marois', 'marois'),
('moumene', 'abdelmoumene_toudeft', 'moumene'),
('pcharest', 'Pauline Charest', 'charest'),
('samnang', 'samnang_suon', 'suon'),
('sduvet', 'Sylvie Duvet', 'duvet');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cours`
--
ALTER TABLE `cours`
 ADD PRIMARY KEY (`numero`);

--
-- Indexes for table `evaluation`
--
ALTER TABLE `evaluation`
 ADD PRIMARY KEY (`id`), ADD KEY `evaluation_idProf_fk` (`idProf`), ADD KEY `evaluation_idLivre_fk` (`idLivre`);

--
-- Indexes for table `evaluationcours`
--
ALTER TABLE `evaluationcours`
 ADD PRIMARY KEY (`id`), ADD KEY `evaluationcours_idLivre_fk` (`idLivre`), ADD KEY `evaluationcours_idProf_fk` (`idProf`), ADD KEY `evaluationcours_idCours_fk` (`idCours`);

--
-- Indexes for table `exemplaire`
--
ALTER TABLE `exemplaire`
 ADD PRIMARY KEY (`isbn`,`numero`), ADD KEY `exemplaire_isbn_fk` (`isbn`), ADD KEY `èxemplaire_proprietaire_fk` (`proprietaire`), ADD KEY `exemplaire_detenteur_fk` (`detenteur`);

--
-- Indexes for table `livre`
--
ALTER TABLE `livre`
 ADD PRIMARY KEY (`ISBN`), ADD KEY `NumAuteur` (`NomAuteur`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `evaluation`
--
ALTER TABLE `evaluation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `evaluationcours`
--
ALTER TABLE `evaluationcours`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `evaluation`
--
ALTER TABLE `evaluation`
ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`idProf`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`idLivre`) REFERENCES `livre` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evaluationcours`
--
ALTER TABLE `evaluationcours`
ADD CONSTRAINT `evaluationcours_ibfk_1` FOREIGN KEY (`idLivre`) REFERENCES `livre` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `evaluationcours_ibfk_2` FOREIGN KEY (`idProf`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `evaluationcours_ibfk_3` FOREIGN KEY (`idCours`) REFERENCES `cours` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exemplaire`
--
ALTER TABLE `exemplaire`
ADD CONSTRAINT `exemplaire_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `livre` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `exemplaire_ibfk_2` FOREIGN KEY (`proprietaire`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `exemplaire_ibfk_3` FOREIGN KEY (`detenteur`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
