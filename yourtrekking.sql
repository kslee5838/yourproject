DROP TABLE yourtrekking CASCADE;

CREATE TABLE yourtrekking (
id SERIAL,
모임종류 varchar(128),
모임종류_id INTEGER,
장소 VARCHAR(128),
동행1 varchar(128),
동행2 VARCHAR(128),
동행3 VARCHAR(128),
언제어디서 VARCHAR(128),
언제어디서_id INTEGER,
요일 VARCHAR(128),
PRIMARY KEY(id)
);

INSERT INTO yourtrekking (모임종류,장소,동행1,동행2,동행3,언제어디서,요일) 
VALUES 
  ('좋은사람들', '금원산','-', '정재순', '-', '2023-06-17','일요일'),
  ('좋은사람들', '설악산,'-','혼자','-','2023-06-06','화요일');

DROP TABLE 모임종류;
DROP TABLE 직업;
DROP TABLE 언제어디서;
DROP TABLE 기간;

CREATE TABLE 모임종류
(id SERIAL,
모임종류 VARCHAR(128),
PRIMARY KEY(id)
);

CREATE TABLE 직업
(id SERIAL,
직업 VARCHAR(128),
PRIMARY KEY(id)
);
