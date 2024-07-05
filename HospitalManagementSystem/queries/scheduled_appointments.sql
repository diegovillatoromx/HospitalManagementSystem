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
