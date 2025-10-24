/* Hack 2*/

/* CREATE */

insert into countries (name)
values ('argentina'), ('colombia'), ('chile');
select * from countries;

insert into users (id_country, email, name)
values (2,'foo@foo.com', 'fooziman'), (3, 'bar@bar.com', 'barziman');

/* DELETE */

delete from users where email = 'bar@bar.com';


/* UPDATE */

update users set email = 'foo@foo.foo', name = 'fooz' where id_users = 1;
select * from users;

/* READ */

select * from users 
inner join  countries on users.id_country = countries.id_country;

select u.id_users as id, u.email, u.name as fullname, c.name 
from users u inner join  countries c on u.id_country = c.id_country;   
