-- TOPIC 3: Joins
-- Tables used: crm_lead_request, crm_lead_request_call_log, crm_lead_notes,
--              crm_lead_conversations, crm_lead_vision, crm_lead_update_log
-- Relationship: child.lead_id = crm_lead_request.id (in all tables above)
-- Covers: INNER JOIN, LEFT JOIN, multi-table JOIN

-- Q1. List each lead's name along with their call_status and call_description
-- Your answer:


--     from crm_lead_request_call_log (INNER JOIN).


-- Q2. List every lead's name, and their note_html if any notes exist for them
-- Your answer:


--     (use LEFT JOIN so leads with no notes still appear, with NULL note).


-- Q3. Find all leads that have NO entry in crm_lead_notes at all
-- Your answer:


--     (LEFT JOIN + WHERE ... IS NULL).


-- Q4. List lead name, their latest call_status (from call_log) and their latest
-- Your answer:


--     lead_status (from crm_lead_update_log), joining all three tables.


-- Q5. List each lead's name along with the number of conversation messages
-- Your answer:


--     they have in crm_lead_conversations (JOIN + GROUP BY).


-- Q6. Find leads who have both a note in crm_lead_notes AND at least one
-- Your answer:


--     entry in crm_lead_vision (join both tables to crm_lead_request).


-- Q7. List lead name, email_id and every question/answer pair from crm_lead_vision
-- Your answer:


--     for that lead.


-- Q8. Find all leads whose call_status in crm_lead_request_call_log is 'Unreachable',
-- Your answer:


--     showing the lead's name, mobileno and the call's add_date.
