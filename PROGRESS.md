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
- [ ] Q6 (blank — previous attempt was incorrect, needs rework)
- [x] Q7 ✅
- [x] Q8 ✅

## Topic 4 — Subqueries (`04_subqueries.sql`)
- [x] Q1 ✅
- [x] Q2 ✅
- [x] Q3 ✅
- [x] Q4 ✅
- [x] Q5 ✅
- [x] Q6 ✅ (correlated subquery count matches JOIN+GROUP BY exactly)
- [x] Q7 ✅
- [x] Q8 ✅ (works, but see note on unneeded correlation inside the IN subquery)

## Topic 5 — String & Date Functions (`05_string_date_functions.sql`)
- [x] Q1 ✅
- [x] Q2 ✅
- [x] Q3 ✅
- [x] Q4 ✅
- [x] Q5 ✅
- [x] Q6 ✅ (works, but hint suggested MONTH()/YEAR(); MONTHNAME() was tried first and also works)
- [x] Q7 ✅
- [x] Q8 ✅
- [x] Q9 ✅

## Topic 6 — Window Functions (`06_window_functions.sql`)
- [ ] Q1
- [ ] Q2
- [ ] Q3
- [ ] Q4
- [ ] Q5
- [ ] Q6
- [ ] Q7

## Topic 7 — CASE & Conditional Logic (`07_case_conditional.sql`)
- [x] Q1 ✅
- [x] Q2 ✅ (works — note: a few rows have lead_utm_source = '' (empty string) not NULL, so IFNULL correctly leaves them blank rather than 'Unknown'; that's the literal question's spec, but watch for empty-string vs NULL distinction)
- [x] Q3 ✅
- [x] Q4 ✅ (correctly handles the edge case status='error' AND http_status=200 → 'Check')
- [ ] Q5
- [ ] Q6

## Topic 8 — Set Operations (`08_set_operations.sql`)
- [x] Q1 ✅
- [x] Q2 ✅
- [x] Q3 ✅
- [x] Q4 ✅

## Topic 9 — DDL & DML Practice (`09_ddl_dml_practice.sql`)
- [x] Q1 ✅
- [x] Q2 ✅
- [x] Q3 ✅
- [x] Q4 ✅
- [x] Q5 ✅ (fixed table name typo — ALTER TABLE referenced `practice_students` while Q1 had created `practise_students`; renamed table to `practice_students` throughout for consistency)
- [x] Q6 ✅
- [x] Q7 ✅

---
**Total: 72 questions across 9 topics.**

Suggested pace: do 10–15, then say *"check my answers up to Topic X Q_"* — Claude will run them
against `salestest`, mark this file, and give feedback.
