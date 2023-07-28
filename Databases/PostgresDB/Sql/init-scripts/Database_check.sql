-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS HospitalDB;

-- Connect to the database
\c HospitalDB;

-- Create patient table
CREATE TABLE IF NOT EXISTS `patients` (
  `P_Id` int NOT NULL AUTO_INCREMENT,
  `P_LastName` varchar(50) DEFAULT NOT NULL,
  `P_FirstName` varchar(50) DEFAULT NOT NULL,
  `AssuranceNumber` varchar(50) DEFAULT NULL,
  `Address` varchar(80) DEFAULT NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NOT NULL,
  PRIMARY KEY (`P_Id`)
);

-- Create doctor table
CREATE TABLE IF NOT EXISTS `doctors` (
  `D_Id` int NOT NULL AUTO_INCREMENT,
  `D_LastName` varchar(50) DEFAULT NOT NULL,
  `D_FirstName` varchar(50) DEFAULT NOT NULL,
  `Sex` char(1) DEFAULT NOT NULL,
  `Working_Hospital` varchar(40) DEFAULT NOT NULL,
  `Working_Sector` varchar(50) DEFAULT NOT NULL,
  `Specialization` varchar(50) DEFAULT NOT NULL,
  PRIMARY KEY (`D_Id`)
);

-- Create Credentials table
CREATE TABLE