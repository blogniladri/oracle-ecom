-- Insert sample products
INSERT INTO QDev.products (id, name, description, price, image_url, stock_quantity)
VALUES (QDev.products_seq.NEXTVAL, 'Laptop', 'High-performance laptop with 16GB RAM, 512GB SSD.', 999.99, 'http://example.com/laptop.jpg', 50);

INSERT INTO QDev.products (id, name, description, price, image_url, stock_quantity)
VALUES (QDev.products_seq.NEXTVAL, 'Smartphone', 'Latest model smartphone with 128GB storage and 5G connectivity.', 699.99, 'http://example.com/smartphone.jpg', 100);

INSERT INTO QDev.products (id, name, description, price, image_url, stock_quantity)
VALUES (QDev.products_seq.NEXTVAL, 'Headphones', 'Noise-cancelling wireless headphones.', 199.99, 'http://example.com/headphones.jpg', 200);

INSERT INTO QDev.products (id, name, description, price, image_url, stock_quantity)
VALUES (QDev.products_seq.NEXTVAL, 'Smartwatch', 'Fitness smartwatch with heart rate monitoring.', 149.99, 'http://example.com/smartwatch.jpg', 150);

-- Insert sample cart items
INSERT INTO QDev.cart_items (product_id, quantity) VALUES (1, 2);
INSERT INTO QDev.cart_items (product_id, quantity) VALUES (2, 1);
INSERT INTO QDev.cart_items (product_id, quantity) VALUES (3, 3);
INSERT INTO QDev.cart_items (product_id, quantity) VALUES (4, 1);

-- Insert sample orders
INSERT INTO QDev.orders (id, name, address, city, phone, status, created_at)
VALUES (QDev.orders_seq.NEXTVAL, 'John Doe', '123 Main St, Springfield, IL', 'Springfield', '555-1234', 'PENDING', CURRENT_TIMESTAMP);

INSERT INTO QDev.orders (id, name, address, city, phone, status, created_at)
VALUES (QDev.orders_seq.NEXTVAL, 'Jane Smith', '456 Oak St, Metropolis, NY', 'Metropolis', '555-5678', 'PENDING', CURRENT_TIMESTAMP);

-- Insert sample order items
INSERT INTO QDev.order_items (order_id, product_id, quantity, price) VALUES (1, 1, 2, 999.99);
INSERT INTO QDev.order_items (order_id, product_id, quantity, price) VALUES (1, 2, 1, 699.99);
INSERT INTO QDev.order_items (order_id, product_id, quantity, price) VALUES (1, 3, 1, 199.99);

INSERT INTO QDev.order_items (order_id, product_id, quantity, price) VALUES (2, 4, 1, 149.99);
INSERT INTO QDev.order_items (order_id, product_id, quantity, price) VALUES (2, 3, 2, 199.99);
