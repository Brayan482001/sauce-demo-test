
CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);

CREATE TABLE Sucursal (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);

CREATE TABLE Producto (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipoProducto VARCHAR(100) NOT NULL
);

CREATE TABLE Inscripcion (
    idProducto INT,
    idCliente INT,
    FOREIGN KEY (idProducto) REFERENCES Producto(id),
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

CREATE TABLE Disponibilidad (
    idSucursal INT,
    idProducto INT,
    PRIMARY KEY (idSucursal, idProducto),
    FOREIGN KEY (idSucursal) REFERENCES Sucursal(id),
    FOREIGN KEY (idProducto) REFERENCES Producto(id)
);

CREATE TABLE Visitan (
    idSucursal INT,
    idCliente INT,
    fechaVisita DATE NOT NULL,
    PRIMARY KEY (idSucursal, idCliente),
    FOREIGN KEY (idSucursal) REFERENCES Sucursal(id),
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);