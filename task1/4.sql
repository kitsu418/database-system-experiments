CREATE DATABASE IF NOT EXISTS MyDb;
USE MyDb;
CREATE TABLE products(
    pid CHAR(10) PRIMARY KEY,
    name VARCHAR(32),
    brand CHAR(10),
    price INT,
    CONSTRAINT CK_products_brand CHECK(brand IN ('A', 'B')),
    CONSTRAINT CK_products_price CHECK(price > 0)
);