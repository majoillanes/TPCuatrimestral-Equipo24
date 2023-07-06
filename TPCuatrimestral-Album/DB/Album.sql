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
CREATE TABLE Nacionalidad(
PAIS_NAC VARCHAR(50) NOT NULL,
GENTILICIO_NAC VARCHAR(70) NOT NULL,
ISO_NAC VARCHAR(3) PRIMARY KEY,
Activo BIT DEFAULT 1
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
Fundacion VARCHAR(4) NOT NULL CHECK (Fundacion LIKE '%[0-9]%'),
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
GO
CREATE TABLE Figuritas (
IDFigurita INT PRIMARY KEY IDENTITY(1,1),
IDAlbum INT FOREIGN KEY REFERENCES Albumes(ID),
Tipo TINYINT FOREIGN KEY REFERENCES Tipos(ID),
Ubicacion INT not null,
IDUsuario INT FOREIGN KEY REFERENCES Usuarios(ID),
Pegada BIT DEFAULT 0,
Activo BIT DEFAULT 1
)
GO
CREATE TABLE Figuritas_Jugadores (
ID INT PRIMARY KEY IDENTITY(1,1),
IDFigurita INT FOREIGN KEY REFERENCES Figuritas(IDFigurita) NOT NULL,
IDJugador INT FOREIGN KEY REFERENCES Jugadores(ID) NOT NULL
)
GO
CREATE TABLE Figuritas_Equipos (
ID INT PRIMARY KEY IDENTITY(1,1),
IDFigurita INT FOREIGN KEY REFERENCES Figuritas(IDFigurita) NOT NULL,
IDEquipo SMALLINT FOREIGN KEY REFERENCES Equipos(ID) NOT NULL
)
GO
CREATE TABLE Figuritas_Estadios (
ID INT PRIMARY KEY IDENTITY(1,1),
IDFigurita INT FOREIGN KEY REFERENCES Figuritas(IDFigurita) NOT NULL,
IDEstadios SMALLINT FOREIGN KEY REFERENCES Estadios(ID) NOT NULL
)
GO
CREATE TABLE Usuarios_X_Figuritas(
IDUsuario INT FOREIGN KEY REFERENCES Usuarios(ID) NOT NULL,
IDFigurita INT FOREIGN KEY REFERENCES Figuritas(IDFigurita) NOT NULL
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
('Antonio Vespucio Liberti', 'Monumental', '83196', 'Nuñez', 'Av. Pres. Figueroa Alcorta 7597', 'https://image-service.onefootball.com/transform?w=280&h=210&dpr=2&image=https%3A%2F%2Fwp-images.onefootball.com%2Fwp-content%2Fuploads%2Fsites%2F12%2F2022%2F02%2FESTADIO-MONUMENTAL-DE-NU%25C3%2591EZ-1000x750.jpg'),
('Alberto J. Armando', 'La Bombonera', '57200', 'La Boca', 'Brandsen 805', 'https://s1.eestatic.com/2023/02/08/deportes/futbol/internacional/739937044_230754838_1706x960.jpg'),
('Presidente Perón', 'El Cilindro de Avellaneda', '51389', 'Avellaneda', 'Pasaje Mozart y Corbatta', 'https://fotos.perfil.com/2020/10/30/3110estadioracingdrone-1069268.jpg'),
('José Amalfitani', NULL, '49747', 'Liniers', 'Av Juan B Justo 9200', 'https://velezsarsfield.com.ar/img/contenido/club/gr/estadio-02.jpg'),
('Tomás Adolfo Ducó', 'El Palacio', '48314', 'Parque Patricios', 'Av. Amancio Alcorta 2570', 'https://www.estadiosdeargentina.com.ar/wp-content/uploads/2014/01/cancha-huracan-parque-patricios3-740x486.png'),
('Pedro Bidegain', 'El Nuevo Gasometro', '47964', 'Nueva Pompeya', 'Av. Perito Moreno 2145', 'https://www.infobae.com/new-resizer/7zpQJjqq9uXJ_eCTQNDW4PsLszo=/1200x628/filters:format(webp):quality(85)//s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/12/04155244/nuevo-gasometro-captura-1920-1024x575.jpg'),
('Néstor Díaz Pérez', 'Ciudad de Lanús', '45319', 'Lanús', 'Calle Ramón Cabrero 2007', 'https://fotos.perfil.com/2020/11/12/1211estadiolanus-1075716.jpg'),
('Ricardo Enrique Bochini', 'Libertadores de América', '42069', 'Avellaneda', 'Ricardo Enrique Bochini 751', 'https://cogelamochila.com/wp-content/uploads/2020/12/LDA.jpg'),
('Marcelo Bielsa', 'El Coloso del Parque', '42000', 'Rosario', 'Av. Int. Morcillo 2501-2699', 'https://i.pinimg.com/736x/c2/3c/41/c23c41bd9ee722b0f5223351d92041f1.jpg'),
('Dr. Lisandro de la Torre', 'Gigante de Arroyito', '41654', 'Rosario', 'Cordiviola 1100', 'https://www.estadiosdeargentina.com.ar/wp-content/uploads/2014/01/estadio-gigante-arroyito-central1-1-640x480.jpg'),
('Francisco Cabasés', 'La Boutique', '18000', 'Barrio Jardín', 'Avendaño y Valdivia', 'https://i.pinimg.com/originals/c7/c2/80/c7c280fb13edacbeecc0003fabd25693.jpg'),
('Feliciano Gambarte', 'La Bodega', '17000', 'Godoy Cruz', 'Flores 630', 'https://www.ole.com.ar/2021/04/11/ehK4bU325_1200x630__1.jpg'),
('Brigadier Estanislao López', 'El Cementerio de los Elefantes', '46000', 'Santa Fe', 'Av. Juan José Paso 3535', 'https://www.lavoz.com.ar/resizer/J_554RFDubMX0bMolnpdc8jmkqo=/980x640/smart/filters:quality(75):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/grupoclarin/6NMSFOTBWRFPTGY6OJHOL7EELU.jpg'),
('Monumental José Fierro', NULL, '35200', 'Villa 9 de Julio', '25 de mayo 1351', 'https://cdn.resfu.com/img_data/estadios/original_new/186.jpg?size=720x&lossy=1'),
('Florencio Solá', NULL, '34901', 'Banfield', 'Gral. Arenales 900', 'https://media.eldiariosur.com/p/880a32e8afcf58593742132d13a14ec1/adjuntos/291/imagenes/000/421/0000421512/1200x675/smart/lencho-solajpg.jpg'),
('Ciudad de Vicente López', NULL, '28530', 'Florida', 'Zufriategui 2021', 'https://cap.org.ar/wp-content/uploads/2021/02/DJI_0131.jpg'),
('José Luis Hirschi', 'Estadio UNO', '32530', 'La Plata', 'Avenida 1 y 57 1900', 'https://media.lacapital.com.ar/p/a16378077335ba98858f9c2ddac52b24/adjuntos/204/imagenes/029/815/0029815894/1200x675/smart/estadio-estudiantesjpg.jpg'),
('Julio César Villagra', 'El Gigante de Alberdi', '31500', 'Alberdi', 'Dr. Arturo Orgaz 510', 'https://telefe-static2.akamaized.net/media/486794/whatsapp-image-2023-04-06-at-141922.jpeg?v=20230406183416000&format=extraLarge&width=929&height=523&mode=crop'),
('Estadio 15 de Abril', NULL, '30000', 'Santa Fe', 'Av. López y Planes 3553', 'https://www.clubaunion.com.ar/wp-content/uploads/2020/08/IMG-20180713-WA0006.jpg'),
('Alfredo Terrera', NULL, '16000', 'Santiago del Estero', 'Granadero Saavedra 200', 'https://i.ytimg.com/vi/r9KN3eWcqvs/maxresdefault.jpg'),
('José Dellagiovanna', 'Coliseo de Victoria', '26282', 'Victoria', 'Av. Pres. Perón 2698', 'https://www.estadiosdeargentina.com.ar/wp-content/uploads/2014/03/estadio-tigre-victoria-640x360.jpg'),
('Juan Domingo Perón', 'Monumental de Alta Córdoba', '26000', 'Alta Córdoba', 'Jujuy 2602', 'https://i.pinimg.com/originals/92/aa/c8/92aac89180e6ce37808f15a4b3af3b8e.jpg'),
('Diego Armando Maradona', NULL, '26000', 'La Paternal', 'Gavilán 2151', 'https://www.estadiosdeargentina.com.ar/wp-content/uploads/2014/01/estadio-argentinos-juniors3-740x545.jpg'),
('Eva Perón', NULL, '22000', 'Junín', 'Necochea 25', 'https://laverdadonline.com/wp-content/uploads/2019/04/estadio.jpg'),
('Juan Carmelo Zerillo', 'El Bosque', '21500', 'La Plata', 'Av. 60 1904 La Plata', 'https://cogelamochila.com/wp-content/uploads/2022/02/EEKKrwqXkAAzqHg-1220x600.jpg'),
('Norberto Tomaghello', NULL, '20000', 'Gobernador Costa', 'Av. Humahuaca 244', 'https://pbs.twimg.com/media/FMjWk3vXMAYD3E4?format=jpg&name=medium'),
('Julio Humberto Grondona', 'El Viaducto', '18300', 'Sarandí', 'Julio Humberto Grondona 3660', 'https://www.estadiosdeargentina.com.ar/wp-content/uploads/2014/01/estadio-arsenal-sarandi1-740x526.jpg'),
('Claudio Fabián Tapia', NULL, '4400', 'Barracas', 'Luna 1211', 'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt8afb1e67b3bfd35b/64279c1de55f443779683e6d/01a.png?auto=webp&format=pjpg&width=3840&quality=60')
GO

select * from Nacionalidad
INSERT INTO Equipos (Nombre, Alias, Ciudad, Fundacion, Estadio, Imagen)
VALUES
('Argentinos Juniors', 'El Bicho', 'Ciudad Autónoma de Buenos Aires', '1904', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Maradona%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Asociacion_Atletica_Argentinos_Juniors.svg/1200px-Asociacion_Atletica_Argentinos_Juniors.svg.png'),
('Arsenal', 'El Arse', 'Sarandí', '1957', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Grondona%'), 'https://upload.wikimedia.org/wikipedia/en/thumb/6/60/Arsenal_Sarand%C3%AD_logo.svg/1200px-Arsenal_Sarand%C3%AD_logo.svg.png'),
('Atlético Tucumán', 'El Decano', 'Tucumán', '1902', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Fierro%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Logo_del_Club_Atl%C3%A9tico_Tucum%C3%A1n_-_2017.svg/1200px-Logo_del_Club_Atl%C3%A9tico_Tucum%C3%A1n_-_2017.svg.png'),
('Banfield', 'El Taladro', 'Banfield', '1896', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Florencio%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/CA_Banfield_%282014%29.svg/1200px-CA_Banfield_%282014%29.svg.png'),
('Barracas Central', 'El Guapo', 'Ciudad Autónoma de Buenos Aires', '1904', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Tapia%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Barracas_central_logo.svg/1200px-Barracas_central_logo.svg.png'),
('Belgrano', 'El Pirata', 'Córdoba', '1905', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Villagra%'), 'https://upload.wikimedia.org/wikipedia/commons/8/85/Escudo_Oficial_del_Club_Atl%C3%A9tico_Belgrano.png'),
('Boca Juniors', 'El Xeneize', 'Ciudad Autónoma de Buenos Aires', '1905', (SELECT ID FROM Estadios WHERE Alias LIKE '%Bombonera%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/CABJ70.png/207px-CABJ70.png'),
('Central Córdoba', 'El Ferroviario', 'Santiago del Estero', '1919', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Terrera%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Escudo_del_Club_Central_C%C3%B3rdoba_de_Santiago_del_Estero.svg/1200px-Escudo_del_Club_Central_C%C3%B3rdoba_de_Santiago_del_Estero.svg.png'),
('Colón', 'El Sabalero', 'Santa Fe', '1901', (SELECT ID FROM Estadios WHERE Alias LIKE '%Elefante%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Escudo_del_Club_Atl%C3%A9tico_Col%C3%B3n.svg/1200px-Escudo_del_Club_Atl%C3%A9tico_Col%C3%B3n.svg.png'),
('Defensa y Justicia', 'El Halcón', 'Florencio Varela', '1935', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Tomaghello%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Escudo_del_Club_Social_y_Deportivo_Defensa_y_Justicia.svg/1200px-Escudo_del_Club_Social_y_Deportivo_Defensa_y_Justicia.svg.png'),
('Estudiantes de la Plata', 'El Pincha', 'La Plata', '1905', (SELECT ID FROM Estadios WHERE Alias LIKE '%Estadio UNO%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Escudo_de_Estudiantes_de_La_Plata.svg/188px-Escudo_de_Estudiantes_de_La_Plata.svg.png'),
('Gimnasia y Esgrima', 'El Lobo', 'La Plata', '1887', (SELECT ID FROM Estadios WHERE Alias LIKE '%Bosque%'), 'https://upload.wikimedia.org/wikipedia/en/thumb/6/6d/Gimnasia_Esgrima_LP_logo.svg/800px-Gimnasia_Esgrima_LP_logo.svg.png'),
('Godoy Cruz', 'El Tomba', 'Mendoza', '1921', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Gambarte%'), 'https://upload.wikimedia.org/wikipedia/commons/4/4b/GCAT.png'),
('Huracán', 'El Globo', 'Ciudad Autónoma de Buenos Aires', '1908', (SELECT ID FROM Estadios WHERE Alias LIKE '%Palacio%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Emblema_oficial_del_Club_Atl%C3%A9tico_Hurac%C3%A1n.svg/240px-Emblema_oficial_del_Club_Atl%C3%A9tico_Hurac%C3%A1n.svg.png'),
('Independiente', 'El Rojo', 'Avellaneda', '1904', (SELECT ID FROM Estadios WHERE Alias LIKE '%Libertador%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Escudo_del_Club_Atl%C3%A9tico_Independiente.svg/1200px-Escudo_del_Club_Atl%C3%A9tico_Independiente.svg.png'),
('Instituto', 'La Gloria', 'Córdoba', '1918', (SELECT ID FROM Estadios WHERE Alias LIKE '%Alta Córdoba%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Escudo_Instituto_Atletico_Central_Cordoba.png/225px-Escudo_Instituto_Atletico_Central_Cordoba.png'),
('Lanús', 'El Granate', 'Lanús', '1915', (SELECT ID FROM Estadios WHERE Alias LIKE '%Ciudad de Lanús%'), 'https://upload.wikimedia.org/wikipedia/commons/9/93/Modificacion_flyer_para_Editat%C3%B3n_del_Centenario_del_Club_Atl%C3%A9tico_Lan%C3%BAs.png'),
('Newell''s Old Boys', 'La Lepra', 'Rosario', '1903', (SELECT ID FROM Estadios WHERE Alias LIKE '%Coloso%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Escudo_del_Club_Atl%C3%A9tico_Newell%27s_Old_Boys_de_Rosario.svg/1200px-Escudo_del_Club_Atl%C3%A9tico_Newell%27s_Old_Boys_de_Rosario.svg.png'),
('Platense', 'El Calamar', 'Vicente López', '1905', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Vicente López%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Escudo_del_Club_Alt%C3%A9tico_Platense.svg/1200px-Escudo_del_Club_Alt%C3%A9tico_Platense.svg.png'),
('Racing Club', 'La Academia', 'Avellaneda', '1903', (SELECT ID FROM Estadios WHERE Alias LIKE '%Cilindro%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Escudo_de_Racing_Club_%282014%29.svg/1200px-Escudo_de_Racing_Club_%282014%29.svg.png'),
('River Plate', 'El Millonario', 'Ciudad Autónoma de Buenos Aires', '1901', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Liberti%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Escudo_del_C_A_River_Plate.svg/1200px-Escudo_del_C_A_River_Plate.svg.png'),
('Rosario Central', 'El Canalla', 'Rosario', '1889', (SELECT ID FROM Estadios WHERE Alias LIKE '%Arroyito%'), 'https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/Rosario_Central_logo.svg/1200px-Rosario_Central_logo.svg.png'),
('San Lorenzo', 'El Ciclón', 'Ciudad Autónoma de Buenos Aires', '1908', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Bidegain%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Escudo_del_Club_Atl%C3%A9tico_San_Lorenzo_de_Almagro.svg/1200px-Escudo_del_Club_Atl%C3%A9tico_San_Lorenzo_de_Almagro.svg.png'),('Sarmiento', 'El Verde', 'Junín', '1911', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Eva Perón%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Escudo_del_Club_Atl%C3%A9tico_Sarmiento_de_Jun%C3%ADn.svg/244px-Escudo_del_Club_Atl%C3%A9tico_Sarmiento_de_Jun%C3%ADn.svg.png'),
('Talleres', 'El Matador', 'Córdoba', '1903', (SELECT ID FROM Estadios WHERE Alias LIKE '%Boutique%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Escudo_Talleres_2015.svg/1200px-Escudo_Talleres_2015.svg.png'),
('Tigre', 'El Matador de Victoria', 'Victoria', '1902', (SELECT ID FROM Estadios WHERE Alias LIKE '%Victoria%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Escudo_del_Club_Atl%C3%A9tico_Tigre.svg/1200px-Escudo_del_Club_Atl%C3%A9tico_Tigre.svg.png'),
('Unión', 'El Tatengue', 'Santa Fe', '1907', (SELECT ID FROM Estadios WHERE Nombre LIKE '%15 de Abril%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Escudo_del_Club_Atl%C3%A9tico_Uni%C3%B3n.svg/1788px-Escudo_del_Club_Atl%C3%A9tico_Uni%C3%B3n.svg.png'),
('Velez Sarsfield', 'El Fortín', 'Ciudad Autónoma de Buenos Aires', '1910', (SELECT ID FROM Estadios WHERE Nombre LIKE '%Amalfitani%'), 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Escudo_del_Club_Atl%C3%A9tico_V%C3%A9lez_Sarsfield.svg/1200px-Escudo_del_Club_Atl%C3%A9tico_V%C3%A9lez_Sarsfield.svg.png')
GO
INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen,Activo)
VALUES ('Franco', 'Armani', '1986-10-16', 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'ARQ', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/1638-01-armani-imagengrillapaginaplantel.png',1 ),
('Jonatan', 'Maidana', '1985-07-29', 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'DEF', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/4-04-maidana-imagengrillapaginaplantel.png',1 ),
('Ignacio', 'Fernandez', '1990-01-12', 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'MED', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-12/1254-nacho_270x360.png',1 ),
('Lucas', 'Beltrán', '2001-03-29', 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'DEL', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/850-18-beltran-imagengrillapaginaplantel.png',1 )


insert into Albumes(Nombre)
values ('Liga Profesional Argentina 2023')


insert into Tipos (Nombre, Descripcion)
values ('Legendaria', ''),
('Especial', ''),
('Estándar', '')

select * from Nacionalidad
--alter table Figuritas 
--add IDJugador int foreign key references Jugadores (ID)


--SELECT DISTINCT A.Id, A.Nombre, A.Codigo, A.Descripcion, M.Descripcion AS Marca, C.Descripcion AS
--Categoria, A.Precio, A.IdMarca, A.IdCategoria FROM ARTICULOS A LEFT JOIN MARCAS M ON M.ID = A.IdMarca
--LEFT JOIN CATEGORIAS C ON C.ID = A.IdCategoria




--idfigu, idalbum, activo, pegada, idjugador, nombre, apellido, imagen