DROP TABLE yourfriends CASCADE;

CREATE TABLE yourfriends (
id SERIAL,
모임종류 VARCHAR(128),
이름 VARCHAR(128),
직업 VARCHAR(128),
언제어디서 VARCHAR(128),
기간 INTEGER,
PRIMARY KEY(id)
);

INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) values ('친구', '전우평', '사업', '초등', '30');
INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) values ('친구', '정재윤', '건축사', '초등', '30');
INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) values ('직장', '박은영', '뱅커', '회사', '7');
INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) values ('직장', '정재순', '뱅커', '회사', '15');
INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) values ('리스크', '김현영', '뱅커', '회사', '20');
INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) values ('리스크', '차봉수', '뱅커', '회사', '20');
INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) values ('RRM', '김재삼', '뱅커', '회사', '10');
INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) values ('RRM', '김진기', '뱅커', '회사', '10');
INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) values ('직장', '박재순', '뱅커', '회사', '3');
INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) values ('직장', '김성은', '뱅커', '회사', '5');
INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) values ('HIMB', '한무현', '뱅커', '회사', '28');
INSERT INTO yourfriends (모임종류,이름,직업,언제어디서,기간) values ('HIMB', '이관식', '뱅커', '회사', '28');
