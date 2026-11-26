-- SDC310L Retail Ordering & Inventory System
-- Week 2: database structure and sample data (MySQL)

DROP DATABASE IF EXISTS inventory_db;
CREATE DATABASE inventory_db;
USE inventory_db;

CREATE TABLE products (
    product_id    INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    description   VARCHAR(255),
    price         DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    quantity      INT NOT NULL DEFAULT 0 CHECK (quantity >= 0),
    reorder_level INT NOT NULL DEFAULT 5 CHECK (reorder_level >= 0)
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(100),
    phone       VARCHAR(30)
);

CREATE TABLE orders (
    order_id    INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id      INT NOT NULL,
    product_id    INT NOT NULL,
    quantity      INT NOT NULL CHECK (quantity > 0),
    unit_price    DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE restock_orders (
    restock_id   INT AUTO_INCREMENT PRIMARY KEY,
    product_id   INT NOT NULL,
    quantity     INT NOT NULL CHECK (quantity > 0),
    status       VARCHAR(20) NOT NULL DEFAULT 'Pending',
    created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample data
INSERT INTO products (name, description, price, quantity, reorder_level) VALUES
('Wireless Mouse', 'Compact 2.4GHz mouse', 45.00, 30, 10),
('USB-C Charger', '20W fast charger', 80.00, 4, 10),
('Phone Case', 'Shockproof case', 25.00, 50, 15),
('Bluetooth Speaker', 'Portable speaker', 150.00, 8, 5),
('Laptop Stand', 'Adjustable aluminium stand', 95.00, 3, 5);

INSERT INTO customers (name, email, phone) VALUES
('Ama Mensah', 'ama@example.com', '0240000001'),
('Kojo Boateng', 'kojo@example.com', '0240000002'),
('Efua Asare', 'efua@example.com', '0240000003');

INSERT INTO orders (customer_id) VALUES (1), (2);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 2, 45.00),
(1, 3, 1, 25.00),
(2, 4, 1, 150.00);

INSERT INTO restock_orders (product_id, quantity, status) VALUES
(2, 20, 'Pending');
