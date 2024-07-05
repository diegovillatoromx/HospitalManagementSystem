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
