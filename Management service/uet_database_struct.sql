drop database uet;

create database uet;

use uet;

create table user (
id int(50) primary key,
name text,
email text,
photo_url text
);

create table class(
id int(50) primary key,
name text,
start_date timestamp,
description text,
owner_id int(50),
address text,
private boolean,
foreign key (owner_id) REFERENCES user(id)
);

create table groups(
id int(50) primary key,
name text,
description text,
size int(3)
);

create table schedule (
id int(50) primary key auto_increment,
title text,
description text,
exprire_date timestamp
);
/* owner_id: la nguoi tao ra notification nay
	scope: "class" hoac "group" - pham vi ma notification hoat dong
*/

create table notification(
id int(50) primary key auto_increment,
type text,
message text,
create_date timestamp,
owner_id int(50),
scope varchar(20)
);

create table user_class(
id int(50) primary key auto_increment,
student_id int(50),
class_id int(50),
foreign key (student_id) REFERENCES user(id),
foreign key (class_id) REFERENCES class(id)
);

create table user_group(
id int(50) primary key auto_increment,
student_id int(50),
group_id int(50),
foreign key (student_id) REFERENCES user(id),
foreign key (group_id) REFERENCES groups(id)
);
