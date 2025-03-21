create database construction;
use construction;

create table admin (
                       id int primary key auto_increment,
                       username varchar (120) not null,
                       password varchar (200) not null
);

create table projet (
                        id_projet int primary key auto_increment,
                        nom varchar(255) not null,
                        description text not null,
                        date_debut date not null,
                        date_fin date not null,
                        budget decimal (10,2) not null
);

create table tache (
                       id_tache int primary key auto_increment,
                       id_projet int not null,
                       description text not null,
                       date_debut date not null,
                       date_fin date not null,
                       foreign key (id_projet) references projet (id_projet) on delete cascade
);

create table ressource (
                           id_ressource int primary key auto_increment,
                           nom varchar (300) not null,
                           type varchar (300) not null,
                           quantite int not null,
                           fournisseur varchar(400)  not null,
                           id_tache int not null,
                           foreign key (id_tache) references tache(id_tache) on delete cascade
);

insert into projet (id_projet , nom , description , date_debut , date_fin , budget) values (1 , 'youssef' , 'aitrais' , '2024-10-20' , '2025-10-20' , 10000 );
select * from tache;