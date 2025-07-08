-- ============================================
-- FUNCIÓN: Descontar del inventario tras venta
-- ============================================
-- FUNCIÓN ACTUALIZADA
CREATE OR REPLACE FUNCTION descontar_inventario()
RETURNS TRIGGER AS $$
BEGIN
    -- Verificar si hay suficiente stock
    PERFORM 1 FROM inventory
    WHERE product_id = NEW.product_id AND quantity >= NEW.quantity;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Stock insuficiente para el producto con ID %', NEW.product_id;
    END IF;

    -- Descontar cantidad del inventario
    UPDATE inventory
    SET quantity = quantity - NEW.quantity,
        last_updated = NOW()
    WHERE product_id = NEW.product_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- TRIGGER ACTUALIZADO
CREATE TRIGGER tr_descontar_inventario
BEFORE INSERT ON order_items
FOR EACH ROW
EXECUTE FUNCTION descontar_inventario();



-- ============================================
-- FUNCIÓN: Registrar cambios de precio en audit_log
-- ============================================
CREATE OR REPLACE FUNCTION registrar_cambio_precio()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.price <> OLD.price THEN
        INSERT INTO audit_log (table_name, action, changed_by, details)
        VALUES (
            'products',
            'UPDATE',
            current_user,
            FORMAT(
                'Producto ID %s: precio cambiado de %s a %s',
                OLD.product_id, OLD.price, NEW.price
            )
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


