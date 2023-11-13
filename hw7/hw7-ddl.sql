# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

DROP TABLE IF EXISTS skills;
CREATE TABLE skills(
    id int NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL DEFAULT ('default description'),
    tag varchar(255) NOT NULL,
    url varchar(255) DEFAULT NULL,
    time_commitment int DEFAULT NULL,
    PRIMARY KEY (id)
);

-- SELECT * FROM skills;

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills(id, name, tag) values
(1, 'kick boxing', 'Skill 1'),
(2, 'python coding','Skill 2'),
(3, 'cooking', 'Skill 3'),
(4, 'dancing', 'Skill 4'),
(5, 'playing piano','Skill 5'),
(6, 'cleaning','Skill 6'),
(7, 'magician', 'Skill 7'),
(8, 'solving rubix cube', 'Skill 8');


-- SELECT * FROM skills;

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id int not null,
    first_name varchar(255),
    last_name varchar(255) not null,
    email varchar(255),
    linkedin_url varchar(255),
    headshot_url varchar(255),
    discord_handle varchar(255),
    brief_bio varchar(255) DEFAULT ('default brief bio'),
    date_joined date not null,
    PRIMARY KEY (id)
);

-- SELECT * FROM people;

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, date_joined) values 
(1,'Violet', 'Person 1', 'violet02@gmail.com','linkedin.com/in/violet02' ,'headshot.com/violet02','violet02', '2023-11-06'),
(2,'Janet','Person 2', 'jj8@gmail.com', 'linkedin.com/in/jj8','headshot.com/jj8', 'jj8','2023-03-04'),
(3,'Lee','Person 3', 'lee@gmail.com', 'linkedin.com/in/lee', 'headshot.com/lee', 'leelee', '2021-03-30'),
(4,'Michael','Person 4', 'mj@gmail.com', 'linkedin.com/in/michaelj23', 'headshot.com/mj', 'mjbb23', '2022-02-17'),
(5,'Sasha','Person 5', 'sashaoh@gmail.com', 'linkedin.com/in/sashaoh15', 'headshot.com/sashaoh15', 'sashaoh15', '2020-03-10'),
(6,'Sakura','Person 6', 'harunosaku@gmail.com', 'linkedin.com/in/sakuraharuno', 'headshot.com/sakuraharuno', 'harunosakuranbo', '2019-01-01'),
(7,'George','Person 7', 'gharrison@gmail.com', 'linkedin.com/in/gharrison', 'headshot.com/gharrison', 'gharrison43', '2021-12-25'),
(8,'Jungkook','Person 8', 'jungkookie@gmail.com', 'linkedin.com/in/jk97', 'headshot.com/jk', 'jk97', '2009-09-01'),
(9,'Marianne','Person 9', 'mari03@gmail.com', 'linkedin.com/in/mari03', 'headshot.com/mari03', 'mari03','2023-05-18'),
(10,'Connell','Person 10', 'connell02@gmail.com', 'linkedin.com/in/conell02', 'headshot.com/conell02', 'conell02','2022-12-18');


-- SELECT * FROM people;


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills(
    id int not null auto_increment,
    skills_id int not null,
    people_id int not null,
    date_acquired date not null default (current_date),
    PRIMARY KEY (id),
    FOREIGN KEY (skills_id) REFERENCES skills(id) on delete cascade,
    FOREIGN KEY (people_id) REFERENCES people(id) on delete cascade,
    unique(skills_id, people_id)
);

-- SELECT * FROM peopleskills;
-- SELECT count(*) from peopleskills;


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT into peopleskills(people_id, skills_id) values
(1, 1), 
(1, 3), 
(1, 6),
(2, 3), 
(2, 4), 
(2, 5),
(3, 1), 
(3, 5), 
(5, 3), 
(5, 6), 
(6, 2),
(6, 3), 
(6, 4), 
(7, 3),
(7, 5), 
(7, 6), 
(8, 1),
(8, 3), 
(8, 5), 
(8, 6),
(9, 2),
(9, 5),
(9, 6),
(10, 1), 
(10, 4),
(10, 5);

-- SELECT * FROM peopleskills;

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles(
    id int not null,
    name varchar(255) not null,
    sort_priority int not null,
    PRIMARY KEY (id)
);

-- SELECT * FROM roles;


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT into roles (id, name, sort_priority) values
( 101, 'Designer', 10),
( 102, 'Developer', 20),
( 103, 'Recruit', 30),
( 104, 'Team Lead', 40),
( 105, 'Boss', 50),
( 106, 'Mentor', 60);

-- SELECT * FROM roles;


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles(
    id int not null auto_increment,
    people_id int not null,
    role_id int not null,
    date_assigned date not null default (current_date),
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id) on delete cascade,
    FOREIGN KEY (role_id) REFERENCES roles(id) on delete cascade,
    unique(people_id, role_id)
);

-- SELECT * FROM peopleroles;


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id) values
(1, 102),
(2, 105),
(2, 106),
(3, 102),
(3, 104),
(4, 103),
(5, 103),
(6, 102),
(6, 101),
(7, 101),
(8, 101),
(8, 104),
(9, 102),
(10, 101),
(10, 102);

-- SELECT * FROM peopleroles;
