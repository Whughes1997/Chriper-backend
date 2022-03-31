create database c16_chirpr;

use c16_chirpr;

grant all privileges
on c16_chirper.*
to 'username'@'localhost';

create table users (
	id int not null auto_increment primary key,
    name varchar(30) not null,
    email varchar(50) not null,
    password varchar(200) null,
    _created datetime default current_timestamp
);

create table chirps (
	id int not null auto_increment primary key,
	userid int not null,
	content varchar(200) not null,
	location varchar(200) not null,
	_created datetime default current_timestamp
);

create table mentions (
	userid int not null,
    chirpid int not null,
	primary key (userid, chirpid),
    foreign key (userid) references users(id),
    foreign key (chirpid) references chirps(id)
);

ALTER TABLE chirps 
ADD CONSTRAINT fk_users_id
FOREIGN KEY (userid)
REFERENCES users(id);

use c16_chirpr;

create user
'username'@'localhost'
identified by 'password';

INSERT INTO users (name, email, password)
VALUES ("Josh", "j@l.com", "hunter2"),
("Garrett", "k@l.com", "hunter2"),
("Kaley", "k@l.com", "hunter2"),
("Hunter", "k@l.com", "hunter2"),
("Chad", "k@l.com", "hunter2"),
("Brad", "k@l.com", "hunter2"),
("Madd", "k@l.com", "hunter2"),
("Fadd", "k@l.com", "hunter2");

insert into chirps (userid, content, location)
values (1, " of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", "Wisconsin"),
(1, "This is Post 2", "Home"),
(1, "This is Post 3", "Home"),
(1, "This is Post 4", "Home"),
(1, "This is Post 5", "Home"),
(1, "This is Post 6", "Home"),
(1, "This is Post 7", "Home"),
(1, "This is Post 8", "Home"),
(1, "This is Post 9", "Home"),
(1, "This is Post 10", "Home"),
(2, "This is Post 1", "Home"),
(2, "This is Post 2", "Home"),
(2, "This is Post 3", "Home"),
(2, "This is Post 4", "Home"),
(2, "This is Post 5", "Home"),
(2, "This is Post 6", "Home"),
(2, "This is Post 7", "Home"),
(2, "This is Post 8", "Home"),
(2, "This is Post 9", "Home"),
(2, "This is Post 10", "Home"),
(3, "This is Post 1", "Home"),
(3, "This is Post 2", "Home"),
(3, "This is Post 3", "Home"),
(3, "This is Post 4", "Home"),
(3, "This is Post 5", "Home"),
(3, "This is Post 6", "Home"),
(3, "This is Post 7", "Home"),
(3, "This is Post 8", "Home"),
(3, "This is Post 9", "Home"),
(3, "This is Post 10", "Home"),
(4, "This is Post 1", "Home"),
(4, "This is Post 2", "Home"),
(4, "This is Post 3", "Home"),
(4, "This is Post 4", "Home"),
(4, "This is Post 5", "Home"),
(4, "This is Post 6", "Home"),
(4, "This is Post 7", "Home"),
(4, "This is Post 8", "Home"),
(4, "This is Post 9", "Home"),
(4, "This is Post 10", "Home"),
(5, "This is Post 1", "Home"),
(5, "This is Post 2", "Home"),
(5, "This is Post 3", "Home"),
(5, "This is Post 4", "Home"),
(5, "This is Post 5", "Home"),
(5, "This is Post 6", "Home"),
(5, "This is Post 7", "Home"),
(5, "This is Post 8", "Home"),
(5, "This is Post 9", "Home"),
(5, "This is Post 10", "Home"),
(6, "This is Post 1", "Home"),
(6, "This is Post 2", "Home"),
(6, "This is Post 3", "Home"),
(6, "This is Post 4", "Home"),
(6, "This is Post 5", "Home"),
(6, "This is Post 6", "Home"),
(6, "This is Post 7", "Home"),
(6, "This is Post 8", "Home"),
(6, "This is Post 9", "Home"),
(6, "This is Post 10", "Home"),
(7, "This is Post 1", "Home"),
(7, "This is Post 2", "Home"),
(7, "This is Post 3", "Home"),
(7, "This is Post 4", "Home"),
(7, "This is Post 5", "Home"),
(7, "This is Post 6", "Home"),
(7, "This is Post 7", "Home"),
(7, "This is Post 8", "Home"),
(7, "This is Post 9", "Home"),
(7, "This is Post 10", "Home"),
(8, "This is Post 1", "Home"),
(8, "This is Post 2", "Home"),
(8, "This is Post 3", "Home"),
(8, "This is Post 4", "Home"),
(8, "This is Post 5", "Home"),
(8, "This is Post 6", "Home"),
(8, "This is Post 7", "Home"),
(8, "This is Post 8", "Home"),
(8, "This is Post 9", "Home"),
(8, "This is Post 10", "Home");

insert into mentions(userid, chirpid)
values (1, 103),
(2, 103);

select chirps.*
from chirps
join mentions
on chirps.id = mentions.chirpid
where mentions.userid = 2;

select * from users;

select chirps.content, chirps.location, chirps._created, users.name
from chirps
join users on chirps.userid = users.id
where users.id = 1; 

ALTER USER 'username'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password'