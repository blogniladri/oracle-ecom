CREATE SEQUENCE products_seq START WITH 1;
CREATE SEQUENCE orders_seq START WITH 1;

CREATE TABLE products (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    description VARCHAR2(1000),
    price NUMBER(10,2) NOT NULL,
    image_url VARCHAR2(500),
    stock_quantity NUMBER NOT NULL
);

CREATE TABLE cart_items (
    product_id NUMBER PRIMARY KEY,
    quantity NUMBER NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE orders (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    address VARCHAR2(500) NOT NULL,
    city VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20) NOT NULL,
    status VARCHAR2(50) DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER NOT NULL,
    price NUMBER(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


-- Insert sample products
INSERT INTO products (id, name, description, price, image_url, stock_quantity)
VALUES (products_seq.NEXTVAL, 'Laptop', 'High-performance laptop with 16GB RAM, 512GB SSD.', 999.99, 'http://example.com/laptop.jpg', 50);

INSERT INTO products (id, name, description, price, image_url, stock_quantity)
VALUES (products_seq.NEXTVAL, 'Smartphone', 'Latest model smartphone with 128GB storage and 5G connectivity.', 699.99, 'http://example.com/smartphone.jpg', 100);

INSERT INTO products (id, name, description, price, image_url, stock_quantity)
VALUES (products_seq.NEXTVAL, 'Headphones', 'Noise-cancelling wireless headphones.', 199.99, 'http://example.com/headphones.jpg', 200);

INSERT INTO products (id, name, description, price, image_url, stock_quantity)
VALUES (products_seq.NEXTVAL, 'Smartwatch', 'Fitness smartwatch with heart rate monitoring.', 149.99, 'http://example.com/smartwatch.jpg', 150);

-- Insert sample cart items
INSERT INTO cart_items (product_id, quantity) VALUES (1, 2);
INSERT INTO cart_items (product_id, quantity) VALUES (2, 1);
INSERT INTO cart_items (product_id, quantity) VALUES (3, 3);
INSERT INTO cart_items (product_id, quantity) VALUES (4, 1);

-- Insert sample orders
INSERT INTO orders (id, name, address, city, phone, status, created_at)
VALUES (orders_seq.NEXTVAL, 'John Doe', '123 Main St, Springfield, IL', 'Springfield', '555-1234', 'PENDING', CURRENT_TIMESTAMP);

INSERT INTO orders (id, name, address, city, phone, status, created_at)
VALUES (orders_seq.NEXTVAL, 'Jane Smith', '456 Oak St, Metropolis, NY', 'Metropolis', '555-5678', 'PENDING', CURRENT_TIMESTAMP);

-- Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (1, 1, 2, 999.99);
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (1, 2, 1, 699.99);
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (1, 3, 1, 199.99);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (2, 4, 1, 149.99);
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (2, 3, 2, 199.99);
