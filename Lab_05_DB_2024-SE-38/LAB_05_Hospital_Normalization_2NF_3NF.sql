-- ============================================================
-- LAB 05 — Conversion to 2NF and 3NF
-- Assessment Problem: Hospital Patient Visits
-- Continuation of LAB 04
-- ============================================================

CREATE DATABASE IF NOT EXISTS hospital_normalization;
USE hospital_normalization;

-- ============================================================
-- 2NF — ANALYSIS AND JUSTIFICATION
-- ============================================================

-- Candidate Key from Lab 04:
-- VisitID
--
-- VisitID is a SINGLE-ATTRIBUTE candidate key.
--
-- A partial dependency can occur only when a table has a
-- COMPOSITE candidate key and a non-key attribute depends on
-- only part of that composite key.
--
-- Here, the candidate key is only VisitID.
-- Therefore, there can be NO partial dependency on part of VisitID.
--
-- Hence:
-- The 1NF HospitalVisit relation is already in 2NF.
--
-- No decomposition is required specifically for removing
-- partial dependencies at the 2NF stage.
--
-- The dependencies such as:
-- PatientID -> PatientName, PatientPhone
-- DoctorID -> DoctorName, Specialty, DeptName
-- DeptName -> DeptHead
-- are transitive dependencies and will be removed in 3NF.

-- ============================================================
-- 2NF SCHEMA
-- ============================================================

DROP TABLE IF EXISTS HospitalVisit_2NF;

CREATE TABLE HospitalVisit_2NF (
    VisitID       VARCHAR(10) PRIMARY KEY,
    VisitDate     DATE NOT NULL,
    PatientID     VARCHAR(10) NOT NULL,
    PatientName   VARCHAR(100) NOT NULL,
    PatientPhone  VARCHAR(20) NOT NULL,
    DoctorID      VARCHAR(10) NOT NULL,
    DoctorName    VARCHAR(100) NOT NULL,
    Specialty     VARCHAR(100) NOT NULL,
    DeptName      VARCHAR(100) NOT NULL,
    DeptHead      VARCHAR(100) NOT NULL,
    Diagnosis     VARCHAR(200) NOT NULL,
    Fee           DECIMAL(10,2) NOT NULL
);

-- ============================================================
-- 2NF INSERTS
-- ============================================================

INSERT INTO HospitalVisit_2NF
    (VisitID, VisitDate, PatientID, PatientName, PatientPhone,
     DoctorID, DoctorName, Specialty, DeptName, DeptHead,
     Diagnosis, Fee)
VALUES
    ('V-9001', '2026-04-10', 'P-201', 'Hassan',  '0300-1112233',
     'D-30', 'Dr. Imran', 'Cardiology', 'Heart Care', 'Dr. Tariq',
     'Hypertension', 2500),

    ('V-9002', '2026-04-10', 'P-202', 'Mehreen', '0301-4445566',
     'D-31', 'Dr. Asma', 'Dermatology', 'Skin Clinic', 'Dr. Asma',
     'Eczema', 2000),

    ('V-9003', '2026-04-11', 'P-201', 'Hassan',  '0300-1112233',
     'D-31', 'Dr. Asma', 'Dermatology', 'Skin Clinic', 'Dr. Asma',
     'Allergy', 2000),

    ('V-9004', '2026-04-12', 'P-203', 'Junaid',  '0302-7778899',
     'D-30', 'Dr. Imran', 'Cardiology', 'Heart Care', 'Dr. Tariq',
     'Arrhythmia', 3000);

-- ============================================================
-- 3NF — TRANSITIVE DEPENDENCY ANALYSIS
-- ============================================================

-- The following transitive dependencies exist:
--
-- VisitID -> PatientID -> PatientName, PatientPhone
-- VisitID -> DoctorID -> DoctorName, Specialty, DeptName
-- DeptName -> DeptHead
--
-- To achieve 3NF, these dependencies are separated into
-- independent tables.

-- ============================================================
-- 3NF — DROP OLD TABLES IF THEY EXIST
-- ============================================================

DROP TABLE IF EXISTS Visit_3NF;
DROP TABLE IF EXISTS Doctor_3NF;
DROP TABLE IF EXISTS Patient_3NF;
DROP TABLE IF EXISTS Department_3NF;

-- ============================================================
-- 3NF — DEPARTMENT TABLE
-- ============================================================

CREATE TABLE Department_3NF (
    DeptName VARCHAR(100) PRIMARY KEY,
    DeptHead VARCHAR(100) NOT NULL
);

-- ============================================================
-- 3NF — PATIENT TABLE
-- ============================================================

CREATE TABLE Patient_3NF (
    PatientID    VARCHAR(10) PRIMARY KEY,
    PatientName  VARCHAR(100) NOT NULL,
    PatientPhone VARCHAR(20) NOT NULL
);

-- ============================================================
-- 3NF — DOCTOR TABLE
-- ============================================================

CREATE TABLE Doctor_3NF (
    DoctorID   VARCHAR(10) PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialty  VARCHAR(100) NOT NULL,
    DeptName   VARCHAR(100) NOT NULL,

    CONSTRAINT fk_doctor_department
        FOREIGN KEY (DeptName)
        REFERENCES Department_3NF(DeptName)
);

-- ============================================================
-- 3NF — VISIT TABLE
-- ============================================================

CREATE TABLE Visit_3NF (
    VisitID   VARCHAR(10) PRIMARY KEY,
    VisitDate DATE NOT NULL,
    PatientID VARCHAR(10) NOT NULL,
    DoctorID  VARCHAR(10) NOT NULL,
    Diagnosis VARCHAR(200) NOT NULL,
    Fee       DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_visit_patient
        FOREIGN KEY (PatientID)
        REFERENCES Patient_3NF(PatientID),

    CONSTRAINT fk_visit_doctor
        FOREIGN KEY (DoctorID)
        REFERENCES Doctor_3NF(DoctorID)
);

-- ============================================================
-- 3NF — INSERT DEPARTMENT DATA
-- ============================================================

INSERT INTO Department_3NF (DeptName, DeptHead)
VALUES
    ('Heart Care', 'Dr. Tariq'),
    ('Skin Clinic', 'Dr. Asma');

-- ============================================================
-- 3NF — INSERT PATIENT DATA
-- ============================================================

INSERT INTO Patient_3NF (PatientID, PatientName, PatientPhone)
VALUES
    ('P-201', 'Hassan',  '0300-1112233'),
    ('P-202', 'Mehreen', '0301-4445566'),
    ('P-203', 'Junaid',  '0302-7778899');

-- ============================================================
-- 3NF — INSERT DOCTOR DATA
-- ============================================================

INSERT INTO Doctor_3NF
    (DoctorID, DoctorName, Specialty, DeptName)
VALUES
    ('D-30', 'Dr. Imran', 'Cardiology',  'Heart Care'),
    ('D-31', 'Dr. Asma',  'Dermatology', 'Skin Clinic');

-- ============================================================
-- 3NF — INSERT VISIT DATA
-- ============================================================

INSERT INTO Visit_3NF
    (VisitID, VisitDate, PatientID, DoctorID, Diagnosis, Fee)
VALUES
    ('V-9001', '2026-04-10', 'P-201', 'D-30', 'Hypertension', 2500),
    ('V-9002', '2026-04-10', 'P-202', 'D-31', 'Eczema',       2000),
    ('V-9003', '2026-04-11', 'P-201', 'D-31', 'Allergy',      2000),
    ('V-9004', '2026-04-12', 'P-203', 'D-30', 'Arrhythmia',   3000);

-- ============================================================
-- CHECK 3NF TABLES
-- ============================================================

SELECT * FROM Department_3NF;
SELECT * FROM Patient_3NF;
SELECT * FROM Doctor_3NF;
SELECT * FROM Visit_3NF;

-- ============================================================
-- DELIVERABLE 5
-- SINGLE SELECT QUERY TO RECREATE TABLE 8.1
-- ============================================================

SELECT
    v.VisitID,
    v.VisitDate,
    p.PatientID,
    p.PatientName,
    p.PatientPhone,
    v.DoctorID,
    d.DoctorName,
    d.Specialty,
    dpt.DeptName,
    dpt.DeptHead,
    v.Diagnosis,
    v.Fee
FROM Visit_3NF v
JOIN Patient_3NF p
    ON v.PatientID = p.PatientID
JOIN Doctor_3NF d
    ON v.DoctorID = d.DoctorID
JOIN Department_3NF dpt
    ON d.DeptName = dpt.DeptName
ORDER BY v.VisitID;

-- ============================================================
-- DELIVERABLE 6
-- ANOMALIES ELIMINATED BY THE 3NF DESIGN
-- ============================================================

-- 1. UPDATE ANOMALY:
-- Patient information is stored once in Patient_3NF.
-- Doctor information is stored once in Doctor_3NF.
-- Department information is stored once in Department_3NF.
-- Therefore, changing a patient's phone, doctor's name,
-- or department head does not require changing many visit rows.

-- 2. INSERTION ANOMALY:
-- A new patient, doctor, or department can be inserted
-- independently without requiring a hospital visit record.
-- Therefore, entity information can be stored before a visit occurs.

-- 3. DELETION ANOMALY:
-- Deleting a visit does not automatically remove the
-- corresponding patient, doctor, or department information.
-- Therefore, important entity information is not lost merely
-- because a visit record is deleted.

-- 4. REDUNDANCY:
-- Repeated patient, doctor, and department details are removed
-- from the Visit table. This reduces unnecessary duplication.
