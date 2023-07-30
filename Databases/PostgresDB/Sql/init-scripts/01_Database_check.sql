-- Create the database if it does not exist
-- CREATE DATABASE IF NOT EXISTS HospitalDB;

-- Connect to the database
\c HospitalDB;

-- Create patient table
CREATE TABLE IF NOT EXISTS Patients (
  P_Id SERIAL PRIMARY KEY,
  P_Last_Name varchar(50) NOT NULL,
  P_First_Name varchar(50) NOT NULL,
  Assurance_Number varchar(50),
  Address varchar(80) NOT NULL,
  Phone_Number varchar(20) NOT NULL
);


-- Create doctor table
CREATE TABLE IF NOT EXISTS doctors (
  D_Id SERIAL PRIMARY KEY,
  D_Last_Name varchar(50) NOT NULL,
  D_First_Name varchar(50) NOT NULL,
  Sex char(1) NOT NULL,
  Working_Hospital varchar(40) NOT NULL,
  Working_Sector varchar(50) NOT NULL,
  Specialization varchar(50) NOT NULL
);


-- Create Credentials table
CREATE TABLE IF NOT EXISTS credentials (
  User_Id SERIAL PRIMARY KEY,
  User_Name varchar(50) NOT NULL,
  User_Email varchar(255) NOT NULL,
  User_Password bytea NOT NULL,
  User_PhoneNumber int NOT NULL,
  Account_Type varchar(20) NOT NULL CHECK (Account_Type IN ('Admin', 'Doctor', 'Patient'))
);