-- TOPIC 8: Set Operations
-- Tables used: crm_lead_request, crm_user_registration
-- Covers: UNION, UNION ALL

-- Q1. Create a combined contact list showing name + email_id from
-- Your answer:
SELECT a.name, a.email_id 
FROM crm_lead_request a 
UNION 
SELECT b.user_name, b.user_email 
FROM crm_user_registration b;

--     crm_lead_request UNION user_name + user_email from crm_user_registration.


-- Q2. Same as Q1 but using UNION ALL — explain (in a comment) why the row
-- Your answer:
SELECT a.name, a.email_id 
FROM crm_lead_request a 
UNION ALL
SELECT b.user_name, b.user_email 
FROM crm_user_registration b;

-- With the current (trimmed) data, UNION and UNION ALL both return 6 rows (5 leads + 1 user),
-- because there happen to be no duplicate (name, email_id) pairs across the two tables.
-- In general UNION ALL keeps every row including duplicates, while UNION runs an extra
-- dedup pass over the combined result, so UNION ALL's count would be >= UNION's count
-- whenever duplicate rows actually exist.
--     count differs (or doesn't) from Q1.


-- Q3. List all distinct lead_utm_source values that appear in crm_lead_request
-- Your answer:
SELECT DISTINCT lead_utm_source 
FROM `crm_lead_request`

UNION

SELECT DISTINCT call_status
FROM `crm_lead_request_call_log`;

--     UNION all distinct call_status values from crm_lead_request_call_log
--     (single combined column of "labels").


-- Q4. Find lead ids that exist in crm_lead_request_call_log but produce the
-- Your answer:
SELECT id
FROM crm_lead_request
INTERSECT
SELECT lead_id
FROM crm_lead_request_call_log
ORDER BY 1;

-- EXISTS-based equivalent (Topic 4 Q1 style):
SELECT id
FROM crm_lead_request a
WHERE EXISTS (
    SELECT 1
    FROM crm_lead_request_call_log b
    WHERE b.lead_id = a.id
)
ORDER BY 1;

-- Both return the same 3 ids (3, 4, 5) — INTERSECT keeps only rows present in
-- both sides, while EXISTS keeps rows from crm_lead_request for which a
-- matching lead_id is found in crm_lead_request_call_log. Same result, two ways.
--     same result as an equivalent EXISTS-based query from Topic 4 Q1 — write
--     both versions and compare.
