/* Hack 5 */

create table countries (
id_country serial primary key,
name varchar (100) not null
);

create table roles (
id_role serial primary key,
name varchar (50) not null
);

create table taxes (
id_tax serial primary key,
percentage integer not null
);

create table offers (
id_offer serial primary key,
status varchar (50) default 'active'
);

create table discounts (
id_discount serial primary key,
status varchar (50),
percentage decimal (5,2) not null
);

create table payments (
id_payment serial primary key,
type varchar (50) not null unique
);

create table customers (
email varchar (100) primary key,
id_country integer not null,
id_role integer not null,
name varchar (100) not null,
age integer,
password varchar (250) not null,
physical_address text,
foreign key (id_role) references roles (id_role),
foreign key (id_country) references countries (id_country)
);

create table invoice_status (
id_invoice_status serial primary key,
status varchar (50) not null unique
);

create table products (
id_product serial primary key,
id_discount integer,
id_offer integer,
id_tax integer,
name varchar (50) not null,
details text,
minimum_stock integer not null default 0,
current_stock integer not null default 0,
price decimal (10,2) not null,
price_with_tax decimal (10, 2),
foreign key (id_discount) references discounts (id_discount),
foreign key (id_offer) references offers (id_offer),
foreign key (id_tax) references taxes (id_tax)
);

create table products_customers(
id_product integer,
email varchar (100),
primary key (id_product, email),
foreign key (id_product) references products (id_product),
FOREIGN KEY (email) REFERENCES customers(email)
);

create table invoices (
id_invoice serial primary key,
email varchar(100) not null,
id_payment integer not null,
id_invoice_status integer not null,
date timestamp default current_timestamp,
total_to_pay decimal (10,2) not null,
foreign key (id_payment) references payments (id_payment),
foreign key (email) references customers (email),
foreign key (id_invoice_status) references invoice_status (id_invoice_status)
);

create table orders (
id_order serial primary key,
id_invoice integer not null,
id_product integer not null,
detail text,
amount integer,
price decimal (10, 2) not null,
foreign key (id_invoice) references invoices (id_invoice),
foreign key (id_product) references products (id_product)
);

insert into countries (name) values
('Japan'),
('Mexico'),
('France');

select * from countries;

insert into roles (name) values
('Bronze customer'),
('Silver customer'),
('Gold customer');

select * from roles;

insert into taxes (percentage) values
(30),
(50),
(4);

select * from taxes;

insert into offers (status) values
('active'),
('active'),
('inactive');

select * from offers;

insert into discounts (status, percentage) values
('active', 10.00),
('active', 50.00),
('inactive', 30.00);

select * from discounts;

insert into payments (type) values
('Credit card'),
('Paypal'),
('Cash');

select * from payments;

insert into customers (id_role, id_country, name, age, password, email, physical_address) values
(1, 1, 'John Doe', 34, '12345', 'johndoe@email.com', 'Tokyo-to Chiyoda-ku Marunouchi 2-chome 7-ban 2-go'),
(2, 2, 'Jane Doe', 44, '54321', 'janedoe@email.com', 'Sr. Juan Perez Calle 16 de Septiembre 12'),
(3, 3, 'Fooziman Mann', 27, 'thisisapassword', 'foozimanmann@email.com', '123 Avenue des Champs-Élysées, 75008 Paris');

select * from customers;

insert into invoice_status (status) values
('Payed'),
('Pending payment'),
('Cancelled');

select * from invoice_status;

insert into products (id_discount, id_offer, id_tax, name, details, minimum_stock, current_stock, price, price_with_tax) values
(1, 3, 2, 'Laptop Gaming', 'Laptop RGB 16GB RAM, 512GB SSD', 5, 15, 1200.00, 1392.00),
(2, 1, 2, 'Teclado Mecánico', 'Teclado mecánico switches blue', 10, 25, 80.00, 92.80),
(3, 2, 1, 'Mouse Inalámbrico', 'Mouse ergonómico 2400DPI', 15, 30, 25.00, 27.50);

select * from products;

insert into products_customers (id_product, email) values
(1, 'johndoe@email.com'),
(2, 'janedoe@email.com'),
(3, 'foozimanmann@email.com');

select * from products_customers;

insert into invoices (email, id_payment, id_invoice_status, date, total_to_pay) values
('johndoe@email.com', 1, 1, '2024-01-15 14:30:00', 1392.00);

select * from invoices;

insert into orders (id_invoice, id_product, detail, amount, price) values
(1, 1, 'Laptop RGB 16GB RAM, 512GB SSD', 1, 1392.00);

select * from orders;

insert into invoices (email, id_payment, id_invoice_status, date, total_to_pay) values
('janedoe@email.com', 2, 1, '2024-01-15 15:30:00', 92.80);

select * from invoices;

insert into orders (id_invoice, id_product, detail, amount, price) values
(2, 2, 'Teclado mecánico switches blue', 1, 92.80);

select * from orders;

insert into invoices (email, id_payment, id_invoice_status, date, total_to_pay) values
('foozimanmann@email.com', 3, 2, '2024-01-15 16:30:00', 27.50);

select * from invoices;

insert into orders (id_invoice, id_product, detail, amount, price) values
(3, 3, 'Mouse ergonómico 2400DPI', 1, 27.50);

select * from orders;

SELECT '*** INSERTS COMPLETED ***' AS status;

/* Delete last first user */

delete from orders where id_invoice = 1;
select * from orders;

delete from invoices where email = 'johndoe@email.com';
select * from invoices;

delete from products_customers where email = 'johndoe@email.com';
select * from products_customers;

delete from customers where email = 'johndoe@email.com';
select * from customers;

select '*** first customer deleted succesfully ***' as status;

/* Update last first user */

select * from customers;
Update customers
set

id_role = (select id_role from roles where name = 'Silver customer'),
physical_address = ('45 Rue de la République, 69002 Lyon'),
age = 28

where email = 'foozimanmann@email.com';

select * from customers;

/* Update taxes and prices */

UPDATE taxes 
SET percentage = 
    CASE 
        WHEN id_tax = 1 THEN 16  
        WHEN id_tax = 2 THEN 21    
        WHEN id_tax = 3 THEN 10  
    END;


SELECT * FROM taxes;

SELECT * from products;

/* Update taxes and prices */

UPDATE taxes 
SET percentage = 
    CASE 
        WHEN id_tax = 1 THEN 16  
        WHEN id_tax = 2 THEN 21    
        WHEN id_tax = 3 THEN 10  
    END;

SELECT * FROM taxes;

SELECT * FROM products;

UPDATE products p
SET price_with_tax = ROUND(p.price * (1 + t.percentage/100), 2)
FROM taxes as t
WHERE p.id_tax = t.id_tax;

SELECT * FROM products;

SELECT '*** UPDATE COMPLETED ***' AS status;

SELECT *
FROM customers c
JOIN roles r ON c.id_role = r.id_role;

SELECT * FROM taxes;

SELECT p.name, p.price AS new_price, t.percentage AS tax_percentage, p.price_with_tax AS new_price_with_tax
FROM products p
JOIN taxes t ON p.id_tax = t.id_tax;

SELECT 'ALL CRUD OPERATIONS COMPLETED SUCCESSFULLY' AS status;