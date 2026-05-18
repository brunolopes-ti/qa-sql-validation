DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_user_status 
    CHECK (status IN ('active', 'locked', 'inactive'))
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,

    CONSTRAINT chk_product_price 
    CHECK (price >= 0),

    CONSTRAINT chk_stock_quantity 
    CHECK (stock_quantity >= 0)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    total_amount NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_orders_users 
    FOREIGN KEY (user_id) REFERENCES users(user_id),

    CONSTRAINT chk_order_status 
    CHECK (order_status IN ('pending', 'paid', 'cancelled')),

    CONSTRAINT chk_total_amount 
    CHECK (total_amount >= 0)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,

    CONSTRAINT fk_order_items_orders 
    FOREIGN KEY (order_id) REFERENCES orders(order_id),

    CONSTRAINT fk_order_items_products 
    FOREIGN KEY (product_id) REFERENCES products(product_id),

    CONSTRAINT chk_quantity 
    CHECK (quantity > 0),

    CONSTRAINT chk_unit_price 
    CHECK (unit_price >= 0)
);