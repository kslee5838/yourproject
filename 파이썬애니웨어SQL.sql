
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
