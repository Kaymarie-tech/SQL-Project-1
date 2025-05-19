-- Find condition specific admission patterns:

SELECT medical_condition, admission_type, COUNT(*) AS admission_count
FROM healthcare_data
GROUP BY medical_condition, admission_type
ORDER BY admission_count DESC;

-- Measured how long patients stay for each condition to identify areas of improvement by condition, hospital, and doctor.

-- 1. Condition
SELECT medical_condition,
	ROUND(AVG(DATEDIFF(discharge_date,date_of_admission)),1) AS avg_stay,
    COUNT(*) AS total_patients
FROM healthcare_data
GROUP BY medical_condition
ORDER BY avg_stay DESC;

-- 2. Hospital
SELECT hospital,
	ROUND(AVG(DATEDIFF(discharge_date, date_of_admission)),1) AS avg_stay,
    COUNT(*) AS total_patients
    FROM healthcare_data
    GROUP BY hospital
    ORDER BY avg_stay DESC;

-- 3. Doctor
SELECT doctor,
	ROUND(AVG(DATEDIFF(discharge_date, date_of_admission)),1) AS avg_stay,
    COUNT(*) AS total_oatients
FROM healthcare_data
GROUP BY doctor
HAVING COUNT(*) > 10
ORDER BY avg_stay DESC;

-- Length of stay distribution
SELECT DATEDIFF(discharge_date, date_of_admission) AS length_of_stay,
	COUNT(*) AS num_patients
FROM healthcare_data
GROUP BY length_of_stay
ORDER BY length_of_stay;

-- Minimum and Maximum stay per condition
SELECT medical_condition,
	MIN(DATEDIFF(discharge_date, date_of_admission)) AS min_stay,
    MAX(DATEDIFF(discharge_date, date_of_admission)) AS max_stay
FROM healthcare_data
GROUP BY medical_condition
ORDER BY medical_condition;

-- Resource utilization:

-- Room occupancy by hospital
SELECT hospital, COUNT(DISTINCT room_number) AS total_rooms,
	COUNT(*) AS total_admission,
    ROUND(COUNT(*)/COUNT(DISTINCT room_number),2) AS avg_admissions_per_room
FROM healthcare_data
GROUP BY hospital; 

-- Room usage over time 
SELECT room_number, COUNT(*) AS times_used
FROM healthcare_data
GROUP BY room_number
ORDER BY times_used DESC;

-- Average length of stay by room
SELECT room_number,
	ROUND(AVG(DATEDIFF(discharge_date, date_of_admission)),2) AS avg_stay
FROM healthcare_data
GROUP BY room_number
ORDER BY avg_stay DESC; 

-- Patient Refferal:

-- Refferal Volume by insurance provider and hospital
SELECT insurance_provider, hospital, COUNT(*) AS refferal_count 
FROM healthcare_data
GROUP BY insurance_provider, hospital
ORDER BY insurance_provider, refferal_count DESC;
