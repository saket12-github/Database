-- TOPIC 9: DDL & DML Practice
-- IMPORTANT: Do NOT modify existing crm_* tables. Create your own scratch
-- table(s) for this section so the real data stays untouched.

-- Q1. Create a table `practice_students` with columns:
-- Your answer:
CREATE TABLE practice_students(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
score INT NOT NULL,
joined_on DATE)

--     id (INT, PK, auto_increment), name (VARCHAR 100), score (INT), joined_on (DATE).


-- Q2. Insert 5 sample rows into practice_students.
-- Your answer:
INSERT INTO practice_students(id, name, score, joined_on)
VALUES
(1, 'Alice', 95, CURRENT_DATE()),
(2, 'Bob', 80, DATE_SUB(CURRENT_DATE(), INTERVAL 10 DAY)),
(3, 'Claire', 0, CURRENT_DATE()),
(4, 'Daisy', 0, '2026-08-01'),
(5, 'Elephant', 79, DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY));



-- Q3. Update the score of one student by name.
-- Your answer:
UPDATE practice_students
SET score=25
WHERE name='Daisy'


-- Q4. Delete one row from practice_students by id.
-- Your answer:
DELETE FROM practice_students
WHERE id=4


-- Q5. Add a new column `email` (VARCHAR 150) to practice_students using ALTER TABLE.
-- Your answer:
ALTER TABLE practice_students
ADD COLUMN email VARCHAR(150) NULL AFTER name



-- Q6. Create an index on the `name` column of practice_students.
-- Your answer:
CREATE INDEX idx_name ON practice_students(name)


-- Q7. Drop the practice_students table when you're done (cleanup).
-- Your answer:
DROP TABLE practice_students;

