-- QA-VAL-01 - Validar usuários bloqueados
SELECT 
    user_id,
    username,
    email,
    status
FROM users
WHERE status = 'locked';

-- QA-VAL-02 - Validar produtos ativos sem estoque
SELECT 
    product_id,
    product_name,
    price,
    stock_quantity,
    is_active
FROM products
WHERE is_active = TRUE
AND stock_quantity = 0;

-- QA-VAL-03 - Validar produtos inativos
SELECT 
    product_id,
    product_name,
    price,
    stock_quantity,
    is_active
FROM products
WHERE is_active = FALSE;

-- QA-VAL-04 - Validar pedidos sem itens
SELECT 
    o.order_id,
    o.user_id,
    o.order_status,
    o.total_amount
FROM orders o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;

-- QA-VAL-05 - Validar divergência entre total do pedido e soma dos itens
SELECT 
    o.order_id,
    o.total_amount AS order_total,
    SUM(oi.quantity * oi.unit_price) AS calculated_total
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY 
    o.order_id,
    o.total_amount
HAVING o.total_amount <> SUM(oi.quantity * oi.unit_price);

-- QA-VAL-06 - Validar pedidos de usuários bloqueados
SELECT 
    o.order_id,
    u.username,
    u.status,
    o.order_status,
    o.total_amount
FROM orders o
INNER JOIN users u
    ON o.user_id = u.user_id
WHERE u.status = 'locked';

-- QA-VAL-07 - Validar pedidos de usuários inativos
SELECT 
    o.order_id,
    u.username,
    u.status,
    o.order_status,
    o.total_amount
FROM orders o
INNER JOIN users u
    ON o.user_id = u.user_id
WHERE u.status = 'inactive';

-- QA-VAL-08 - Validar produtos inativos vinculados a pedidos
SELECT 
    o.order_id,
    p.product_id,
    p.product_name,
    p.is_active,
    oi.quantity,
    oi.unit_price
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
INNER JOIN orders o
    ON oi.order_id = o.order_id
WHERE p.is_active = FALSE;

-- QA-VAL-09 - Validar produtos sem estoque vinculados a pedidos não cancelados
SELECT 
    o.order_id,
    o.order_status,
    p.product_id,
    p.product_name,
    p.stock_quantity,
    oi.quantity
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
INNER JOIN orders o
    ON oi.order_id = o.order_id
WHERE p.stock_quantity = 0
AND o.order_status <> 'cancelled';

-- QA-VAL-10 - Validar pedidos com status inválido
SELECT 
    order_id,
    order_status
FROM orders
WHERE order_status NOT IN ('pending', 'paid', 'cancelled');

-- QA-VAL-11 - Validar usuários com status inválido
SELECT 
    user_id,
    username,
    status
FROM users
WHERE status NOT IN ('active', 'locked', 'inactive');

-- QA-VAL-12 - Validar produtos com preço zerado ou negativo
SELECT 
    product_id,
    product_name,
    price
FROM products
WHERE price <= 0;

-- QA-VAL-13 - Validar pedidos com valor zerado ou negativo
SELECT 
    order_id,
    total_amount
FROM orders
WHERE total_amount <= 0;