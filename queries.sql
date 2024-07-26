-- Create a DB with the following tables / columns:
-- philosopher
--  id (PK)
--  name (unique)
--  bio
--  date_of_birth
--  date_of_death
--  image_url
-- quote
--  id (PK)
--  philosopher_id (FK)
--  content

create table philosopher (
    id int not null auto_increment,
    name varchar(255) unique not null,
    bio varchar(255),
    date_of_birth int,
    date_of_death int,
    image_url varchar(255),
    primary key (id)
);

create table quote (
    id int not null auto_increment,
    philosopher_id int,
    content varchar(255),
    primary key (id),
    foreign key (philosopher_id) references philosopher(id) on delete cascade
);

insert into philosopher (name, bio, date_of_birth, date_of_death, image_url) values
    ("Socrates", "Socrates was a hugely important Greek philosopher from the Classical period. Unlike most of the Pre-Socratic philosophers who came before him, who were much more interested in establishing how the world works, Socrates was more concerned with how people should behave, and so was perhaps the first major philosopher of Ethics.", -469, -399, "https://www.philosophybasics.com/photos/socrates.jpg"),
    ("Ludwig Wittgenstein", "Ludwig Josef Johann Wittgenstein was an Austrian philosopher and logician, and has come to be considered one of the 20th Century's most important philosophers, if not the most important.", 1889, 1951, "https://www.philosophybasics.com/photos/wittgenstein.jpg"),
    ("William of Ockham", "William of Ockham was an English Franciscan friar, philosopher and theologian of the Medieval period.", 1285, 1348, "https://www.philosophybasics.com/photos/ockham.jpg");

insert into quote (philosopher_id, content) values 
    (1, "The unexamined life is not worth living"),
    (2, "Whereof one cannot speak, thereof one must be silent"),
    (3, "Entities should not be multiplied unnecessarily"),
    (1, "There is only one good, knowledge, and one evil, ignorance"),
    (2, "Philosophy is a battle against the bewitchment of our intelligence by means of language");

DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `w21b`.`new_philosopher`(name_input varchar(255), bio_input varchar(255), date_of_birth_input int, date_of_death_input int, image_url_input varchar(255))
begin
    insert into philosopher (name, bio, date_of_birth, date_of_death, image_url) values (name_input, bio_input, date_of_birth_input, date_of_death_input, image_url_input);
    select id from quote order by id desc limit 1
end$$
DELIMITER ;

create procedure get_all_philosopher()
    select * from philosopher;

DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `w21b`.`new_quote`(philosopher_id_input int, content_input varchar(255))
begin
    insert into quote (philosopher_id, content) values (philosopher_id_input, content_input);
    select id from quote order by id desc limit 1
end$$
DELIMITER ;

create procedure get_philosopher_quote(philosopher_id_input int)
    select * from quote where philosopher_id = philosopher_id_input;

-- select id from quote order by id desc limit 1;

