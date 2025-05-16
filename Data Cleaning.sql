-- Checked for nulls and duplicates:

SELECT *
FROM healthcare_data
WHERE name IS NULL OR billing_amount IS NULL OR medical_condition IS NULL;

SELECT name, date_of_admission, hospital, COUNT(*) as count
FROM your_table
GROUP BY name, date_of_admission, hospital
HAVING COUNT(*) > 1;

-- Formatted billing amount column:

UPDATE healthcare_data
SET billing_amount = ROUND(CAST(billing_amount AS DECIMAL(10, 2)), 2); 

-- Renamed columns for clarity and consistency:

--    Before:                After:
--    Blood Type             blood_type
--    Medical Condition      medical_condition
--    Date of Admission      date_of_admission

ALTER TABLE healthcare_data
RENAME COLUMN `Blood Type` TO blood_type;

ALTER TABLE healthcare_data
RENAME COLUMN `Medical Condition` TO medical_condition;

ALTER TABLE healthcare_data
RENAME COLUMN `Date of Admission` TO date_of_admission;

-- Fixed irregular rows by correcting formatting issues:

--    Before:                After:
--    Bobby JacksOn          Bobby Jackson
--    LesLie TErRy           Leslie Terry
--    DaNnY sMitH            Danny Smith

UPDATE healthcare_data
SET Name = CONCAT(
  UPPER(LEFT(SUBSTRING_INDEX(TRIM(Name), ' ', 1), 1)),        
  LOWER(SUBSTRING(SUBSTRING_INDEX(TRIM(Name), ' ', 1), 2)),   
  ' ',
  UPPER(LEFT(SUBSTRING_INDEX(TRIM(Name), ' ', -1), 1)),       
  LOWER(SUBSTRING(SUBSTRING_INDEX(TRIM(Name), ' ', -1), 2))   
);

-- Removed unwanted titles:

--    Before:                After:
--    Ms. Natalie Gamble     Natalie Gamble
--    Mr. Kenneth Moore      Kenneth Moore
--    Dr. Jeffrey Cole       Jeffrey Cole

UPDATE healthcare_data
SET Name = TRIM(
  CASE
    WHEN Name LIKE 'MR. %' THEN SUBSTRING(Name, 4)
    WHEN Name LIKE 'MS. %' THEN SUBSTRING(Name, 4)
    WHEN Name LIKE 'DR. %' THEN SUBSTRING(Name, 4)
    ELSE Name
  END
);



