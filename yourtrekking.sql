DROP TABLE yourtrekking CASCADE;

CREATE TABLE yourtrekking (
id SERIAL,
언제어디서 VARCHAR(128),
언제어디서_id INTEGER,
요일 VARCHAR(128),
모임종류 varchar(128),
모임종류_id INTEGER,
장소 VARCHAR(128),
동행1 varchar(128),
동행2 VARCHAR(128),
동행3 VARCHAR(128),

PRIMARY KEY(id)
);

INSERT INTO yourtrekking (언제어디서,요일,모임종류,장소,동행1,동행2,동행3) 
VALUES 
  ('2023-06-17','금,토요일','좋은사람들', '금원산','-', '정재순', '-' ),
  ('2023-06-06','화요일','동서울터미널', '설악산','-','혼자','-'),
  ('2023-05-26','금, 비왔음','불광역', '북한산,족두리봉','-','혼자','-'),
  ('2023-05-20','토,일요일','좋은사람들', '설악산','-','정재순','-'),
  ('2023-07-19','수,목,금','좋은사람들','일본, 후지산,'동료들','정민호','the Sacred Place')
  ;

