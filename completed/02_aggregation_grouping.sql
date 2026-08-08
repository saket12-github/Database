-- TOPIC 2: Aggregate Functions, GROUP BY, HAVING
-- Tables used: crm_lead_request, crm_lead_request_call_log, crm_ai_agent_logs
-- Covers: COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING

-- Q1. Count the total number of leads in crm_lead_request.
-- Your answer:
SELECT COUNT(*) FROM `crm_lead_request` WHERE 1



-- Q2. Count how many leads exist for each value of status.
-- Your answer:
SELECT status, COUNT(status) 
FROM `crm_lead_request` 
group by status



-- Q3. Count how many leads came from each lead_utm_source, ordered by count descending.
-- Your answer:
SELECT lead_utm_source, COUNT(*) AS true_count, COUNT(lead_utm_source) AS col_count
FROM crm_lead_request GROUP BY lead_utm_source ORDER BY true_count DESC;




-- Q4. Find the number of leads assigned to each assign_to (salesperson id), excluding unassigned (assign_to = 0).
-- Your answer:
SELECT assign_to, COUNT(assign_to)
FROM `crm_lead_request` 
group by assign_to
having assign_to != 0



-- Q5. Using crm_lead_request_call_log, find the count of calls grouped by call_status,
-- Your answer:
SELECT call_status, count(call_status) AS count_call_status 
FROM `crm_lead_request_call_log` 
GROUP BY call_status

--     and show only the call_status values that occurred more than 3 times (HAVING).
SELECT call_status, count(call_status) AS count_call_status 
FROM `crm_lead_request_call_log` 
GROUP BY call_status
HAVING count_call_status > 3

-- Q6. From crm_ai_agent_logs, find the average duration_ms and average total_tokens per agent.
-- Your answer:
SELECT agent, AVG(duration_ms) AS duration, AVG(total_tokens) AS tokens
FROM crm_ai_agent_logs
group by agent

-- Q7. From crm_ai_agent_logs, find the total input_tokens and total output_tokens used per model.
-- Your answer:
SELECT model, SUM(input_tokens), SUM(output_tokens)
FROM crm_ai_agent_logs
group by model


-- Q8. Find the earliest (MIN) and latest (MAX) add_date in crm_lead_request.
-- Your answer:
SELECT MIN(add_date) as earliest, MAX(add_date) as latest 
FROM `crm_lead_request` 
WHERE 1



-- Q9. Find which lead_utm_source has the highest number of leads (single row result).
-- Your answer:
SELECT lead_utm_source,COUNT(lead_utm_source) AS countutm
FROM `crm_lead_request` 
group by lead_utm_source
ORDER BY countutm DESC
LIMIT 1



-- Q10. From crm_lead_request_call_log, count the number of calls logged per lead_id,
-- Your answer:
select lead_id,count(lead_id)
from crm_lead_request_call_log
group by lead_id

--      and list only leads that have been called more than once.
select lead_id,count(lead_id) AS calls
from crm_lead_request_call_log
group by lead_id
having calls > 1