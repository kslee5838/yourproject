##야구선수모음

drop table Players;

create table Players(
teams TEXT,
teams_id INTEGER,
backnumber integer,
posit VARCHAR(126),
position_id integer,
irum VARCHAR(126),
투타유형 VARCHAR(126),
born VARCHAR(126),
height VARCHAR(126),
weight VARCHAR(126)
);

\copy Players(teams,backnumber,posit,irum,투타유형,born,height,weight) FROM 'C:\Users\Kslee5838\Documents\basebll_team\PlayerSearch_nonheader.csv' WITH DELIMITER ',' CSV;

drop table team;
create table team (
id SERIAL,
primary key (id),
teams text
);

drop table pos;
create table pos (
id SERIAL,
primary key(id),
posit text
);

select distinct teams from players ;
insert into team(teams) select distinct teams from players;
UPDATE players SET teams_id = (SELECT team.id FROM team WHERE team.teams = players.teams);

select distinct posit from players ;
insert into pos(posit) select distinct posit from players;
UPDATE players SET position_id = (SELECT pos.id FROM pos WHERE pos.posit = players.posit);

drop table teams_posit;
CREATE TABLE teams_posit(
id SERIAL, 
PRIMARY KEY(id), 
teams TEXT, 
teams_id INTEGER,
posit text,
position_id INTEGER
);

INSERT INTO teams_posit (teams, teams_id,posit,position_id) SELECT teams, teams_id,posit, position_id FROM players;
select * from teams_posit join team on teams_posit.teams_id=team.id;  
#join 은 teams_posit 와 team 테이블, pos테이블을 한다, 겹치게 한다

select * from teams_posit join pos on teams_posit.position_id=pos.id;

SELECT players.irum, players.posit, players.teams
  FROM players
  JOIN pos ON players.position_id = pos.id
  order by posit 
  limit 10;
 
## 2023.04.09 일요일 작성  

