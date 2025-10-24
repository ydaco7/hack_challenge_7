/* Hack 3 */

create table priorities (
id_priority serial primary key,
type_name varchar(100) not null
);

create table countries (
id_country serial primary key,
name varchar (50)
);

create table contact_request(
id_email varchar (100) primary key,
id_country integer not null,
id_priority integer not null,
name varchar(50),
detail varchar(50),
physical_address varchar(100),
foreign key (id_country) references countries(id_country),
foreign key (id_priority) references priorities(id_priority)
);
