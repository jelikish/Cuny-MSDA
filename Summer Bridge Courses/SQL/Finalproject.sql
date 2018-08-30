##Joseph Elikishvili Final Project

#1.
DROP DATABASE IF EXISTS BuildingEnergy;
CREATE DATABASE BuildingEnergy;
use BuildingEnergy;

#2.
CREATE TABLE EnergyCategories (
EnergyID int not null auto_increment,
EnergyCategory varchar(30),
primary key (EnergyID)
);

CREATE TABLE EnergyTypes (
TypeID int, 
EnergyType varchar(30),
EnergyID int
);

INSERT INTO EnergyCategories ( EnergyCategory ) VALUES
("Fossil"),
("Renewable");

INSERT INTO EnergyTypes (TypeID, EnergyType, EnergyID) VALUES
(1,"Electricity",1),
(2,"Gas",1),
(3,"Steam",1),
(4,"Fuel Oil",1),
(5,"Solar",2),
(6,"Wind",2);

#3.
SELECT EnergyCategories.EnergyCategory, 
EnergyTypes.EnergyType from EnergyCategories
LEFT JOIN EnergyTypes 
on EnergyCategories.EnergyID = EnergyTypes.EnergyID
ORDER BY EnergyType;

#4.
CREATE TABLE Buildings (
buildingID int,
buildingname varchar(50)
);

INSERT INTO Buildings (buildingID, buildingname ) VALUES
(1,"Empire State Building"),
(2,"Chrysler Building"),
(3,"Borough of Manhattan Community College");

CREATE TABLE Buildings_EnergrType (
buildingID int,
TypeID int
);

INSERT INTO Buildings_EnergrType ( buildingID, TypeID) VALUES
(3,1),(3,3),(3,5),
(2,1),(2,3),
(1,1),(1,2),(1,3);

#5.
SELECT Buildings.buildingname, EnergyTypes.EnergyType from Buildings
LEFT JOIN Buildings_EnergrType on Buildings_EnergrType.buildingID = buildings.buildingID
LEFT JOIN EnergyTypes on Buildings_EnergrType.TypeID = EnergyTypes.TypeID
ORDER BY buildingname;

#6. 

INSERT INTO Buildings (buildingID, buildingname ) VALUES
(4,"Bronx Lion House"),
(5,"Brooklyn Childrens Museum");

INSERT INTO EnergyTypes (TypeID, EnergyType, EnergyID) VALUES
(7,"Geothermal",2);

INSERT INTO Buildings_EnergrType ( buildingID, TypeID) VALUES
(4,7),
(5,1),(5,7);

#7.
SELECT Buildings.buildingname, EnergyTypes.EnergyType, EnergyCategories.EnergyCategory from EnergyCategories
JOIN EnergyTypes on EnergyTypes.EnergyID = EnergyCategories.EnergyID
JOIN Buildings_EnergrType on EnergyTypes.TypeID = Buildings_EnergrType.TypeID
JOIN Buildings on Buildings.buildingID = Buildings_EnergrType.buildingID
WHERE EnergyCategories.EnergyCategory = "Renewable";

#8.
SELECT EnergyTypes.EnergyType, count(Buildings_EnergrType.buildingID) as "BuildingID" FROM EnergyTypes
JOIN Buildings_EnergrType on Buildings_EnergrType.TypeID = EnergyTypes.TypeID
GROUP BY EnergyTypes.EnergyType
ORDER BY BuildingID DESC;
