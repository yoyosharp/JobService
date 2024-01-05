drop database if exists prj321_asm02;
create database prj321_asm02 charset 'utf8mb4';
use prj321_asm02;

drop table if exists role;
create table role(
	id int auto_increment,
    role_name varchar(50),
    primary key(id)
);

insert into role(role_name)
values ('ROLE_USER'), ('ROLE_EMPLOYER'), ('ROLE_EMPLOYEE');

drop table if exists category;
create table category(
	id int not null auto_increment,
    name varchar(50),
    applied_number int default 0,
    primary key(id)
);
insert into category(name, applied_number)
values ('Java', floor(rand() * 1000)),
		('PHP', floor(rand() * 1000)),
		('C', floor(rand() * 1000)),
		('C++', floor(rand() * 1000)),
		('Python', floor(rand() * 1000)),
		('HTML/CSS', floor(rand() * 1000)),
		('JavaScript', floor(rand() * 1000)),
        ('Angular', floor(rand() * 1000)),
        ('Beauty', floor(rand() * 1000)),
        ('Health', floor(rand() * 1000)),
        ('Logistic', floor(rand() * 1000)),
        ('Sale', floor(rand() * 1000)),
        ('Education', floor(rand() * 1000)),
        ('Import/Export', floor(rand() * 1000)),
        ('Insurance', floor(rand() * 1000)),
        ('E-commerce', floor(rand() * 1000)),
        ('Marketing', floor(rand() * 1000)),
        ('Digital Content', floor(rand() * 1000)),
        ('Real Estate', floor(rand() * 1000));

drop table if exists `type`;
create table `type`(
	id int not null auto_increment,
    name varchar(50),
    primary key(id)
);
insert into `type`(name)
values ('Full-time'), ('Part-time'), ('Freelancer'), ('Internship'), ('Temporary') ;

drop table if exists user;
create table user(
	id int not null auto_increment,
    email varchar(255),
    password varchar(68) not null,
    name varchar(255),
    phone_number varchar(20),
    address varchar(255),
    image varchar(255) default '',
    company_id int default 0,
    cv_id int,
    description varchar(255),
    status int,
    primary key(id)
);

insert into user(email, password, name, status)
values ('datndfx23121@funix.edu.vn', '$2a$10$ME2L8/JbLPoRwWJBsP60GOfWHZ5HmpMe9DzLHCSB1hbIWAhGp/hki', 'Nguyễn Đức Đạt', 1),
		('tuyendung@company.org', '$2a$10$fuSnXPKWHLOahIf7kfzBA.v5yF5c5kWBrLRaoraJ.hXp2xPO/.luS', 'Demo Employer 1', 1),
		('user1@localhost.local', '$2a$10$1.CuU97pRaM3FQe0TC91vOCdu50N/DzRJ6.z/Bw29fk3Jbu.Vuy4u', 'Demo User 1', 1),
        ('user2@gmail.com', '$2a$10$2IsoZnBRs1kzSW05KfKHquprC2muvXmBDSVjSRsTLflTOAP8eLoYW', 'Demo User 2', 1),
        ('user3@localhost.local', '$2a$10$1.CuU97pRaM3FQe0TC91vOCdu50N/DzRJ6.z/Bw29fk3Jbu.Vuy4u', 'Demo User 3', 1),
        ('user4@localhost.local', '$2a$10$1.CuU97pRaM3FQe0TC91vOCdu50N/DzRJ6.z/Bw29fk3Jbu.Vuy4u', 'Demo User 4', 1),
        ('user5@localhost.local', '$2a$10$1.CuU97pRaM3FQe0TC91vOCdu50N/DzRJ6.z/Bw29fk3Jbu.Vuy4u', 'Demo User 3', 1),
        ('user6@localhost.local', '$2a$10$1.CuU97pRaM3FQe0TC91vOCdu50N/DzRJ6.z/Bw29fk3Jbu.Vuy4u', 'Demo User 3', 1),
        ('user7@localhost.local', '$2a$10$1.CuU97pRaM3FQe0TC91vOCdu50N/DzRJ6.z/Bw29fk3Jbu.Vuy4u', 'Demo User 3', 1),
        ('user8@localhost.local', '$2a$10$1.CuU97pRaM3FQe0TC91vOCdu50N/DzRJ6.z/Bw29fk3Jbu.Vuy4u', 'Demo User 3', 1);

update user set image = '/images/anonymous.jpg';

drop table if exists authorities;
create table authorities (
	user_id int,
    role_id int,
    foreign key(user_id) references user(id),
    foreign key(role_id) references role(id)
    );
    
insert into authorities 
values (1, 1), (1, 2), (2, 1), (2, 2) , (3, 1), (3, 3), (4, 1), (4, 3), (5, 1), (5, 2), (6, 1), (6, 2),
		(7, 1), (7, 2), (8, 1), (9, 2), (9, 1), (9, 2), (10, 1), (10, 2);    

drop table if exists cv;
create table cv(
	id int not null auto_increment,
    file_name varchar(255) default '',
    user_id int,
    primary key(id),
    foreign key(user_id) references user(id)
);

drop table if exists company;
create table company(
	id int not null auto_increment,
    name varchar(255),
    address varchar(255),
    phone_number varchar(255),
    email varchar(255) default '',
    logo varchar(255) default '',
    description varchar(255),
    total_job int default 0,
    total_applied int default 0,
    user_id int,
    primary key(id),
    foreign key(user_id) references user(id)
);

insert into company(name, address, user_id, total_job, total_applied)
values ('Demo Company', 'Hà Nội', 1, floor(10 + rand() *50), floor(10 + rand()*40)),
 ('Demo Company 2', 'Hà Nội', 2, floor(10 + rand() *50), floor(10 + rand()*40)),
 ('Demo Company 3', 'Hà Nội', 5, floor(10 + rand() *50), floor(10 + rand()*40)),
 ('Demo Company 4', 'Hà Nội', 6, floor(10 + rand() *50), floor(10 + rand()*40)),
 ('Demo Company 5', 'Hà Nội', 7, floor(10 + rand() *50), floor(10 + rand()*40)),
 ('Demo Company 6', 'Hà Nội', 8, floor(10 + rand() *50), floor(10 + rand()*40)),
 ('Demo Company 7', 'Hà Nội', 9, floor(10 + rand() *50), floor(10 + rand()*40)),
 ('Demo Company 8', 'Hà Nội', 10, floor(10 + rand() *50), floor(10 + rand()*40));
update user set company_id = 1 where id = 1;
update user set company_id = 2 where id = 1;
update user set company_id = 3 where id = 5;
update user set company_id = 4 where id = 6;
update user set company_id = 5 where id = 7;
update user set company_id = 6 where id = 8;
update user set company_id = 7 where id = 9;
update user set company_id = 18 where id = 10;
update company set logo = '/images/company-1.jpg';
update company set email = concat(id, 'your@company.com');

drop table if exists follow_company;
create table follow_company(
	id int not null auto_increment,
    company_id int,
    user_id int,
    primary key(id),
    foreign key(company_id) references company(id),
    foreign key(user_id) references user(id)
);

drop table if exists recruitment;
create table recruitment(
	id int not null auto_increment,
    title varchar(255),
    description varchar(255),
    experience varchar(50),
    quantity int,
    address varchar(255),
    salary int,
    deadline varchar(255) default "",
    created_at varchar(255),
    total_applied int default 0,
    type_id int,
    status int default 1,
    category_id int,
    company_id int,
    primary key(id),
    foreign key(type_id) references `type`(id),
    foreign key(category_id) references category(id),
    foreign key(company_id) references company(id)
);

insert into recruitment(title, quantity, total_applied, type_id, category_id, company_id)
values ('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*7), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8)),
('recruitment', floor(10 + rand()*50), floor(rand()*10), floor(1 + rand()*5), floor(1 + rand()*19), floor(1 + rand()*8));

update recruitment set salary = floor(10 + rand()*50)*1000000;
update recruitment set title = concat('Recruitment ', id);
update recruitment set address = concat('Location ', floor(1 + rand()*5));
update recruitment set experience = 'Không yêu cầu';
update recruitment set created_at = '2023-01-01';
update recruitment set description = 'Demo recruitment';

drop table if exists saved_job;
create table saved_job(
	id int not null auto_increment,
    recruitment_id int,
    user_id int,
    primary key(id),
    foreign key(recruitment_id) references recruitment(id),
    foreign key(user_id) references user(id)
);

drop table if exists applied_job;
create table applied_job(
	id int not null auto_increment,
    created_at varchar(255),
    recruitment_id int,
    user_id int,
    cv_name varchar(255),
    primary key(id),
    foreign key(recruitment_id) references recruitment(id),
    foreign key(user_id) references user(id)
);

insert into applied_job(user_id, recruitment_id)
values (floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29)),
(floor(3 + rand()*2), floor(1 + rand()*29));