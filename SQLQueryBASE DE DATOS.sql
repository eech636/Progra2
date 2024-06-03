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

----------------METERLE DATOS A LOS ROLES--------------------------
-- Insertar registros en la tabla Roles
INSERT INTO Roles (NombreRol) VALUES
('ADMIN'),
('SUPERVISOR'),
('VENDEDOR');
GO
-------------------------------------------------------------------
----------------METERLE DATOS A LOS USUARIOS-----------------------
-- Insertar registros en la tabla Usuarios
INSERT INTO Usuarios (idRol, NombreUsuario, Clave, Email) VALUES
(1, 'Colocho', '123', 'test@test.com'),
(2, 'Rivera', '123', 'test@test.com'),
(3, 'Garcia', '123', 'test3@test.com');
GO
--------------------------------------------------------------------
----------------METERLE DATOS A LOS PRODUCTOS-----------------------
-- Insertar registros en la tabla Productos
INSERT INTO Productos (NombreProducto, CantidadDisponible, Precio, PrecioCosto, Descripcion) VALUES
('Producto 1', 10, 100.00, 80.00, 'Descripcion del Producto 1'),
('Producto 2', 15, 150.00, 120.00, 'Descripcion del Producto 2'),
('Producto 3', 20, 200.00, 160.00, 'Descripcion del Producto 3'),
('Producto 4', 25, 250.00, 200.00, 'Descripcion del Producto 4'),
('Producto 5', 30, 300.00, 240.00, 'Descripcion del Producto 5'),
('Producto 6', 35, 350.00, 280.00, 'Descripcion del Producto 6'),
('Producto 7', 40, 400.00, 320.00, 'Descripcion del Producto 7'),
('Producto 8', 45, 450.00, 360.00, 'Descripcion del Producto 8'),
('Producto 9', 50, 500.00, 400.00, 'Descripcion del Producto 9'),
('Producto 10', 55, 550.00, 440.00, 'Descripcion del Producto 10'),
('Producto 11', 60, 600.00, 480.00, 'Descripcion del Producto 11'),
('Producto 12', 65, 650.00, 520.00, 'Descripcion del Producto 12'),
('Producto 13', 70, 700.00, 560.00, 'Descripcion del Producto 13'),
('Producto 14', 75, 750.00, 600.00, 'Descripcion del Producto 14'),
('Producto 15', 80, 800.00, 640.00, 'Descripcion del Producto 15'),
('Producto 16', 85, 850.00, 680.00, 'Descripcion del Producto 16'),
('Producto 17', 90, 900.00, 720.00, 'Descripcion del Producto 17'),
('Producto 18', 95, 950.00, 760.00, 'Descripcion del Producto 18'),
('Producto 19', 100, 1000.00, 800.00, 'Descripcion del Producto 19'),
('Producto 20', 105, 1050.00, 840.00, 'Descripcion del Producto 20'),
('Producto 21', 110, 1100.00, 880.00, 'Descripcion del Producto 21'),
('Producto 22', 115, 1150.00, 920.00, 'Descripcion del Producto 22'),
('Producto 23', 120, 1200.00, 960.00, 'Descripcion del Producto 23'),
('Producto 24', 125, 1250.00, 1000.00, 'Descripcion del Producto 24'),
('Producto 25', 130, 1300.00, 1040.00, 'Descripcion del Producto 25'),
('Producto 26', 135, 1350.00, 1080.00, 'Descripcion del Producto 26'),
('Producto 27', 140, 1400.00, 1120.00, 'Descripcion del Producto 27'),
('Producto 28', 145, 1450.00, 1160.00, 'Descripcion del Producto 28'),
('Producto 29', 150, 1500.00, 1200.00, 'Descripcion del Producto 29'),
('Producto 30', 155, 1550.00, 1240.00, 'Descripcion del Producto 30');
GO
----------------------------------------------------------------------------
----------------METERLE DATOS A LOS CLIENTES	-----------------------
-- Insertar registros en la tabla Clientes
INSERT INTO Clientes (DUI, NombreCliente, TelefonoCliente, CorreoCliente, Direccion) VALUES
('00100000-1', 'Cliente 1', '70000001', 'cliente1@example.com', 'Direccion 1'),
('00100000-2', 'Cliente 2', '70000002', 'cliente2@example.com', 'Direccion 2'),
('00100000-3', 'Cliente 3', '70000003', 'cliente3@example.com', 'Direccion 3'),
('00100000-4', 'Cliente 4', '70000004', 'cliente4@example.com', 'Direccion 4'),
('00100000-5', 'Cliente 5', '70000005', 'cliente5@example.com', 'Direccion 5'),
('00100000-6', 'Cliente 6', '70000006', 'cliente6@example.com', 'Direccion 6'),
('00100000-7', 'Cliente 7', '70000007', 'cliente7@example.com', 'Direccion 7'),
('00100000-8', 'Cliente 8', '70000008', 'cliente8@example.com', 'Direccion 8'),
('00100000-9', 'Cliente 9', '70000009', 'cliente9@example.com', 'Direccion 9'),
('00100000-0', 'Cliente 10', '70000010', 'cliente10@example.com', 'Direccion 10'),
('00200000-1', 'Cliente 11', '70000011', 'cliente11@example.com', 'Direccion 11'),
('00200000-2', 'Cliente 12', '70000012', 'cliente12@example.com', 'Direccion 12'),
('00200000-3', 'Cliente 13', '70000013', 'cliente13@example.com', 'Direccion 13'),
('00200000-4', 'Cliente 14', '70000014', 'cliente14@example.com', 'Direccion 14'),
('00200000-5', 'Cliente 15', '70000015', 'cliente15@example.com', 'Direccion 15'),
('00200000-6', 'Cliente 16', '70000016', 'cliente16@example.com', 'Direccion 16'),
('00200000-7', 'Cliente 17', '70000017', 'cliente17@example.com', 'Direccion 17'),
('00200000-8', 'Cliente 18', '70000018', 'cliente18@example.com', 'Direccion 18'),
('00200000-9', 'Cliente 19', '70000019', 'cliente19@example.com', 'Direccion 19'),
('00200000-0', 'Cliente 20', '70000020', 'cliente20@example.com', 'Direccion 20'),
('00300000-1', 'Cliente 21', '70000021', 'cliente21@example.com', 'Direccion 21'),
('00300000-2', 'Cliente 22', '70000022', 'cliente22@example.com', 'Direccion 22'),
('00300000-3', 'Cliente 23', '70000023', 'cliente23@example.com', 'Direccion 23'),
('00300000-4', 'Cliente 24', '70000024', 'cliente24@example.com', 'Direccion 24'),
('00300000-5', 'Cliente 25', '70000025', 'cliente25@example.com', 'Direccion 25'),
('00300000-6', 'Cliente 26', '70000026', 'cliente26@example.com', 'Direccion 26'),
('00300000-7', 'Cliente 27', '70000027', 'cliente27@example.com', 'Direccion 27'),
('00300000-8', 'Cliente 28', '70000028', 'cliente28@example.com', 'Direccion 28'),
('00300000-9', 'Cliente 29', '70000029', 'cliente29@example.com', 'Direccion 29'),
('00300000-0', 'Cliente 30', '70000030', 'cliente30@example.com', 'Direccion 30');
GO
