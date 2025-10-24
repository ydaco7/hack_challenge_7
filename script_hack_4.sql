/* Hack 4*/

insert into countries (name) values
('El Salvador'),
('Suecia'),
('Cambodia'),
('Canada'),
('Sri Lanka');

/*Insert */

insert into priorities (type_name) values
('Alta'),
('Media'),
('Baja');

insert into contact_request (id_email, id_country, id_priority, detail, physical_address, name) values
('foo@foo.foo',1,1, 'Hotfix y soporte técnico', 'Calle Principal #15, San Salvador', 'Fooziman'),
('bar@bar.bar', 4, 2, 'Actualización de nombres de productos', '123 Main Street Apt, Ottawa', 'Barziman' ),
('bob@bob.bob', 2, 3, 'Consultoria', 'Sven Nilsson, Estocolmo', 'Robert');

/* Delete last user */

delete from contact_request where id_email = 'bob@bob.bob';

/*Update */

update contact_request set id_email = 'foozi@foo.foo', name = 'Fuziman' where id_email = 'foo@foo.foo';


SELECT * FROM contact_request;
SELECT 'Las operaciones CRUD se han ejecutado correctamente.' AS status;
