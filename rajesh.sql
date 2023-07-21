--Database creation
create database movie;
use movie;

--Creating and storing values in tables
create table directors(director_id varchar(50) primary key,director_name varchar(50));
insert into directors values("V1","Vamsi Paidipally"),("PS1","P S Mithran"),("VV2","V V Vinayak"),("PR1","Prasanth Varma");
select * from directors;

create table movies(movie_id int(10) primary key,title varchar(50),release_year int(4),director_id varchar(10),foreign key(director_id) references directors(director_id));
insert into movies values(5,"Varidu",2020,"V1"),(11,"SARDAR",2023,"PS1"),(1,"Nayak",2011,"VV2"),(14,"Zombie REddy",2019,"PR1");
select * from movies;

create table genres(genre_id varchar(10) primary key,genre_name varchar(30));
insert into genres values("G1","Action,Romance"),("G2","Action,Triller"),("G3","Romance");
select * from genres;

create table movie_genres(movie_id int(10),genre_id varchar(10),foreign key(movie_id) references movies(movie_id),foreign key(genre_id) references genres(genre_id));
insert into movie_genres values(10,"G1"),(11,"G2"),(12,"G3"),(13,"G1");
select * from movie_genres;

--Task1
select m.title,d.director_name from movies m,directors d where m.director_id=d.director_id;

--Task2
select m.title,m.release_year,d.director_name from movies m join directors d on m.director_id=d.director_id;

--Task3
select d.director_name,m.title from directors d join movies m on d.director_id=m.director_id;

--Task4
select m.title,m.release_year,d.director_name from movies m join directors d on m.director_id=d.director_id and d.director_name!="";

--Task5
select m.title,g.genre_name from movies m join movie_genres mg on m.movie_id=mg.movie_id join genres g on mg.genre_id=g.genre_id;