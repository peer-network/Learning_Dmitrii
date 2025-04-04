CREATE DATABASE db
ENCODING 'UTF8';

create table users (
	userid UUID PRIMARY KEY,
	user_name varchar(23) NOT NULL,
    user_password varchar(202) NOT NULL,
    user_email varchar(102) UNIQUE
);

create table posts (
	user_id UUID,
	post_id UUID PRIMARY KEY,
	title varchar(32),
	content varchar(255),
	content_type varchar(13) CHECK(content_type in ('text','image','video','audio')),
	constraint fk_users FOREIGN KEY(user_id)  references users(userid) ON DELETE CASCADE
);

insert into users (
	userid,
	user_name,
	user_password,
    user_email)
values (
	'28a194fd-6db1-43ca-8811-51942fe52d84',
	'username1',
	md5('пароль123'),
	'email1'
);


insert into posts (
	user_id,
	post_id,
	title,
	content,
	content_type)
values (
	'28a194fd-6db1-43ca-8811-51942fe52d84',
	'a3c0230b-fcff-465c-8db2-be2e99e896bd',
	'title1',
	'content of the post',
	'text'
	);

update users
set user_name = 'username1.1',user_password = md5('пароль123_2')
where userid = '28a194fd-6db1-43ca-8811-51942fe52d84';


delete from users
where user_name = 'username1.1'