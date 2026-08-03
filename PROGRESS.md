# Progress Tracker

Tick a box once you've written an answer in the matching `answers/*.sql` file.
When you ask Claude to check a batch, it will mark them ✅ (correct) or 🔁 (needs another look) instead of just a checkmark.

## Topic 1 — Basics & Filtering (`01_basics_filtering.sql`)
- [x] Q1 ✅
- [x] Q2 ✅
- [x] Q3 ✅
- [x] Q4 ✅ (works, but see note on BETWEEN + datetime in review feedback)
- [x] Q5 ✅
- [x] Q6 ✅ (works, but see note on collation/case-sensitivity)
- [x] Q7 ✅
- [x] Q8 ✅
- [x] Q9 ✅
- [x] Q10 ✅

## Topic 2 — Aggregation & Grouping (`02_aggregation_grouping.sql`)
- [x] Q1 ✅
- [x] Q2 ✅
- [x] Q3 ✅ (works, but see note on COUNT(col) vs COUNT(*) with NULLs in review feedback)
- [x] Q4 ✅
- [x] Q5 ✅
- [x] Q6 ✅
- [x] Q7 ✅
- [x] Q8 ✅
- [x] Q9 ✅ (works, but see note on COUNT(col) vs COUNT(*) with NULLs)
- [x] Q10 ✅

## Topic 3 — Joins (`03_joins.sql`)
- [x] Q1 ✅
- [x] Q2 ✅
- [x] Q3 ✅
- [ ] Q4
- [x] Q5 ✅
- [ ] Q6 🔁 (incorrect — doesn't join crm_lead_vision, see review feedback)
- [ ] Q7
- [ ] Q8

## Topic 4 — Subqueries (`04_subqueries.sql`)
- [ ] Q1
- [ ] Q2
- [ ] Q3
- [ ] Q4
- [ ] Q5
- [ ] Q6
- [ ] Q7
- [ ] Q8

## Topic 5 — String & Date Functions (`05_string_date_functions.sql`)
- [ ] Q1
- [ ] Q2
- [ ] Q3
- [ ] Q4
- [ ] Q5
- [ ] Q6
- [ ] Q7
- [ ] Q8
- [ ] Q9

## Topic 6 — Window Functions (`06_window_functions.sql`)
- [ ] Q1
- [ ] Q2
- [ ] Q3
- [ ] Q4
- [ ] Q5
- [ ] Q6
- [ ] Q7

## Topic 7 — CASE & Conditional Logic (`07_case_conditional.sql`)
- [ ] Q1
- [ ] Q2
- [ ] Q3
- [ ] Q4
- [ ] Q5
- [ ] Q6

## Topic 8 — Set Operations (`08_set_operations.sql`)
- [ ] Q1
- [ ] Q2
- [ ] Q3
- [ ] Q4

## Topic 9 — DDL & DML Practice (`09_ddl_dml_practice.sql`)
- [ ] Q1
- [ ] Q2
- [ ] Q3
- [ ] Q4
- [ ] Q5
- [ ] Q6
- [ ] Q7

---
**Total: 72 questions across 9 topics.**

Suggested pace: do 10–15, then say *"check my answers up to Topic X Q_"* — Claude will run them
against `salestest`, mark this file, and give feedback.
