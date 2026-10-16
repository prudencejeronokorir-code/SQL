set search_path to morning;

select * from morning.doctors;

show search_path;

select * from doctors;
 -- COMMON SQL KEY WORDS
-- SELECT - Retrieve data

select * from patients;

ALTER TABLE visits 
RENAME TO fact_visits;

select * from fact_visits;

--male pateints who are above 40
select * from patients
where patient_gender = 'Male';

select * from patients
where patient_age > 40;

-- green and yellow triage level 
select * from fact_visits
where triage_level not in ('Green');

select * from fact_visits
where triage_level = 'Green' or triage_level = 'Yellow';

ALTER TABLE fact_visits 
RENAME COLUMN total_bill_kes TO total_bill;

-- visits where 10000-30000 was collected 
select * from fact_visits 
where total_bill >= 10000 and total_bill <= 30000;

select * from fact_visits
where total_bill between 10000 and 30000;


select * from patients 
where patient_age > 40 and patient_gender = 'Male' and county = ' Kiambu';

-- aar, Britam and cic insurance

select * from fact_visits 
where insurance_provider not in ('CIC', 'AAR', 'Britam');

-- ORDER BY- SORT query results ASC/DESC

select * from fact_visits
order by visit_date desc ;

select * from patients
order by patient_name desc
limit 2;

-- LIMIT - restricts the number or rows returned 

select * from patients 
order by patient_age desc
limit 1;

select * from patients 
order by patient_age asc
limit 2;

-- Filtering records using pattern matching (LIKE with wildcards)
select * from patients
select * from patients 
where patient_name like 'A%';

-- GROUP BY - group and summarise data - used with aggregate fuctions
select avg(patient_age) as avg_age  
from patients;

select patient_gender, avg(patient_age) as average_age
from patients
group by patient_gender;

-- total amount collected by each doctor
select doctor_id, sum(total_bill)
from fact_visits
group by  doctor_id;

-- which doctors collected more than 100000
select doctor_id, sum(total_bill)
from fact_visits
group by  doctor_id
having sum(total_bill) >= 100000;

select * from fact_visits;

select doctor_id, doctor_name, sum(total_bill)
from fact_visits
group by  doctor_id, doctor_name;
--the above code could not work because the visits table does not have the doctors name but only the id and below was the suggested corrected code demonstrating inner join
SELECT 
    d.doctor_id, 
    d.doctor_name, 
    SUM(fv.total_bill) AS total_collected
FROM fact_visits fv
JOIN doctors d 
    ON fv.doctor_id = d.doctor_id
GROUP BY d.doctor_id, d.doctor_name;

-- money from the different payment methods
select payment_method, sum(total_bill)
from fact_visits
group by payment_method;

--which pament methods collected lesss thyan 50000
select payment_method, sum(total_bill)
from fact_visits
group by payment_method
having sum(total_bill) < 50000;


-- which insurance provider paid for the highest amount of money
select max(revenue) from (
select insurance_provider, sum(total_bill) as revenue
from fact_visits
group by insurance_provider);

select insurance_provider, sum(total_bill) as revenue
from fact_visits
group by insurance_provider
order by sum(total_bill) desc 
limit 1;


-- which insurance provider had the most patients != or <>
select insurance_provider, count(doctor_id)
from fact_visits
where insurance_provider <> 'None'
group by insurance_provider
having count(doctor_id) > 3
order by count(doctor_id) desc;

-- HAVING - Filter groups after aggregation

-- list the patients that visited the hospital more than once

select patient_id, count(visit_id)
from fact_visits
group by patient_id
having count(visit_id) >1;


/* SQL WRITTING ORDER
 * 1. SELECT
 * 2. FROM
 * 3. WHERE
 * 4. GROUP BY
 * 5. HAVING
 * 6. ORDER BY
 * 7. LIMIT 
 * 
 * EXECUTION ORDER
 * 1. FROM
 * 2. WHERE
 * 3. GROUP BY 
 * 4. HAVING
 * 5. SELECT 
 * 6. ORDER BY
 * 7. LIMIT
 */


