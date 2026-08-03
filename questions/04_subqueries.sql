-- TOPIC 4: Subqueries
-- Tables used: crm_lead_request, crm_lead_request_call_log, crm_lead_notes, crm_ai_agent_logs
-- Covers: scalar subquery, IN, EXISTS, NOT EXISTS, correlated subquery

-- Q1. Find all leads whose id appears in crm_lead_request_call_log (use IN subquery).

-- Q2. Find all leads who have NEVER been called (id NOT IN crm_lead_request_call_log,
--     handle NULLs carefully).

-- Q3. Find all leads that have at least one note, using EXISTS with crm_lead_notes.

-- Q4. Find all leads that have no conversation messages at all, using NOT EXISTS
--     with crm_lead_conversations.

-- Q5. Find the lead(s) with the most recent add_date, using a subquery
--     (WHERE add_date = (SELECT MAX(add_date) ...)).

-- Q6. For each lead, show name and the number of calls logged for them using a
--     correlated subquery in the SELECT list (instead of a JOIN + GROUP BY).

-- Q7. From crm_ai_agent_logs, find all rows where duration_ms is greater than
--     the average duration_ms across all rows.

-- Q8. Find leads whose status is 'converted' and who also have a row in
--     crm_lead_vision (use IN with a subquery on lead_id).
