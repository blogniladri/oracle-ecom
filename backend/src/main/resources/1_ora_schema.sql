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
    FOREIGN KEY (product_id) REFERENCES QDev.products(id)
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
    FOREIGN KEY (order_id) REFERENCES QDev.orders(id),
    FOREIGN KEY (product_id) REFERENCES QDev.products(id)
);
