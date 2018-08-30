/* 
username = 'data607'
password = 'project3'
dbname = 'dataScienceSkills'
host = 'data607-project3.ce2dfe0qxt5q.us-west-2.rds.amazonaws.com'
*/

DROP TABLE IF EXISTS skill_names;

CREATE TABLE skill_names
(
	skill_id int NOT NULL AUTO_INCREMENT,
    skill_name varchar(100) NOT NULL,
    PRIMARY KEY (skill_id),
    UNIQUE (skill_name)
);


DROP TABLE IF EXISTS category_names;

CREATE TABLE category_names
(
	category_id int NOT NULL AUTO_INCREMENT,
    category_name varchar(100) NOT NULL
    CHECK (category_name IN ('Soft Skill', 'Hard Skill')),
    PRIMARY KEY (category_id)
);


DROP TABLE IF EXISTS skill_count;

CREATE TABLE skill_count
(
	skill_id int NOT NULL,
    skill_count int NOT NULL,
    count_source varchar(100),
    FOREIGN KEY (skill_id) REFERENCES skill_names(skill_id)
);

SELECT * FROM skill_names;

