DROP SCHEMA IF EXISTS project;
CREATE DATABASE IF NOT EXISTS `project`;
USE project;

DROP TABLE IF EXISTS mentioned;

CREATE TABLE mentioned
(	
	tid bigint NOT NULL,
	screen_name VARCHAR(500) NOT NULL,
	PRIMARY KEY (tid, screen_name)
);

DROP TABLE IF EXISTS tweet;
CREATE TABLE tweet
(
	tid bigint NOT NULL,
	text_body varchar(500) NOT NULL,
    retweeted int,
    retweet_count int,
	posted date NOT NULL,
	posting_user VARCHAR(500),
	PRIMARY KEY(tid)
);

DROP TABLE IF EXISTS urlused;
CREATE TABLE urlused
(
	url varchar(500),
	PRIMARY KEY(url)
);

DROP TABLE IF EXISTS users;
CREATE TABLE users
(
	screen_name VARCHAR(500) NOT NULL,
	uname VARCHAR(500),
	sub_category VARCHAR(500),
    category VARCHAR(500),
    ofstate VARCHAR(500),
    numFollowers int,
    numFollowing int,
    PRIMARY KEY(screen_name)
);

DROP TABLE IF EXISTS tagged;
CREATE TABLE tagged
(
	hashtagname varchar(500) NOT NULL,
	PRIMARY KEY (hashtagname)
);

DROP TABLE IF EXISTS contained;
CREATE TABLE contained
(
	tid bigint NOT NULL,
    url varchar(500),
    PRIMARY KEY (tid, url)
);

DROP TABLE IF EXISTS includes;
CREATE TABLE includes
(
	tid bigint NOT NULL,
    hashtagname varchar(500) NOT NULL,
    PRIMARY KEY (tid, hashtagname)
);

