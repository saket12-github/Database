-- TOPIC 7: CASE Expressions & NULL Handling
-- Tables used: crm_lead_request, crm_ai_agent_logs
-- Covers: CASE WHEN, IFNULL/COALESCE, IF()

-- Q1. Show each lead's name and a new column "priority" that shows 'High' if
--     status = 'converted', 'Medium' if status = 'customer replied' or
--     'reply sent to customer', otherwise 'Low'.

-- Q2. Show each lead's lead_utm_source, replacing any NULL value with the
--     text 'Unknown' (COALESCE or IFNULL).

-- Q3. Show each lead's name and a column "is_assigned" that displays 'Yes' if
--     assign_to <> 0, otherwise 'No' (use IF() or CASE).

-- Q4. From crm_ai_agent_logs, show request_id and a column "outcome" that
--     shows 'OK' if status = 'success' and http_status = 200, else 'Check'.

-- Q5. Count how many leads fall into each of the priority buckets defined in
--     Q1 (combine CASE with GROUP BY).

-- Q6. Show each lead's call_status from crm_lead_request, replacing empty
--     string '' with 'Not Contacted'.
