SELECT DISTINCT p.nombre
FROM Producto p
JOIN Disponibilidad d ON p.id = d.idProducto
JOIN Sucursal s ON d.idSucursal = s.id
WHERE s.ciudad = 'Medellín'

EXCEPT

SELECT DISTINCT p.nombre
FROM Producto p
JOIN Disponibilidad d ON p.id = d.idProducto
JOIN Sucursal s ON d.idSucursal = s.id
WHERE s.ciudad = 'Bogotá';