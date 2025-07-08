-- ================================================
-- Vista: Productos con stock y categoría
-- ================================================

CREATE OR REPLACE VIEW vista_productos_con_stock AS
SELECT 
    p.product_id,
    p.name AS product_name,
    c.category_name,
    i.quantity AS stock,
    p.price
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN inventory i ON p.product_id = i.product_id;

-- ================================================
-- Vista: Total de ordenes por cliente
-- ================================================
CREATE OR REPLACE VIEW vista_total_ordenes AS
SELECT 
    o.order_id,
    o.order_date,
    c.full_name AS customer,
    SUM(oi.quantity * oi.unit_price) AS total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.order_date, c.full_name;

-- ================================================
-- Vista: Total gastado por cliente
-- ================================================

CREATE OR REPLACE VIEW  AS
SELECT 
    c.customer_id,
    c.full_name,
    SUM(p.amount) AS total_gastado
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON p.order_id = o.order_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_gastado DESC
LIMIT 5;