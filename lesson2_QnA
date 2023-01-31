# pg4e.com, Lesson2, Entering Many-to-One Data - Automobiles
DROP TABLE make;
DROP TABLE model;

CREATE TABLE make (
    id SERIAL,
    name VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE model (
  id SERIAL,
  name VARCHAR(128),
  make_id INTEGER REFERENCES make(id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);

INSERT INTO make(name) VALUES ('Mercedez-Benze');

INSERT INTO model(name,make_id) VALUES ('CLK55AMG','1');
INSERT INTO model(name,make_id) VALUES ('CLK55AMG(Cabriolet)','1');
INSERT INTO model(name,make_id) VALUES ('CLK550','1');
INSERT INTO model(name,make_id) VALUES ('E63 AMG S 4matic (wagon)','1');
INSERT INTO model(name,make_id) VALUES ('G500','1');

SELECT make.name, model.name
    FROM model
    JOIN make ON model.make_id = make.id
    ORDER BY make.name LIMIT 5;

#display below

#Question 2 answer
CREATE TABLE student (
    id SERIAL,
    name VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

DROP TABLE course CASCADE;
CREATE TABLE course (
    id SERIAL,
    title VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

DROP TABLE roster CASCADE;
CREATE TABLE roster (
    id SERIAL,
    student_id INTEGER REFERENCES student(id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES course(id) ON DELETE CASCADE,
    role INTEGER,
    UNIQUE(student_id, course_id),
    PRIMARY KEY (id)
);

INSERT INTO student(name) VALUES ('Eubh');
INSERT INTO student(name) VALUES ('Courtney');
INSERT INTO student(name) VALUES ('Ifra');
INSERT INTO student(name) VALUES ('Misha');
INSERT INTO student(name) VALUES ('Stewart');
INSERT INTO student(name) VALUES ('Abaigeal');
INSERT INTO student(name) VALUES ('Carra');
INSERT INTO student(name) VALUES ('Kaine');
INSERT INTO student(name) VALUES ('Kelso');
INSERT INTO student(name) VALUES ('Missy');
INSERT INTO student(name) VALUES ('Sabah');
INSERT INTO student(name) VALUES ('Bendeguz');
INSERT INTO student(name) VALUES ('Mahdiya');
INSERT INTO student(name) VALUES ('Rhett');
INSERT INTO student(name) VALUES ('Seb');

INSERT INTO course(title) VALUES ('si106');
INSERT INTO course(title) VALUES ('si110');
INSERT INTO course(title) VALUES ('si206');

INSERT INTO roster(role,student_id,course_id) VALUES ('0','1','1');
INSERT INTO roster(role,student_id,course_id) VALUES ('1','2','1');
INSERT INTO roster(role,student_id,course_id) VALUES ('1','3','1');
INSERT INTO roster(role,student_id,course_id) VALUES ('1','4','1');
INSERT INTO roster(role,student_id,course_id) VALUES ('1','5','1');
INSERT INTO roster(role,student_id,course_id) VALUES ('0','6','2');
INSERT INTO roster(role,student_id,course_id) VALUES ('1','7','2');
INSERT INTO roster(role,student_id,course_id) VALUES ('1','8','2');
INSERT INTO roster(role,student_id,course_id) VALUES ('1','9','2');
INSERT INTO roster(role,student_id,course_id) VALUES ('1','10','2');
INSERT INTO roster(role,student_id,course_id) VALUES ('0','11','3');
INSERT INTO roster(role,student_id,course_id) VALUES ('1','12','3');
INSERT INTO roster(role,student_id,course_id) VALUES ('1','13','3');
INSERT INTO roster(role,student_id,course_id) VALUES ('1','14','3');
INSERT INTO roster(role,student_id,course_id) VALUES ('1','15','3');

SELECT student.name, course.title, roster.role
    FROM student 
    JOIN roster ON student.id = roster.student_id
    JOIN course ON roster.course_id = course.id
    ORDER BY course.title, roster.role ASC, student.name;


