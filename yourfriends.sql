DROP TABLE yourfriends CASCADE;

CREATE TABLE yourfriends (
id SERIAL,
모임종류 VARCHAR(128),
모임종류_id INTEGER,
이름 VARCHAR(128),
직업 VARCHAR(128),
직업_id INTEGER,
언제어디서 VARCHAR(128),
언제어디서_id INTEGER,
기간 INTEGER,
기간_id INTEGER,
PRIMARY KEY(id)
);

INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) 
VALUES
('친구', '전우평', '사업', '초등', '30'),
('친구', '정재윤', '건축사', '초등', '30'),
('직장', '박은영', '뱅커', '회사', '7'),
('직장', '정재순', '뱅커', '회사', '15'),
('리스크', '김현영', '뱅커', '회사', '20'),
('리스크', '차봉수', '뱅커', '회사', '20'),
('RRM', '김재삼', '뱅커', '회사', '10'),
('RRM', '김진기', '뱅커', '회사', '10'),
('직장', '박재순', '뱅커', '회사', '3'),
('직장', '김성은', '뱅커', '회사', '5'),
('HIMB', '한무현', '뱅커', '회사', '28'),
('HIMB', '이관식', '뱅커', '회사', '28')
;

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
CREATE TABLE 언제어디서
(id SERIAL,
언제어디서 VARCHAR(128),
PRIMARY KEY(id)
);
CREATE TABLE 기간
(id SERIAL,
기간 INTEGER,
PRIMARY KEY(id)
);

INSERT INTO 모임종류 (모임종류) SELECT DISTINCT 모임종류 FROM yourfriends;
INSERT INTO 직업(직업) SELECT DISTINCT 직업 FROM yourfriends;
INSERT INTO 언제어디서 (언제어디서) SELECT DISTINCT 언제어디서 FROM yourfriends;
INSERT INTO 기간 (기간) SELECT DISTINCT 기간 FROM yourfriends;

CREATE TABLE xy_raw(x TEXT, y TEXT, y_id INTEGER);
CREATE TABLE y (id SERIAL, PRIMARY KEY(id), y TEXT);
CREATE TABLE xy(id SERIAL, PRIMARY KEY(id), x TEXT, y_id INTEGER, UNIQUE(x,y_id));
INSERT INTO y (y) SELECT DISTINCT y FROM xy_raw;

UPDATE xy_raw SET y_id = (SELECT y.id FROM y WHERE y.y = xy_raw.y);
