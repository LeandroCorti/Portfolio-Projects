-- Ejercicio 1
-- Liste el detalle de las ordenes, ordenado por el Order Id
SELECT 	orders.id, 
		orders.order_date, 
        orders.ship_address, 
        order_details.product_id, 
        order_details.quantity, 
        order_details.unit_price
From orders
JOIN order_details
ON orders.Id = order_details.order_id
ORDER BY Orders.id;


-- Ejercicio 1 - Bonus Track
-- Agregue al ejercicio 1, la descripcion de los productos
SELECT 	orders.id, 
		orders.order_date, 
        orders.ship_address, 
        order_details.product_id,
        products.product_name,
        order_details.quantity, 
        order_details.unit_price
From orders
JOIN order_details
ON orders.Id = order_details.order_id
JOIN products
ON products.id = order_details.product_id
;

-- Ejercicio 2
-- Agregue al listado una columna que sea el Importe.
SELECT 	orders.id, 
		orders.order_date, 
        orders.ship_address, 
        order_details.product_id, 
        order_details.quantity, 
        order_details.unit_price,
		order_details.quantity * order_details.unit_price AS Importe
From orders
JOIN order_details
ON orders.Id = order_details.order_id
ORDER BY Orders.id;

-- Ejercicio 3
-- Filtre para el listado del punto 1, solo la orden 44
SELECT 	orders.id, 
		orders.order_date, 
        orders.ship_address, 
        order_details.product_id, 
        order_details.quantity, 
        order_details.unit_price
From orders
JOIN order_details
ON orders.Id = order_details.order_id
WHERE orders.Id = 44
ORDER BY Orders.id;

-- Ejercicio 4
-- Muestra todos los campos de las ordenes del employee “Sergienko”
SELECT orders.* 
From orders
JOIN employees
ON orders.employee_id = employees.id
WHERE employees.last_name = 'Sergienko';

-- Ejercicio 5
-- Muestra todos los campos de las ordenes que tienen status distinto a Closed
SELECT orders.* 
From orders
JOIN orders_status
ON orders.status_id = orders_status.id
WHERE orders_status.status_name <> 'Closed';

-- Ejercicio 6
-- Muestra todos los campos de las ordenes con el nombre y apellido de los empleados
SELECT orders.*,
       employees.first_name,
       employees.last_name
From orders
JOIN employees
ON orders.employee_id = employees.id;

-- Ejercicio 7
-- Muestre un listado con todos los clientes que hayan realizado compras cuyo “status order” sea “New”, y la ciudad de envio sea “New York”
SELECT customers.* 
From customers
JOIN orders
ON orders.customer_id = customers.id
JOIN orders_status
ON orders.status_id = orders_status.id
WHERE orders_status.status_name = 'New'
AND orders.ship_city = 'New York';

-- Idem, pero sin duplicados
SELECT DISTINCT customers.* 
From customers
JOIN orders
ON orders.customer_id = customers.id
JOIN orders_status
ON orders.status_id = orders_status.id
WHERE orders_status.status_name = 'New'
AND orders.ship_city = 'New York';

-- Ejercicio 8
-- Muestra todos los campos de las ordenes del empleado cuyo apellido  sea “Kotas” o que incluyan el producto id = “80”
SELECT orders.* 
From orders
JOIN employees
ON orders.employee_id = employees.id
JOIN order_details
ON orders.id = order_details.order_id
WHERE employees.last_name = 'Kotas'
or order_details.product_id = 80;

-- Ejercicio 9
-- Muestra todos los campos de las ordenes del empleado cuyo apellido  sea “Kotas” y que incluyan el producto id = “80”
SELECT orders.* 
From orders
JOIN employees
ON orders.employee_id = employees.id
JOIN order_details
ON orders.id = order_details.order_id
WHERE employees.last_name = 'Kotas'
and order_details.product_id = 80;

-- Ejercicio 10
-- Haga un listado con los cinco mejores clientes, segun sus importes de compras
Select 	customers.id,
		customers.first_name,
		customers.last_name,
		SUM(order_details.quantity * order_details.unit_price) AS importe
From orders
Join customers On customers.id = orders.customer_id
Join order_details on order_details.order_id = orders.id
GROUP BY customers.id, customers.first_name, customers.last_name
Order BY importe DESC
LImit 5;

-- Ejercicio 11
-- Haga un listado de ordenes, con los campos id, nombre y apellido del cliente,  order date, y pais de envio, con las 5 ordenes mas recientes
Select 	orders.id,
		customers.first_name,
		customers.last_name,
        orders.order_date,
        orders.ship_country_region
From orders
Join customers On customers.id = orders.customer_id
Order BY orders.order_date DESC
Limit 5;