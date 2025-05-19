# Healthcare Data Analysis

This healthcare dataset used in this analysis is a simulated representation of hospital data, created for educational and analytical purposes.
It includes key patient demographics, administrative details, and clinical information. The initiative of this project is to enhance hospital operational performance, patient care quality and treatment efficiency.

Insights and recommendations are provided on the following key areas:

- Condition specific admissions:

Most medical conditions have approximately 3,000 admissions per admission type, with diabetes and hypertension being the most common. Urgent admissions are more frequent for diabetes while hypertension cases tend to be scheduled as planned visits.
Recommendation: 
Align hospital staffing and resource planning with the most commonly treated conditions at each facility. Prioritizing readiness for urgent diabetic cases and pre scheduling hypertension care can enhance patient flow and care efficiency.

- Treatment Efficiency:

The average length of stay across conditions is around 15 days, though patient volume varies by diagnosis. No same-day discharges were observed, and some hospitals and doctors discharge patients faster than others.                         
Recommendation: Aim to reduce the 15-day average stay by identifying and replicating best practices from efficient hospitals and providers. Validate data accuracy and explore opportunities for shorter, safe discharge times.                     

- Resource Utilization:

Room occupnacy averages between 1 and 2 patients, with average patient stays per room ranging from 12.56 to 17.72 dyas. Usage varies across rooms, with room 393 being used 181 times and room 398 only 109 times, indicating uneven utilization over time.              
Recommendation: Maintain balanced room assignments and monitor usage trends to avoid overcrowding. Identify best practices from highly utilized rooms and apply them to less used ones. Optimize room turnover and scheduling to improve patient flow and overall hospital efficiency. 

- Patient Referral:

Certain insurance providers, like aetna, show higher refferal volumes to specific hospitals, such as LLC Smith with 11 patients, suggesting established refferal networks.
Recommendation: Hospitals should strengthen collaborations with high referral insurance providers to streamline patient intake, enhance care coordination, and improve operational efficiency.


The SQL queries used to inspect and clean the data for this analysis can be found here LINK.

Targeted SQL queries regarding various business questions can be found here [Click here](https://github.com/Kaymarie-tech/SQL-Project-1/blob/main/Analysis.sql)

An interactive Tableau dashboard can be downloaded here LINK.

# Data Structure & Initial Checks 

Down below is a database sturucture that consists of one table: healthcare_dataset has a total row count of 50,001 records.




