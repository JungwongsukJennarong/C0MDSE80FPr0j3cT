CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    fullName VARCHAR(255) NOT NULL,
    phone VARCHAR(8) NOT NULL,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE user_roles (
    user_role_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_role_id),
    FOREIGN KEY (username) REFERENCES users(username)
);

INSERT INTO users(username, password, fullName, phone, address) VALUES ('max', '{noop}maxpw', 'Max Lau', '20190721', 'Yuen Long');
INSERT INTO user_roles(username, role) VALUES ('max', 'ROLE_ADMIN');

INSERT INTO users(username, password, fullName, phone, address) VALUES ('kobe', '{noop}kobepw', 'Kobe Chan', '20190831', 'Prince Edward');
INSERT INTO user_roles(username, role) VALUES ('kobe', 'ROLE_USER');

INSERT INTO users(username, password, fullName, phone, address) VALUES ('out', '{noop}outpw', 'Iam Sorry', '20191220', 'Tseung Kwan O');
INSERT INTO user_roles(username, role) VALUES ('out', 'ROLE_USER');

CREATE TABLE records(
    order_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    orderlist VARCHAR(255) NOT NULL,
    orderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (order_id)
);

INSERT INTO records(username, orderlist) VALUES ('kobe', '{Hamburger=1, Big mac=2}');

CREATE TABLE food (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL,
    availability BOOLEAN NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE attachment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    filename VARCHAR(255) DEFAULT NULL,
    content_type VARCHAR(255) DEFAULT NULL,
    content BLOB DEFAULT NULL,
    food_id INTEGER DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (food_id) REFERENCES food(id)
);

CREATE TABLE comment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    timestamp VARCHAR(50) NOT NULL,
    food_id INTEGER DEFAULT NULL,
    userName VARCHAR(50) NOT NULL,
    contents VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (food_id) REFERENCES food(id)
);

INSERT INTO food (name, description, price, availability) VALUES 
('Fish and Chips', 'With Fish and Chips', 10, true);

INSERT INTO food (name, description, price, availability) VALUES 
('Hamburger', 'Big Big Hamburger with cheese', 15, true);

INSERT INTO comment (timestamp, food_id, userName, contents) VALUES 
('2019.12.20.19.42.04', 1, 'max', 'Where are you brother?');