DROP TABLE category CASCADE;
DROP TABLE iso CASCADE;
DROP TABLE state CASCADE;
DROP TABLE region CASCADE;
DROP TABLE unesco_raw CASCADE;
DROP TABLE unesco CASCADE;

CREATE TABLE unesco_raw
 (name TEXT, description TEXT, justification TEXT, year INTEGER,
    longitude FLOAT, latitude FLOAT, area_hectares FLOAT,
    category TEXT, category_id INTEGER, state TEXT, state_id INTEGER,
    region TEXT, region_id INTEGER, iso TEXT, iso_id INTEGER);

--복사는 한줄로 한다
\copy unesco_raw(name,description,justification,year,longitude,latitude,area_hectares,category,state,region,iso) FROM 'whc-sites-2018-small.csv' WITH DELIMITER ',' CSV HEADER;

CREATE TABLE category (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE iso (
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE state(
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE region(
  id SERIAL,
  name VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE unesco(
  id SERIAL, 
  PRIMARY KEY(id), 
  name TEXT, 
  year INTEGER,
  category_id INTEGER, 
  iso_id INTEGER,
  state_id INTEGER,
  region_id INTEGER
   );

SELECT DISTINCT category FROM unesco_raw;
INSERT INTO category(name) SELECT DISTINCT category FROM unesco_raw;
INSERT INTO iso(name) SELECT DISTINCT iso FROM unesco_raw;
INSERT INTO state(name) SELECT DISTINCT state FROM unesco_raw;
INSERT INTO region(name) SELECT DISTINCT region FROM unesco_raw;

UPDATE unesco_raw SET category_id = (SELECT category.id FROM category WHERE category.name = unesco_raw.category);
UPDATE unesco_raw SET iso_id = (SELECT iso.id FROM iso WHERE iso.name = unesco_raw.iso);
UPDATE unesco_raw SET state_id = (SELECT state.id FROM state WHERE state.name = unesco_raw.state);
UPDATE unesco_raw SET region_id= (SELECT region.id FROM region WHERE region.name = unesco_raw.region);

INSERT INTO unesco (name, year,category_id,iso_id,state_id,region_id) SELECT name, year, category_id, iso_id,state_id,region_id FROM unesco_raw;

SELECT unesco.name, year,category.name,iso.name,state.name,region.name
  FROM unesco
  JOIN category ON category_id = category.id
  JOIN iso ON unesco.iso_id = iso.id
  join state on unesco.state_id=state.id
  join region on unesco.region_id=region.id
  ORDER BY year, unesco.name
  LIMIT 3;
