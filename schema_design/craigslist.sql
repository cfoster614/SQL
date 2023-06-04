DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE category
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(10) NOT NULL UNIQUE,
    password VARCHAR(10) NOT NULL
    CONSTRAINT fk_preferred_region
        FOREIGN KEY(preferred_region_id)
        REFERENCES region(id)
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(20) NOT NULL,
    text NOT NULL,
    CONSTRAINT fk_region
        FOREIGN KEY(region_id)
        REFERENCES region(id),
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES users(id),
    CONSTRAINT fk_category
        FOREIGN KEY(category_id)
        REFERENCES category(id) 
);