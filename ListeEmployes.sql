create database listeemployes;
use listeemployes;
create table employe (
id int(11) not null auto_increment,
courriel varchar(128) not null,
lastName varchar(45) not null,
firstName varchar(45) not null,
age int not null,
position varchar(45),
phone varchar(15),
adress varchar(128),
primary key(id),
unique key id_unique (id),
unique key courriel_unique (courriel)
) engine=InnoDB;

select * from employe;

use bookstore;
create table product (
product_id int(11) not null auto_increment,
name varchar(155) not null,
price float not null,
primary key (product_id)
);

create table product_detail (
id int(11) not null auto_increment,
origin varchar(45),
weight float not null,
part_number varchar(45) not null,
product_id int(11) not null,
 KEY product_fk(product_id),
CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES product (product_id),
primary key (id)

);

select * from product;
select * from product_detail;

create table category (
id int not null auto_increment,
title varchar(256) not null,
primary key (id));

create table post (
id int not null auto_increment,
title varchar(256) not null,
category_id int not null,
primary key (id),
key (category_id),
constraint fk_category 
foreign key (category_id) references category (id));

select * from category;
select * from post;

create table users (
id int not null auto_increment,
username varchar(45) not null,
primary key (id)
);

create table `groups` (
id int not null auto_increment,
name varchar(45) not null,
primary key (id));

create table `groups_users` (
user_id int not null,
group_id int not null,
key fk_user(user_id),
key fk_group (group_id),
constraint fk_user  foreign key (user_id) references users (id),
constraint fk_group foreign key (group_id) references `groups` (id));

select * from `groups` as g left outer join groups_users on g.id = groups_users.group_id left outer join users on users.id = groups_users.user_id where g.name = "admin";

select * from `groups` as g left outer join groups_users on g.id = groups_users.group_id left outer join users on users.id = groups_users.user_id;

create database listeemployes;
use listeemployes;

create table enterprises (
id int not null auto_increment,
name varchar(45) not null,
primary key (id));

create table filiales (
id int not null auto_increment,
name varchar(45) not null,
employe_number int not null,
enterprise_id int not null,
primary key (id),
key (enterprise_id),
constraint fk_enterprise 
foreign key (enterprise_id) references enterprises (id)
);

create table sectors (
id int not null auto_increment,
name varchar(45) not null,
area varchar(45),
primary key (id));

create table `filiales_sectors` (
filiale_id int not null,
sector_id int not null,
key fk_user(filiale_id),
key fk_group (sector_id),
constraint fk_filiale  foreign key (filiale_id) references filiales (id),
constraint fk_sector foreign key (sector_id) references sectors (id));

create table employe (
id int(11) not null auto_increment,
courriel varchar(128) not null,
lastName varchar(45) not null,
firstName varchar(45) not null,
age int not null,
position varchar(45),
phone varchar(15),
adress varchar(128),
sector_id int not null,
primary key(id),
key (sector_id),
constraint fk_sector2 
foreign key (sector_id) references sectors (id)


);








