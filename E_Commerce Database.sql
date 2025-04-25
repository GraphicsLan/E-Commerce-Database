CREATE DATABASE IF NOT EXISTS E_Commerce; -- E_Commerce database creation
USE E_Commerce;

--  -- Brand Table
CREATE TABLE brand (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50) NOT NULL UNIQUE,
    brand_description VARCHAR(100)
);

--  Product Category Table:
CREATE TABLE product_category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    category_description VARCHAR(100)
);

--  Product Table:
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2),
    description VARCHAR(100),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

--  Product Image Table
CREATE TABLE product_image (
    image_id INT PRIMARY KEY,
    product_id INT,
    image_urls VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

--  Color Table
CREATE TABLE color (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(30),
    hex_value VARCHAR(10)
);

--  Size Category Table
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY,
    category_name VARCHAR(30) NOT NULL,
    category_description VARCHAR(100)
);

--  Size Option Table
CREATE TABLE size_option (
    size_id INT PRIMARY KEY,
    size_category_id INT,
    size_label VARCHAR(10) NOT NULL,
    size_description VARCHAR(50),
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

--  Product Item Table
CREATE TABLE product_item (
    item_id INT PRIMARY KEY,
    product_id INT,
    product_item_name VARCHAR(50) NOT NULL,
    variation_id INT,
    product_quantity INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

--  Product Variation Table
CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id)
);

--  Attribute Type Table
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY,
    attribute_name VARCHAR(30) NOT NULL
);

-- 11. Attribute Category Table
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY,
    attribute_category_name VARCHAR(30) NOT NULL
);

--  Product Attribute Table
CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    attribute_name VARCHAR(30) NOT NULL,
    attribute_value VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

