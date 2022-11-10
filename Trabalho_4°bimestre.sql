
create database sistema;

use sistema;

create table user (
id_user INT auto_increment primary key,
nome VARCHAR(30) not null,
nascimento DATE,
sexo ENUM('M','F'),
peso DECIMAL(5,2),
altura DECIMAL(3,2)
);

INSERT INTO user
(nome, nascimento, sexo, peso, altura)
values
('joao', '2009-03-30','M', '60.54','1.88'),
('gabriel', '2010-04-10','M', '68.54','1.93'),
('hanna', '2022-01-05','F', '50.4','1.55'),
('juliana', '1988-09-23','F', '61.00','1.60'),
('dominick', '2009-11-29','F', '62.54','1.77');

delete from user where id_user = 2;
delete from user_roles where id_user = 2; 
delete from post where id_user = 2; 
select * from user

CREATE TABLE roles (
id_roles INT AUTO_INCREMENT PRIMARY KEY,
nome varchar(30)
);
 
INSERT INTO roles (nome) values ('admin'), ('client'), ('employee');
select * from roles;

create table user_roles(
id_user INT, foreign key(id_user) references user(id_user),
id_roles INT, foreign key(id_roles) references roles(id_roles)
);

insert into user_roles (id_roles, id_user)
values (1,1), (3,2), (2,3), (2,4), (3,5);

select user.id_user, user.nome, roles.nome from user_roles 
join user on user.id_user = user_roles.id_user 
join roles on roles.id_roles = user_roles.id_roles 
where roles.nome = 'admin';


create table post(
id_post INT auto_increment primary key,
title VARCHAR(30),
description TEXT,
id_user INT,
foreign key(id_user) references user (id_user)
);

INSERT INTO post
(title, description, id_user)
values
('eu sou ', 'Uma pessoa bem de humor',  1),
('gosto de ','Gosto de jogar durante a tarde',  1),
('eu sou ','Uma pessoa bem de calma',  2),
('gosto de ','Gosto de dormir durante a tarde',  2),
('eu sou ','Uma pessoa bem de bonita',  3),
('gosto de ','Gosto de estudar bastante',  3),
('eu sou ','Uma pessoa bem de feia',  4),
('gosto de ','Gosto de **** durante a tarde',  4),
('eu sou ','Uma pessoa positava',  5),
('gosto de ','Gosto de cantar',  5)


DELETE FROM post WHERE id_user = 4 LIMIT 2;

select * FROM post WHERE id_user in (3,5);


UPDATE POST
SET  description = 'louca'
WHERE id_user = 1 LIMIT 1;

SELECT * FROM post;
 

