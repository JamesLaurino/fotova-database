--liquibase formatted sql

--changeset tpe:1
insert into category_entity (id,name) values(1,"Laptop");
insert into category_entity (id,name) values(2,"Tablette");
insert into category_entity (id,name) values(3,"TV");

insert into product_entity (id,name,price,quantity,category_id,url) values (1,'Dell i9',25.5,8,1,'photo Dell i9');
insert into product_entity (id,name,price,quantity,category_id,url) values (2,'Lenovo i7',36.6,9,1,'photo Lenovo i7');
insert into product_entity (id,name,price,quantity,category_id,url) values (3,'Pad m12',14.5,10,2,'photo Pad m12');
insert into product_entity (id,name,price,quantity,category_id,url) values (4,'Samsung TV',78.5,12,3, 'photo Samsung');

insert into address_entity (id,street,city,number,country) values (1,'Avenue Ponty','Mons','15','Belgique');
insert into address_entity (id,street,city,number,country) values (2,'Rue Boucher','Bruxelles','8','Belgique');
insert into address_entity (id,street,city,number,country) values (3,'Rue Merlot','Nice','2','France');
insert into address_entity (id,street,city,number,country) values (4,'Rue Poincon','Paris','26','France');
insert into address_entity (id,street,city,number,country) values (5,'Rue Seige-gang','Zimbaboue','6','Croatie');

insert into supplier_entity (id,address_id,product_id,registration_number) values(1,3,1,'0123456789');
insert into supplier_entity (id,address_id,product_id,registration_number) values(2,4,2,'123456');
insert into supplier_entity (id,address_id,product_id,registration_number) values(3,5,3,'123457');
insert into supplier_entity (id,address_id,product_id,registration_number) values(4,5,4,'123457');

--changeset tpe:2
insert into client_entity(id,address_id,is_active,created_at,updated_at,email,password,username)values(1,1,true,now(),now(),'thomas@hotmail.com','$2a$10$VCtb0afUP.nWv2YOGjJ0Sedci7HKV/trVZDDIGXNUFa33/UyhKILa','thomas');
insert into role_entity (id,name) values(1,'ROLE_ADMIN');
insert into client_role_entity (role_id,client_id) values(1,1);

--changeset tpe:3
insert into client_entity(id,address_id,is_active,created_at,updated_at,email,password,username)values(2,2,true,now(),now(),'james@hotmail.com','$2a$10$VCtb0afUP.nWv2YOGjJ0Sedci7HKV/trVZDDIGXNUFa33/UyhKILa','james');
insert into role_entity (id,name) values(2,'ROLE_USER');
insert into client_role_entity (role_id,client_id) values(2,2);

--changeset tpe:4
insert into comment_entity (id,header,body,created_at,updated_at,client_id) values(1,'Congratulation','Hello there',now(),now(),1);
insert into comment_entity (id,header,body,created_at,updated_at,client_id) values(2,'Bad Luck','Good by',now(),now(),1);

--changeset tpe:5
insert into order_entity (id,client_id,create_at) values (1,1,now());
insert into order_entity (id,client_id,create_at) values (2,2,now());

--changeset tpe:6
insert into order_product_entity (id,order_id,product_id,quantity_product)values(1,1,1,3);
insert into order_product_entity (id,order_id,product_id,quantity_product) values(2,1,3,2);
