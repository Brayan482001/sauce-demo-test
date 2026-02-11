SELECT DISTINCT c.nombre, c.apellidos
FROM Cliente c
JOIN Visitan v ON c.id = v.idCliente
JOIN Sucursal s ON v.idSucursal = s.id
WHERE s.nombre = 'Norte' 
  AND v.fechaVisita >= CURRENT_DATE - INTERVAL '1 month';