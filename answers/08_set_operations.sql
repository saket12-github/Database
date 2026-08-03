-- TOPIC 8: Set Operations
-- Tables used: crm_lead_request, crm_user_registration
-- Covers: UNION, UNION ALL

-- Q1. Create a combined contact list showing name + email_id from
-- Your answer:


--     crm_lead_request UNION user_name + user_email from crm_user_registration.


-- Q2. Same as Q1 but using UNION ALL — explain (in a comment) why the row
-- Your answer:


--     count differs (or doesn't) from Q1.


-- Q3. List all distinct lead_utm_source values that appear in crm_lead_request
-- Your answer:


--     UNION all distinct call_status values from crm_lead_request_call_log
--     (single combined column of "labels").


-- Q4. Find lead ids that exist in crm_lead_request_call_log but produce the
-- Your answer:


--     same result as an equivalent EXISTS-based query from Topic 4 Q1 — write
--     both versions and compare.
