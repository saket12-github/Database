-- TOPIC 2: Aggregate Functions, GROUP BY, HAVING
-- Tables used: crm_lead_request, crm_lead_request_call_log, crm_ai_agent_logs
-- Covers: COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING

-- Q1. Count the total number of leads in crm_lead_request.
-- Your answer:




-- Q2. Count how many leads exist for each value of status.
-- Your answer:




-- Q3. Count how many leads came from each lead_utm_source, ordered by count descending.
-- Your answer:




-- Q4. Find the number of leads assigned to each assign_to (salesperson id), excluding unassigned (assign_to = 0).
-- Your answer:




-- Q5. Using crm_lead_request_call_log, find the count of calls grouped by call_status,
-- Your answer:


--     and show only the call_status values that occurred more than 3 times (HAVING).


-- Q6. From crm_ai_agent_logs, find the average duration_ms and average total_tokens per agent.
-- Your answer:




-- Q7. From crm_ai_agent_logs, find the total input_tokens and total output_tokens used per model.
-- Your answer:




-- Q8. Find the earliest (MIN) and latest (MAX) add_date in crm_lead_request.
-- Your answer:




-- Q9. Find which lead_utm_source has the highest number of leads (single row result).
-- Your answer:




-- Q10. From crm_lead_request_call_log, count the number of calls logged per lead_id,
-- Your answer:


--      and list only leads that have been called more than once.
