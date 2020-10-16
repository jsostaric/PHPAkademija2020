drop database if exists homework;
create database homework
    character set utf8mb4
        collate utf8mb4_unicode_ci;
use homework;

#mysql -uroot -p --default_character_set=utf8mb4 < c:\xampp\htdocs\PHPAcademyHomework4\script.sql

drop trigger if exists trigger_insert_members;

create table genres(
    id int not null primary key auto_increment,
    name varchar(255) not null
);

create table cities(
    id int not null primary key auto_increment,
    post_code int not null,
    name varchar(255) not null
);

create table media(
    id int not null primary key auto_increment,
    name varchar(255) not null
);

create table movies(
    id int not null primary key auto_increment,
    title varchar(255) not null,
    media int not null
);

create table members(
    id int not null primary key auto_increment,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    address varchar(255) not null,
    is_active int default 1,
    cities int not null
);

create table genres_movies(
    id int not null primary key auto_increment,
    genres int not null,
    movies int not null
);

create table members_movies(
    id int not null primary key auto_increment,
    members int not null,
    movies int not null,
    day_of_rent datetime not null,
    day_of_return datetime
);

create trigger trigger_insert_members
    before insert on members
    for each row
    set new.first_name = upper(new.first_name);

#add foreign keys
alter table movies add foreign key(media) references media(id) on delete cascade;

alter table genres_movies add foreign key(genres) references genres(id) on delete cascade;
alter table genres_movies add foreign key(movies) references movies(id) on delete cascade;

alter table members add foreign key(cities) references cities(id) on delete cascade;

alter table members_movies add foreign key(members) references members(id);
alter table members_movies add foreign key(movies) references movies(id);


#inserts
insert into genres(name)
        values('Action'),
                ('Adventure'),
                ('Drama'),
                ('Fantasy'),
                ('War'),
                ('Mystery'),
                ('Thriller'),
                ('Comedy'),
                ('Sci-fi'),
                ('Crime'),
                ('Romance'),
                ('Horror');

insert into media(name)
        values('CD'),
                ('DVD'),
                ('VHS'),
                ('Betamax');

insert into cities(post_code, name)
        values(31000, 'Osijek'),
                (32000, 'Vukovar'),
                (10000, 'Zagreb'),
                (48000, 'Koprivnica'),
                (44000, 'Sisak'),
                (40000, 'Čakovec'),
                (51000, 'Rijeka'),
                (21000, 'Split'),
                (31400, 'Đakovo'),
                (23000, 'Zadar');

insert into movies(title, media) values('Casablanca', 3),
                                ('Avengers', 2),
                                ('Serenity', 2),
                                ('Seven Samurai', 1),
                                ('Pulp Fiction', 1),
                                ('Fifth Element', 3),
                                ('Big Fish', 1),
                                ('Cowboy Bebop', 3),
                                ('The Good, The Bad and The Ugly', 2),
                                ('Shawshank Redemption', 2),
                                ('Pink Panther', 3),
                                ('Going Postal', 1),
                                ('Escape From New York', 3);

insert into members(first_name, last_name, address, cities)
        values('Ana', 'Anić', 'Fiktivna adresa 35', 6),
                ('Bruno', 'Brunić', 'adresa broj 15', 2),
                ('Cecilija', 'Celić', 'ulica strahova 22', 4),
                ('Ivan', 'Ivić', 'Radićeva 57', 8),
                ('Pero', 'Perić', 'Gundulićeva 42', 6),
                ('Doonie', 'Darko', 'Jelačićeva 50', 10),
                ('Malcolm', 'Reynolds', 'Strossmayerova 5', 1),
                ('Cohen', 'The Barbarian', 'Trg Grgura Ninskog 2', 3),
                ('Rincewind', 'The Wizard', 'Dravska 221', 5),
                ('Arthur', 'Dent', 'Restoran na kraju univerzuma bb', 7),
                ('Marko', 'Marić', 'Striborova 15', 3),
                ('Sam', 'Verner', 'Rooseveltova 105', 2);

insert into genres_movies(genres, movies)
        values(1,1),
                (1,2),
                (3,13),
                (11,12),
                (5,3),
                (5,5),
                (7,4),
                (12,4),
                (1,11),
                (5,6),
                (5,8),
                (4,7),
                (4,9),
                (10,10);

insert into members_movies(members, movies, day_of_rent, day_of_return)
        values(
            2,1,now(), FROM_UNIXTIME(
                            UNIX_TIMESTAMP(now())
                            + FLOOR(0 + (RAND() * 604800)))
        ),
        (
            5,3,now(), FROM_UNIXTIME(
                            UNIX_TIMESTAMP(now())
                            + FLOOR(0 + (RAND() * 604800)))
        ),
        (
            7,9,now(), FROM_UNIXTIME(
                            UNIX_TIMESTAMP(now())
                            + FLOOR(0 + (RAND() * 604800)))
        ),
        (
            12,5,now(), FROM_UNIXTIME(
                            UNIX_TIMESTAMP(now())
                            + FLOOR(0 + (RAND() * 604800)))
        ),
        (
            8,8,now(), FROM_UNIXTIME(
                            UNIX_TIMESTAMP(now())
                            + FLOOR(0 + (RAND() * 604800)))
        );

#statements
#10 select, 5 update, 5 delete
#use 5 joins and 5 built-in functions

# show member with name Cohen
select * from members where first_name = 'Cohen';

#show fullname of memebers in city of Zagreb
select concat(a.first_name, ' ', a.last_name) as fullname, b.name
    from members a
    inner join cities b on a.cities=b.id where b.name = 'Zagreb';

#how many members rented movies in city of Vukovar
select count(d.name)
    from movies a
    inner join members_movies b on a.id=b.movies
    inner join members c on c.id=b.members
    inner join cities d on d.id=c.cities where d.name = 'Vukovar';

#show title, member, when was last movie returned and how long did it take to return it
select a.title, c.first_name, c.last_name,b.day_of_return, datediff(b.day_of_return, b.day_of_rent) as numberOfDays
    from movies a
    inner join members_movies b on a.id=b.movies
    inner join members c on c.id=b.members
    order by day_of_return desc limit 1;

# what is average time of movies rental in days
select avg(datediff(day_of_return, day_of_rent)) as AverageDaysOfRental
    from members_movies;

# how many movies are on specific media
select b.name, count(a.id) as NumberOfMovies
    from movies a
    right join media b on a.media=b.id
    group by b.name desc;

#show movies with their genres
select a.title, group_concat(c.name) as genre
    from movies a
    right join genres_movies b on a.id=b.movies
    inner join genres c on c.id=b.genres group by a.title;

#how many movies are in every genre
select a.name, count(c.id) as moviesInGenres
    from genres a
    left join genres_movies b on a.id=b.genres
    left join movies c on c.id=b.movies
    group by a.id;

#memebers that did not rent movie
select a.first_name, a.last_name
    from members a
    left join members_movies b on a.id=b.members
    left join movies c on c.id=b.movies
    where c.title is null;


#show members and movies they rented and are active members
select a.title, concat(c.first_name, ' ', c.last_name) as fullname, b.day_of_rent as dayOfRent
    from movies a
    inner join members_movies b on a.id=b.movies
    inner join members c on c.id=b.members
    where c.is_active != 0;

#updates
update members set is_active = 0
    where id in(1,3,4,6,9,10,11);

update cities set post_code = 49000, name = 'Krapina'
    where id = (select id from cities where name='Sisak');

update movies set title = replace(title, 'Seven Samurai', 'Ran');

update cities set name = upper(name);

update movies set media = 4 where title = 'Pink Panther';

#deletes
delete from media where name = 'Betamax';

delete from movies where id = 11;

delete from members_movies where members = (select id from members where id = 12);

delete from members where first_name = 'Rincewind' and last_name = 'The Wizard';

delete from members where is_active = 0;
