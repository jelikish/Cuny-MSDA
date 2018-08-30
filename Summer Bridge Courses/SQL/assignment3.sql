DROP DATABASE IF EXISTS building;
CREATE database building;
use building;

CREATE TABLE users (
userID int not null auto_increment,
username varchar(20),
groupID int,
primary key (userID)
);

INSERT INTO users (username, groupID) VALUES
('Modesto',1),
('Ayine',1),
('Christopher',2),
('Cheng Woo',2),
('Heidy',NULL),
('Saulat',3);

#SELECT * from users

CREATE TABLE groups (
groupID int not null auto_increment,
groupName varchar(20),
primary key(groupID)
);

INSERT INTO groups (groupname) VALUES
('IT'),
('Sales'),
('Administration'),
('Operations');

CREATE TABLE rooms (
roomID int not null auto_increment,
roomName varchar(20),
primary key(roomID)
);

INSERT INTO rooms (roomName) VALUES
('101'),
('102'),
('Auditorium A'),
('Auditorium B');

CREATE TABLE group_room (
groupID int not NULL REFERENCES groups.groupID,
roomID int not NULL REFERENCES rooms.roomID,
CONSTRAINT pk_group_room PRIMARY KEY(groupID, roomID)
);

INSERT INTO group_room (groupID, roomID) VALUES
(1,1),
(1,2),
(2,2),
(2,3);



#-----------------
#Q1
select 
groups.groupName as 'Group',
users.username as 'Username' 
from groups
left join users
on groups.groupID = users.groupID;

#Q2
select 
r.roomName as 'Room',
g.groupName as 'Group' 
from rooms r
left join group_room gr ON r.roomID=gr.roomID
left join groups g ON gr.groupID=g.groupID;

#Q3
select users.username, groups.groupName, rooms.roomName from users
left join groups on users.groupID = groups.groupID
left join group_room on groups.groupID=group_room.groupID
left join rooms on group_room.roomID=rooms.roomID
order by username, groupName, roomName;

