SELECT 
    c.nombre, 
    c.apellidos, 
    COALESCE(CAST(v.max_fecha AS VARCHAR), 'Sin visitas') AS ultima_visita,
    COALESCE(s.nombre, 'N/A') AS sucursal
FROM Cliente c
LEFT JOIN (
    SELECT idCliente, MAX(fechaVisita) as max_fecha
    FROM Visitan
    GROUP BY idCliente
) v_max ON c.id = v_max.idCliente
LEFT JOIN Visitan v ON v.idCliente = v_max.idCliente AND v.fechaVisita = v_max.max_fecha
LEFT JOIN Sucursal s ON v.idSucursal = s.id;