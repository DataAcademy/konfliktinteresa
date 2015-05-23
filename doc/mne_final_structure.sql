-- phpMyAdmin SQL Dump
-- version 4.2.12deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 19, 2015 at 05:44 PM
-- Server version: 5.5.40-1
-- PHP Version: 5.6.2-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mne`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresa`
--

CREATE TABLE IF NOT EXISTS `adresa` (
`id` int(11) unsigned NOT NULL,
  `ulica` varchar(255) DEFAULT NULL,
  `broj_ulaza` int(11) DEFAULT NULL,
  `grad` varchar(255) DEFAULT NULL,
  `drzava_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `adresa_osobe`
--

CREATE TABLE IF NOT EXISTS `adresa_osobe` (
`id` int(11) unsigned NOT NULL,
  `osoba_id` int(11) DEFAULT NULL,
  `report_details_id` int(11) DEFAULT NULL,
  `adresa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE IF NOT EXISTS `details` (
`id` int(11) unsigned NOT NULL,
  `osoba_id` int(11) DEFAULT NULL,
  `report_details_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `druge_djelatnosti`
--

CREATE TABLE IF NOT EXISTS `druge_djelatnosti` (
`id` int(11) unsigned NOT NULL,
  `ime_djelatnosti` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `druge_djelatnosti_report`
--

CREATE TABLE IF NOT EXISTS `druge_djelatnosti_report` (
`id` int(11) unsigned NOT NULL,
  `report_details_id` int(11) NOT NULL,
  `druge_djelatnosti_id` int(11) NOT NULL,
  `plata` int(11) NOT NULL,
  `valuta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `drzava`
--

CREATE TABLE IF NOT EXISTS `drzava` (
`id` int(11) unsigned NOT NULL,
  `drzava` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dugovanja_report`
--

CREATE TABLE IF NOT EXISTS `dugovanja_report` (
`id` int(11) unsigned NOT NULL,
  `report_details_id` int(11) NOT NULL,
  `tipovi_dugovanja_id` int(11) NOT NULL,
  `iznos_dugovanja_ukupno` int(11) NOT NULL,
  `valuta_id` int(11) NOT NULL,
  `preostali_iznos_dugovanja` int(11) NOT NULL,
  `iznos_rate` int(11) NOT NULL,
  `rok_otplate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `funkcije_osoba`
--

CREATE TABLE IF NOT EXISTS `funkcije_osoba` (
`id` int(11) unsigned NOT NULL,
  `javne_funkcije_id` int(11) DEFAULT NULL,
  `plata` int(111) DEFAULT NULL,
  `valuta_id` int(11) DEFAULT NULL,
  `report_details_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `godina`
--

CREATE TABLE IF NOT EXISTS `godina` (
`id` int(11) unsigned NOT NULL,
  `godina` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `javne_funkcije`
--

CREATE TABLE IF NOT EXISTS `javne_funkcije` (
`id` int(11) unsigned NOT NULL,
  `kategorije_funkcija_id` int(11) DEFAULT NULL,
  `ime_funkcije` varchar(255) DEFAULT NULL,
  `postavljen_od` varchar(255) DEFAULT NULL,
  `aktuelno` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kategorije_funkcija`
--

CREATE TABLE IF NOT EXISTS `kategorije_funkcija` (
`id` int(11) unsigned NOT NULL,
  `ime_kategorije_funkcije` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nacin_nabave`
--

CREATE TABLE IF NOT EXISTS `nacin_nabave` (
`id` int(11) unsigned NOT NULL,
  `nacin_nabave` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nekretnine_report`
--

CREATE TABLE IF NOT EXISTS `nekretnine_report` (
`id` int(11) unsigned NOT NULL,
  `report_details_id` int(11) NOT NULL,
  `vrsta_nekretnine_id` int(11) NOT NULL,
  `kvadratura` int(11) NOT NULL,
  `struktura` varchar(255) NOT NULL,
  `nacin_nabave_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `osobe`
--

CREATE TABLE IF NOT EXISTS `osobe` (
`id` int(11) unsigned NOT NULL,
  `titula` varchar(255) DEFAULT NULL,
  `ime` varchar(255) DEFAULT NULL,
  `prezime` varchar(255) DEFAULT NULL,
  `spol` varchar(10) DEFAULT NULL,
  `datum_rodjenja` date NOT NULL,
  `funkcioner` varchar(255) DEFAULT NULL,
  `e-mail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pokretna_imovina_type`
--

CREATE TABLE IF NOT EXISTS `pokretna_imovina_type` (
`id` int(11) unsigned NOT NULL,
  `tip_pokretne_imovine` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pokretna_report`
--

CREATE TABLE IF NOT EXISTS `pokretna_report` (
`id` int(11) NOT NULL,
  `report_details_id` int(11) NOT NULL,
  `pokretna_imovina_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `porodicne_relacije`
--

CREATE TABLE IF NOT EXISTS `porodicne_relacije` (
`id` int(11) NOT NULL,
  `osobe_id_1` int(11) NOT NULL,
  `osobe_id_2` int(11) NOT NULL,
  `report_details_id` int(11) NOT NULL,
  `porodicne_relacije_vrste_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `porodicne_relacije_vrste`
--

CREATE TABLE IF NOT EXISTS `porodicne_relacije_vrste` (
`id` int(11) NOT NULL,
  `ime_porodicne_relacije` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `report_details`
--

CREATE TABLE IF NOT EXISTS `report_details` (
`id` int(10) unsigned NOT NULL,
  `report_type` int(11) DEFAULT NULL,
  `godina.id` int(11) NOT NULL,
  `stalni_radni_odnos` varchar(255) DEFAULT NULL,
  `plata_radni_odnos` int(11) DEFAULT NULL,
  `valuta_id` int(11) DEFAULT NULL,
  `entry_date` int(11) NOT NULL,
  `entry_user` int(11) NOT NULL,
  `last_edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_edit_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `report_type`
--

CREATE TABLE IF NOT EXISTS `report_type` (
`id` int(11) NOT NULL,
  `ime_izvjestaja` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tipovi_dugovanja`
--

CREATE TABLE IF NOT EXISTS `tipovi_dugovanja` (
`id` int(11) unsigned NOT NULL,
  `tip_dugovanja` varchar(255) NOT NULL,
  `kome_duguje` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `valuta`
--

CREATE TABLE IF NOT EXISTS `valuta` (
`id` int(11) unsigned NOT NULL,
  `ime_valute` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vrsta_nekretnine`
--

CREATE TABLE IF NOT EXISTS `vrsta_nekretnine` (
`id` int(11) unsigned NOT NULL,
  `ime_vrste_nekretnine` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresa`
--
ALTER TABLE `adresa`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adresa_osobe`
--
ALTER TABLE `adresa_osobe`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `druge_djelatnosti`
--
ALTER TABLE `druge_djelatnosti`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `druge_djelatnosti_report`
--
ALTER TABLE `druge_djelatnosti_report`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drzava`
--
ALTER TABLE `drzava`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dugovanja_report`
--
ALTER TABLE `dugovanja_report`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funkcije_osoba`
--
ALTER TABLE `funkcije_osoba`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `godina`
--
ALTER TABLE `godina`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `javne_funkcije`
--
ALTER TABLE `javne_funkcije`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategorije_funkcija`
--
ALTER TABLE `kategorije_funkcija`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nacin_nabave`
--
ALTER TABLE `nacin_nabave`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nekretnine_report`
--
ALTER TABLE `nekretnine_report`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `osobe`
--
ALTER TABLE `osobe`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pokretna_imovina_type`
--
ALTER TABLE `pokretna_imovina_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pokretna_report`
--
ALTER TABLE `pokretna_report`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `porodicne_relacije`
--
ALTER TABLE `porodicne_relacije`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `porodicne_relacije_vrste`
--
ALTER TABLE `porodicne_relacije_vrste`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_details`
--
ALTER TABLE `report_details`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_type`
--
ALTER TABLE `report_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipovi_dugovanja`
--
ALTER TABLE `tipovi_dugovanja`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `valuta`
--
ALTER TABLE `valuta`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vrsta_nekretnine`
--
ALTER TABLE `vrsta_nekretnine`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresa`
--
ALTER TABLE `adresa`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `adresa_osobe`
--
ALTER TABLE `adresa_osobe`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `druge_djelatnosti`
--
ALTER TABLE `druge_djelatnosti`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `druge_djelatnosti_report`
--
ALTER TABLE `druge_djelatnosti_report`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `drzava`
--
ALTER TABLE `drzava`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dugovanja_report`
--
ALTER TABLE `dugovanja_report`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `funkcije_osoba`
--
ALTER TABLE `funkcije_osoba`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `godina`
--
ALTER TABLE `godina`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `javne_funkcije`
--
ALTER TABLE `javne_funkcije`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kategorije_funkcija`
--
ALTER TABLE `kategorije_funkcija`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nacin_nabave`
--
ALTER TABLE `nacin_nabave`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nekretnine_report`
--
ALTER TABLE `nekretnine_report`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `osobe`
--
ALTER TABLE `osobe`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pokretna_imovina_type`
--
ALTER TABLE `pokretna_imovina_type`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pokretna_report`
--
ALTER TABLE `pokretna_report`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `porodicne_relacije`
--
ALTER TABLE `porodicne_relacije`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `porodicne_relacije_vrste`
--
ALTER TABLE `porodicne_relacije_vrste`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report_details`
--
ALTER TABLE `report_details`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report_type`
--
ALTER TABLE `report_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipovi_dugovanja`
--
ALTER TABLE `tipovi_dugovanja`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `valuta`
--
ALTER TABLE `valuta`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vrsta_nekretnine`
--
ALTER TABLE `vrsta_nekretnine`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
