-- =========================================
-- Healthcare Analytics SQL Project
-- Advanced SQL for Data Analysis
-- =========================================

------------------------------------------------
-- 1) Basic Data Preview
------------------------------------------------
SELECT TOP 10 *
FROM hospital_readmissions;


------------------------------------------------
-- 2) Readmission Count
------------------------------------------------
SELECT readmitted, COUNT(*) AS total
FROM hospital_readmissions
GROUP BY readmitted;


------------------------------------------------
-- 3) Average Hospital Stay
------------------------------------------------
SELECT AVG(time_in_hospital) AS avg_stay
FROM hospital_readmissions;


------------------------------------------------
-- 4) JOIN + Aggregation
------------------------------------------------
SELECT 
    a.age,
    a.readmitted,
    a.patient_count,
    b.avg_stay
FROM 
(
    SELECT age, readmitted, COUNT(*) AS patient_count
    FROM hospital_readmissions
    GROUP BY age, readmitted
) a
JOIN 
(
    SELECT age, AVG(time_in_hospital) AS avg_stay
    FROM hospital_readmissions
    GROUP BY age
) b
ON a.age = b.age
ORDER BY a.age;


------------------------------------------------
-- 5) CTE
------------------------------------------------
WITH ReadmissionCTE AS (
    SELECT 
        age,
        time_in_hospital,
        readmitted
    FROM hospital_readmissions
)
SELECT 
    age,
    COUNT(*) AS total_patients,
    AVG(time_in_hospital) AS avg_stay
FROM ReadmissionCTE
WHERE readmitted = 1
GROUP BY age
ORDER BY avg_stay DESC;


------------------------------------------------
-- 6) Window Function
------------------------------------------------
SELECT 
    age,
    time_in_hospital,
    readmitted,
    AVG(time_in_hospital) OVER (PARTITION BY age) AS avg_stay_by_age,
    RANK() OVER (ORDER BY time_in_hospital DESC) AS stay_rank
FROM hospital_readmissions;


------------------------------------------------
-- 7) High-Risk Patients
------------------------------------------------
SELECT *
FROM hospital_readmissions
WHERE time_in_hospital > 7 AND readmitted = 1;


------------------------------------------------
-- 8) Diabetes Medication Analysis
------------------------------------------------
SELECT diabetes_med, COUNT(*) AS total
FROM hospital_readmissions
GROUP BY diabetes_med;


------------------------------------------------
-- 9) Glucose Test Analysis
------------------------------------------------
SELECT glucose_test, COUNT(*) AS total
FROM hospital_readmissions
GROUP BY glucose_test;


------------------------------------------------
-- 10) Age-wise Patient Distribution
------------------------------------------------
SELECT age, COUNT(*) AS total
FROM hospital_readmissions
GROUP BY age
ORDER BY total DESC;
