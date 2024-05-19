USE SistemaInventarioyFacturacion;

GO
-- Creación de la tabla Productos
CREATE TABLE Productos (
    IdProducto INT PRIMARY KEY IDENTITY,
    NombreProducto NVARCHAR(100),
    CantidadDisponible INT,
    Precio DECIMAL(10, 2)
);
GO

-- Creación de la tabla Roles
CREATE TABLE Roles (
    IdRol INT PRIMARY KEY IDENTITY,
    NombreRol NVARCHAR(50)
);
GO

-- Creación de la tabla Usuarios
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

-- Creación de la tabla Clientes

CREATE TABLE [dbo].[Clientes](
	[DUI] [nvarchar](10) NOT NULL,
	[NombreCliente] [nvarchar](100) NULL,
	[TelefonoCliente] [nvarchar](15) NULL,
	[CorreoCliente] [nvarchar](100) NULL,
	[Direccion] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[DUI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-- Creación de la tabla Ventas
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

  -----------AGREGANDO DATOS A TABLA CLIENTES ---------------
  INSERT INTO [SistemaInventarioyFacturacion].[dbo].[Clientes] 
([DUI], [NombreCliente], [TelefonoCliente], [CorreoCliente], [Direccion])
VALUES
('00123456-7', 'Juan Perez', '555-0100', 'juan.perez@example.com', 'Calle Falsa 123'),
('00123457-8', 'Maria Gomez', '555-0101', 'maria.gomez@example.com', 'Avenida Siempre Viva 742'),
('00123458-9', 'Carlos Ruiz', '555-0102', 'carlos.ruiz@example.com', 'Boulevard de los Sueños 56'),
('00123459-0', 'Ana Lopez', '555-0103', 'ana.lopez@example.com', 'Calle de la Paz 34'),
('00123460-1', 'Luis Hernandez', '555-0104', 'luis.hernandez@example.com', 'Avenida Principal 678'),
('00123461-2', 'Carmen Fernandez', '555-0105', 'carmen.fernandez@example.com', 'Calle del Sol 45'),
('00123462-3', 'Jose Martinez', '555-0106', 'jose.martinez@example.com', 'Avenida de la Luna 89'),
('00123463-4', 'Laura Sanchez', '555-0107', 'laura.sanchez@example.com', 'Calle Estrella 23'),
('00123464-5', 'Miguel Torres', '555-0108', 'miguel.torres@example.com', 'Boulevard del Mar 101'),
('00123465-6', 'Paula Ramirez', '555-0109', 'paula.ramirez@example.com', 'Calle del Rio 12'),
('00123466-7', 'Andres Gomez', '555-0110', 'andres.gomez@example.com', 'Avenida Central 99'),
('00123467-8', 'Monica Rojas', '555-0111', 'monica.rojas@example.com', 'Calle Norte 77'),
('00123468-9', 'Ricardo Diaz', '555-0112', 'ricardo.diaz@example.com', 'Boulevard Este 44'),
('00123469-0', 'Sandra Morales', '555-0113', 'sandra.morales@example.com', 'Avenida Oeste 33'),
('00123470-1', 'Jorge Romero', '555-0114', 'jorge.romero@example.com', 'Calle Sur 22'),
('00123471-2', 'Lucia Alvarez', '555-0115', 'lucia.alvarez@example.com', 'Avenida Norte 11'),
('00123472-3', 'Pedro Jimenez', '555-0116', 'pedro.jimenez@example.com', 'Calle de la Esperanza 56'),
('00123473-4', 'Patricia Navarro', '555-0117', 'patricia.navarro@example.com', 'Avenida del Bosque 98'),
('00123474-5', 'Diego Ruiz', '555-0118', 'diego.ruiz@example.com', 'Calle de la Flor 67'),
('00123475-6', 'Raquel Herrera', '555-0119', 'raquel.herrera@example.com', 'Avenida del Parque 89'),
('00123476-7', 'Fernando Castro', '555-0120', 'fernando.castro@example.com', 'Boulevard del Lago 101'),
('00123477-8', 'Isabel Mendez', '555-0121', 'isabel.mendez@example.com', 'Calle del Cielo 34'),
('00123478-9', 'Victor Figueroa', '555-0122', 'victor.figueroa@example.com', 'Avenida del Sol 45'),
('00123479-0', 'Elena Ortiz', '555-0123', 'elena.ortiz@example.com', 'Calle de las Estrellas 56'),
('00123480-1', 'Francisco Vargas', '555-0124', 'francisco.vargas@example.com', 'Avenida del Mar 67'),
('00123481-2', 'Gloria Delgado', '555-0125', 'gloria.delgado@example.com', 'Boulevard de los Pinos 78'),
('00123482-3', 'Oscar Gutierrez', '555-0126', 'oscar.gutierrez@example.com', 'Calle de las Flores 89'),
('00123483-4', 'Silvia Castro', '555-0127', 'silvia.castro@example.com', 'Avenida de la Luna 101'),
('00123484-5', 'Emilio Ortiz', '555-0128', 'emilio.ortiz@example.com', 'Calle del Sol 12'),
('00123485-6', 'Marina Gomez', '555-0129', 'marina.gomez@example.com', 'Avenida Siempre Viva 23'),
('00123486-7', 'Luis Ramos', '555-0130', 'luis.ramos@example.com', 'Boulevard de los Sueños 34'),
('00123487-8', 'Sofia Fernandez', '555-0131', 'sofia.fernandez@example.com', 'Calle de la Paz 45'),
('00123488-9', 'Martin Jimenez', '555-0132', 'martin.jimenez@example.com', 'Avenida Principal 56'),
('00123489-0', 'Eva Martinez', '555-0133', 'eva.martinez@example.com', 'Boulevard del Mar 67'),
('00123490-1', 'Hector Lopez', '555-0134', 'hector.lopez@example.com', 'Calle del Rio 78'),
('00123491-2', 'Alejandra Sanchez', '555-0135', 'alejandra.sanchez@example.com', 'Avenida Central 89'),
('00123492-3', 'Rafael Rojas', '555-0136', 'rafael.rojas@example.com', 'Calle Norte 101'),
('00123493-4', 'Lorena Diaz', '555-0137', 'lorena.diaz@example.com', 'Avenida Este 12'),
('00123494-5', 'Daniela Morales', '555-0138', 'daniela.morales@example.com', 'Calle Oeste 23'),
('00123495-6', 'Esteban Romero', '555-0139', 'esteban.romero@example.com', 'Boulevard Sur 34'),
('00123496-7', 'Claudia Alvarez', '555-0140', 'claudia.alvarez@example.com', 'Avenida Norte 45'),
('00123497-8', 'Gabriel Jimenez', '555-0141', 'gabriel.jimenez@example.com', 'Calle de la Esperanza 56'),
('00123498-9', 'Adriana Navarro', '555-0142', 'adriana.navarro@example.com', 'Avenida del Bosque 67'),
('00123499-0', 'Julian Ruiz', '555-0143', 'julian.ruiz@example.com', 'Boulevard del Lago 78'),
('00234500-1', 'Ines Herrera', '555-0144', 'ines.herrera@example.com', 'Calle del Cielo 89'),
('00234501-2', 'Pablo Castro', '555-0145', 'pablo.castro@example.com', 'Avenida del Sol 101'),
('00234502-3', 'Veronica Mendez', '555-0146', 'veronica.mendez@example.com', 'Calle de las Estrellas 12'),
('00234503-4', 'Alberto Figueroa', '555-0147', 'alberto.figueroa@example.com', 'Boulevard del Mar 23');
----------------------------------------------------------------------------------------------------------------