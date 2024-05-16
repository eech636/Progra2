USE SistemaInventarioyFacturacion;

GO
-- Creaci�n de la tabla Productos
CREATE TABLE Productos (
    IdProducto INT PRIMARY KEY IDENTITY,
    NombreProducto NVARCHAR(100),
    CantidadDisponible INT,
    Precio DECIMAL(10, 2)
);
GO

-- Creaci�n de la tabla Roles
CREATE TABLE Roles (
    IdRol INT PRIMARY KEY IDENTITY,
    NombreRol NVARCHAR(50)
);
GO

-- Creaci�n de la tabla Usuarios
CREATE TABLE Usuarios (
    IdUsuario INT PRIMARY KEY IDENTITY,
    NombreUsuario NVARCHAR(50),
    Clave NVARCHAR(50),
	Email VARCHAR(150) NOT NULL,
    IdRol INT,
    FOREIGN KEY (IdRol) REFERENCES Roles(IdRol),
	CONSTRAINT UQ_Email UNIQUE(Email)
);
GO

-- Creaci�n de la tabla Clientes
CREATE TABLE Clientes (
    DUI NVARCHAR(10) PRIMARY KEY,
    NombreCliente NVARCHAR(100),
    TelefonoCliente NVARCHAR(15),
    CorreoCliente NVARCHAR(100),
    Direccion NVARCHAR(200)
);
GO

-- Creaci�n de la tabla Ventas
CREATE TABLE Ventas (
    IdProducto INT,
    DUI NVARCHAR(10),
    TotalVenta DECIMAL(10, 2),
    FechaVenta DATE,
    CodigoFactura INT PRIMARY KEY IDENTITY,
    IdUsuario INT,
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto),
    FOREIGN KEY (DUI) REFERENCES Clientes(DUI),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
);
GO

INSERT INTO Roles (NombreRol) VALUES ('Rol 1');
SELECT * FROM Roles;
SELECT * FROM Productos;