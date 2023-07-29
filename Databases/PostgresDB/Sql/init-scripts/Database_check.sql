-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS HospitalDB;

-- Connect to the database
\c HospitalDB;

-- Create patient table
CREATE TABLE IF NOT EXISTS `Patients` (
  `P_Id` int NOT NULL AUTO_INCREMENT,
  `P_Last_Name` varchar(50) DEFAULT NOT NULL,
  `P_First_Name` varchar(50) DEFAULT NOT NULL,
  `Assurance_Number` varchar(50) DEFAULT NULL,
  `Address` varchar(80) DEFAULT NOT NULL,
  `Phone_Number` varchar(20) DEFAULT NOT NULL,
  PRIMARY KEY (`P_Id`)
);

-- Create doctor table
CREATE TABLE IF NOT EXISTS `doctors` (
  `D_Id` int NOT NULL AUTO_INCREMENT,
  `D_Last_Name` varchar(50) DEFAULT NOT NULL,
  `D_First_Name` varchar(50) DEFAULT NOT NULL,
  `Sex` char(1) DEFAULT NOT NULL,
  `Working_Hospital` varchar(40) DEFAULT NOT NULL,
  `Working_Sector` varchar(50) DEFAULT NOT NULL,
  `Specialization` varchar(50) DEFAULT NOT NULL,
  PRIMARY KEY (`D_Id`)
);

-- Create Credentials table
CREATE TABLE IF NOT EXISTS `credentials` (
  `User_Id` int NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(50), DEFAULT NOT NULL
  `User_Email` varchar(255) DEFAULT NOT NULL,
  `User_Password` binary DEFAULT NOT NULL,
  `User_PhoneNumber` int(15) DEFAULT NOT NULL
  `Account_Type` enum('Admin', 'Doctor', 'Patient') DEFAULT NOT NULL,
  PRIMARY KEY (`User_Id`)
);