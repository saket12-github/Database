-- TOPIC 6: Window Functions
-- Tables used: crm_lead_request, crm_lead_request_call_log, crm_ai_agent_logs
-- Covers: ROW_NUMBER, RANK, DENSE_RANK, PARTITION BY, LAG/LEAD, running totals

-- Q1. Assign a row number to each lead ordered by add_date ascending
--     (ROW_NUMBER() OVER (ORDER BY add_date)).

-- Q2. For each lead_utm_source, rank the leads by add_date (earliest = rank 1)
--     using RANK() OVER (PARTITION BY lead_utm_source ORDER BY add_date).

-- Q3. For each assign_to (salesperson), find the most recently added lead only
--     (hint: ROW_NUMBER() PARTITION BY assign_to ORDER BY add_date DESC, then
--     filter row number = 1).

-- Q4. From crm_lead_request_call_log, for each lead_id show the previous
--     call_status using LAG() ordered by add_date.

-- Q5. From crm_ai_agent_logs, compute a running total of total_tokens ordered
--     by created_at (SUM(total_tokens) OVER (ORDER BY created_at)).

-- Q6. For each lead_utm_source, show each lead alongside the count of leads
--     in that same source (COUNT(*) OVER (PARTITION BY lead_utm_source)).

-- Q7. From crm_ai_agent_logs, find the 2nd highest duration_ms per agent
--     using DENSE_RANK().
