# SQL Practice — salestest

Practice questions built from the real `salestest` MySQL database (a CRM/lead-management schema).

## Structure

```
questions/   -- one .sql file per topic, questions only (don't edit these)
answers/     -- matching file per topic, write your query under each "-- Your answer:" line
```

Topics (roughly increasing difficulty):

1. `01_basics_filtering.sql` — SELECT, WHERE, ORDER BY, LIMIT, LIKE, IN, BETWEEN, IS NULL
2. `02_aggregation_grouping.sql` — COUNT/SUM/AVG/MIN/MAX, GROUP BY, HAVING
3. `03_joins.sql` — INNER/LEFT JOIN across lead tables
4. `04_subqueries.sql` — scalar, IN, EXISTS/NOT EXISTS, correlated
5. `05_string_date_functions.sql` — string + date functions
6. `06_window_functions.sql` — ROW_NUMBER, RANK, PARTITION BY, LAG, running totals
7. `07_case_conditional.sql` — CASE, IFNULL/COALESCE
8. `08_set_operations.sql` — UNION / UNION ALL
9. `09_ddl_dml_practice.sql` — CREATE/ALTER/INSERT/UPDATE/DELETE (on your own scratch table)

## How to work

1. Open a file in `answers/`, write your query under the matching `-- Your answer:` line.
2. Run it against the DB to sanity-check yourself:
   ```
   mysql -u root -p salestest < answers/01_basics_filtering.sql
   ```
   (or just run individual queries in a MySQL client / VS Code SQL extension connected to `salestest`)
3. Commit your progress with git as you go, e.g.:
   ```
   git add answers/01_basics_filtering.sql
   git commit -m "Attempt topic 1: basics & filtering"
   ```
4. When you want a check, ask Claude: *"Check my answers in answers/01_basics_filtering.sql"* —
   it will run each query against `salestest`, verify the logic/result against the question, and
   give feedback (without just handing you the model answer first).

## Key tables & relationships used across these questions

- `crm_lead_request` — the leads themselves (id, name, email_id, mobileno, status, lead_utm_source, add_date, assign_to, ...)
- `crm_lead_request_call_log` — call attempts, `lead_id` → `crm_lead_request.id`
- `crm_lead_update_log` — status/assignment history, `lead_id` → `crm_lead_request.id`
- `crm_lead_notes` — free-text notes, `lead_id` → `crm_lead_request.id`
- `crm_lead_conversations` — chat messages, `lead_id` → `crm_lead_request.id`
- `crm_lead_vision` — Q&A pairs per lead, `lead_id` → `crm_lead_request.id`
- `crm_ai_agent_logs` — AI agent call logs (tokens, duration, status), optionally linked via `lead_id`
- `crm_user_registration` — internal CRM users

## Connecting

Local MySQL, database `salestest`. Use your own MySQL client of choice (CLI, VS Code MySQL/SQL
extension, DBeaver, etc.) pointed at `localhost`, schema `salestest`.
