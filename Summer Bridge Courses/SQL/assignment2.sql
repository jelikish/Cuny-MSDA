##Joseph Elikishvili assignment 2

DROP DATABASE IF EXISTS videodb;
CREATE DATABASE videodb;
use videodb;

DROP TABLE IF EXISTS video;
DROP TABLE IF EXISTS reviewers;

CREATE TABLE video (
ID int not null auto_increment,
title varchar(30),
length integer,
URL varchar(50),
primary key (ID)
);


INSERT INTO video (title, length, URL) VALUES
("Infinite Limits",725,"https://www.youtube.com/watch?v=-vwcLvb9A0s"),
("One Sided Limits",355,"https://www.youtube.com/watch?v=JXVUyk2JOU4"),
("Squeze Theorem",452,"https://www.youtube.com/watch?v=iyTPDuh-LF8");

CREATE TABLE reviewers (
username varchar(20),
rating integer,
review varchar(30),
vID integer
);

INSERT INTO reviewers (username, rating, review, vID) VALUES
("mathrocks",5,"Great Video",1),
("user123",4,"Not Bad",1),
("timcook",NULL,"Horrible Video",2),
("billgates",5,"The Best",2);

Select video.ID as "Video ID", video.title as "Video Title", video.length as "Length", video.URL, reviewers.username as "Username", reviewers.rating as "Rating", reviewers.review as "Review"
from video
left join reviewers
on video.ID = reviewers.vID;




