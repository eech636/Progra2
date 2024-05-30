create  database SistemaInventarioFacturacionDB;
use SistemaInventarioFacturacionDB
------------TABLA ROLES-------------
CREATE TABLE Roles (
idRol int PRIMARY KEY IDENTITY(1,1),
NombreRol VARCHAR(50) NOT NULL
);
GO
--------------TABLA USUARIOS-----------------

CREATE TABLE Usuarios(
idUsuario INT PRIMARY KEY IDENTITY (1,1),
idRol INT  NOT NULL,
NombreUsuario VARCHAR (250) NOT NULL,
Clave  VARCHAR (250) NOT NULL,
Email VARCHAR (250) NOT NULL,
FOREIGN KEY(idRol) REFERENCES Roles(idRol)
);
go

--------------TABLA ESTADO VENTA ---------------
CREATE TABLE EstadoVenta(
idEstadoVenta INT PRIMARY KEY IDENTITY (1,1),
Nombre  VARCHAR(50) NOT NULL
);
GO

----------------TABLA CLIENTE-------------------
CREATE TABLE Clientes(
DUI VARCHAR(10) PRIMARY KEY,
NombreCliente VARCHAR (250) NOT NULL,
TelefonoCliente VARCHAR (10),
CorreoCliente VARCHAR (250),
Direccion TEXT
);
GO

--------------TABLA FACTURAS----------------------
CREATE TABLE Facturas (
idFactura  INT PRIMARY KEY IDENTITY(1,1),
TotalVenta DECIMAL(19,4),
FechaFactura DATETIME
)
GO
---------------TABLA PRODUCTOS---------------
CREATE TABLE Productos (
idProducto INT PRIMARY KEY IDENTITY (1,1),
NombreProducto VARCHAR(250),
CantidadDisponible INT,
Precio DECIMAL(19,4),
PrecioCosto DECIMAL(19,4),
Descripcion TEXT
);
GO
------------TABLA VENTAS-----------------
CREATE TABLE Ventas (
idVenta INT PRIMARY KEY IDENTITY(1,1),
idUsuario INT NOT NULL,
idFactura INT NOT NULL,
idEstadoVenta INT NOT NULL,
DUI VARCHAR (10) NOT NULL,
FechaVenta DATETIME NOT NULL,
FOREIGN KEY (idUsuario) REFERENCES  Usuarios(idUsuario),
FOREIGN KEY (idFactura) REFERENCES Facturas(idFactura),
FOREIGN KEY (idEstadoVenta) REFERENCES EstadoVenta(idEstadoVenta),
FOREIGN KEY (DUI)REFERENCES Clientes(DUI)
);
GO

-----------TABLA PRODUCTOS VENTAS------------
CREATE TABLE ProductosVentas(
idVenta INT NOT NULL,
idProducto INT NOT NULL,
FOREIGN KEY (idVenta) REFERENCES Ventas(idVenta),
FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);
