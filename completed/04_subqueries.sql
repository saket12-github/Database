-- TOPIC 4: Subqueries
-- Tables used: crm_lead_request, crm_lead_request_call_log, crm_lead_notes, crm_ai_agent_logs
-- Covers: scalar subquery, IN, EXISTS, NOT EXISTS, correlated subquery

-- Q1. Find all leads whose id appears in crm_lead_request_call_log (use IN subquery).
-- Your answer:
SELECT *
FROM crm_lead_request
WHERE id IN (
SELECT DISTINCT lead_id
FROM crm_lead_request_call_log
)

-- Q2. Find all leads who have NEVER been called (id NOT IN crm_lead_request_call_log,
-- Your answer:
SELECT *
FROM crm_lead_request
WHERE id NOT IN (
SELECT lead_id
FROM crm_lead_request_call_log
)
--     handle NULLs carefully).


-- Q3. Find all leads that have at least one note, using EXISTS with crm_lead_notes.
-- Your answer:
SELECT *
FROM crm_lead_request lr
WHERE EXISTS (
    SELECT 1
    FROM crm_lead_notes n
    WHERE n.lead_id = lr.id
)



-- Q4. Find all leads that have no conversation messages at all, using NOT EXISTS
-- Your answer:
SELECT *
FROM crm_lead_request lr
WHERE NOT EXISTS (
    SELECT 1
    FROM crm_lead_conversations n
    WHERE n.lead_id = lr.id
)

--     with crm_lead_conversations.


-- Q5. Find the lead(s) with the most recent add_date, using a subquery
-- Your answer:
SELECT *
FROM crm_lead_request
WHERE add_date = (
    SELECT MAX(add_date)
    FROM crm_lead_request
    )

--     (WHERE add_date = (SELECT MAX(add_date) ...)).


-- Q6. For each lead, show name and the number of calls logged for them using a
-- Your answer:
SELECT
    lr.id,
    lr.name,
    (SELECT COUNT(*) FROM crm_lead_request_call_log AS b WHERE lr.id=b.lead_id) AS call_count 
FROM crm_lead_request lr

--     correlated subquery in the SELECT list (instead of a JOIN + GROUP BY).


-- Q7. From crm_ai_agent_logs, find all rows where duration_ms is greater than
-- Your answer:
SELECT id, request_id, lead_id
FROM `crm_ai_agent_logs` 
WHERE duration_ms > (
    SELECT AVG(duration_ms)
    FROM crm_ai_agent_logs
	)

--     the average duration_ms across all rows.


-- Q8. Find leads whose status is 'converted' and who also have a row in
-- Your answer:
SELECT * 
FROM `crm_lead_request` lr
WHERE lr.status = 'converted' AND lr.id IN (
    SELECT lead_id FROM crm_lead_vision
)


--     crm_lead_vision (use IN with a subquery on lead_id).
