SELECT s.nombre AS Sucursal, COUNT(DISTINCT v.idCliente) AS total_clientes
FROM Sucursal s
LEFT JOIN Visitan v ON s.id = v.idSucursal
GROUP BY s.id, s.nombre
ORDER BY total_clientes DESC;