-- ============================================================
-- LAB 04 — Normalization: Overview and 1NF
-- Assessment Problem: Hospital Patient Visits
-- ============================================================

CREATE DATABASE IF NOT EXISTS hospital_normalization;
USE hospital_normalization;

-- ============================================================
-- Functional Dependencies and Candidate Key
-- ============================================================

-- Functional Dependencies:
--
-- 1. VisitID -> VisitDate, PatientID, DoctorID, Diagnosis, Fee
--    Each VisitID identifies one visit and its visit-specific details.
--
-- 2. PatientID -> PatientName, PatientPhone
--    Each PatientID identifies one patient and the patient's phone.
--
-- 3. DoctorID -> DoctorName, Specialty, DeptName
--    Each DoctorID identifies one doctor, specialty, and department.
--
-- 4. DeptName -> DeptHead
--    Each department has one department head.
--
-- Candidate Key:
-- VisitID
--
-- Reason:
-- VisitID uniquely identifies every hospital visit.
-- Therefore, VisitID is the candidate key of the original relation.

-- ============================================================
-- 1NF Version of the Hospital Visit Table
-- ============================================================

DROP TABLE IF EXISTS HospitalVisit_1NF;

CREATE TABLE HospitalVisit_1NF (
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

-- All values are atomic, so the relation satisfies 1NF.

-- ============================================================
-- 1NF INSERTS
-- ============================================================

INSERT INTO HospitalVisit_1NF
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
-- CHECK 1NF TABLE
-- ============================================================

SELECT * 
FROM HospitalVisit_1NF
ORDER BY VisitID;

-- ============================================================
-- END OF LAB 04
-- ============================================================
