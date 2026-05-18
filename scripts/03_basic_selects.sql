-- 01 - Consultar todos os usuários cadastrados
SELECT *
FROM users;

-- 02 - Consultar todos os produtos cadastrados
SELECT *
FROM products;

-- 03 - Consultar todos os pedidos cadastrados
SELECT *
FROM orders;

-- 04 - Consultar todos os itens de pedido
SELECT *
FROM order_items;

-- 05 - Consultar apenas usuários ativos
SELECT user_id, username, email, status
FROM users
WHERE status = 'active';

-- 06 - Consultar usuários bloqueados
SELECT user_id, username, email, status
FROM users
WHERE status = 'locked';

-- 07 - Consultar usuários inativos
SELECT user_id, username, email, status
FROM users
WHERE status = 'inactive';

-- 08 - Consultar produtos com estoque disponível
SELECT product_id, product_name, price, stock_quantity, is_active
FROM products
WHERE stock_quantity > 0;

-- 09 - Consultar produtos sem estoque
SELECT product_id, product_name, price, stock_quantity, is_active
FROM products
WHERE stock_quantity = 0;

-- 10 - Consultar produtos ativos
SELECT product_id, product_name, price, stock_quantity, is_active
FROM products
WHERE is_active = TRUE;

-- 11 - Consultar produtos inativos
SELECT product_id, product_name, price, stock_quantity, is_active
FROM products
WHERE is_active = FALSE;

-- 12 - Consultar produtos ordenados do menor para o maior preço
SELECT product_id, product_name, price
FROM products
ORDER BY price ASC;

-- 13 - Consultar produtos ordenados do maior para o menor preço
SELECT product_id, product_name, price
FROM products
ORDER BY price DESC;

-- 14 - Consultar pedidos pagos
SELECT order_id, user_id, order_status, total_amount, created_at
FROM orders
WHERE order_status = 'paid';

-- 15 - Consultar pedidos pendentes
SELECT order_id, user_id, order_status, total_amount, created_at
FROM orders
WHERE order_status = 'pending';

-- 16 - Consultar pedidos cancelados
SELECT order_id, user_id, order_status, total_amount, created_at
FROM orders
WHERE order_status = 'cancelled';