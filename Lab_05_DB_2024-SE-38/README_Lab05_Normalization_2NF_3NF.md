# Lab 05 — Normalization: 2NF and 3NF

## Database Systems

This folder contains the SQL work for **Lab 05 — Conversion to 2NF and 3NF**, continuing the Hospital Patient Visits assessment from Lab 04.

### SQL File

- `LAB_05_Hospital_Normalization_2NF_3NF.sql`

### Database

The script uses:

```sql
hospital_normalization
```

### Topics Covered

This lab covers:

- Second Normal Form (2NF)
- Partial dependency analysis
- Third Normal Form (3NF)
- Transitive dependency analysis
- Decomposition into related tables
- Primary keys and foreign keys
- Reconstructing the original information using joins
- Update, insertion, deletion anomalies, and redundancy

### 2NF

The original candidate key is:

```text
VisitID
```

Because `VisitID` is a single-attribute candidate key, there can be no partial dependency on part of the key. Therefore, the 1NF relation is already in 2NF.

The 2NF table is:

```text
HospitalVisit_2NF
```

### 3NF

The SQL file identifies these transitive dependencies:

```text
VisitID -> PatientID -> PatientName, PatientPhone
VisitID -> DoctorID -> DoctorName, Specialty, DeptName
DeptName -> DeptHead
```

To remove these transitive dependencies, the data is separated into:

- `Department_3NF`
- `Patient_3NF`
- `Doctor_3NF`
- `Visit_3NF`

Foreign keys connect the related entities.

### Additional Deliverables

The file also contains:

- Verification queries for the 3NF tables
- A single SELECT query that recreates the combined hospital visit information
- Comments describing the update, insertion, and deletion anomalies eliminated by the 3NF design
- Explanation of reduced data redundancy

### How to Run

1. Open the SQL file in MySQL Workbench.
2. Execute the complete script.
3. The 2NF table and 3NF tables will be created.
4. Sample data will be inserted.
5. Run the verification queries to inspect the normalized tables.
