INSERT INTO users (username, email, status) VALUES
('standard_user', 'standard_user@test.com', 'active'),
('locked_out_user', 'locked_out_user@test.com', 'locked'),
('problem_user', 'problem_user@test.com', 'active'),
('inactive_user', 'inactive_user@test.com', 'inactive');

INSERT INTO products (product_name, category, price, stock_quantity, is_active) VALUES
('Backpack', 'Accessories', 29.99, 10, TRUE),
('Bike Light', 'Accessories', 9.99, 25, TRUE),
('T-Shirt', 'Clothing', 15.99, 0, TRUE),
('Jacket', 'Clothing', 49.99, 5, TRUE),
('Onesie', 'Clothing', 7.99, 15, FALSE);

INSERT INTO orders (user_id, order_status, total_amount) VALUES
(1, 'paid', 39.98),
(1, 'pending', 49.99),
(3, 'cancelled', 15.99);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 29.99),
(1, 2, 1, 9.99),
(2, 4, 1, 49.99),
(3, 3, 1, 15.99);