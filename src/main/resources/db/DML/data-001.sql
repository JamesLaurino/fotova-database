--liquibase formatted sql

--changeset tpe:1
insert into category_entity (id,name) values(1,"Bonnet");
insert into category_entity (id,name) values(2,"Gant");
insert into category_entity (id,name) values(3,"Echarpe");

insert into product_entity (id,name,price,quantity,category_id,url,description) values (1,'Bonnet rouge',25,8,1,'bonnet_rouge_1.jpg','Un beau bonnet rouge');
insert into product_entity (id,name,price,quantity,category_id,url,description) values (2,'Bonnet orange',36,9,1,'bonnet_orange_1.jpg', 'Un beau bonnet orange');
insert into product_entity (id,name,price,quantity,category_id,url,description) values (3,'Bonnet mauve',38,9,1,'bonnet_mauve_1.jpg','Un beau bonnet mauve' );
insert into product_entity (id,name,price,quantity,category_id,url,description) values (4,'Gant noir',14,10,2,'gant_noir_1.png', 'Un beau gant noir');
insert into product_entity (id,name,price,quantity,category_id,url,description) values (5,'Echarpe rouge',78,12,3, 'echarpe_rouge_1.png','Un belle echarpe rouge');

insert into address_entity (id,street,city,number,country) values (1,'Avenue Ponty','Mons','15','BELGIUM');
insert into address_entity (id,street,city,number,country) values (2,'Rue Boucher','Bruxelles','8','BELGIUM');
insert into address_entity (id,street,city,number,country) values (3,'Rue Merlot','Nice','2','FRANCE');
insert into address_entity (id,street,city,number,country) values (4,'Rue Poincon','Paris','26','FRANCE');
insert into address_entity (id,street,city,number,country) values (5,'Rue Seige-gang','Zimbaboue','6','CROATIA');

insert into supplier_entity (id,address_id,product_id,registration_number) values(1,3,1,'0123456789');
insert into supplier_entity (id,address_id,product_id,registration_number) values(2,4,2,'123456');
insert into supplier_entity (id,address_id,product_id,registration_number) values(3,5,3,'123457');
insert into supplier_entity (id,address_id,product_id,registration_number) values(4,5,4,'123457');

--changeset tpe:2
insert into client_entity(id,address_id,is_active,created_at,updated_at,email,password,username)values(1,1,true,now(),now(),'thomas@hotmail.com','$2a$10$VCtb0afUP.nWv2YOGjJ0Sedci7HKV/trVZDDIGXNUFa33/UyhKILa','Thomas');
insert into role_entity (id,name) values(1,'ROLE_ADMIN');
insert into client_role_entity (role_id,client_id) values(1,1);

--changeset tpe:3
insert into client_entity(id,address_id,is_active,created_at,updated_at,email,password,username)values(2,2,true,now(),now(),'james@hotmail.com','$2a$10$VCtb0afUP.nWv2YOGjJ0Sedci7HKV/trVZDDIGXNUFa33/UyhKILa','James');
insert into role_entity (id,name) values(2,'ROLE_USER');
insert into client_role_entity (role_id,client_id) values(2,2);

--changeset tpe:4
insert into comment_entity (id,header,body,created_at,updated_at,client_id) values(1,'Congratulation','Hello there',now(),now(),1);
insert into comment_entity (id,header,body,created_at,updated_at,client_id) values(2,'Bad Luck','Good by',now(),now(),1);

--changeset tpe:5
insert into order_entity (id,client_id,create_at,is_done) values (1,1,now(),true);
insert into order_entity (id,client_id,create_at,is_done) values (2,2,now(),true);
insert into order_entity (id,client_id,create_at,is_done) values (3,1,now(),false);

--changeset tpe:6
insert into order_product_entity (id,order_id,product_id,quantity_product)values(1,1,1,3);
insert into order_product_entity (id,order_id,product_id,quantity_product) values(2,1,3,2);
insert into order_product_entity (id,order_id,product_id,quantity_product) values(3,2,1,1);
insert into order_product_entity (id,order_id,product_id,quantity_product) values(4,3,1,1);
insert into order_product_entity (id,order_id,product_id,quantity_product) values(5,3,2,1);

--changeset tpe:7
insert into image_entity (id,product_id,path) values(1,1,'bonnet_rouge_2.jpg');
insert into image_entity (id,product_id,path) values(2,1,'bonnet_rouge_3.jpg');
insert into image_entity (id,product_id,path) values(3,1,'bonnet_rouge_4.jpg');
insert into image_entity (id,product_id,path) values(4,2,'bonnet_orange_2.jpg');
insert into image_entity (id,product_id,path) values(5,2,'bonnet_orange_3.jpg');
insert into image_entity (id,product_id,path) values(6,3,'bonnet_mauve_2.jpg');
insert into image_entity (id,product_id,path) values(7,3,'bonnet_mauve_3.jpg');
insert into image_entity (id,product_id,path) values(8,4,'gant_noir_2.png');
insert into image_entity (id,product_id,path) values(9,5,'echarpe_rouge_2.png');

--changeset tpe:8
insert into label_entity (id,product_id,title_fr,title_en,title_ru,description_fr,description_en,description_ru) values (id,1,'Bonnet rouge','Red hat','красная шляп','Un beau bonnet rouge','A beautifully red hat', 'Красивая красная шляпа');
insert into label_entity (id,product_id,title_fr,title_en,title_ru,description_fr,description_en,description_ru) values (id,2,'Bonnet orange','Orange hat','оранжевая шляпа','Un beau bonnet orange','A beautifully orange hat', 'Красивая оранжевая шляпа');
insert into label_entity (id,product_id,title_fr,title_en,title_ru,description_fr,description_en,description_ru) values (id,3,'Bonnet mauve','Mauve hat','сиреневого цвета','Un beau bonnet mauve','A beautifully mauve hat', 'Красивая шляпа сиреневого цвета');
insert into label_entity (id,product_id,title_fr,title_en,title_ru,description_fr,description_en,description_ru) values (id,4,'Gant noir','Black glove','Черная перчатка','Des beau gants noir','A beautifull Black glove', 'Красивая Черная перчатка');
insert into label_entity (id,product_id,title_fr,title_en,title_ru,description_fr,description_en,description_ru) values (id,5,'Écharpe rouge','Red scarf','Красный шарф','Une belle écharpe rouge','A beautifull red scarf', 'Красивая Красный шарф');

--changeset tpe:9
insert into address_entity (id,street,city,number,country) values (6,'Rue de la Paix','Paris','12','FRANCE');
insert into address_entity (id,street,city,number,country) values (7,'Rue des Fleurs','Lyon','34','FRANCE');
insert into address_entity (id,street,city,number,country) values (8,'Avenue du Lac','Bordeaux','7','FRANCE');
insert into address_entity (id,street,city,number,country) values (9,'Rue de la Gare','Liège','19','BELGIUM');
insert into address_entity (id,street,city,number,country) values (10,'Rue du Marché','Strasbourg','3','FRANCE');
insert into address_entity (id,street,city,number,country) values (11,'Boulevard du Vieux Port','Marseille','45','FRANCE');
insert into address_entity (id,street,city,number,country) values (12,'Rue de Bretagne','Nantes','22','FRANCE');
insert into address_entity (id,street,city,number,country) values (13,'Allée des Roses','Toulouse','11','FRANCE');

insert into client_entity(id,address_id,is_active,created_at,updated_at,email,password,username)values(3,6,true,now(),now(),'sophie@hotmail.com','$2a$10$VCtb0afUP.nWv2YOGjJ0Sedci7HKV/trVZDDIGXNUFa33/UyhKILa','Sophie');
insert into client_entity(id,address_id,is_active,created_at,updated_at,email,password,username)values(4,7,true,now(),now(),'lucas@hotmail.com','$2a$10$VCtb0afUP.nWv2YOGjJ0Sedci7HKV/trVZDDIGXNUFa33/UyhKILa','Lucas');
insert into client_entity(id,address_id,is_active,created_at,updated_at,email,password,username)values(5,8,true,now(),now(),'emma@hotmail.com','$2a$10$VCtb0afUP.nWv2YOGjJ0Sedci7HKV/trVZDDIGXNUFa33/UyhKILa','Emma');
insert into client_entity(id,address_id,is_active,created_at,updated_at,email,password,username)values(6,9,true,now(),now(),'antoine@hotmail.com','$2a$10$VCtb0afUP.nWv2YOGjJ0Sedci7HKV/trVZDDIGXNUFa33/UyhKILa','Antoine');
insert into client_entity(id,address_id,is_active,created_at,updated_at,email,password,username)values(7,10,true,now(),now(),'marie@hotmail.com','$2a$10$VCtb0afUP.nWv2YOGjJ0Sedci7HKV/trVZDDIGXNUFa33/UyhKILa','Marie');
insert into client_entity(id,address_id,is_active,created_at,updated_at,email,password,username)values(8,11,true,now(),now(),'pierre@hotmail.com','$2a$10$VCtb0afUP.nWv2YOGjJ0Sedci7HKV/trVZDDIGXNUFa33/UyhKILa','Pierre');
insert into client_entity(id,address_id,is_active,created_at,updated_at,email,password,username)values(9,12,true,now(),now(),'julie@hotmail.com','$2a$10$VCtb0afUP.nWv2YOGjJ0Sedci7HKV/trVZDDIGXNUFa33/UyhKILa','Julie');
insert into client_entity(id,address_id,is_active,created_at,updated_at,email,password,username)values(10,13,true,now(),now(),'nicolas@hotmail.com','$2a$10$VCtb0afUP.nWv2YOGjJ0Sedci7HKV/trVZDDIGXNUFa33/UyhKILa','Nicolas');

insert into client_role_entity (role_id,client_id) values(2,3);
insert into client_role_entity (role_id,client_id) values(2,4);
insert into client_role_entity (role_id,client_id) values(2,5);
insert into client_role_entity (role_id,client_id) values(2,6);
insert into client_role_entity (role_id,client_id) values(2,7);
insert into client_role_entity (role_id,client_id) values(2,8);
insert into client_role_entity (role_id,client_id) values(2,9);
insert into client_role_entity (role_id,client_id) values(2,10);

--changeset tpe:10
-- Lucas : 1 petite commande (terminée)
insert into order_entity (id,client_id,create_at,is_done) values (4,4,now(),true);
-- Emma : 1 commande moyenne (terminée)
insert into order_entity (id,client_id,create_at,is_done) values (5,5,now(),true);
-- Antoine : 2 commandes (une terminée, une en cours)
insert into order_entity (id,client_id,create_at,is_done) values (6,6,now(),true);
insert into order_entity (id,client_id,create_at,is_done) values (7,6,now(),false);
-- Pierre : 1 grosse commande (terminée)
insert into order_entity (id,client_id,create_at,is_done) values (8,8,now(),true);
-- Julie : 2 commandes (une terminée, une en cours)
insert into order_entity (id,client_id,create_at,is_done) values (9,9,now(),true);
insert into order_entity (id,client_id,create_at,is_done) values (10,9,now(),false);
-- Nicolas : 1 commande (terminée)
insert into order_entity (id,client_id,create_at,is_done) values (11,10,now(),true);

--changeset tpe:11
-- Order 4 - Lucas (petite : 1 article)
insert into order_product_entity (id,order_id,product_id,quantity_product) values(6,4,3,1);
-- Order 5 - Emma (moyenne : 2 articles)
insert into order_product_entity (id,order_id,product_id,quantity_product) values(7,5,2,1);
insert into order_product_entity (id,order_id,product_id,quantity_product) values(8,5,5,2);
-- Order 6 - Antoine commande 1 (2 articles)
insert into order_product_entity (id,order_id,product_id,quantity_product) values(9,6,1,2);
insert into order_product_entity (id,order_id,product_id,quantity_product) values(10,6,4,1);
-- Order 7 - Antoine commande 2 en cours (1 article)
insert into order_product_entity (id,order_id,product_id,quantity_product) values(11,7,5,1);
-- Order 8 - Pierre (grosse : 3 articles)
insert into order_product_entity (id,order_id,product_id,quantity_product) values(12,8,1,3);
insert into order_product_entity (id,order_id,product_id,quantity_product) values(13,8,2,2);
insert into order_product_entity (id,order_id,product_id,quantity_product) values(14,8,4,4);
-- Order 9 - Julie commande 1 (1 article)
insert into order_product_entity (id,order_id,product_id,quantity_product) values(15,9,3,1);
-- Order 10 - Julie commande 2 en cours (2 articles)
insert into order_product_entity (id,order_id,product_id,quantity_product) values(16,10,1,2);
insert into order_product_entity (id,order_id,product_id,quantity_product) values(17,10,5,1);
-- Order 11 - Nicolas (2 articles)
insert into order_product_entity (id,order_id,product_id,quantity_product) values(18,11,2,1);
insert into order_product_entity (id,order_id,product_id,quantity_product) values(19,11,4,2);
