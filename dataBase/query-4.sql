SELECT c.nombre, c.apellidos, COUNT(i.idProducto) AS cantidad_productos
FROM Cliente c
JOIN Inscripcion i ON c.id = i.idCliente
GROUP BY c.id, c.nombre, c.apellidos
HAVING COUNT(i.idProducto) > 2;