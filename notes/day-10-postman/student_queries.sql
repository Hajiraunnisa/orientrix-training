CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);
CREATE TABLE marks (
    id INTEGER PRIMARY KEY,
    student_id INTEGER,
    subject_id INTEGER,
    score INTEGER,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);
INSERT INTO students (id, name) VALUES
(1, 'Aisha'),
(2, 'Rahul'),
(3, 'Meera'),
(4, 'John'),
(5, 'Fatima'),
(6, 'Arjun'),
(7, 'Sara'),
(8, 'Kiran');
INSERT INTO subjects (id, name) VALUES
(1, 'Math'),
(2, 'Science'),
(3, 'English'),
(4, 'History');

INSERT INTO marks (student_id, subject_id, score) VALUES
(1, 1, 88),   -- Aisha - Math
(1, 2, 92),   -- Aisha - Science
(1, 3, 75),   -- Aisha - English
(2, 1, 65),   -- Rahul - Math
(2, 2, 70),   -- Rahul - Science
(2, 4, 80),   -- Rahul - History
(3, 1, 95),   -- Meera - Math
(3, 3, 85),   -- Meera - English
(4, 2, 60),   -- John - Science
(4, 3, 55),   -- John - English
(4, 4, 70),   -- John - History
(5, 1, 78),   -- Fatima - Math
(5, 2, 82),   -- Fatima - Science
(6, 1, 90),   -- Arjun - Math
(6, 3, 88),   -- Arjun - English
(6, 4, 92),   -- Arjun - History
(7, 2, 68),   -- Sara - Science
(7, 4, 74),   -- Sara - History
(8, 1, 55),   -- Kiran - Math
(8, 3, 60);   -- Kiran - English

-- Query 1: Show every mark with the student's name and the subject's name.
SELECT s.name AS student, sub.name AS subject, m.score
FROM marks m
JOIN students s ON m.student_id = s.id
JOIN subjects sub ON m.subject_id = sub.id;

-- Query 2: Show all students and their marks, including students with no marks at all.
SELECT s.name AS student, m.subject_id, m.score
FROM students s
LEFT JOIN marks m ON s.id = m.student_id;

-- Query 3: Show students who scored more than 80 in Math.
SELECT s.name AS student, m.score
FROM marks m
JOIN students s ON m.student_id = s.id
JOIN subjects sub ON m.subject_id = sub.id
WHERE sub.name = 'Math' AND m.score > 80;

-- Query 4: Show the average score per subject.
SELECT sub.name AS subject, AVG(m.score) AS avg_score
FROM marks m
JOIN subjects sub ON m.subject_id = sub.id
GROUP BY sub.id, sub.name;

-- Query 5: Show the total marks per student, sorted highest first.
SELECT s.name AS student, SUM(m.score) AS total
FROM marks m
JOIN students s ON m.student_id = s.id
GROUP BY s.id, s.name
ORDER BY total DESC;

-- Query 6: Show subjects where the average score is above 75.
SELECT sub.name AS subject, AVG(m.score) AS avg_score
FROM marks m
JOIN subjects sub ON m.subject_id = sub.id
GROUP BY sub.id, sub.name
HAVING AVG(m.score) > 75;

-- Query 7: Show the highest score in each subject.
SELECT sub.name AS subject, MAX(m.score) AS top_score
FROM marks m
JOIN subjects sub ON m.subject_id = sub.id
GROUP BY sub.id, sub.name;

--Query 8: Show the top scorer per subject, with student name.
SELECT sub.name AS subject, s.name AS student, m.score
FROM marks m
JOIN students s ON m.student_id = s.id
JOIN subjects sub ON m.subject_id = sub.id
WHERE m.score = (
    SELECT MAX(m2.score)
    FROM marks m2
    WHERE m2.subject_id = m.subject_id
);

-- Query 9: Show the lowest scorer per subject, with student name.
SELECT sub.name AS subject, s.name AS student, m.score
FROM marks m
JOIN students s ON m.student_id = s.id
JOIN subjects sub ON m.subject_id = sub.id
WHERE m.score = (
    SELECT MIN(m2.score)
    FROM marks m2
    WHERE m2.subject_id = m.subject_id
);

-- Query 10: Show students who have no marks in History.
SELECT s.name AS student
FROM students s
LEFT JOIN marks m ON s.id = m.student_id
    AND m.subject_id = (SELECT id FROM subjects WHERE name = 'History')
WHERE m.id IS NULL;

-- Query 11: Count how many marks each student has.
SELECT student_id, COUNT(*) AS total_marks
FROM marks
GROUP BY student_id;

-- Query 12 : Show each subject and its highest and lowest score.
SELECT sub.name AS subject,
       MAX(m.score) AS highest,
       MIN(m.score) AS lowest
FROM marks m
JOIN subjects sub ON m.subject_id = sub.id
GROUP BY sub.id, sub.name;

-- Query 13: Show students whose total marks exceed 200.
SELECT student_id, SUM(score) AS total
FROM marks
GROUP BY student_id
HAVING SUM(score) > 200;

-- Query 14: Show the student with the highest single score overall.
SELECT s.name, m.score
FROM marks m
JOIN students s ON m.student_id = s.id
ORDER BY m.score DESC
LIMIT 1;

-- Query 15 (replacement): Show the number of distinct students who took each subject.
SELECT sub.name AS subject,
       COUNT(DISTINCT m.student_id) AS num_students
FROM marks m
JOIN subjects sub ON m.subject_id = sub.id
GROUP BY sub.id, sub.name;