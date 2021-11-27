
###########################################################
#
#                 SQL BASIC QUERIES
#
#               @Author: TuringMach1ne
#
###########################################################

.headers yes
.mode column

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species
VARCHAR(20), sex CHAR(1), checkups SMALLINT UNSIGNED, birth DATE,
death DATE);

INSERT INTO pet (name,owner,species,sex,checkups,birth,death)VALUES
('Fluffy','Harold','cat','f',5,'2001-02-04',''),
('Claws','Gwen','cat','m',2,'2000-03-17',''),
('Buffy','Harold','dog','f',7,'1999-05-13',''),
('Fang','Benny','dog','m',4,'2000-08-27',''), 
('Bowser','Diane','dog','m',8,'1998-08-31','2001-07-29'),
('Chirpy','Gwen','bird','f',0,'2002-09-11',''),
('Whistler','Gwen','bird','',1,'2001-12-09',''),
('Slim','Benny','snake','m',5,'2001-04-29','');

.print 'THE TABLE SCHEMA IS:'
.schema
.print
.print '---------QUESTIONS-----------'
.print
.print '---START OF THE 1ST SECTION---'
.print
.print 'Q1-1. The names of owners and their pet"s name for all pets who are female.'
/*Question 1-1*/
.print
SELECT name, owner FROM pet WHERE sex = "f";

.print
.print 'Q1-2. The names and birth dates of pets which are dogs.'
.print

/*Question 1-2*/
SELECT name, birth FROM pet WHERE species = "dog";

.print
.print 'Q1-3. The names of the owners of birds.'
.print

/*Question 1-3 The names of the owners of birds. DISTINCT command is used assuming two Gwen's are the same person*/
SELECT DISTINCT owner FROM pet WHERE species = "bird";

.print
.print 'Q1-4. The species of pets who are female.'
.print

/*Question 1-4*/
SELECT species FROM pet WHERE sex = "f";

.print
.print 'Q1-5. The names and birth dates of pets which are cats or birds.'
.print

/*Question 1-5*/
SELECT name, birth FROM pet WHERE species IN ('cat', 'bird');

.print
.print 'Q1-6. The names and species of pets which are cats or birds and which are female.'
.print

/*Question 1-6*/
SELECT name, species FROM pet WHERE species IN('cat', 'bird') AND sex = "f";

.print
.print '---START OF THE 2ND SECTION---'

.print
.print 'Q2-1. The names of owners and their pets where the pet''s name ends with “er” or “all”'
.print
/*Question 2-1*/
SELECT owner, name FROM pet WHERE name LIKE '%er' OR name LIKE '%all';

.print
.print 'Q2-2. The names of any pets whose owner"s name contains an "e"'
.print
/*Question 2-2*/
SELECT name FROM pet WHERE owner LIKE '%e%';

.print
.print 'Q2-3. The names of all pets whose name does not end with "fy"'
.print
/*Question 2-3*/
SELECT name FROM pet WHERE name NOT LIKE '%fy';

.print
.print 'Q2-4. All pet names whose owners name is only four characters long'
.print
/*Question 2-4*/
SELECT name FROM pet WHERE owner LIKE '____';

.print
.print 'Q2-5. All owners whose names begin and end with one of the first five letters of the alphabet'
.print
/*Question 2-5 NOTE: While using BETWEEN command, the first letter is inclusive and the second letter is exclusive. This query finds ABCDE*/
SELECT owner FROM pet WHERE owner BETWEEN 'A' AND 'F';

.print
.print 'Q2-6. Repeat the previous query, but make the query sensitive to the case of letters of the alphabet thecharacters in the name'
.print
/*Question 2-6 NOTE: While using BETWEEN command, the first letter is inclusive and the second letter is exclusive. This query finds ABCDE and/or abcde*/
SELECT owner FROM pet WHERE owner BETWEEN 'A' AND 'F' OR (owner BETWEEN 'a' AND 'f');

.print
.print
.print '---START OF THE 3RD SECTION---'
.print

.print 'Q3-1. The average number of check-ups that each owner has made with their pets'
.print
/*Question 3-1*/
SELECT owner, AVG(checkups) AS AvgCheckups FROM pet GROUP BY owner;
.print

.print 'Q3-2. The number of pets of each species in ascending order'
.print
/*Question 3-2 NOTE: ORDER BY assumes ascending order by default*/
SELECT species, COUNT(species) AS NoOfPets FROM pet GROUP BY species ORDER BY NoOfPets;
.print

.print 'Q3-3. The number of pets of each species that each owner has'
.print
/*Question 3-3*/
SELECT owner, species, COUNT(species) AS NoOfPets FROM pet GROUP BY species, owner ORDER BY owner;
.print

.print 'Q3-4. The number of distinct species of pet each owner has'
.print
/*Question 3-4*/
SELECT owner, COUNT(DISTINCT species) AS NoOfDistinctPets FROM pet GROUP BY owner;
.print

.print 'Q3-5. The number of pets of each gender there are in the database, where the gender is known'
.print
/*Question 3-5 NOTE: Null datatype possibility is assumed. != is used instead of NOT LIKE to create leaner code. Only possible sexes are not limited to m and f in this example.*/
SELECT sex, COUNT(species) AS NoOfSpecies FROM pet WHERE sex IS NOT NULL AND sex != '' GROUP BY sex;
.print

.print 'Q3-6. The number of birds each owner has'
.print
/*Question 3-6 NOTE: Owners with "0" birds are not included to prevent redundancy*/
SELECT owner, COUNT(species) AS NoOfBirds FROM pet WHERE species LIKE 'bird' GROUP BY owner;
.print

.print 'Q3-7. The total number of check-ups each owner has made with all their pets'
.print
/*Question 3-7*/
SELECT owner, SUM(checkups) AS NoOfCheckUps FROM pet GROUP BY owner;
.print
