DROP SCHEMA IF EXISTS ds_skills;

CREATE SCHEMA ds_skills;
USE ds_skills;

# attributes of open job positions:  job id, position role, location
CREATE TABLE jobs (
post_id INT PRIMARY KEY NOT NULL,
role_id INT NOT NULL REFERENCES roles(role_id),
loc_id INT NOT NULL REFERENCES locations(loc_id) 
);

# populate jobs with dummy values
INSERT INTO jobs VALUES(1, 5, 2);
INSERT INTO jobs VALUES(2, 3, 5);
INSERT INTO jobs VALUES(3, 1, 5);
INSERT INTO jobs VALUES(4, 3, 5);
INSERT INTO jobs VALUES(5, 3, 1);
INSERT INTO jobs VALUES(6, 1, 2);
INSERT INTO jobs VALUES(7, 1, 3);
INSERT INTO jobs VALUES(8, 1, 5);
INSERT INTO jobs VALUES(9, 4, 4);
INSERT INTO jobs VALUES(10, 2, 3);
INSERT INTO jobs VALUES(11, 3, 5);
INSERT INTO jobs VALUES(12, 3, 3);
INSERT INTO jobs VALUES(13, 1, 2);
INSERT INTO jobs VALUES(14, 1, 3);
INSERT INTO jobs VALUES(15, 4, 3);
INSERT INTO jobs VALUES(16, 2, 5);
INSERT INTO jobs VALUES(17, 1, 3);
INSERT INTO jobs VALUES(18, 5, 5);
INSERT INTO jobs VALUES(19, 3, 2);
INSERT INTO jobs VALUES(20, 3, 4);
INSERT INTO jobs VALUES(21, 2, 5);
INSERT INTO jobs VALUES(22, 4, 2);
INSERT INTO jobs VALUES(23, 1, 4);
INSERT INTO jobs VALUES(24, 1, 1);
INSERT INTO jobs VALUES(25, 5, 1);


# geographic locations of jobs
CREATE TABLE locations (
loc_id INT NOT NULL PRIMARY KEY,
city VARCHAR(30) NOT NULL,
state CHAR(2) NOT NULL
);

# populate locations table with dummy values
INSERT INTO locations VALUES(1, 'San Francisco',  'CA');
INSERT INTO locations VALUES(2, 'Seattle',  'WA');
INSERT INTO locations VALUES(3, 'New York',  'NY');
INSERT INTO locations VALUES(4, 'Charlotte',  'NC');
INSERT INTO locations VALUES(5, 'Atlanta ',  'GA');



# job position titles.  Examples:  Data Scientist, Data Engineer, etc.
CREATE TABLE roles (
role_id INT NOT NULL PRIMARY KEY,
role_desc VARCHAR(30) NOT NULL
);

# populate job position titles with dummy info
INSERT INTO roles VALUES( 1,  'Data_Scientist');
INSERT INTO roles VALUES( 2,  'Data Engineer');
INSERT INTO roles VALUES( 3,  'Data Analyst');
INSERT INTO roles VALUES( 4,  'Jr. Data Scientist');
INSERT INTO roles VALUES( 5,  'Sr. Data Scientist');



# keyword descriptions.  Examples:  R, Python, Machine Learning, etc.
CREATE TABLE keywords (
key_id INT NOT NULL PRIMARY KEY,
keyword_desc VARCHAR(35) NOT NULL
);

# populate keywords table with dummy values
INSERT INTO keywords VALUES( 1,  'r');
INSERT INTO keywords VALUES( 2,  'python');
INSERT INTO keywords VALUES( 3,  'java');
INSERT INTO keywords VALUES( 4,  'ruby');
INSERT INTO keywords VALUES( 5,  'perl');
INSERT INTO keywords VALUES( 6,  'javascript');
INSERT INTO keywords VALUES( 7,  'c++');
INSERT INTO keywords VALUES( 8,  'matlab');
INSERT INTO keywords VALUES( 9,  'javascript');
INSERT INTO keywords VALUES( 10,  'scala');
INSERT INTO keywords VALUES( 11,  'excel');
INSERT INTO keywords VALUES( 12,  'tableau');
INSERT INTO keywords VALUES( 13,  'd3.js');
INSERT INTO keywords VALUES( 14,  'sas');
INSERT INTO keywords VALUES( 15,  'spss');
INSERT INTO keywords VALUES( 16,  'd3');
INSERT INTO keywords VALUES( 17,  'hadoop');
INSERT INTO keywords VALUES( 18,  'mapreduce');
INSERT INTO keywords VALUES( 19,  'spark');
INSERT INTO keywords VALUES( 20,  'pig');
INSERT INTO keywords VALUES( 21,  'hive');
INSERT INTO keywords VALUES( 22,  'shark');
INSERT INTO keywords VALUES( 23,  'oozie');
INSERT INTO keywords VALUES( 24,  'zookeeper');
INSERT INTO keywords VALUES( 25,  'flume');
INSERT INTO keywords VALUES( 26,  'mahout');
INSERT INTO keywords VALUES( 27,  'sql');
INSERT INTO keywords VALUES( 28,  'nosql');
INSERT INTO keywords VALUES( 29,  'hbase');
INSERT INTO keywords VALUES( 30,  'cassandra');
INSERT INTO keywords VALUES( 31,  'mongodb');
INSERT INTO keywords VALUES( 32,  'amazon s3');
INSERT INTO keywords VALUES( 33,  'unstructured data');
INSERT INTO keywords VALUES( 34,  'structured data');
INSERT INTO keywords VALUES( 35,  'structured');
INSERT INTO keywords VALUES( 36,  'intellectual curiosity');
INSERT INTO keywords VALUES( 37,  'business acumen');
INSERT INTO keywords VALUES( 38,  'communication');
INSERT INTO keywords VALUES( 39,  'data visualization');
INSERT INTO keywords VALUES( 40,  'data munging');
INSERT INTO keywords VALUES( 41,  'machine learning');
INSERT INTO keywords VALUES( 42,  'calculus');
INSERT INTO keywords VALUES( 43,  'linear algebra');
INSERT INTO keywords VALUES( 44,  'statistics');
INSERT INTO keywords VALUES( 45,  'data munging');
INSERT INTO keywords VALUES( 46,  'software engineering');
INSERT INTO keywords VALUES( 47,  'scientific method');
INSERT INTO keywords VALUES( 48,  'math');
INSERT INTO keywords VALUES( 49,  'product design');
INSERT INTO keywords VALUES( 50,  'product development');
INSERT INTO keywords VALUES( 51,  'database administration');
INSERT INTO keywords VALUES( 52,  'project management');
INSERT INTO keywords VALUES( 53,  'data mining');
INSERT INTO keywords VALUES( 54,  'predictive modeling');
INSERT INTO keywords VALUES( 55,  'predictive analytics');
INSERT INTO keywords VALUES( 56,  'bi');
INSERT INTO keywords VALUES( 57,  'b.i.');
INSERT INTO keywords VALUES( 58,  'business intelligence');
INSERT INTO keywords VALUES( 59,  'optimization');
INSERT INTO keywords VALUES( 60,  'text mining');
INSERT INTO keywords VALUES( 61,  'cloud management');
INSERT INTO keywords VALUES( 62,  'big data');
INSERT INTO keywords VALUES( 63,  'viz');
INSERT INTO keywords VALUES( 64,  'bayesian statistics');
INSERT INTO keywords VALUES( 65,  'bayesian analysis');
INSERT INTO keywords VALUES( 66,  'n.l.p');
INSERT INTO keywords VALUES( 67,  'nlp');
INSERT INTO keywords VALUES( 68,  'natural language processing');
INSERT INTO keywords VALUES( 69,  'simulation');
INSERT INTO keywords VALUES( 70,  'simulations');
INSERT INTO keywords VALUES( 71,  'classification');
INSERT INTO keywords VALUES( 72,  'clustering');
INSERT INTO keywords VALUES( 73,  'regression');
INSERT INTO keywords VALUES( 74,  'glm');
INSERT INTO keywords VALUES( 75,  'glms');
INSERT INTO keywords VALUES( 76,  'generalized linear models');
INSERT INTO keywords VALUES( 77,  'entrepreneurial ');
INSERT INTO keywords VALUES( 78,  'entrepreneur');
INSERT INTO keywords VALUES( 79,  'least squares');
INSERT INTO keywords VALUES( 80,  'roc');
INSERT INTO keywords VALUES( 81,  'data wrangling');
INSERT INTO keywords VALUES( 82,  'storyteller');
INSERT INTO keywords VALUES( 83,  'storytelling');
INSERT INTO keywords VALUES( 84,  'hacking');
INSERT INTO keywords VALUES( 85,  'deep learning');
INSERT INTO keywords VALUES( 86,  'neural network');
INSERT INTO keywords VALUES( 87,  'neural networks');
INSERT INTO keywords VALUES( 88,  'sci-kit learn');
INSERT INTO keywords VALUES( 89,  'pandas');
INSERT INTO keywords VALUES( 90,  'numpy');
INSERT INTO keywords VALUES( 91,  'microsoft power bi');
INSERT INTO keywords VALUES( 92,  'knime');
INSERT INTO keywords VALUES( 93,  'octave');
INSERT INTO keywords VALUES( 94,  'rapidminer');
INSERT INTO keywords VALUES( 95,  'minitab');
INSERT INTO keywords VALUES( 96,  'stata');
INSERT INTO keywords VALUES( 97,  'h20');
INSERT INTO keywords VALUES( 98,  'curious');
INSERT INTO keywords VALUES( 99,  'xlstat');
INSERT INTO keywords VALUES( 100,  '@risk');
INSERT INTO keywords VALUES( 101,  'random forest');
INSERT INTO keywords VALUES( 102,  'decision tree');
INSERT INTO keywords VALUES( 103,  'time series');
INSERT INTO keywords VALUES( 104,  'random tree');
INSERT INTO keywords VALUES( 105,  'probability');
INSERT INTO keywords VALUES( 106,  'dato');
INSERT INTO keywords VALUES( 107,  'ggplot ');
INSERT INTO keywords VALUES( 108,  'ggvis');



# intermediary table required due to many-many relationship between job postings and keywordds
CREATE TABLE post_keys  (
post_id INT NOT NULL REFERENCES jobs(post_id) ,
key_id INT NOT NULL REFERENCES keywords(key_id)
);

# populate post_keys table with dummy values
INSERT INTO post_keys VALUES(1, 1);
INSERT INTO post_keys VALUES(1, 80);
INSERT INTO post_keys VALUES(1, 86);
INSERT INTO post_keys VALUES(1, 23);
INSERT INTO post_keys VALUES(1, 89);
INSERT INTO post_keys VALUES(1, 39);
INSERT INTO post_keys VALUES(1, 43);
INSERT INTO post_keys VALUES(1, 58);
INSERT INTO post_keys VALUES(1, 106);
INSERT INTO post_keys VALUES(1, 75);
INSERT INTO post_keys VALUES(1, 28);
INSERT INTO post_keys VALUES(1, 46);
INSERT INTO post_keys VALUES(1, 37);
INSERT INTO post_keys VALUES(1, 92);
INSERT INTO post_keys VALUES(1, 31);
INSERT INTO post_keys VALUES(2, 3);
INSERT INTO post_keys VALUES(2, 70);
INSERT INTO post_keys VALUES(2, 63);
INSERT INTO post_keys VALUES(2, 84);
INSERT INTO post_keys VALUES(2, 12);
INSERT INTO post_keys VALUES(2, 91);
INSERT INTO post_keys VALUES(2, 77);
INSERT INTO post_keys VALUES(2, 42);
INSERT INTO post_keys VALUES(2, 21);
INSERT INTO post_keys VALUES(2, 83);
INSERT INTO post_keys VALUES(3, 55);
INSERT INTO post_keys VALUES(3, 65);
INSERT INTO post_keys VALUES(3, 74);
INSERT INTO post_keys VALUES(3, 79);
INSERT INTO post_keys VALUES(3, 66);
INSERT INTO post_keys VALUES(3, 67);
INSERT INTO post_keys VALUES(3, 4);
INSERT INTO post_keys VALUES(3, 15);
INSERT INTO post_keys VALUES(3, 69);
INSERT INTO post_keys VALUES(3, 36);
INSERT INTO post_keys VALUES(3, 53);
INSERT INTO post_keys VALUES(3, 11);
INSERT INTO post_keys VALUES(4, 93);
INSERT INTO post_keys VALUES(4, 78);
INSERT INTO post_keys VALUES(4, 33);
INSERT INTO post_keys VALUES(4, 43);
INSERT INTO post_keys VALUES(4, 98);
INSERT INTO post_keys VALUES(5, 29);
INSERT INTO post_keys VALUES(5, 71);
INSERT INTO post_keys VALUES(5, 93);
INSERT INTO post_keys VALUES(5, 80);
INSERT INTO post_keys VALUES(5, 56);
INSERT INTO post_keys VALUES(5, 41);
INSERT INTO post_keys VALUES(5, 6);
INSERT INTO post_keys VALUES(5, 61);
INSERT INTO post_keys VALUES(5, 13);
INSERT INTO post_keys VALUES(5, 30);
INSERT INTO post_keys VALUES(5, 55);
INSERT INTO post_keys VALUES(5, 97);
INSERT INTO post_keys VALUES(5, 66);
INSERT INTO post_keys VALUES(6, 71);
INSERT INTO post_keys VALUES(6, 57);
INSERT INTO post_keys VALUES(6, 35);
INSERT INTO post_keys VALUES(6, 66);
INSERT INTO post_keys VALUES(6, 95);
INSERT INTO post_keys VALUES(6, 74);
INSERT INTO post_keys VALUES(6, 56);
INSERT INTO post_keys VALUES(6, 22);
INSERT INTO post_keys VALUES(6, 42);
INSERT INTO post_keys VALUES(7, 17);
INSERT INTO post_keys VALUES(7, 57);
INSERT INTO post_keys VALUES(7, 99);
INSERT INTO post_keys VALUES(8, 77);
INSERT INTO post_keys VALUES(8, 62);
INSERT INTO post_keys VALUES(8, 50);
INSERT INTO post_keys VALUES(8, 17);
INSERT INTO post_keys VALUES(8, 28);
INSERT INTO post_keys VALUES(8, 56);
INSERT INTO post_keys VALUES(8, 18);
INSERT INTO post_keys VALUES(8, 36);
INSERT INTO post_keys VALUES(8, 51);
INSERT INTO post_keys VALUES(8, 47);
INSERT INTO post_keys VALUES(8, 54);
INSERT INTO post_keys VALUES(9, 90);
INSERT INTO post_keys VALUES(9, 13);
INSERT INTO post_keys VALUES(9, 74);
INSERT INTO post_keys VALUES(9, 7);
INSERT INTO post_keys VALUES(9, 72);
INSERT INTO post_keys VALUES(9, 55);
INSERT INTO post_keys VALUES(9, 46);
INSERT INTO post_keys VALUES(10, 8);
INSERT INTO post_keys VALUES(10, 95);
INSERT INTO post_keys VALUES(10, 52);
INSERT INTO post_keys VALUES(10, 10);
INSERT INTO post_keys VALUES(10, 65);
INSERT INTO post_keys VALUES(10, 31);
INSERT INTO post_keys VALUES(10, 14);
INSERT INTO post_keys VALUES(10, 87);
INSERT INTO post_keys VALUES(10, 68);
INSERT INTO post_keys VALUES(10, 84);
INSERT INTO post_keys VALUES(10, 61);
INSERT INTO post_keys VALUES(10, 72);
INSERT INTO post_keys VALUES(10, 51);
INSERT INTO post_keys VALUES(10, 24);
INSERT INTO post_keys VALUES(11, 37);
INSERT INTO post_keys VALUES(11, 80);
INSERT INTO post_keys VALUES(11, 17);
INSERT INTO post_keys VALUES(11, 10);
INSERT INTO post_keys VALUES(11, 9);
INSERT INTO post_keys VALUES(11, 4);
INSERT INTO post_keys VALUES(11, 46);
INSERT INTO post_keys VALUES(12, 62);
INSERT INTO post_keys VALUES(12, 27);
INSERT INTO post_keys VALUES(12, 97);
INSERT INTO post_keys VALUES(12, 74);
INSERT INTO post_keys VALUES(12, 29);
INSERT INTO post_keys VALUES(12, 8);
INSERT INTO post_keys VALUES(12, 77);
INSERT INTO post_keys VALUES(13, 19);
INSERT INTO post_keys VALUES(13, 52);
INSERT INTO post_keys VALUES(13, 49);
INSERT INTO post_keys VALUES(13, 28);
INSERT INTO post_keys VALUES(13, 60);
INSERT INTO post_keys VALUES(13, 5);
INSERT INTO post_keys VALUES(13, 106);
INSERT INTO post_keys VALUES(13, 86);
INSERT INTO post_keys VALUES(13, 103);
INSERT INTO post_keys VALUES(13, 3);
INSERT INTO post_keys VALUES(14, 78);
INSERT INTO post_keys VALUES(14, 64);
INSERT INTO post_keys VALUES(14, 59);
INSERT INTO post_keys VALUES(14, 76);
INSERT INTO post_keys VALUES(14, 19);
INSERT INTO post_keys VALUES(15, 79);
INSERT INTO post_keys VALUES(15, 35);
INSERT INTO post_keys VALUES(15, 18);
INSERT INTO post_keys VALUES(15, 49);
INSERT INTO post_keys VALUES(15, 41);
INSERT INTO post_keys VALUES(15, 92);
INSERT INTO post_keys VALUES(15, 42);
INSERT INTO post_keys VALUES(15, 59);
INSERT INTO post_keys VALUES(15, 75);
INSERT INTO post_keys VALUES(15, 84);
INSERT INTO post_keys VALUES(15, 17);
INSERT INTO post_keys VALUES(15, 74);
INSERT INTO post_keys VALUES(15, 71);
INSERT INTO post_keys VALUES(15, 44);
INSERT INTO post_keys VALUES(15, 36);
INSERT INTO post_keys VALUES(15, 67);
INSERT INTO post_keys VALUES(16, 4);
INSERT INTO post_keys VALUES(16, 73);
INSERT INTO post_keys VALUES(16, 85);
INSERT INTO post_keys VALUES(16, 25);
INSERT INTO post_keys VALUES(16, 64);
INSERT INTO post_keys VALUES(16, 99);
INSERT INTO post_keys VALUES(16, 102);
INSERT INTO post_keys VALUES(16, 26);
INSERT INTO post_keys VALUES(16, 106);
INSERT INTO post_keys VALUES(16, 34);
INSERT INTO post_keys VALUES(16, 65);
INSERT INTO post_keys VALUES(16, 58);
INSERT INTO post_keys VALUES(16, 13);
INSERT INTO post_keys VALUES(16, 44);
INSERT INTO post_keys VALUES(16, 57);
INSERT INTO post_keys VALUES(16, 11);
INSERT INTO post_keys VALUES(16, 83);
INSERT INTO post_keys VALUES(17, 13);
INSERT INTO post_keys VALUES(17, 102);
INSERT INTO post_keys VALUES(17, 24);
INSERT INTO post_keys VALUES(17, 83);
INSERT INTO post_keys VALUES(17, 59);
INSERT INTO post_keys VALUES(17, 41);
INSERT INTO post_keys VALUES(17, 77);
INSERT INTO post_keys VALUES(17, 14);
INSERT INTO post_keys VALUES(17, 40);
INSERT INTO post_keys VALUES(17, 4);
INSERT INTO post_keys VALUES(17, 91);
INSERT INTO post_keys VALUES(17, 60);
INSERT INTO post_keys VALUES(17, 56);
INSERT INTO post_keys VALUES(17, 95);
INSERT INTO post_keys VALUES(17, 12);
INSERT INTO post_keys VALUES(17, 3);
INSERT INTO post_keys VALUES(17, 108);
INSERT INTO post_keys VALUES(17, 69);
INSERT INTO post_keys VALUES(17, 107);
INSERT INTO post_keys VALUES(17, 7);
INSERT INTO post_keys VALUES(17, 39);
INSERT INTO post_keys VALUES(17, 78);
INSERT INTO post_keys VALUES(18, 96);
INSERT INTO post_keys VALUES(18, 106);
INSERT INTO post_keys VALUES(18, 47);
INSERT INTO post_keys VALUES(18, 12);
INSERT INTO post_keys VALUES(19, 69);
INSERT INTO post_keys VALUES(19, 104);
INSERT INTO post_keys VALUES(19, 16);
INSERT INTO post_keys VALUES(19, 30);
INSERT INTO post_keys VALUES(19, 28);
INSERT INTO post_keys VALUES(19, 108);
INSERT INTO post_keys VALUES(19, 66);
INSERT INTO post_keys VALUES(19, 25);
INSERT INTO post_keys VALUES(20, 66);
INSERT INTO post_keys VALUES(20, 61);
INSERT INTO post_keys VALUES(20, 37);
INSERT INTO post_keys VALUES(20, 30);
INSERT INTO post_keys VALUES(20, 15);
INSERT INTO post_keys VALUES(20, 41);
INSERT INTO post_keys VALUES(20, 82);
INSERT INTO post_keys VALUES(20, 34);
INSERT INTO post_keys VALUES(21, 68);
INSERT INTO post_keys VALUES(21, 37);
INSERT INTO post_keys VALUES(21, 81);
INSERT INTO post_keys VALUES(21, 53);
INSERT INTO post_keys VALUES(21, 38);
INSERT INTO post_keys VALUES(21, 72);
INSERT INTO post_keys VALUES(21, 43);
INSERT INTO post_keys VALUES(21, 48);
INSERT INTO post_keys VALUES(21, 42);
INSERT INTO post_keys VALUES(22, 65);
INSERT INTO post_keys VALUES(22, 22);
INSERT INTO post_keys VALUES(22, 106);
INSERT INTO post_keys VALUES(22, 77);
INSERT INTO post_keys VALUES(22, 73);
INSERT INTO post_keys VALUES(22, 96);
INSERT INTO post_keys VALUES(22, 23);
INSERT INTO post_keys VALUES(22, 105);
INSERT INTO post_keys VALUES(22, 89);
INSERT INTO post_keys VALUES(22, 80);
INSERT INTO post_keys VALUES(22, 8);
INSERT INTO post_keys VALUES(22, 18);
INSERT INTO post_keys VALUES(22, 44);
INSERT INTO post_keys VALUES(22, 1);
INSERT INTO post_keys VALUES(22, 97);
INSERT INTO post_keys VALUES(22, 64);
INSERT INTO post_keys VALUES(22, 108);
INSERT INTO post_keys VALUES(22, 63);
INSERT INTO post_keys VALUES(22, 107);
INSERT INTO post_keys VALUES(23, 52);
INSERT INTO post_keys VALUES(23, 28);
INSERT INTO post_keys VALUES(23, 102);
INSERT INTO post_keys VALUES(23, 78);
INSERT INTO post_keys VALUES(23, 36);
INSERT INTO post_keys VALUES(23, 32);
INSERT INTO post_keys VALUES(24, 53);
INSERT INTO post_keys VALUES(24, 57);
INSERT INTO post_keys VALUES(24, 9);
INSERT INTO post_keys VALUES(24, 43);
INSERT INTO post_keys VALUES(25, 10);
INSERT INTO post_keys VALUES(25, 51);
INSERT INTO post_keys VALUES(25, 55);
INSERT INTO post_keys VALUES(25, 96);
INSERT INTO post_keys VALUES(25, 65);
INSERT INTO post_keys VALUES(25, 22);
INSERT INTO post_keys VALUES(25, 27);
INSERT INTO post_keys VALUES(25, 9);
INSERT INTO post_keys VALUES(25, 75);


