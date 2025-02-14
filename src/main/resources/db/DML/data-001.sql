--liquibase formatted sql

--changeset tpe:1
insert into category_entity (id,name) values(1,"Laptop");
insert into category_entity (id,name) values(2,"Tablette");
insert into category_entity (id,name) values(3,"TV");

insert into product_entity (id,name,price,quantity,category_id) values (1,'Dell i9',25.5,1,1);
insert into product_entity (id,name,price,quantity,category_id) values (2,'Lenovo i7',36.6,4,1);
insert into product_entity (id,name,price,quantity,category_id) values (3,'Pad m12',14.5,2,2);
insert into product_entity (id,name,price,quantity,category_id) values (4,'Samsung TV',78.5,3,3);

insert into address_entity (id,street,city,number,country) values (1,'Avenue Ponty','Mons','15','Belgique');
insert into address_entity (id,street,city,number,country) values (2,'Rue Boucher','Bruxelles','8','Belgique');
insert into address_entity (id,street,city,number,country) values (3,'Rue Merlot','Nice','2','France');
insert into address_entity (id,street,city,number,country) values (4,'Rue Poincon','Paris','26','France');
insert into address_entity (id,street,city,number,country) values (5,'Rue Seige-gang','Zimbaboue','6','Croatie');

insert into supplier_entity (id,address_id,product_id,registration_number) values(1,3,1,'0123456789');
insert into supplier_entity (id,address_id,product_id,registration_number) values(2,4,2,'123456');
insert into supplier_entity (id,address_id,product_id,registration_number) values(3,5,3,'123457');
insert into supplier_entity (id,address_id,product_id,registration_number) values(4,5,4,'123457');

insert into comment_entity (id,header,body,create_at,client_id) values(1,'Congratulation','Hello there',now(),null);
insert into comment_entity (id,header,body,create_at,client_id) values(2,'Bad Luck','Good by',now(),null);