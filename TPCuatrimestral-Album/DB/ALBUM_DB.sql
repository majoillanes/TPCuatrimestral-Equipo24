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
IDFigurita BIGINT PRIMARY KEY IDENTITY(1,1),
IDAlbum INT FOREIGN KEY REFERENCES Albumes(ID),
Tipo TINYINT FOREIGN KEY REFERENCES Tipos(ID),
Pegada BIT DEFAULT 0,
Activo BIT DEFAULT 1
)
GO
CREATE TABLE Usuarios_X_Figuritas(
IDUsuario INT FOREIGN KEY REFERENCES Usuarios(ID) NOT NULL,
IDFigurita BIGINT FOREIGN KEY REFERENCES Figuritas(IDFigurita) NOT NULL
)