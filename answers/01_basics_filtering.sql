-- TOPIC 1: Basic SELECT & Filtering
-- Tables used: crm_lead_request, crm_user_registration, crm_module
-- Covers: SELECT, WHERE, ORDER BY, LIMIT, DISTINCT, LIKE, IN, BETWEEN, IS NULL

-- Q1. List the name, email_id and mobileno of all leads from crm_lead_request.
-- Your answer:
select name, email_id,mobileno
from crm_lead_request


-- Q2. List all leads whose status is 'pending', ordered by add_date descending.
-- Your answer:
SELECT * 
FROM `crm_lead_request` 
WHERE status='pending'
ORDER BY add_date DESC;


-- Q3. Find all leads whose lead_utm_source is either 'google' or 'facebook'.
-- Your answer:
SELECT * FROM `crm_lead_request` 
WHERE lead_utm_source IN ('google','facebook')


-- Q4. Find all leads added between '2026-06-01' and '2026-06-30' (use add_date).
-- Your answer:
SELECT * FROM `crm_lead_request` 
WHERE add_date BETWEEN '2026-06-01' and '2026-06-30'


-- Q5. List the distinct values of call_status from crm_lead_request.
-- Your answer:
SELECT DISTINCT call_status FROM `crm_lead_request` 



-- Q6. Find all leads whose name starts with 'A' or contains 'sh' (case-insensitive).
-- Your answer:
SELECT * 
FROM `crm_lead_request` 
WHERE LOWER(name) LIKE 'A%' OR LOWER(name) LIKE '%sh%'


-- Q7. List leads where address_city IS NULL.
-- Your answer:
SELECT * 
FROM `crm_lead_request` 
WHERE address_city IS NULL;


-- Q8. Show the 5 most recently added leads (name + add_date only).
-- Your answer:
SELECT name, add_date 
FROM `crm_lead_request` 
order by add_date DESC
LIMIT 5;


-- Q9. List all leads NOT assigned to anyone (assign_to = 0).
-- Your answer:
SELECT * FROM `crm_lead_request` WHERE assign_to=0



-- Q10. From crm_user_registration, list active users (is_active = 'Y') along with their user_email and department.
-- Your answer:
SELECT user_email, department FROM `crm_user_registration` 
WHERE is_active='Y'

