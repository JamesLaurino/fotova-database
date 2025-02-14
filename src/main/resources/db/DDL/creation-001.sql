--liquibase formatted sql

--changeset tpe:1
CREATE TABLE t_category (
    id integer not null PRIMARY KEY,
    name varchar(255)
);

CREATE TABLE t_role (
      id integer not null PRIMARY KEY,
      name ENUM ('ROLE_USER', 'ROLE_ADMIN')
);

CREATE TABLE t_comment (
    id integer not null PRIMARY KEY,
    header varchar(255),
    body varchar(255),
    createAt timestamp
);

CREATE TABLE t_address (
    id integer not null PRIMARY KEY,
    street varchar(255),
    city varchar(255),
    number varchar(20),
    country varchar(150)
);

CREATE TABLE t_product (
    id integer not null PRIMARY KEY,
    name varchar(255),
    quantity integer,
    price numeric,
    category_id integer,

    FOREIGN KEY (category_id) REFERENCES t_category(id)
);

CREATE TABLE t_supplier (
    id integer not null PRIMARY KEY,
    registration_number varchar(150),
    address_id integer,
    product_id integer,

    FOREIGN KEY (address_id) REFERENCES t_address(id),
    FOREIGN KEY (product_id) REFERENCES t_product(id)
);

CREATE TABLE t_client (
    id integer not null PRIMARY KEY,
    username varchar(255),
    email varchar(255),
    password varchar(255) unique not null,
    isActive BOOLEAN,
    createdAt timestamp,
    updatedAt timestamp,

    address_id integer,
    comment_id integer,

    FOREIGN KEY (address_id) REFERENCES t_address(id),
    FOREIGN KEY (comment_id) REFERENCES t_comment(id)
);

CREATE TABLE t_role_client (
    id integer not null PRIMARY KEY,
    role_id integer,
    client_id integer,

    FOREIGN KEY (role_id) REFERENCES t_role(id),
    FOREIGN KEY (client_id) REFERENCES t_client(id)
);

CREATE TABLE t_order (
    id integer not null PRIMARY KEY,
    createAt timestamp,
    client_id integer,

    FOREIGN KEY (client_id) REFERENCES t_client(id)
);

CREATE TABLE t_order_product (
    id integer not null PRIMARY KEY,
    quantity_product integer,
    order_id integer,
    product_id integer,

    FOREIGN KEY (order_id) REFERENCES t_order(id),
    FOREIGN KEY (product_id) REFERENCES t_product(id)

);
