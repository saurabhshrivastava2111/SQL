Drop Database pharma_db;

SHOW DATABASES;

-- 1. Create a New Database named HealthcareDB

CREATE DATABASE HealthcareDB;

-- 2. Use the newly created Database to perform the subsequent
-- operations.

USE HealthcareDB;

-- 3. The database needs to store information about patients. Each patient
-- has a unique patient ID. The table should record essential patient
-- details including their name, date of birth, gender, address, phone
-- number, email, and insurance ID.
-- Create a table named Patients with the following columns:
-- ● patient_id: Integer
-- ● first_name: String (VARCHAR(50))
-- ● last_name: String (VARCHAR(50))
-- ● date_of_birth: String (VARCHAR(30))
-- ● gender: String (VARCHAR(20))
-- ● address: String (VARCHAR(200))
-- ● phone_number: String (VARCHAR(100))
-- ● email: String (VARCHAR(30))
-- ● insurance_id: Integer

CREATE TABLE IF NOT EXISTS Patients(
patient_id INT AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
date_of_birth VARCHAR(30),
gender VARCHAR(20) NOT NULL DEFAULT 'Others',
address VARCHAR(200) NOT NULL,
phone_number VARCHAR(100) NOT NULL,
email VARCHAR(30) NOT NULL,
insurance_id INT NOT NULL,
PRIMARY KEY constraint_patient_primary_key (patient_id),
  CHECK(gender IN ('Male', 'FEMALE', 'Others'))
);

SHOW CREATE TABLE Patients;

-- 4. The database needs to store information about doctors. Each doctor
-- has a unique doctor ID. The table should record essential details
-- including their name, specialization, phone
-
-- number, address,
-- department and experience
-- _years.
-- Create a table named Doctors with the following columns:
-- ● doctor_id: Integer
-- ● first_name: String (VARCHAR(50))
-- ● last_name: String (VARCHAR(50))
-- ● specialization: String (VARCHAR(100))
-- ● phone_number: String (VARCHAR(20))
-- ● email: String (VARCHAR(100))
-- ● department: String (VARCHAR(100))
-- ● experience_years: Integer
-- Add the following constraints to the Doctors table:
-- ● Primary key on the doctor_id column.
-- ● Not null constraint on all columns except for the email column.
-- ● Auto-increment constraint on the doctor_id column.
-- ● Add a check constraint to ensure that experience
-- _years is a
-- non-negative integer.


CREATE TABLE IF NOT EXISTS Doctors (
doctor_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50)NOT NULL,
specialization VARCHAR(100) NOT NULL,
phone_number  VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL,
department VARCHAR(30) NOT NULL,
experience_years INT NOT NULL,
CHECK (experience_years > 0)
);



-- 5. The database needs to store information about appointments. Each
-- appointment has a unique appointment ID. The table should record
-- essential details including the patient ID, doctor ID, appointment date
-- and time, status, and reason for the appointment.
-- Create a table named Appointments with the following columns:
-- ● appointment_id: Integer
-- ● patient_id: Integer
-- ● doctor_id: Integer
-- ● appointment_date: String (VARCHAR(30))
-- ● appointment_time: Time
-- ● status: String (VARCHAR(50))
-- ● reason: String (VARCHAR(255))
-- Add the following constraints to the Appointments table:
-- ● Primary key on the appointment_id column.
-- ● Not null constraint on all columns.
-- ● Auto-increment constraint on the appointment_id column.
-- ● Foreign key constraint on the patient_id column referencing the
-- Patients table.
-- ● Foreign key constraint on the doctor_id column referencing the
-- Doctors table.

CREATE TABLE IF NOT EXISTS Appointments (
appointment_id INT,
patient_id INT,
doctor_id INT,
appointment_date VARCHAR(30),
appointment_time TIME,
status VARCHAR(50),
reason VARCHAR(255),

PRIMARY KEY constraint_appointment_id(appointment_id),
FOREIGN KEY constraint_appointment_doctor_id (doctor_id) REFERENCES Doctors(doctor_id),
FOREIGN KEY constraint_appointment_patient_id (patient_id) REFERENCES Patients(patient_id)
);


-- 6. The database needs to store information about medical records. Each
-- record has a unique record ID. The table should record essential
-- details including the patient ID, doctor ID, visit date, diagnosis,
-- treatment, and additional notes.
-- Create a table named MedicalRecords with the following columns:
-- ● record_id: Integer
-- ● patient_id: Integer
-- ● doctor_id: Integer
-- ● visit_date: String (VARCHAR(30))
-- ● diagnosis: String (VARCHAR(150))
-- ● treatment: String (VARCHAR(150))
-- ● notes: String (VARCHAR(255))
-- Add the following constraints to the MedicalRecords table:
-- ● Primary key on the record_id column.
-- ● Not null constraint on all columns.
-- ● Auto-increment constraint on the record_id column.
-- ● Foreign key constraint on the patient_id column referencing the
-- Patients table.
-- ● Foreign key constraint on the doctor_id column referencing the
-- Doctors table.

-- DROP TABLE MedicalRecords;
CREATE TABLE IF NOT EXISTS MedicalRecords (
record_id INT AUTO_INCREMENT,
patient_id INT,
doctor_id INT,
visit_date VARCHAR(30) NOT NULL,
diagnosis VARCHAR(150) NOT NULL,
treatment VARCHAR(150) NOT NULL,
notes VARCHAR(150) NOT NULL ,
PRIMARY KEY constraint_primary_key_record_id (record_id),
FOREIGN KEY constraint_foreign_key_patient_id (patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY constraint_foreign_key_doctor_id(doctor_id) REFERENCES Doctors(doctor_id)
);


-- 7. The database needs to store information about prescriptions. Each
-- prescription has a unique prescription ID. The table should record
-- essential details including the associated medical record ID,
-- medication name, dosage, frequency, duration, and additional notes.
-- Create a table named Prescriptions with the following columns:
-- ● prescription_id: Integer
-- ● record_id: Integer
-- ● medication_name: String (VARCHAR(100))
-- ● dosage: String (VARCHAR(50))
-- ● frequency: String (VARCHAR(50))
-- ● duration: String (VARCHAR(50))
-- ● notes: String (VARCHAR(255))
-- Add the following constraints to the Prescriptions table:
-- ● Composite primary key on the prescription_id and record_id
-- columns.
-- ● Not null constraint on all columns.
-- ● Auto-increment constraint on the prescription_id column.
-- ● Foreign key constraint on the record_id column referencing the
-- MedicalRecords table.

CREATE TABLE IF NOT EXISTS Prescriptions(
prescription_id INT NOT NULL AUTO_INCREMENT,
record_id INT NOT NULL,
medication_name VARCHAR(100) NOT NULL,
dosage VARCHAR(50) NOT NULL,
frequency VARCHAR(50) NOT NULL,
duration VARCHAR(50) NOT NULL ,
notes VARCHAR(255) NOT NULL,
PRIMARY KEY constraint_primary_key_composite_prescriptionid_record_id(prescription_id, record_id),
FOREIGN KEY constraint_foreign_key_record_id(record_id) REFERENCES MedicalRecords(record_id)
);

-- 8. The database needs to store information about insurance. Each
-- insurance has a unique insurance ID. The table should record
-- essential details including the insurance id, insurance provider,
-- policy number, coverage details and expiry date.
-- Create a table named Insurance with the following columns:
-- ● insurance_id: Integer
-- ● insurance_provider: String (VARCHAR(100))
-- ● policy_number: String (VARCHAR(50))
-- ● coverage_details: String (VARCHAR(255))
-- ● expiry_date: String (VARCHAR(30))
-- Add the following constraints to the Insurance table:
-- ● Primary key on the insurance_id column.
-- ● Not null constraint on all columns.
-- ● Auto-increment constraint on the insurance_id column.


CREATE TABLE IF NOT EXISTS Insurance(
insurance_id INT AUTO_INCREMENT,
insurance_provider VARCHAR(100),
policy_number VARCHAR(50),
coverage_details VARCHAR(255),
expiry_date VARCHAR(30),
 PRIMARY KEY constraint_primary_key_insurance_id (insurance_id)
);


-- 9. The database needs to store information about departments. Each
-- department has a unique department ID. The table should record
-- essential details including the department name and the head of the
-- department.
-- Create a table named Departments with the following columns:
-- ● department_id: Integer
-- ● department_name: String (VARCHAR(100))
-- ● head_of_department: String (VARCHAR(100))
-- Add the following constraints to the Departments table:
-- ● Primary key on the department_id column.
-- ● Not null constraint on all columns.
-- ● Auto-increment constraint on the department_id column.
-- ● Unique constraint to ensure that department
-- _
-- name is unique to avoid
-- duplicate department names.


CREATE TABLE IF NOT EXISTS Departments(
department_id INT AUTO_INCREMENT,
department_name VARCHAR(100) NOT NULL,
head_of_department VARCHAR(100) NOT NULL,
PRIMARY KEY constraint_primary_key_department_id(department_id),
UNIQUE KEY condtraint_unique_key_department_name(department_name)
);


-- 10.The database needs to store information about drugs. Each drug
-- has a unique drug ID. The table should record essential details
-- including the drug name, manufacturer, price, and stock quantity.
-- Create a table named Drugs with the following columns:
-- ● drug_id: Integer
-- ● drug_name: String (VARCHAR(100))
-- ● manufacturer: String (VARCHAR(100))
-- ● price: Float
-- ● stock_quantity: Integer
-- Add the following constraints to the Drugs table:
-- ● Primary key on the drug_id column.
-- ● Not null constraint on all columns.
-- ● Auto-increment constraint on the drug_id column.
-- ● Apply a check constraint to ensure that the price is not negative.


CREATE TABLE IF NOT EXISTS Drugs(
drug_id INT PRIMARY KEY AUTO_INCREMENT,
drug_name VARCHAR(100) NOT NULL,
manufacturer VARCHAR(100) NOT NULL,
price FLOAT CHECK (price > 0),
stock_quantity INT
);


-- Task 2 - Data Import
-- The datasets consisting of the records for each of the tables are
-- made available in the csv format in the downloadable section. Please
-- download all the datasets and import the data into the respective
-- tables using the ‘Table Data Import Wizard’
-- .


-- Task 3 - Data Filtering
-- 1. Retrieve all the details of Female patients.

SELECT * 
	FROM Patients
		WHERE gender = 'Female';

-- 2. List all doctors specializing in 'Pediatrics'

SELECT * 
	FROM DOCTORS 
		WHERE specialization = 'Pediatrics';

-- 3. Find doctors with 10 or more years of experience.
SELECT * 
	FROM DOCTORS 
		WHERE experience_years >= 10;
-- 4. List appointments for patient-ID 21 with a status of 'Completed'

SELECT * 
	FROM Appointments 
		WHERE patient_id = 21 AND status = 'Completed';

-- 5. Find records where the diagnosis is 'Diabetes'

SELECT * 
	FROM MedicalRecords
		WHERE diagnosis LIKE '%Diabetes%';
-- 6. List all the unique insurance providers.

SELECT DISTINCT * 
	FROM Insurance;
    
-- 7. Retrieve the head-of-department for the 'Cardiology' department.

SELECT head_of_department 
	FROM Departments
		WHERE department_name = 'Cardiology';
		
-- 8. Retrieve drugs priced between $10 and $50.

SELECT * 
	FROM Drugs
		WHERE price BETWEEN 10 AND 50;
        
        
        
-- Task 4 - Changing Data Types and adding additional constraints Like
-- Unique.

-- 2. Alter price column to DECIMAL(10,2) type for accurate pricing.

SHOW CREATE TABLE Doctors;

-- 'CREATE TABLE `Doctors` (
--   `doctor_id` int NOT NULL AUTO_INCREMENT,
--   `first_name` varchar(50) NOT NULL,
--   `last_name` varchar(50) NOT NULL,
--   `specialization` varchar(100) NOT NULL,
--   `phone_number` varchar(20) NOT NULL,
--   `email` varchar(100) NOT NULL,
--   `department` varchar(30) NOT NULL,
--   `experience_years` int NOT NULL,
--   PRIMARY KEY (`doctor_id`),
--   CONSTRAINT `doctors_chk_1` CHECK ((`experience_years` > 0))
-- ) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'

-- 1. Ensure that email column values are unique across the patients and
-- doctors table.

ALTER TABLE Doctors
	ADD CONSTRAINT UNIQUE constraint_unique_key (email);
    
    -- Post Adding Unique Key Constraints 
    
--     'CREATE TABLE `Doctors` (
--   `doctor_id` int NOT NULL AUTO_INCREMENT,
--   `first_name` varchar(50) NOT NULL,
--   `last_name` varchar(50) NOT NULL,
--   `specialization` varchar(100) NOT NULL,
--   `phone_number` varchar(20) NOT NULL,
--   `email` varchar(100) NOT NULL,
--   `department` varchar(30) NOT NULL,
--   `experience_years` int NOT NULL,
--   PRIMARY KEY (`doctor_id`),
--   UNIQUE KEY `constraint_unique_key` (`email`),
--   CONSTRAINT `doctors_chk_1` CHECK ((`experience_years` > 0))
-- ) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'



SHOW CREATE TABLE Patients;

-- 'CREATE TABLE `Patients` (
--   `patient_id` int NOT NULL AUTO_INCREMENT,
--   `first_name` varchar(50) DEFAULT NULL,
--   `last_name` varchar(50) DEFAULT NULL,
--   `date_of_birth` varchar(30) DEFAULT NULL,
--   `gender` varchar(20) NOT NULL DEFAULT ''Others'',
--   `address` varchar(200) NOT NULL,
--   `phone_number` varchar(100) NOT NULL,
--   `email` varchar(30) NOT NULL,
--   `insurance_id` int NOT NULL,
--   PRIMARY KEY (`patient_id`),
--   CONSTRAINT `patients_chk_1` CHECK ((`gender` in (_utf8mb4''Male'',_utf8mb4''FEMALE'',_utf8mb4''Others'')))
-- ) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'

ALTER TABLE Patients
	ADD CONSTRAINT UNIQUE constraint_unique_key (email);
    
-- Post Altering Patients table 

-- 'CREATE TABLE `Patients` (
--   `patient_id` int NOT NULL AUTO_INCREMENT,
--   `first_name` varchar(50) DEFAULT NULL,
--   `last_name` varchar(50) DEFAULT NULL,
--   `date_of_birth` varchar(30) DEFAULT NULL,
--   `gender` varchar(20) NOT NULL DEFAULT ''Others'',
--   `address` varchar(200) NOT NULL,
--   `phone_number` varchar(100) NOT NULL,
--   `email` varchar(30) NOT NULL,
--   `insurance_id` int NOT NULL,
--   PRIMARY KEY (`patient_id`),
--   UNIQUE KEY `constraint_unique_key` (`email`),
--   CONSTRAINT `patients_chk_1` CHECK ((`gender` in (_utf8mb4''Male'',_utf8mb4''FEMALE'',_utf8mb4''Others'')))
-- ) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'

-- 2. Alter price column to DECIMAL(10,2) type for accurate pricing.

ALTER TABLE Drugs
	MODIFY COLUMN price DECIMAL(10,2);
    
    SHOW CREATE TABLE Drugs;
    
    -- Post Altering the Table
    
--  'CREATE TABLE `Drugs` (
--   `drug_id` int NOT NULL AUTO_INCREMENT,
--   `drug_name` varchar(100) NOT NULL,
--   `manufacturer` varchar(100) NOT NULL,
--   `price` decimal(10,2) DEFAULT NULL,
--   `stock_quantity` int DEFAULT NULL,
--   PRIMARY KEY (`drug_id`),
--   CONSTRAINT `drugs_chk_1` CHECK ((`price` > 0))
-- ) ENGINE=InnoDB AUTO_INCREMENT=3045 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'

-- Task 5 - Adding and Renaming Columns
-- 1. Add an active column (VARCHAR(20)) to indicate whether the doctor
-- is currently active and default it to active status.

ALTER TABLE Doctors
	ADD COLUMN Status VARCHAR(20) NOT NULL DEFAULT 'Active';
    
SHOW CREATE TABLE  DOCTORS;
-- POst Altering the Table 

-- 'CREATE TABLE `DOCTORS` (
--   `doctor_id` int NOT NULL AUTO_INCREMENT,
--   `first_name` varchar(50) NOT NULL,
--   `last_name` varchar(50) NOT NULL,
--   `specialization` varchar(100) NOT NULL,
--   `phone_number` varchar(20) NOT NULL,
--   `email` varchar(100) NOT NULL,
--   `department` varchar(30) NOT NULL,
--   `experience_years` int NOT NULL,
--   `Status` varchar(20) NOT NULL DEFAULT ''Active'',
--   PRIMARY KEY (`doctor_id`),
--   UNIQUE KEY `constraint_unique_key` (`email`),
--   CONSTRAINT `doctors_chk_1` CHECK ((`experience_years` > 0))
-- ) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'

-- Sampel One Record 

SELECT * FROM Doctors LIMIT 1;
-- # doctor_id	first_name	last_name	specialization	phone_number	email	department	experience_years	Status
-- 201	James	Williams	Cardiology	5551012345	james.w@example.com	Cardiology	15	Active



-- 2. Rename notes to medical
-- notes in the medicalrecords table for clarity.

ALTER TABLE MedicalRecords RENAME COLUMN notes TO medical_notes;

-- Post Altering the Table 
SHOW CREATE TABLE MedicalRecords;
-- 'CREATE TABLE `MedicalRecords` (
--   `record_id` int NOT NULL AUTO_INCREMENT,
--   `patient_id` int DEFAULT NULL,
--   `doctor_id` int DEFAULT NULL,
--   `visit_date` varchar(30) NOT NULL,
--   `diagnosis` varchar(150) NOT NULL,
--   `treatment` varchar(150) NOT NULL,
--   `medical_notes` varchar(150) NOT NULL,
--   PRIMARY KEY (`record_id`),
--   KEY `constraint_foreign_key_patient_id` (`patient_id`),
--   KEY `constraint_foreign_key_doctor_id` (`doctor_id`),
--   CONSTRAINT `medicalrecords_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `Patients` (`patient_id`),
--   CONSTRAINT `medicalrecords_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `Doctors` (`doctor_id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'


-- Task 6 - On Delete Cascade
-- Implement the following – drop all foreign keys and update it to
-- on-delete cascade.

-- ALTER TABLE MedicalRecords DROP medicalrecords_ibfk_1;

ALTER TABLE MedicalRecords DROP CONSTRAINT medicalrecords_ibfk_1;

ALTER TABLE MedicalRecords DROP CONSTRAINT medicalrecords_ibfk_2;

ALTER TABLE MedicalRecords 
	ADD CONSTRAINT FOREIGN KEY constraint_foriegn_key_doctor_id(doctor_id)
		REFERENCES Doctors(doctor_id) ON DELETE CASCADE;
ALTER TABLE MedicalRecords 
	ADD CONSTRAINT FOREIGN KEY constraint_foriegn_key_patient_id(patient_id)
		REFERENCES Patients(patient_id) ON DELETE CASCADE;
        
        
-- Post Altering teh Table 

Show CREATE TABLE MedicalRecords;

-- 'CREATE TABLE `MedicalRecords` (
--   `record_id` int NOT NULL AUTO_INCREMENT,
--   `patient_id` int DEFAULT NULL,
--   `doctor_id` int DEFAULT NULL,
--   `visit_date` varchar(30) NOT NULL,
--   `diagnosis` varchar(150) NOT NULL,
--   `treatment` varchar(150) NOT NULL,
--   `medical_notes` varchar(150) NOT NULL,
--   PRIMARY KEY (`record_id`),
--   KEY `constraint_foriegn_key_doctor_id` (`doctor_id`),
--   KEY `constraint_foriegn_key_patient_id` (`patient_id`),
--   CONSTRAINT `medicalrecords_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `Doctors` (`doctor_id`) ON DELETE CASCADE,
--   CONSTRAINT `medicalrecords_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `Patients` (`patient_id`) ON DELETE CASCADE
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'


-- Task 7 - Update and Delete Statement

-- 1. Update the address to ‘921 Birch St, Springfield’ of the patient where
-- the patient
-- id is 27

UPDATE Patients 
	Set address = '921 Birch St, Springfield' 
		WHERE patient_id = 27;


-- 2. Delete doctors who are having 5 years of experience

DELETE FROM Doctors
	Where experience_years =5;

-- 3. Update the department
-- head to ‘Dr.Jonathan Smith’ where the department id is 1011

UPDATE Departments
	SET head_of_department = 'Dr.Jonathan Smith'
		WHERE department_id = 1011;
        
-- 4. Delete all medical records associated with patient id 54.

DELETE FROM MedicalRecords 
	WHERE patient_id = 54;

