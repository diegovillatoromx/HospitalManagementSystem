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
