
------------------------------------------------------ The following database and tables just to test my query-----------------------------------------------------------------

DROP DATABASE Students_Ranking;
GO



CREATE DATABASE Students_Ranking;
GO

USE Students_Ranking;
GO

CREATE TABLE colleges (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    collegeId INTEGER,
    FOREIGN KEY (collegeId) REFERENCES colleges(id)
);

CREATE TABLE rankings (
    studentId INTEGER,
    ranking INTEGER NOT NULL,
    year INTEGER NOT NULL,
    FOREIGN KEY (studentId) REFERENCES students(id)
);

INSERT INTO colleges (id, name) VALUES 
(1, 'GUC'),
(2, 'BUE'),
(3, 'AUC'),
(4, 'TEST');


INSERT INTO students (id, name, collegeId) VALUES 
(1, 'Seif', 1),
(2, 'Yousef', 1),
(3, 'Ahmad', 2),
(4, 'Rasheed', 2),
(5, 'Mostafa', 3),
(6, 'Sawy', 3),
(7, 'Test', 4);

INSERT INTO rankings (studentId, ranking, year) VALUES 
(1, 1, 2015),
(2, 4, 2015),
(3, 2, 2015),
(4, 3, 2015),
(5, 5, 2015),
(6, 1, 2015),
(7, 1, 2020);

----------------------------------------------------------------- The query is below -------------------------------------------------------------------------------

/*
  Query to list all colleges with at least one student ranking between 1 and 3 for the year 2015.
  The result includes:
  - College name
  - The rank of their best ranking student for 2015.
  - Number of students with ranking between 1 and 3 (both inclusive) for year 2015
*/

SELECT  c.name AS college_name,
        MIN(r.ranking) AS best_ranking,
        COUNT(r.ranking) AS num_students
FROM 
    colleges c INNER JOIN students s ON c.id = s.collegeId 
    INNER JOIN rankings r ON s.id = r.studentId
WHERE
    r.year = 2015 AND r.ranking BETWEEN 1 AND 3
GROUP BY 
    c.name
HAVING 
    COUNT(r.ranking) > 0;
