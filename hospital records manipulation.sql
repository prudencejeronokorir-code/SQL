
-- Check and set current active schema context
SHOW search_path;
SET search_path TO morning;

-- Renaming a schema
ALTER SCHEMA cohort9 RENAME TO ch9;

SET search_path TO morning;
-- ==========================================
-- 2. ALTER TABLE OPERATIONS
-- ==========================================

-- Add a column with a UNIQUE constraint
ALTER TABLE patients 
ADD COLUMN phone_number VARCHAR(14) UNIQUE;

-- View updated table structure
SELECT * FROM patients;

-- Drop a column
ALTER TABLE patients 
DROP COLUMN phone_number;

-- Modify a column data type
ALTER TABLE visits 
ALTER COLUMN visit_id TYPE CHAR(4);

SELECT * FROM visits;
-- Rename a column
ALTER TABLE visits 
RENAME COLUMN total_bill_kes TO total_bill;

-- Rename a table
ALTER TABLE department 
RENAME TO departments;

SELECT * FROM departments;
-- ==========================================
-- 5. UPDATING RECORDS & CLASS EXERCISE
-- ==========================================
ALTER TABLE morning.doctors 
ADD COLUMN doctor_email  CHAR(50);


-- Update email addresses for existing doctor records
UPDATE morning.doctors
SET doctor_email = 'brianmwangi@gmail.com'
WHERE doctor_id = 101;

UPDATE morning.doctors
SET doctor_email = 'sarawanjiku@gmail.com'
WHERE doctor_id = 102;

UPDATE morning.doctors
SET doctor_email = 'peterotieno@gmail.com'
WHERE doctor_id = 103;

UPDATE morning.doctors
SET doctor_email = 'faithchebet@gmail.com'
WHERE doctor_id = 104;

SELECT * FROM doctors;

-- Class Task: Add 'city' column and update doctor locations
ALTER TABLE morning.doctors 
ADD COLUMN city CHAR(50);

UPDATE morning.doctors SET city = 'Nairobi' WHERE doctor_id = 101;
UPDATE morning.doctors SET city = 'Kisumu'  WHERE doctor_id = 102;
UPDATE morning.doctors SET city = 'Kisumu'  WHERE doctor_id = 103;
UPDATE morning.doctors SET city = 'Nakuru'  WHERE doctor_id = 104;