-- TOPIC 3: Joins
-- Tables used: crm_lead_request, crm_lead_request_call_log, crm_lead_notes,
--              crm_lead_conversations, crm_lead_vision, crm_lead_update_log
-- Relationship: child.lead_id = crm_lead_request.id (in all tables above)
-- Covers: INNER JOIN, LEFT JOIN, multi-table JOIN

-- Q1. List each lead's name along with their call_status and call_description
-- Your answer:
SELECT a.name,b.call_status,b.call_description
FROM crm_lead_request as a
LEFT JOIN crm_lead_request_call_log as b
ON a.id = b.lead_id

--     from crm_lead_request_call_log (INNER JOIN).
SELECT a.name, b.call_status, b.call_description
FROM crm_lead_request AS a
INNER JOIN crm_lead_request_call_log AS b
  ON a.id = b.lead_id

-- Q2. List every lead's name, and their note_html if any notes exist for them
-- Your answer:
SELECT a.id, a.name, b.note_html 
FROM `crm_lead_request` as a
INNER JOIN `crm_lead_notes` as b
ON a.id = b.lead_id

--     (use LEFT JOIN so leads with no notes still appear, with NULL note).
SELECT a.id, a.name, b.note_html 
FROM `crm_lead_request` as a
LEFT JOIN `crm_lead_notes` as b
ON a.id = b.lead_id

-- Q3. Find all leads that have NO entry in crm_lead_notes at all
-- Your answer:
SELECT a.id, a.name, b.note_html 
FROM `crm_lead_request` as a
LEFT JOIN `crm_lead_notes` as b
ON a.id = b.lead_id
WHERE b.lead_id IS NULL



-- Q4. List lead name, their latest call_status (from call_log) and their latest
-- Your answer:


--     lead_status (from crm_lead_update_log), joining all three tables.


-- Q5. List each lead's name along with the number of conversation messages
-- Your answer:
SELECT a.id, a.name, COUNT(b.lead_id) AS total_msgs 
FROM `crm_lead_request` as a 
LEFT JOIN `crm_lead_conversations` as b 
ON a.id = b.lead_id GROUP BY a.id, a.name;

--     they have in crm_lead_conversations (JOIN + GROUP BY).


-- Q6. Find leads who have both a note in crm_lead_notes AND at least one
-- Your answer:
SELECT a.id, a.name 
FROM `crm_lead_request` as a
RIGHT JOIN `crm_lead_notes` as b
ON a.id = b.lead_id
GROUP BY a.id
HAVING count(a.id)>1

--     entry in crm_lead_vision (join both tables to crm_lead_request).


-- Q7. List lead name, email_id and every question/answer pair from crm_lead_vision
-- Your answer:


--     for that lead.


-- Q8. Find all leads whose call_status in crm_lead_request_call_log is 'Unreachable',
-- Your answer:


--     showing the lead's name, mobileno and the call's add_date.
