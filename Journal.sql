# postGres 로 일기 쓰기
##  2023.01.27 오후 3:15
## 테이블 설명
   - event : good 또는 bad로 사건을 애기 했음
   - weather : Sunny 또는 Rainy
   - story : 어쩌구 저쩌구 일상 기록
## 위 테이블 3개를 맹글어서 하나의 테이블로 합쳐 보았음, postGres 이용하여
## 참조 : 미시간 대학교 DR.Chuck 수업

===**** 시작
DROP table event CASCADE;
DROP table story CASCADE;
DROP table weather CASCADE;

CREATE TABLE event (
  id SERIAL,
  mood VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE weather (
  id SERIAL,
  condition_ VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE story (
    id SERIAL,
    blabla VARCHAR(128),
    event_id INTEGER REFERENCES event(id) ON DELETE CASCADE,
    weather_id INTEGER REFERENCES weather(id) ON DELETE CASCADE,
    UNIQUE(blabla, event_id),
    PRIMARY KEY(id)
);

INSERT INTO event (mood) VALUES ('good');
INSERT INTO event (mood) VALUES ('fell bad');

INSERT INTO weather (condition_) VALUES ('Sunny Day');
INSERT INTO weather (condition_) VALUES ('Rainy');

INSERT INTO story (blabla, event_id, weather_id) 
    VALUES ('이게 될려나', 2, 1) ;
INSERT INTO story (blabla, event_id, weather_id) 
    VALUES ('아마도', 2, 1) ;
INSERT INTO story (blabla, event_id, weather_id) 
    VALUES ('또~', 1, 2) ;
INSERT INTO story (blabla, event_id, weather_id) 
    VALUES ('그래서', 1, 2) ;

#SELECT album.title, artist.name FROM album JOIN artist 
 #   ON album.artist_id = artist.id;

#SELECT album.title, album.artist_id, artist.id, artist.name 
  #  FROM album INNER JOIN artist ON album.artist_id = artist.id;

SELECT story.blabla, story.weather_id, weather.id, weather.condition_ 
    FROM story CROSS JOIN weather;

SELECT story.blabla, weather.condition_ FROM story JOIN weather 
    ON track.wearher_id = weather.id;

SELECT story.blabla, event.mood, weather.condition_ 
FROM story 
    JOIN weather ON story.weather_id = weather.id 
    JOIN event ON story.event_id = event.id 
    ;
=====끝
---- 시작

ALTER TABLE story ADD COLUMN dday TEXT;
INSERT INTO story(blabla,event_id,weather_id,dday) VALUES('가고싶어','1','1','토');
====끝

--- 시작, 2024-06-04
DROP TABLE story CASCADE;

CREATE TABLE story (
    id SERIAL,
    dddate DATE NOT NULL,
    blabla VARCHAR(128),
    event_id INTEGER REFERENCES event(id) ON DELETE CASCADE,
    weather_id INTEGER REFERENCES weather(id) ON DELETE CASCADE,
    UNIQUE(blabla, event_id),
    PRIMARY KEY(id)
);

INSERT INTO story (dddate ,blabla, event_id, weather_id) 
    VALUES ('2024-06-04','오늘 화요일', 2, 1) ;
===끝
