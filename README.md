# 🏬 Business DB - PostgreSQL

**Business DB** es una base de datos relacional desarrollada en PostgreSQL que simula el sistema interno de una **tienda departamental**, como Liverpool o Sears. Está diseñada para gestionar clientes, productos, inventario, pedidos y pagos, con funcionalidades inteligentes como triggers, funciones personalizadas y vistas analíticas.

Este proyecto forma parte de mi portafolio personal, con enfoque profesional y estructurado para demostrar mis habilidades como desarrollador SQL y backend.

---

## 📦 Características principales

- 📋 Gestión de clientes y usuarios del sistema
- 🛍️ Control de productos y categorías
- 📦 Manejo de inventario con actualizaciones automáticas
- 🧾 Registro de órdenes y pagos
- 🧠 Funciones para cálculos comerciales
- 🧩 Triggers para automatizar lógica de negocio
- 👁️‍🗨️ Vistas para análisis de datos
- 🕵️ Bitácora de auditoría para cambios sensibles

---

## 🧠 Estructura del proyecto

```
business-db-postgresql/
│
├── database/
│   ├── schema.sql        # Estructura: tablas, relaciones, claves
│   ├── data.sql          # Datos de prueba realistas
│   ├── triggers.sql      # Automatizaciones (stock, auditoría)
│   ├── functions.sql     # Cálculos: totales, stock bajo, etc.
│   └── views.sql         # Vistas de negocio (ventas, clientes top)
├── README.md             # Este documento
└── .gitignore            # Exclusiones de Git (opcional)
```

---

## ⚙️ Cómo ejecutar el proyecto

1. Clona el repositorio:
   ```bash
   git clone https://github.com/IngCbarrios/business-db-postgresql.git
   cd business-db-postgresql
   ```

2. Carga el esquema:
   ```sql
   \i database/schema.sql
   ```

3. Inserta los datos:
   ```sql
   \i database/data.sql
   ```

4. Activa lógica de negocio:
   ```sql
   \i database/functions.sql
   \i database/triggers.sql
   \i database/views.sql
   ```

---

## 🧪 Ejemplos de uso

🔹 Total gastado por un cliente:
```sql
SELECT total_por_cliente(1);
```

🔹 Total de una orden:
```sql
SELECT calcular_total_orden(2);
```

🔹 Productos con bajo inventario:
```sql
SELECT * FROM productos_stock_bajo(5);
```

🔹 Ver ventas completas:
```sql
SELECT * FROM vista_total_ordenes;
```

🔹 Top 5 clientes:
```sql
SELECT * FROM vista_top_clientes;
```

---

## 🛡️ Seguridad y escalabilidad (opcional)

Este proyecto puede escalar con:
- Roles (`admin`, `employee`, `readonly`)
- Manejo de sesiones y permisos
- Logs de actividad y auditoría extendida
- Integración con aplicaciones web

---

## 📈 ¿Qué habilidades demuestra este proyecto?

✅ Modelado relacional (3FN)  
✅ Buenas prácticas SQL  
✅ Automatización con triggers  
✅ Consultas analíticas y reportes  
✅ Organización profesional en módulos  
✅ Pensamiento backend y escalabilidad

---

## 🙋‍♂️ Autor

> **Christian Alejandro Barrios Quiroz**  
> Biomedical Engineer • SQL & Python Developer  
> GitHub: [@IngCbarrios](https://github.com/IngCbarrios)

---

## 🧾 Licencia

Este proyecto es libre para uso educativo y de portafolio.
