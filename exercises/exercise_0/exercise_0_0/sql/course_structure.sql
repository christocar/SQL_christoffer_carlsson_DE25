-- CREATE TABLE FOR COURSE CONTENT

CREATE TABLE IF NOT EXISTS course_content (
    content TEXT PRIMARY KEY,
    week INT,
    content_type TEXT
);

-- INSERT SAMPLE DATA INTO COURSE CONTENT TABLE

INSERT INTO course_content (content, week, content_type) VALUES
('00_intro', 46, 'lecture'),
('01_course_structure', 46, 'lecture'),
('02_setup_duckdb', 46, 'lecture'),
('exercise_0', 46, 'exercise'),
('exercise_1', 47, 'exercise'),
('guest_lecture', 48, 'lecture'),
('project_presentation', 49, 'lecture'),
('exercise_2', 49, 'exercise'),
('tenta', 51, 'exam')
ON CONFLICT DO NOTHING;

-- Task A QUERY TO SELECT ALL EXERCISES FROM THE COURSE CONTENT TABLE
SELECT * FROM course_content WHERE content_type = 'exercise';

-- Task B All lectures
SELECT * FROM course_content WHERE content_type = 'lecture';

-- Task C All records for week 48
SELECT * FROM course_content WHERE week = 48;

-- Task D All records for weeks 47-49
SELECT * FROM course_content WHERE week BETWEEN 47 AND 49;

-- Task E number of lectures
SELECT COUNT(*) AS number_of_lectures 
FROM course_content 
WHERE content_type = 'lecture';

-- Task F number of other content
SELECT COUNT(*) AS number_of_non_lectures
FROM course_content 
WHERE content_type <> 'lecture';

-- Task G Unique content types
SELECT DISTINCT content_type
FROM course_content;

-- Task H Delete and reinsert 02_setup_duckdb
DELETE FROM course_content 
WHERE content = '02_setup_duckdb';

INSERT INTO course_content (content, week, content_type) VALUES
('02_setup_duckdb', 46, 'lecture');

-- Task I sort week ascending
SELECT * 
FROM course_content
ORDER BY week ASC;

-- Task J Example exploration
SELECT week, COUNT(*) AS items_this_week
FROM course_content
GROUP BY week
ORDER BY week;