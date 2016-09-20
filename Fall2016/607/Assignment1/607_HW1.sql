DROP DATABASE IF EXISTS moviedb;
CREATE database moviedb;
use moviedb;

CREATE TABLE users (
userID int not null auto_increment,
fname varchar(20),
lname varchar(20),
primary key (userID)
);

INSERT INTO users (fname, lname) VALUES
('Natalia','Lesechko'),
('Victoria','Elikishvili'),
('Sergey','Vayner'),
('Bing','Bong'),
('Dmitry','Yuster');

CREATE TABLE movies (
movieID int not null auto_increment,
title varchar (30),
genre varchar(20),
imdbrating float,
primary key (movieID)
);

INSERT INTO movies (title, genre, imdbrating) VALUES
('Jason Borurne','Action',6.9),
('War Dogs','Comedy',7.3),
('Suicide Squad','Action',6.7),
('Inside Out','Animation',8.3),
('Zootopia','Animation',8.1),
('Now you see me 2','Action',6.6);

CREATE TABLE reviews(
userID int,
movieID int,
userrating int
);

INSERT INTO reviews (userID, movieID, userrating) VALUES
(1,1,4),(1,2,3),(1,3,2),(1,4,4),(1,5,4),(1,6,4),
(2,1,2),(2,2,2),(2,3,1),(2,4,5),(2,5,5),(2,6,3),
(3,1,5),(3,2,5),(3,3,3),(3,4,4),(3,5,3),(3,6,3),
(4,1,4),(4,2,3),(4,3,4),(4,4,5),(4,5,5),(4,6,3),
(5,1,5),(5,2,5),(5,3,3),(5,4,4),(5,5,4),(5,6,3);

SELECT users.fname, users.lname, movies.title, movies.genre, movies.imdbrating, reviews.userrating from reviews
JOIN users on users.userID = reviews.userID
JOIN movies on reviews.movieID = movies.movieID;