
-- if file saved on pythonanywhere.com, upload to mysql
-- 중요// -p --local-infile=1

(bash)
09:32 ~ $ mysql -h kslee5838.mysql.pythonanywhere-services.com -u kslee5838 'kslee5838$default' -p --local-infile=1

(sql)
-- CREATE DATABASE IF NOT EXISTS music_library;
-- USE music_library;

-- Create the Shazam Library table
CREATE TABLE shazam_library (
    id INT PRIMARY KEY,
    tag_time DATE NOT NULL,
    title VARCHAR(255) NOT NULL,
    artist VARCHAR(255) NOT NULL,
    url VARCHAR(500) NOT NULL,
    track_key BIGINT NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

LOAD DATA LOCAL INFILE '/home/kslee5838/shazamlibrary.csv' 
INTO TABLE shazam_library 
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'   
LINES TERMINATED BY '\n'   
IGNORE 2 LINES;


## 2025.10.11
CREATE TABLE Shazam_Oct (
    id SERIAL,
    TagTime DATE,           -- Matches the CSV column name/data type (2022-06-15)
    title VARCHAR(128),
    artist VARCHAR(128),
    URL VARCHAR(255),       -- Increased size for long URLs
    TrackKey VARCHAR(20),   -- Matches the CSV column name/data type (610472974)
    PRIMARY KEY(id)
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/shazamlibrary_October.csv'
INTO TABLE Shazam_Oct
CHARACTER SET 'utf8mb4'
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n'  -- Changed back to simple newline
IGNORE 1 ROWS
(
    @dummy_index,
    TagTime,
    title,
    artist,
    URL,
    TrackKey
);
