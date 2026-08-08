-- TOPIC 5: String & Date Functions
-- Tables used: crm_lead_request, crm_ai_agent_logs
-- Covers: CONCAT, UPPER/LOWER, SUBSTRING/LEFT/RIGHT, LENGTH, TRIM,
--         DATE(), DATE_FORMAT, DATEDIFF, TIMESTAMPDIFF, NOW/CURDATE, EXTRACT

-- Q1. Display each lead's name in UPPERCASE along with their email_id in lowercase.
-- Your answer:
SELECT CONCAT('Name: ',UPPER(name),' Email: ', LOWER(email_id)) AS Lead_Details
FROM `crm_lead_request` 
WHERE 1

-- Q2. Display each lead's name and mobileno concatenated as a single string:
-- Your answer:
SELECT CONCAT(name, ' (mobile: ', mobileno, ')') AS Lead_details
FROM `crm_lead_request` 
WHERE 1

--     "Name (mobile: xxxxx)".


-- Q3. Extract and display just the first name (text before the first space) from
-- Your answer:
SELECT LEFT(name, (INSTR(name,' ')-1)) AS first_name
FROM `crm_lead_request` 
WHERE 1

--     the `name` column for every lead.


-- Q4. Display each lead's add_date formatted as 'DD-Mon-YYYY' (e.g. 17-Jul-2026)
-- Your answer:
SELECT 
    id, 
    name, 
    CONCAT(
        DATE_FORMAT(add_date, '%d-'), 
        LEFT(DATE_FORMAT(add_date, '%M'), 3), 
        DATE_FORMAT(add_date, '-%Y')
    ) AS formatted_date
FROM crm_lead_request;


--     using DATE_FORMAT.


-- Q5. Find how many days ago each lead was added, compared to today (DATEDIFF
-- Your answer:
SELECT 
    id, 
    name, 
    DATEDIFF(CURRENT_DATE, add_date) AS days_ago
FROM crm_lead_request;

--     with CURDATE()).


-- Q6. List all leads added in the month of June 2026 (any year-safe way using
-- Your answer:
SELECT *
FROM crm_lead_request
WHERE MONTH(add_date)=6 AND YEAR(add_date)='2026'

--     MONTH() and YEAR() functions).


-- Q7. From crm_ai_agent_logs, calculate the duration in seconds between
-- Your answer:
SELECT id, request_id, agent, lead_id, TIMESTAMPDIFF(SECOND, request_started_at,response_received_at) AS time_taken
FROM `crm_ai_agent_logs` 
WHERE 1

--     request_started_at and response_received_at using TIMESTAMPDIFF.


-- Q8. Find all leads whose email_id domain (text after '@') is 'gmail.com'.
-- Your answer:
SELECT * 
FROM `crm_lead_request` 
WHERE RIGHT(email_id, (LENGTH(email_id)-INSTR(email_id, '@')))='gmail.com'



-- Q9. Trim any leading/trailing spaces from `name` and show only leads where
-- Your answer:
SELECT id, TRIM(name) AS name, mobileno, email_id 
FROM `crm_lead_request` 
WHERE LENGTH(name) > 15;

--     LENGTH(name) is greater than 15 characters.
