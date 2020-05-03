LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/urlused.txt'
INTO TABLE contained
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tid, url);

INSERT INTO urlused
SELECT url
FROM contained
ON DUPLICATE KEY UPDATE url = VALUES(url);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/user.txt'
INTO TABLE users
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(screen_name, uname, sub_category, category, ofstate, numFollowers, numFollowing);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tagged.txt'
INTO TABLE includes
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tid, hashtagname);

INSERT INTO tagged
SELECT hashtagname
FROM includes
ON DUPLICATE KEY UPDATE hashtagname = VALUES(hashtagname);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/mentioned.txt'
INTO TABLE mentioned
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tid, screen_name);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tweets.txt'
INTO TABLE tweet
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tid, text_body, retweet_count, retweeted, posted, posting_user);

UPDATE users
set ofstate = 'Florida'
where ofstate = 'FL';

UPDATE users
set ofstate = 'Arizona'
where ofstate = 'AZ';

UPDATE users
set ofstate = 'Nebraska'
where ofstate = 'NE';

UPDATE users
set ofstate = 'South Dakota'
where ofstate = 'SD';

UPDATE users
set ofstate = 'Iowa'
where ofstate = 'IA';

UPDATE users
set ofstate = 'Illinois'
where ofstate = 'IL';

UPDATE users
set ofstate = 'Wisconsin'
where ofstate = 'WI';

Alter table contained
ADD FOREIGN KEY (tid) REFERENCES tweet(tid) ON DELETE CASCADE,
ADD FOREIGN KEY (url) REFERENCES urlused(url);

Alter table includes
ADD FOREIGN KEY (tid) REFERENCES tweet(tid) ON DELETE CASCADE,
ADD FOREIGN KEY (hashtagname) REFERENCES tagged(hashtagname);

Alter table tweet
ADD FOREIGN KEY (posting_user) REFERENCES users(screen_name) ON DELETE CASCADE;

Alter table mentioned
ADD FOREIGN KEY (screen_name) REFERENCES users (screen_name) ON UPDATE CASCADE;