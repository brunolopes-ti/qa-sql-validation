-- 01 - Consultar pedidos com dados dos usuários
SELECT 
    o.order_id,
    u.user_id,
    u.username,
    u.email,
    u.status AS user_status,
    o.order_status,
    o.total_amount,
    o.created_at
FROM orders o
INNER JOIN users u
    ON o.user_id = u.user_id
ORDER BY o.order_id;

-- 02 - Consultar itens dos pedidos com dados dos produtos
SELECT 
    oi.order_item_id,
    oi.order_id,
    p.product_id,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_total
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
ORDER BY oi.order_id;

-- 03 - Consultar pedido completo com usuário, produto e itens
SELECT 
    o.order_id,
    u.username,
    u.email,
    u.status AS user_status,
    o.order_status,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_total,
    o.total_amount AS order_total
FROM orders o
INNER JOIN users u
    ON o.user_id = u.user_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id;

-- 04 - Validar total do pedido comparando com a soma dos itens
SELECT 
    o.order_id,
    u.username,
    o.order_status,
    o.total_amount AS order_total,
    SUM(oi.quantity * oi.unit_price) AS calculated_total
FROM orders o
INNER JOIN users u
    ON o.user_id = u.user_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY 
    o.order_id,
    u.username,
    o.order_status,
    o.total_amount
ORDER BY o.order_id;

-- 05 - Consultar pedidos e identificar se possuem itens
SELECT 
    o.order_id,
    u.username,
    o.order_status,
    o.total_amount,
    oi.order_item_id,
    oi.product_id,
    oi.quantity
FROM orders o
INNER JOIN users u
    ON o.user_id = u.user_id
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
ORDER BY o.order_id;

-- 06 - Consultar produtos vendidos por pedido
SELECT 
    o.order_id,
    o.order_status,
    p.product_name,
    p.price,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_total
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id, p.product_name;

-- 07 - Consultar usuários com seus respectivos pedidos
SELECT 
    u.user_id,
    u.username,
    u.status AS user_status,
    o.order_id,
    o.order_status,
    o.total_amount
FROM users u
LEFT JOIN orders o
    ON u.user_id = o.user_id
ORDER BY u.user_id;