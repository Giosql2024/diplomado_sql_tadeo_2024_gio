CREATE DATABASE Libreria
GO

USE Libreria
GO

CREATE SCHEMA Catalogo
GO

CREATE SCHEMA Ventas
GO

CREATE TABLE Catalogo.Autores (
	AutorID INT PRIMARY KEY,
	Nombre VARCHAR (100),
	Apellido VARCHAR (100)
)
GO


CREATE TABLE Catalogo.Libros (
	LibroID INT PRIMARY KEY,
	Titulo VARCHAR (100),
	AutorID INT,
	CategoriaID INT,
	Precio MONEY
	CONSTRAINT FK_AUTORID_CON_AUTORID_LIBROS FOREIGN KEY (AutorID)
	REFERENCES Catalogo.Autores (AutorID),
	CONSTRAINT FK_CATEGORIAID_CON_CATEGORIAID_CATEGORIA FOREIGN KEY (CategoriaID)
	REFERENCES Catalogo.Categoria (CategoriaID)
)
GO

CREATE TABLE Catalogo.Categoria(
	CategoriaID INT PRIMARY KEY,
	Nombre VARCHAR (100)
)
GO

CREATE TABLE Ventas.Ventas (
	VentaID INT PRIMARY KEY,
	ClienteID INT,
	FechaVenta DATE
)
GO

CREATE TABLE Ventas.Clientes (
	ClienteID INT PRIMARY KEY,
	Nombre VARCHAR (100),
	Apellido VARCHAR (100),
	Correo NVARCHAR (100)
)

CREATE TABLE Ventas.Detalle_ventas (
	DetalleID INT PRIMARY KEY,
	VentaID INT,
	LibroID INT,
	Cantidad INT,
	PrecioVenta MONEY
)
GO




ALTER TABLE Ventas.Ventas
ADD CONSTRAINT FK_IDCLIENTE_CON_IDCLIENTE_DETALLE_VENT FOREIGN KEY (ClienteID)
REFERENCES Ventas.Clientes (ClienteID)
GO


ALTER TABLE Ventas.Detalle_ventas
ADD CONSTRAINT FK_LIBROID_CON_LIBROID_LIBROS FOREIGN KEY (LibroID)
REFERENCES Catalogo.Libros (LibroID)

ALTER TABLE Ventas.Detalle_ventas
ADD CONSTRAINT FK_VENTAID_CON_VENTAID_VENTAS FOREIGN KEY (VentaID)
REFERENCES Ventas.Ventas (VentaID)

ALTER TABLE Ventas.Detalle_ventas
ADD CONSTRAINT FK_VENTAID_DETALLEVENTA FOREIGN KEY (VentaID) REFERENCES Ventas.Detalle_ventas(DetalleID)
GO 

--- AÑADIR UNA COLUMNA DE UNA TABLA

ALTER TABLE Catalogo.Autores
ADD Pais_Origen VARCHAR(100)
GO

ALTER TABLE Catalogo.Autores
ADD Fecha_Nacimiento DATE
GO

ALTER TABLE Catalogo.Libros
ADD Fecha_Publicacion DATE
GO

--- MODIFICAR NOMBRES

--- CABMBIAR NOMBRES DE COLUMNAS

--EXEC sp_rename 'esquema.nombre_de_tu_tabla.nombre_actual_de_la_columna', 'nuevo_nombre_de_la_columna', 'COLUMN';

EXEC sp_rename 'Catalogo.Autores.Pais_Origen', 'Pais_nacimiento', 'COLUMN';

EXEC sp_rename 'Catalogo.Autores.Fecha_Nacimiento', 'Fecha_fallecimiento', 'COLUMN';

EXEC sp_rename 'Catalogo.Libros.Fecha_Publicacion', 'Fecha_Lanzamiento', 'COLUMN';


---INGRESAR DATOS
CREATE TABLE  (
	AutorID INT PRIMARY KEY,
	Nombre VARCHAR (100),
	Apellido VARCHAR (100)
)

INSERT INTO Catalogo.Autores (AutorID,Nombre,Apellido)
VALUES
	(1,'GIO','SIERRA'),
	(2,'VITO','TAMAYO'),
	(3,'ANDREA','AVELLA'),
	(4,'NICO','PALOMO'),
	(5,'ESTEBAN','GARNICA'),
	(6,'GUILLERMO','NINO'),
	(7,'MARIELA','LOAIZA'),
	(8,'YULY','JIMENEZ'),
	(9,'RAFAEL','OROZCO'),
	(10,'BAD','BUNNY')

INSERT INTO Catalogo.Libros (LibroID,Titulo,AutorID,CategoriaID,Precio)
VALUES
	(1,'HOJA',1,1,10),
	(2,'NOVIA',2,2,21),
	(3,'MOMENTOS',3,3,18),
	(4,'PUEBLO',4,4,27),
	(5,'PECADO',5,5,48),
	(6,'DULCE',6,6,33),
	(7,'GANAS',7,7,27),
	(8,'DULCE',8,8,66),
	(9,'ENCANTO',9,9,55),
	(10,'DULCE',10,10,79)


INSERT INTO Catalogo.Categoria(CategoriaID,Nombre)
VALUES
	(1,'ROMANTICO'),
	(2,'HISTORIA'),
	(3,'FANTASIA'),
	(4,'COMEDIA'),
	(5,'TERROR'),
	(6,'SUSPENSO'),
	(7,'TRAGEDIA'),
	(8,'ESPIRITUAL'),
	(9,'FINANZAS'),
	(10,'INFANTIL')




INSERT INTO Ventas.Clientes (ClienteID,Nombre,Apellido,Correo)
VALUES
	(1,'PAULA','TORRES','paula_torres@correo.com'),
	(2,'VITO','VALENCIA','vito_valencia@correo.com'),
	(3,'GIO','MARTINEZ','gio_martinez@correo.com'),
	(4,'DIANA','SIERRA','diana_sierra@correo.com'),
	(5,'LINA','AVELLANA','lina_avellana@correo.com'),
	(6,'MARCELA','AVILA','marcela_avila@correo.com'),
	(7,'EDWIN','BENITEZ','edwin_benitez@correo.com'),
	(8,'MARIELA','ROJAS','mariela_rojas@correo.com'),
	(9,'GINA','BARBOSA','gina_barbosa@correo.com'),
	(10,'JUAN','PETRO','juan_petro@correo.com')


INSERT INTO Ventas.Ventas (VentaID,ClienteID,FechaVenta)
VALUES
	(1,1,'2024-01-1'),
	(2,2,'2024-02-3'),
	(3,3,'2024-03-4'),
	(4,4,'2024-04-6'),
	(5,5,'2024-05-7'),
	(6,6,'2024-02-17'),
	(7,7,'2024-03-12'),
	(8,8,'2024-04-23'),
	(9,9,'2024-01-24'),
	(10,10,'2024-02-13')



INSERT INTO Ventas.Detalle_ventas (DetalleID,VentaID,LibroID,Cantidad,PrecioVenta)
VALUES
	(1,1,1,1,10),
	(2,3,2,1,21),
	(3,4,3,2,18),
	(4,1,4,1,27),
	(5,3,5,1,48),
	(6,5,6,3,33),
	(7,6,7,1,27),
	(8,7,8,2,66),
	(9,8,9,1,55),
	(10,6,10,5,79)


--- POR SI SE QUIERE ELIMINAR LAS COLUMNAS NUEVAS QUE ESTAN CON VALOS NULL

ALTER TABLE table_name
  DROP COLUMN column_name;


  ALTER TABLE Catalogo.Autores
DROP COLUMN Pais_Origen
GO

ALTER TABLE Catalogo.Autores
DROP COLUMN Fecha_Nacimiento
GO

ALTER TABLE Catalogo.Libros
DROP COLUMN Fecha_Publicacion
GO