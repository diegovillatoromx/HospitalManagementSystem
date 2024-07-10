# Hospital Management System 
 
## Introduction 
The Hospital Management System (HMS) is designed to streamline and optimize the management of patient information, staff details, appointments, billing, lab tests, medical history, and feedback within a healthcare institution. This comprehensive database solution ensures efficient data handling, improved patient care, and seamless integration of various hospital operations. The HMS provides a robust framework for managing crucial hospital processes, enabling healthcare professionals to focus on delivering high-quality care.

## EER Diagram 

![EER Diagram](https://github.com/diegovillatoromx/HospitalManagementSystem/blob/main/HospitalManagementSystem/diagrams/EER.png)

## Overview
The HMS database is meticulously designed to cater to the dynamic and multifaceted nature of hospital management. It includes tables for patients, staff, departments, doctors, nurses, emergency contacts, payroll, lab screenings, insurance, medicine, prescriptions, medical history, appointments, rooms, billing, visits, attendants, and feedback. Each table is interconnected through well-defined relationships, ensuring data consistency and integrity.

The database is built using MySQL and adheres to best practices in database design, including normalization, appropriate indexing, and foreign key constraints. The use of colors in the Enhanced Entity-Relationship (EER) diagram aids in the visual representation and categorization of tables, facilitating easier understanding and navigation.

## Project Scenario
### Business Context
The Hospital Management System is implemented in a mid-sized hospital that serves a diverse patient population. The hospital aims to enhance its operational efficiency and patient care services by adopting a comprehensive database management system. The key objectives include:

* **Efficient Patient Management**: Centralize patient records, including personal information, medical history, lab tests, and billing details.
* **Staff Coordination**: Manage staff details, including doctors, nurses, and administrative personnel, along with their departmental assignments and payroll information.
* **Streamlined Appointments**: Schedule and track patient appointments with doctors, ensuring minimal wait times and efficient resource allocation.
* **Billing and Insurance Handling**: Generate accurate billing details, manage insurance claims, and track payments and outstanding balances.
* **Lab Test Management**: Record lab test details, including test costs, results, and technician information, to ensure accurate diagnostics and reporting.
* **Feedback and Improvement**: Collect and analyze patient feedback to continually improve the quality of care and hospital services.
  
### Key Features

* **Patient Records**: Comprehensive management of patient details, including emergency contacts, insurance information, and medical history.
* **Staff and Departments**: Detailed records of hospital staff, their qualifications, departmental assignments, and payroll details.
* **Appointments and Scheduling**: Efficient management of patient appointments with doctors and other medical staff.
* **Billing and Payments**: Accurate billing and payment tracking, including room charges, test costs, and other hospital services.
* **Lab Test Management**: Detailed recording and management of lab screenings and test results.
* **Feedback System**: Collection and analysis of patient feedback to ensure continuous improvement in hospital services.


## Example Queries

### Evaluate the total cost of treatments for a specific patient, broken down by type of service:

```sql
SELECT 
    p.Patient_ID,
    p.Patient_FName,
    p.Patient_LName,
    SUM(b.Room_Cost) AS Total_Room_Cost,
    SUM(b.Test_Cost) AS Total_Test_Cost,
    SUM(b.Other_Charges) AS Total_Other_Charges,
    SUM(b.M_Cost) AS Total_Medicine_Cost,
    SUM(b.Total) AS Total_Cost
FROM 
    Bill b
JOIN 
    Patient p ON b.Patient_ID = p.Patient_ID
WHERE 
    p.Patient_ID = 1234
GROUP BY 
    p.Patient_ID, p.Patient_FName, p.Patient_LName;
```

### Identify the doctors with the most scheduled appointments and the total number of appointments within a specific date range:

```sql
SELECT 
    d.Doctor_ID,
    d.Emp_ID,
    s.Emp_FName,
    s.Emp_LName,
    COUNT(a.Appt_ID) AS Total_Appointments
FROM 
    Appointment a
JOIN 
    Doctor d ON a.Doctor_ID = d.Doctor_ID
JOIN 
    Staff s ON d.Emp_ID = s.Emp_ID
WHERE 
    a.Date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    d.Doctor_ID, d.Emp_ID, s.Emp_FName, s.Emp_LName
ORDER BY 
    Total_Appointments DESC;
```

### Determine the effectiveness of medical treatments by analyzing the number of patients readmitted within a specific time period:

```sql
SELECT 
    COUNT(*) AS Total_Readmissions
FROM 
    Patient p1
JOIN 
    Patient p2 ON p1.Patient_ID = p2.Patient_ID 
WHERE 
    p1.Discharge_Date IS NOT NULL
    AND p2.Admission_Date > p1.Discharge_Date
    AND p2.Admission_Date BETWEEN '2024-01-01' AND '2024-12-31';
```

### Analyze the distribution of laboratory costs by type of test within a specific period:
```sql
SELECT 
    ls.Test_Type,
    COUNT(ls.Lab_ID) AS Total_Tests,
    SUM(ls.Test_Cost) AS Total_Cost
FROM 
    Lab_Screening ls
WHERE 
    ls.Date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    ls.Test_Type
ORDER BY 
    Total_Cost DESC;
```

### Evaluate patient satisfaction with hospital staff by analyzing comments and ratings in the feedback system:

```sql
SELECT 
    f.Staff_ID,
    s.Emp_FName,
    s.Emp_LName,
    AVG(f.Rating) AS Average_Rating,
    COUNT(f.Feedback_ID) AS Total_Feedbacks
FROM 
    Feedback f
JOIN 
    Staff s ON f.Staff_ID = s.Emp_ID
GROUP BY 
    f.Staff_ID, s.Emp_FName, s.Emp_LName
HAVING 
    COUNT(f.Feedback_ID) > 5 -- Consider only those with more than 5 feedbacks
ORDER BY 
    Average_Rating DESC;
```
