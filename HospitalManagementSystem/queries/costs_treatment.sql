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
