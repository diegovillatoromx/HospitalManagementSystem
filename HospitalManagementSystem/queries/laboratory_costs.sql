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
