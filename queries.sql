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