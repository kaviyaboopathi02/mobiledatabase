create database movies;
use movies;
# movie table
create table movie(
movie_id int primary key ,movie_name varchar(30) not null,
tittle varchar(30),release_year int,
director_id int ,actor_id int );

# actor table
create table actor(
actor_id int primary key,
actor_name varchar (30) not null,movie_id int,
foreign key (movie_id) references movie(movie_id));

# director table
create table director(
direc_id int primary key,
direc_name varchar (40),
movie_id int,
foreign key (movie_id) references movie(movie_id));

#review table
create table reviews_s(
 review_id INT primary key auto_increment,
    movie_id INT,
    reviewer_name VARCHAR(255),
    review_text TEXT,
    review_rating int,
   foreign key (movie_id) references movie(movie_id));


#genres table
create table genres(
movie_id int,
 genre_name VARCHAR(50) NOT NULL ,
  foreign key (movie_id) references movie(movie_id)
);

#  insert movie table 
       insert into movie (movie_id,movie_name,tittle,release_year ,director_id,actor_id) values
( 1,'kutti','Thriller',2004,101,2),
(2,'jailer','drama',2012,103,3),
( 3,'doctor','heist action',2024,101,4),
( 4,'varisu','family action',2004,105,5),
( 5,'thunivu','advanture',2013,109,4),
( 6,'viduthalai','sports drama',2024,101,2),
( 7,'good nigght','action fantasy',2002,103,5),
( 8,'kanguva','horror',2015,109,4),
( 9,'japan','action drama',2000,103,5),
( 10,'mark antony','psychological action',2009,105,3),
( 11,'aylaan','shock adventure',2018,103,3),
( 12,'captain','sports vlog',2022,109,2);
# actor insert table
insert into actor (actor_id,actor_name, movie_id) values
(2,'naveen',3),
(3,'mouli',2),
(4,'abi',1),
(5,'vijay',4);
#director insert table
insert into director(direc_id,direc_name,movie_id) values
(101,'ajith',1),
(103,'kumar',3),
(105,'boopathi',4),
(109,'surya',2);

#review insert table
insert into reviews_s( movie_id,reviewer_name,review_text,review_rating) values
(2, 'kaviya', 'Nice and family movie', 80),
(4, 'deepa', 'Very poor movie', 20),
(7, 'naveen', 'Thrilling mass movie', 90),
(9, 'janani', 'Not worth watching', 40),
(12, 'dhanush', 'Excellent, wow!', 70);

#genre insert table
insert into genres(movie_id ,genre_name) values 
(2, 'Family'),
(2, 'Drama'),
(4, 'Horror'),
(4, 'Thriller'),
(7, 'Action'),
(7, 'Thriller'),
(9, 'Comedy'),
(9, 'Drama'),
(12, 'Action'),
(12, 'Adventure');

#select all table 
select * from movie;
select * from actor;
select * from director;
select * from reviews_s;
select * from genres;

#joins

select r.review_id ,r.reviewer_name,r.review_text,r.review_rating,g.genre_name
from reviews_s r inner join genres g
on r.movie_id=g.movie_id;

select m.movie_name,m.tittle,m.release_year,a.actor_name
from movie m inner join actor a
on m.movie_id=a.movie_id;

/* QUERIES */
select * from movie
where movie_id=2;

SELECT m.movie_name, m.tittle, m.release_year
FROM movie m
WHERE m.movie_id
 in (
    SELECT r.movie_id 
    FROM reviews_s r
    WHERE r.review_rating > 50
);

SELECT d.direc_id ,d.direc_name
FROM director d 
WHERE d.direc_name = 'ajith';

# stored procedure 

/* fetch the Stored Procedure to Get High-Rated Movies */
DELIMITER //
CREATE PROCEDURE GetHighRatedMovies(IN min_rating INT)
BEGIN
    SELECT m.movie_id, m.movie_name, m.tittle, r.review_rating
    FROM movie m
    INNER JOIN reviews_s r ON m.movie_id = r.movie_id
    WHERE r.review_rating > min_rating;
end//
DELIMITER ;
 
 /* fetch the Stored Procedure to Insert a New Actor*/
DELIMITER //
CREATE PROCEDURE AddActor(IN actorID INT, IN actorName VARCHAR(30), IN movieID INT)
BEGIN
    INSERT INTO actor (actor_id, actor_name, movie_id)
    VALUES (actorID, actorName, movieID);
END //
DELIMITER ;

/*  fetch the stored Procedure to Find Actors in a Specific Movie*/

DELIMITER //
CREATE PROCEDURE GetActorsByMovie(IN movieName VARCHAR(30))
BEGIN
    SELECT a.actor_id, a.actor_name
    FROM actor a
    INNER JOIN movie m ON a.movie_id = m.movie_id
    WHERE m.movie_name = movieName;
END //

DELIMITER ;

#called subquery
CALL GetHighRatedMovies(70);
CALL AddActor(6,'sam',5);
CALL GetActorsByMovie('varisu');

#update

update director 
set direc_name = 'Steven Spielberg' 
where movie_id = 3;

UPDATE reviews_s 
set review_rating = review_rating + 10 
where movie_id IN (
    select movie_id 
    from movie 
    where release_year > 2010
);
