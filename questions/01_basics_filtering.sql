-- TOPIC 1: Basic SELECT & Filtering
-- Tables used: crm_lead_request, crm_user_registration, crm_module
-- Covers: SELECT, WHERE, ORDER BY, LIMIT, DISTINCT, LIKE, IN, BETWEEN, IS NULL

-- Q1. List the name, email_id and mobileno of all leads from crm_lead_request.

-- Q2. List all leads whose status is 'pending', ordered by add_date descending.

-- Q3. Find all leads whose lead_utm_source is either 'google' or 'facebook'.

-- Q4. Find all leads added between '2026-06-01' and '2026-06-30' (use add_date).

-- Q5. List the distinct values of call_status from crm_lead_request.

-- Q6. Find all leads whose name starts with 'A' or contains 'sh' (case-insensitive).

-- Q7. List leads where address_city IS NULL.

-- Q8. Show the 5 most recently added leads (name + add_date only).

-- Q9. List all leads NOT assigned to anyone (assign_to = 0).

-- Q10. From crm_user_registration, list active users (is_active = 'Y') along with their user_email and department.
