CREATE DATABASE ALBUM_DB
GO
USE ALBUM_DB
GO
CREATE TABLE Niveles (
ID TINYINT PRIMARY KEY,
Nombre VARCHAR(5) NOT NULL
)
GO
CREATE TABLE Albumes (
ID INT PRIMARY KEY IDENTITY (1,1),
Nombre VARCHAR(50) NOT NULL
)
GO
CREATE TABLE Usuarios (
ID INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50) NOT NULL,
Apellido VARCHAR(50) NOT NULL,
Email VARCHAR(100) UNIQUE,
Clave VARCHAR(100) NOT NULL,
Monedas INT DEFAULT 0,
Nivel TINYINT FOREIGN KEY REFERENCES Niveles(ID) 
)
GO
CREATE TABLE Usuarios_X_Albumes(
IDAlbum INT FOREIGN KEY REFERENCES Albumes(ID) NOT NULL,
IDUsuario INT FOREIGN KEY REFERENCES Usuarios(ID) NOT NULL,
PRIMARY KEY(IDAlbum, IDUsuario)
)
GO
CREATE TABLE Tipos(
ID TINYINT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50) NOT NULL,
Descripcion VARCHAR(100) NOT NULL
)
GO


CREATE TABLE Figuritas (
IDFigurita INT PRIMARY KEY IDENTITY(1,1),
IDAlbum INT FOREIGN KEY REFERENCES Albumes(ID),
Tipo TINYINT FOREIGN KEY REFERENCES Tipos(ID),
Pegada BIT DEFAULT 0,
Activo BIT DEFAULT 1
)
GO
CREATE TABLE Usuarios_X_Figuritas(
IDUsuario INT FOREIGN KEY REFERENCES Usuarios(ID) NOT NULL,
IDFigurita INT FOREIGN KEY REFERENCES Figuritas(IDFigurita) NOT NULL
)

CREATE TABLE Nacionalidad(
PAIS_NAC VARCHAR(50) NOT NULL,
GENTILICIO_NAC VARCHAR(70) NOT NULL,
ISO_NAC VARCHAR(3) PRIMARY KEY
)
GO
CREATE TABLE Estadios (
ID SMALLINT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(100) NOT NULL,
Alias VARCHAR(50),
Capacidad VARCHAR(5) NOT NULL CHECK (Capacidad LIKE '%[0-9]%'),
Barrio VARCHAR(50),
Calle VARCHAR(150),
Imagen VARCHAR(250),
Activo BIT DEFAULT 1
)
GO
CREATE TABLE Equipos (
ID SMALLINT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(100) NOT NULL,
Alias VARCHAR(50),
Ciudad VARCHAR(80) NOT NULL,
Fundacion SMALLINT CHECK (Fundacion > 1800 AND Fundacion < YEAR(GETDATE())),
Estadio SMALLINT NOT NULL FOREIGN KEY REFERENCES Estadios (ID),
Imagen VARCHAR(250),
Activo BIT DEFAULT 1
)
GO
CREATE TABLE Posiciones(
Codigo VARCHAR(3) PRIMARY KEY,
Descripcion VARCHAR(20) NOT NULL
)
GO

CREATE TABLE Jugadores (
ID INT PRIMARY KEY IDENTITY(1,1),
Nombres VARCHAR(80) NOT NULL,
Apellidos VARCHAR(80) NOT NULL,
FechaDeNacimiento DATE NOT NULL,
Nacionalidad VARCHAR(3) FOREIGN KEY REFERENCES Nacionalidad (ISO_NAC) NOT NULL,
Equipo SMALLINT FOREIGN KEY REFERENCES Equipos (ID),
Posicion VARCHAR(3) FOREIGN KEY REFERENCES Posiciones (Codigo) NOT NULL,
Imagen VARCHAR(250),
Activo BIT DEFAULT 1
)

INSERT INTO Nacionalidad(PAIS_NAC,GENTILICIO_NAC,ISO_NAC)VALUES('Argentina','ARGENTINA','ARG');

INSERT INTO Posiciones 
VALUES
('ARQ','Arquero'),
('DEF','Defensor'),
('MED','Mediocampista'),
('DEL','Delantero')


INSERT INTO Estadios (Nombre, Alias, Capacidad, Barrio, Calle, Imagen)
VALUES
('Antonio Vespucio Liberti', 'Monumental', '83196', 'Nuñez', 'Av. Pres. Figueroa Alcorta 7597', 'https://image-service.onefootball.com/transform?w=280&h=210&dpr=2&image=https%3A%2F%2Fwp-images.onefootball.com%2Fwp-content%2Fuploads%2Fsites%2F12%2F2022%2F02%2FESTADIO-MONUMENTAL-DE-NU%25C3%2591EZ-1000x750.jpg')

INSERT INTO Equipos (Nombre, Alias, Ciudad, Fundacion, Estadio, Imagen)
VALUES ('River Plate', 'El Millonario', 'Ciudad Autónoma de Buenos Aires', 1901, (SELECT ID FROM Estadios WHERE Nombre LIKE '%Liberti%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Escudo_del_C_A_River_Plate.svg/1200px-Escudo_del_C_A_River_Plate.svg.png')

INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen,Activo)
VALUES ('Franco', 'Armani', '1986-10-16', 'ARG', 1, 'ARQ', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/1638-01-armani-imagengrillapaginaplantel.png',1 )


alter table Figuritas 
add IDJugador int foreign key references Jugadores (ID)

insert into Figuritas (IDAlbum, Tipo, Pegada, Activo, IDJugador)
values (1, 3, 0,0, 1)

select * from Figuritas
select * from Jugadores

insert into Albumes(Nombre)
values ('Liga Profesional Argentina 2023')



insert into Tipos (Nombre, Descripcion)
values ('Legendaria', ''),
('Especial', ''),
('Estándar', '')


SELECT DISTINCT A.Id, A.Nombre, A.Codigo, A.Descripcion, M.Descripcion AS Marca, C.Descripcion AS
Categoria, A.Precio, A.IdMarca, A.IdCategoria FROM ARTICULOS A LEFT JOIN MARCAS M ON M.ID = A.IdMarca
LEFT JOIN CATEGORIAS C ON C.ID = A.IdCategoria




--idfigu, idalbum, activo, pegada, idjugador, nombre, apellido, imagen