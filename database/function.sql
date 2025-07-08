-- ================================================
-- FUNCIÓN 1: Calcular el total de una orden
-- ================================================
CREATE OR REPLACE FUNCTION calcular_total_orden(p_order_id INT)
RETURNS NUMERIC AS $$
DECLARE
    total NUMERIC;
BEGIN
    SELECT SUM(quantity * unit_price)
    INTO total
    FROM order_items
    WHERE order_id = p_order_id;

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;



-- ================================================
-- FUNCIÓN 2: Total gastado por cliente
-- ================================================
CREATE OR REPLACE FUNCTION total_por_cliente(p_customer_id INT)
RETURNS NUMERIC AS $$
DECLARE
    total NUMERIC;
BEGIN
    SELECT SUM(amount)
    INTO total
    FROM payments p
    JOIN orders o ON p.order_id = o.order_id
    WHERE o.customer_id = p_customer_id;

    RETURN COALESCE(total, 0);
END;
$$ LANGUAGE plpgsql;


-- ================================================
-- FUNCIÓN 3: Productos con stock menor a X unidades
-- ================================================
CREATE OR REPLACE FUNCTION productos_stock_bajo(min_stock INT DEFAULT 5)
RETURNS TABLE(product_id INT, name VARCHAR(100), quantity INT) AS $$
BEGIN
    RETURN QUERY
    SELECT p.product_id, p.name, i.quantity
    FROM inventory i
    JOIN products p ON p.product_id = i.product_id
    WHERE i.quantity < min_stock;
END;
$$ LANGUAGE plpgsql;


