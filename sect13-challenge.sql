CREATE TABLE students (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50)
);

CREATE TABLE papers (
	title VARCHAR(100),
    grade VARCHAR(50),
    student_id INT,
	FOREIGN KEY(student_id) REFERENCES students(id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade)
VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT first_name, title, grade
FROM papers
JOIN students
	WHERE papers.student_id = students.id
ORDER BY grade DESC;

SELECT first_name, title, grade
FROM papers
RIGHT JOIN students
	ON papers.student_id = students.id;
    
SELECT 
	first_name,
	IFNULL(title, 'MISSING') AS title,
    IFNULL(grade, 0) AS grade
FROM papers
RIGHT JOIN students
	ON papers.student_id = students.id;
    
SELECT first_name, AVG(grade) AS average
FROM papers 
RIGHT JOIN students
	ON papers.student_id = students.id
GROUP BY students.first_name
ORDER BY average DESC;

SELECT first_name, IFNULL(AVG(grade), 0) AS average,
CASE
		WHEN AVG(grade) > 75 THEN 'passing'
        ELSE 'failing'
    END AS passing_status
FROM papers 
RIGHT JOIN students
	ON papers.student_id = students.id
GROUP BY students.first_name
ORDER BY average DESC;
