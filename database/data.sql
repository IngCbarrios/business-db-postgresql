-- Insertar usuarios administrativos
INSERT INTO users (username, email, password_hash, role) VALUES
('admin1', 'admin1@empresa.com', 'hash_admin1', 'admin'),
('empleado1', 'empleado1@empresa.com', 'hash_empleado1', 'employee');

-- Insertar clientes
INSERT INTO customers (full_name, email, phone, address, city, country) VALUES
('Juan Pérez', 'juanperez@gmail.com', '555-1234', 'Calle Falsa 123', 'CDMX', 'México'),
('Ana López', 'analopez@hotmail.com', '555-5678', 'Av. Siempre Viva 742', 'Guadalajara', 'México'),
('Carlos Ruiz', 'carlosr@yahoo.com', '555-8765', 'Calle Reforma 10', 'Monterrey', 'México');

-- Insertar categorías
INSERT INTO categories (category_name, description) VALUES
('Electrónica', 'Dispositivos electrónicos y gadgets'),
('Ropa', 'Vestimenta y accesorios'),
('Hogar', 'Artículos para el hogar');

-- Insertar productos
INSERT INTO products (name, description, price, category_id) VALUES
('Laptop HP', 'Laptop con 16GB RAM y SSD 512GB', 14500.00, 1),
('Camisa Azul', 'Camisa de vestir 100% algodón', 399.00, 2),
('Licuadora Oster', 'Licuadora de acero inoxidable 3 velocidades', 950.00, 3);

-- Inventario inicial
INSERT INTO inventory (product_id, quantity) VALUES
(1, 15), -- Laptop
(2, 50), -- Camisa
(3, 25); -- Licuadora

-- Órdenes
INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2025-06-20', 'completed'),
(2, '2025-06-21', 'pending'),
(3, '2025-06-22', 'completed');

-- Detalles de cada orden
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 14500.00), -- Juan compró una laptop
(2, 2, 3, 399.00),   -- Ana compró 3 camisas
(3, 3, 2, 950.00);   -- Carlos compró 2 licuadoras

-- Pagos
INSERT INTO payments (order_id, payment_method, amount, paid_at) VALUES
(1, 'Tarjeta de Crédito', 14500.00, '2025-06-20 15:30'),
(3, 'PayPal', 1900.00, '2025-06-22 10:00');
