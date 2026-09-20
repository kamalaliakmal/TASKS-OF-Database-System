# Lab 04 — Normalization: Overview and 1NF

## Database Systems

This folder contains the SQL work for **Lab 04 — Normalization: Overview and 1NF**, based on the Hospital Patient Visits assessment.

### SQL File

- `LAB_04_Hospital_Normalization_1NF(1).sql`

### Database

The script creates and uses:

```sql
hospital_normalization
```

### Topics Covered

This lab covers:

- Functional dependencies
- Candidate key identification
- First Normal Form (1NF)
- Atomic values
- Creating a 1NF hospital visit table
- Inserting the provided hospital visit data
- Verifying the 1NF table

### Assessment Work

The SQL file documents the following functional dependencies:

- `VisitID -> VisitDate, PatientID, DoctorID, Diagnosis, Fee`
- `PatientID -> PatientName, PatientPhone`
- `DoctorID -> DoctorName, Specialty, DeptName`
- `DeptName -> DeptHead`

The candidate key identified is:

```text
VisitID
```

The 1NF table is named:

```text
HospitalVisit_1NF
```

All values are stored as atomic values, satisfying the 1NF requirement.

### How to Run

1. Open the SQL file in MySQL Workbench.
2. Execute the script.
3. The database `hospital_normalization` will be created if it does not already exist.
4. The `HospitalVisit_1NF` table will be created and populated.
5. The final `SELECT` statement can be used to verify the stored records.
