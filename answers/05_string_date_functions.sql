-- TOPIC 5: String & Date Functions
-- Tables used: crm_lead_request, crm_ai_agent_logs
-- Covers: CONCAT, UPPER/LOWER, SUBSTRING/LEFT/RIGHT, LENGTH, TRIM,
--         DATE(), DATE_FORMAT, DATEDIFF, TIMESTAMPDIFF, NOW/CURDATE, EXTRACT

-- Q1. Display each lead's name in UPPERCASE along with their email_id in lowercase.
-- Your answer:




-- Q2. Display each lead's name and mobileno concatenated as a single string:
-- Your answer:


--     "Name (mobile: xxxxx)".


-- Q3. Extract and display just the first name (text before the first space) from
-- Your answer:


--     the `name` column for every lead.


-- Q4. Display each lead's add_date formatted as 'DD-Mon-YYYY' (e.g. 17-Jul-2026)
-- Your answer:


--     using DATE_FORMAT.


-- Q5. Find how many days ago each lead was added, compared to today (DATEDIFF
-- Your answer:


--     with CURDATE()).


-- Q6. List all leads added in the month of June 2026 (any year-safe way using
-- Your answer:


--     MONTH() and YEAR() functions).


-- Q7. From crm_ai_agent_logs, calculate the duration in seconds between
-- Your answer:


--     request_started_at and response_received_at using TIMESTAMPDIFF.


-- Q8. Find all leads whose email_id domain (text after '@') is 'gmail.com'.
-- Your answer:




-- Q9. Trim any leading/trailing spaces from `name` and show only leads where
-- Your answer:


--     LENGTH(name) is greater than 15 characters.
