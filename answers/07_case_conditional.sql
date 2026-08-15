-- TOPIC 7: CASE Expressions & NULL Handling
-- Tables used: crm_lead_request, crm_ai_agent_logs
-- Covers: CASE WHEN, IFNULL/COALESCE, IF()

-- Q1. Show each lead's name and a new column "priority" that shows 'High' if
-- Your answer:
SELECT name, 
CASE
WHEN status='converted' THEN 'High'
WHEN status='customer replied' OR status='reply sent to customer' THEN 'Medium'
ELSE 'Low'
END AS priority
FROM `crm_lead_request` 
WHERE 1

--     status = 'converted', 'Medium' if status = 'customer replied' or
--     'reply sent to customer', otherwise 'Low'.


-- Q2. Show each lead's lead_utm_source, replacing any NULL value with the
-- Your answer:
SELECT id, name, IFNULL(lead_utm_source,'Unknown') AS utm_source
FROM crm_lead_request

--     text 'Unknown' (COALESCE or IFNULL).


-- Q3. Show each lead's name and a column "is_assigned" that displays 'Yes' if
-- Your answer:
SELECT id, name, 
CASE
WHEN assign_to<>0 THEN 'Yes'
ELSE 'No'
END AS is_assigned
FROM crm_lead_request

--     assign_to <> 0, otherwise 'No' (use IF() or CASE).


-- Q4. From crm_ai_agent_logs, show request_id and a column "outcome" that
-- Your answer:
SELECT request_id, 
CASE
WHEN status='success' AND http_status=200 THEN 'OK'
ELSE 'Check'
END AS outcome
FROM `crm_ai_agent_logs` 
WHERE 1

--     shows 'OK' if status = 'success' and http_status = 200, else 'Check'.


-- Q5. Count how many leads fall into each of the priority buckets defined in
-- Your answer:


--     Q1 (combine CASE with GROUP BY).


-- Q6. Show each lead's call_status from crm_lead_request, replacing empty
-- Your answer:


--     string '' with 'Not Contacted'.
