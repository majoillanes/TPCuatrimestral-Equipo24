CREATE DATABASE ALBUM_DB
GO
USE ALBUM_DB
GO
CREATE TABLE Niveles (
ID TINYINT PRIMARY KEY,
Nombre VARCHAR(5) NOT NULL
)
--GO
--CREATE TABLE Albumes (
--ID INT PRIMARY KEY IDENTITY (1,1),
--Nombre VARCHAR(50) NOT NULL
--)
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
--GO
--CREATE TABLE Usuarios_X_Albumes(
--IDAlbum INT FOREIGN KEY REFERENCES Albumes(ID) NOT NULL,
--IDUsuario INT FOREIGN KEY REFERENCES Usuarios(ID) NOT NULL,
--PRIMARY KEY(IDAlbum, IDUsuario)
--)
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
Imagen VARCHAR(350),
Tipo TINYINT FOREIGN KEY REFERENCES Tipos (ID),
Activo BIT DEFAULT 1
)
GO
CREATE TABLE Figuritas (
IDFigurita INT PRIMARY KEY IDENTITY(1,1),
--IDAlbum INT FOREIGN KEY REFERENCES Albumes(ID),
--Tipo TINYINT FOREIGN KEY REFERENCES Tipos(ID),
Ubicacion SMALLINT,
Pegada BIT DEFAULT 0,
Activo BIT DEFAULT 1
)
GO
CREATE TABLE Figuritas_Jugadores (
ID INT PRIMARY KEY IDENTITY(1,1),
IDFigurita INT FOREIGN KEY REFERENCES Figuritas(IDFigurita) NOT NULL,
IDJugador INT FOREIGN KEY REFERENCES Jugadores(ID) NOT NULL,
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
INSERT INTO Nacionalidad(PAIS_NAC,GENTILICIO_NAC,ISO_NAC)VALUES('Chile','CHILENA','CHL');
INSERT INTO Nacionalidad(PAIS_NAC,GENTILICIO_NAC,ISO_NAC)VALUES('Colombia','COLOMBIANA','COL');
INSERT INTO Nacionalidad(PAIS_NAC,GENTILICIO_NAC,ISO_NAC)VALUES('Italia','ITALIANA','ITA');
INSERT INTO Nacionalidad(PAIS_NAC,GENTILICIO_NAC,ISO_NAC)VALUES('México','MEXICANA','MEX');
INSERT INTO Nacionalidad(PAIS_NAC,GENTILICIO_NAC,ISO_NAC)VALUES('Paraguay','PARAGUAYA','PRY');
INSERT INTO Nacionalidad(PAIS_NAC,GENTILICIO_NAC,ISO_NAC)VALUES('Perú','PERUANA','PER');
INSERT INTO Nacionalidad(PAIS_NAC,GENTILICIO_NAC,ISO_NAC)VALUES('Uruguay','URUGUAYA','URY');

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
--GO
--INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen,Activo)
--VALUES ('Franco', 'Armani', '1986-10-16', 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'ARQ', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/1638-01-armani-imagengrillapaginaplantel.png',1 ),
--('Jonatan', 'Maidana', '1985-07-29', 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'DEF', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/4-04-maidana-imagengrillapaginaplantel.png',1 ),
--('Ignacio', 'Fernandez', '1990-01-12', 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'MED', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-12/1254-nacho_270x360.png',1 ),
--('Lucas', 'Beltrán', '2001-03-29', 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'DEL', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/850-18-beltran-imagengrillapaginaplantel.png',1 )


--insert into Albumes
--values ('Liga Profesional Argentina 2023')


insert into Tipos (Nombre, Descripcion)
values ('Legendaria', ''),
('Especial', ''),
('Estándar', '')


--alter table Figuritas 
--add IDJugador int foreign key references Jugadores (ID)

insert into Jugadores values
-- ('','', CONVERT(DATE, '//19', 103), 'ARG',(select ID from Equipos where Nombre like '%Colón%'),'','', 1), 

 --Argentinos
 ('Federico','Lanzillotta', CONVERT(DATE, '01/12/1992', 103), 'ARG',(select ID from Equipos where Nombre like '%Argentinos%'),'ARQ','https://www.footballdatabase.eu/images/photos/players/a_203/203097.jpg', 1), 
 ('Kevin','Mac Allister', CONVERT(DATE, '07/11/1997', 103), 'ARG',(select ID from Equipos where Nombre like '%Argentinos%'),'DEF','https://www.worldfootball.net/player_summary/kevin-mac-allister/', 1), 
 ('Santiago','Montiel', CONVERT(DATE, '22/11/2000', 103), 'ARG',(select ID from Equipos where Nombre like '%Argentinos%'),'DEF','https://static-img.zz.pt/jogadores/07/1000307__20230423210510_santiago_montiel.jpg', 1), 
 ('Miguel','Torren', CONVERT(DATE, '12/08/1988', 103), 'ARG',(select ID from Equipos where Nombre like '%Argentinos%'),'DEF','https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcQPmCRiFs5A0ePyLG5Lo6kpIVjLJv4_H8CwoPfjOIrYUnXy4OqSmfHERdfDrisL1BUj', 1), 
 ('Marco','Di Cesare', CONVERT(DATE, '30/01/2002', 103), 'ARG',(select ID from Equipos where Nombre like '%Argentinos%'),'DEF','https://www.playmakerstats.com/img/jogadores/91/774591_med__20210420141857_marco_di_cesare.png', 1), 
 ('Federico','Redondo', CONVERT(DATE, '18/01/2003', 103), 'ARG',(select ID from Equipos where Nombre like '%Argentinos%'),'MED','https://s2.glbimg.com/C1srRsog-Ek9fJ-x9_Pj6aZ4JjY=/0x0:828x1025/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2023/d/D/QSVCNzSByxcAUHKzHzIQ/whatsapp-image-2023-04-18-at-15.45.00.jpeg', 1), 
 ('Fabricio','Dominguez', CONVERT(DATE, '24/06/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Argentinos%'),'MED','https://elintra.com.ar/wp-content/uploads/2023/04/ARGENTINOS-3.png', 1), 
 ('Matias','Vera', CONVERT(DATE, '20/11/1995', 103), 'ARG',(select ID from Equipos where Nombre like '%Argentinos%'),'MED','https://elintra.com.ar/wp-content/uploads/2023/04/ARGENTINOS-3.png', 1), 
 ('Franco','Moyano', CONVERT(DATE, '13/09/1997', 103), 'ARG',(select ID from Equipos where Nombre like '%Argentinos%'),'MED','https://www.ceroacero.es/img/jogadores/00/774600_med__20210420142427_franco_moyano.png', 1), 
 ('Gabriel','Avalos', CONVERT(DATE, '12/10/1990', 103), 'ARG',(select ID from Equipos where Nombre like '%Argentinos%'),'DEL','https://assets.sorare.com/image-resize/player/5fa24a37-dd8e-4148-8ec7-0d3b339bbd15/picture/tinified-4ee41d69ae95be32eeafebe3487d0b82.png?width=640', 1), 
 ('Thiago','Nuss', CONVERT(DATE, '02/02/2001', 103), 'ARG',(select ID from Equipos where Nombre like '%Argentinos%'),'DEL','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBniNAA39T2YOFeE0LBj2azvTx5hS8LCjkoQ&usqp=CAU', 1),

 --Arsenal

 ('Alejandro','Medina', CONVERT(DATE, '07/12/1986', 103), 'ARG',(select ID from Equipos where Nombre like '%Arsenal%'),'ARQ','https://media.gettyimages.com/id/1331356649/es/foto/alejandro-medina-goalkeeper-of-arsenal-holds-the-ball-during-a-match-between-arsenal-and.jpg?s=1024x1024&w=gi&k=20&c=KN__K3uWX7SBQ4fmMYzHS91tGxNAibmqH5dAK-tcszM=', 1), 
 ('Lucas','Souto', CONVERT(DATE, '11/10/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Arsenal%'),'DEF','https://lc.cx/8_63V6', 1), 
 ('Néstor','Breitenbruch', CONVERT(DATE, '13/09/1995', 103), 'ARG',(select ID from Equipos where Nombre like '%Arsenal%'),'DEF','https://lc.cx/a1iObb', 1), 
 ('Maximiliano','Centurión', CONVERT(DATE, '20/02/1999', 103), 'ARG',(select ID from Equipos where Nombre like '%Arsenal%'),'DEF','https://s.hs-data.com/bilder/spieler/gross/459461.jpg', 1), 
 ('Facundo','Cardozo', CONVERT(DATE, '06/04/1995', 103), 'ARG',(select ID from Equipos where Nombre like '%Arsenal%'),'DEF','https://i.pinimg.com/originals/17/af/be/17afbed3150459def62604be87d366df.jpg', 1), 
 ('Adrián','Spörle', CONVERT(DATE, '13/07/1995', 103), 'ARG',(select ID from Equipos where Nombre like '%Arsenal%'),'DEF','https://imagecache.365scores.com/image/upload/f_png,w_80,h_80,c_limit,q_auto:eco,dpr_2,d_Athletes:default.png,r_max,c_thumb,g_face,z_0.65/Athletes/44313', 1), 
 ('Felipe','Peña Biafore', CONVERT(DATE, '05/04/2001', 103), 'ARG',(select ID from Equipos where Nombre like '%Arsenal%'),'MED','https://bolavip.com/export/sites/lpm/img/2023/02/06/foj5u8txeacfs0b.jpeg_890743846.jpeg', 1), 
 ('Braian','Rivero', CONVERT(DATE, '22/02/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Arsenal%'),'MED','https://lc.cx/Zlpp0x', 1), 
 ('Lautaro','Guzmán', CONVERT(DATE, '18/01/2000', 103), 'ARG',(select ID from Equipos where Nombre like '%Arsenal%'),'MED','https://lc.cx/e0151A', 1), 
 ('Flabián','Londoño', CONVERT(DATE, '09/06/2000', 103), 'COL',(select ID from Equipos where Nombre like '%Arsenal%'),'DEL','https://imagecache.365scores.com/image/upload/f_png,w_80,h_80,c_limit,q_auto:eco,dpr_2,d_Athletes:default.png,r_max,c_thumb,g_face,z_0.65/Athletes/104156', 1), 
 ('Santiago','Toloza', CONVERT(DATE, '28/10/2002', 103), 'ARG',(select ID from Equipos where Nombre like '%Arsenal%'),'DEL','https://www.ole.com.ar/images/2023/04/26/M2SW10OqZ_720x0__1.jpg', 1), 

 --Atl Tucumán

 ('Tomás','Marchiori', CONVERT(DATE, '20/06/1995', 103), 'ARG',(select ID from Equipos where Nombre like '%Tucum%'),'ARQ','https://www.clubatleticotucuman.com.ar//imagenes/jugadores/94_20230203142913.jpg', 1),
 ('Renzo','Tesuri', CONVERT(DATE, '07/06/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Tucum%'),'DEF','https://www.clubatleticotucuman.com.ar//imagenes/jugadores/163_20230203144546.jpg', 1),
 ('Bruno','Bianchi', CONVERT(DATE, '17/02/1989', 103), 'ARG',(select ID from Equipos where Nombre like '%Tucum%'),'DEF','https://www.clubatleticotucuman.com.ar//imagenes/jugadores/171_20230203143003.jpg', 1),
 ('Nicolás','Romero', CONVERT(DATE, '28/11/2003', 103), 'ARG',(select ID from Equipos where Nombre like '%Tucum%'),'DEF','https://www.clubatleticotucuman.com.ar//imagenes/jugadores/174_20230203143359.jpg', 1),
 ('Matías','Orihuela', CONVERT(DATE, '17/02/1992', 103), 'ARG',(select ID from Equipos where Nombre like '%Tucum%'),'DEF','https://www.clubatleticotucuman.com.ar//imagenes/jugadores/190_20230203143549.jpg', 1),
 ('Adrián','Sánchez', CONVERT(DATE, '14/05/1999', 103), 'ARG',(select ID from Equipos where Nombre like '%Tucum%'),'MED','https://www.clubatleticotucuman.com.ar//imagenes/jugadores/193_20230203144620.jpg', 1),
 ('Guillermo','Acosta', CONVERT(DATE, '31/10/1988', 103), 'ARG',(select ID from Equipos where Nombre like '%Tucum%'),'MED','https://www.clubatleticotucuman.com.ar//imagenes/jugadores/135_20230203144526.jpg', 1),
 ('Joaquín','Pereyra', CONVERT(DATE, '01/12/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Tucum%'),'MED','https://www.clubatleticotucuman.com.ar//imagenes/jugadores/162_20230203144559.jpg', 1),
 ('Marcelo','Estigarribia', CONVERT(DATE, '10/04/1995', 103), 'ARG',(select ID from Equipos where Nombre like '%Tucum%'),'DEL','https://www.clubatleticotucuman.com.ar//imagenes/jugadores/199_20230203145458.jpg', 1),
 ('Ramiro','Ruiz Rodríguez', CONVERT(DATE, '21/03/2000', 103), 'ARG',(select ID from Equipos where Nombre like '%Tucum%'),'DEL','	https://www.clubatleticotucuman.com.ar//imagenes/jugadores/133_20230203145333.jpg', 1),
 ('Mateo','Coronel', CONVERT(DATE, '24/10/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Tucum%'),'DEL','	https://www.clubatleticotucuman.com.ar//imagenes/jugadores/133_20230203145333.jpg', 1),

 --BANFIELD

 ('Facundo','Cambeses', CONVERT(DATE, '09/04/1997', 103), 'ARG',(select ID from Equipos where Nombre like '%Banfield%'),'ARQ','https://clubabanfield.org/wp-content/uploads/2023/03/cambeses-facundo.webp', 1),
 ('Emanuel','Insúa', CONVERT(DATE, '10/04/1991', 103), 'ARG',(select ID from Equipos where Nombre like '%Banfield%'),'DEF','https://clubabanfield.org/wp-content/uploads/2023/03/insua-emanuel.webp', 1),
 ('Aaron','Quirós', CONVERT(DATE, '31/01/2001', 103), 'ARG',(select ID from Equipos where Nombre like '%Banfield%'),'DEF','https://clubabanfield.org/wp-content/uploads/2023/03/quiros-aaron.webp', 1),
 ('Alejandro','Maciel', CONVERT(DATE, '22/04/1997', 103), 'ARG',(select ID from Equipos where Nombre like '%Banfield%'),'DEF','https://clubabanfield.org/wp-content/uploads/2023/03/maciel-alejandro.webp', 1),
 ('Emanuel','Coronel', CONVERT(DATE, '01/02/1997', 103), 'ARG',(select ID from Equipos where Nombre like '%Banfield%'),'MED','https://clubabanfield.org/wp-content/uploads/2023/03/coronel-emanuel.webp', 1),
 ('Alejandro','Cabrera', CONVERT(DATE, '30/09/1992', 103), 'ARG',(select ID from Equipos where Nombre like '%Banfield%'),'MED','https://clubabanfield.org/wp-content/uploads/2023/03/cabrera-alejandro.webp', 1),
 ('Brahian','Aleman', CONVERT(DATE, '23/12/1989', 103), 'ARG',(select ID from Equipos where Nombre like '%Banfield%'),'MED','https://clubabanfield.org/wp-content/uploads/2023/03/aleman-brahian-1.webp', 1),
 ('Juan','Bisanz', CONVERT(DATE, '28/08/2001', 103), 'ARG',(select ID from Equipos where Nombre like '%Banfield%'),'MED','https://clubabanfield.org/wp-content/uploads/2023/03/bisanz-juan.webp', 1),
 ('Matías','Romero', CONVERT(DATE, '01/02/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Banfield%'),'MED','https://clubabanfield.org/wp-content/uploads/2023/03/romero-matias.webp', 1),
 ('Nicolás','Sosa', CONVERT(DATE, '06/04/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Banfield%'),'MED','https://clubabanfield.org/wp-content/uploads/2023/03/sosa-sanchez-nicolas.webp', 1),
 ('Milton','Giménez', CONVERT(DATE, '12/08/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Banfield%'),'MED','https://clubabanfield.org/wp-content/uploads/2023/03/milton.webp', 1),

 --Barracas Central

('Andres','Desabato', CONVERT(DATE, '21/04/1983', 103), 'ARG',(select ID from Equipos where Nombre like '%Barracas%'),'ARQ','https://www.barracascentral.com/images/2020/2021/plantel2023/1-_Desbato_Andrs-BRAZOS-ATRAS.jpg', 1), 
('Mauro','Peinipil', CONVERT(DATE, '03/04/1999', 103), 'ARG',(select ID from Equipos where Nombre like '%Barracas%'),'DEF','https://www.barracascentral.com/images/2020/2021/plantel2023/4-_Peinipil_Mauro-BRAZO-ATRAS.jpg', 1), 
('Francisco','Alvarez', CONVERT(DATE, '26/02/2000', 103), 'ARG',(select ID from Equipos where Nombre like '%Barracas%'),'DEF','https://www.barracascentral.com/images/2020/2021/plantel2022/2-FOSSA.jpg', 1), 
('Juan','Diaz', CONVERT(DATE, '26/05/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Barracas%'),'DEF','https://www.barracascentral.com/images/2020/2021/plantel2022/14-DIAZ.jpg', 1), 
('Rodrigo','Insua', CONVERT(DATE, '16/12/1997', 103), 'ARG',(select ID from Equipos where Nombre like '%Barracas%'),'DEF','https://www.barracascentral.com/images/2020/2021/plantel2023/6-_Insa_Rodrigo-BRAZOS-ATRAS.jpg', 1), 
('Carlos ','Arce', CONVERT(DATE, '16/09/1990', 103), 'ARG',(select ID from Equipos where Nombre like '%Barracas%'),'MED','https://www.barracascentral.com/images/2020/2021/plantel2023/19-_Arce_Carlos-BRAZOS-ATRAS.jpg', 1), 
('Rodrigo ','Herrera', CONVERT(DATE, '07/04/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Barracas%'),'MED','https://www.barracascentral.com/images/2020/2021/plantel2023/5-_Herrera_Rodrigo-BRAZOS-ATRAS.jpg', 1), 
('Facundo ','Mater', CONVERT(DATE, '23/07/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Barracas%'),'MED','https://www.barracascentral.com/images/2020/2021/plantel2023/33-_Mater_Facundo-BRAZOS-ATRAS.jpg', 1), 
('Ivan ','Tapia', CONVERT(DATE, '23/11/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Barracas%'),'MED','https://www.barracascentral.com/images/2020/2021/plantel2023/10-_Tapia_Ivn-BRAZOS-ATRAS.jpg', 1), 
('Brian ','Calderara', CONVERT(DATE, '10/01/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Barracas%'),'MED','https://www.barracascentral.com/images/2020/2021/plantel2023/21-_Calderara_Brian_-_BRAZOS-ATRAS.jpg', 1), 
('Bruno ','Sepulveda', CONVERT(DATE, '17/09/1992', 103), 'ARG',(select ID from Equipos where Nombre like '%Barracas%'),'DEL','https://www.barracascentral.com/images/2020/2021/plantel2023/29-_Seplveda_Bruno-BRAZOS-ATRAS.jpg', 1), 

--Belgrano

('Nahuel','Losada', CONVERT(DATE, '17/04/1993', 103), 'ARG',(select ID from Equipos where Nombre like '%Belgrano%'),'ARQ','https://lc.cx/OZ4nII', 1), 
('Alex','Ibacache', CONVERT(DATE, '11/01/1999', 103), 'CHL',(select ID from Equipos where Nombre like '%Belgrano%'),'DEF','https://oneftbl-cms.imgix.net/https%3A%2F%2Fwww.radioagricultura.cl%2Fwp-content%2Fuploads%2F2023%2F03%2Fibacache-.jpg?auto=format%2Ccompress&crop=faces&dpr=2&fit=crop&h=630&q=25&w=840&s=b81d26454a3921b38d77cd2f5973b502', 1), 
('Nicolás','Meriano', CONVERT(DATE, '09/11/2000', 103), 'ARG',(select ID from Equipos where Nombre like '%Belgrano%'),'DEF','https://lc.cx/DVZSjy', 1), 
('Alejandro','Rébola', CONVERT(DATE, '24/07/1988', 103), 'ARG',(select ID from Equipos where Nombre like '%Belgrano%'),'DEF','https://www.lavoz.com.ar/resizer/wFfGIPbLhG36AmcBkHsIjJb61eY=/800x450/smart/filters:quality(75):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/grupoclarin/7GZIKEPZFVH7FENUYTCD6HRBPY.jpg', 1), 
('Juan','Barinaga', CONVERT(DATE, '10/10/2000', 103), 'ARG',(select ID from Equipos where Nombre like '%Belgrano%'),'DEF','http://belgrano.sandboxmap.com/wp-content/uploads/2000/10/JUAN-BARINAGA-2-768x1024.jpg', 1), 
('Bruno','Zapelli', CONVERT(DATE, '16/05/2002', 103), 'ARG',(select ID from Equipos where Nombre like '%Belgrano%'),'MED','http://belgrano.sandboxmap.com/wp-content/uploads/2002/05/BRUNO-ZAPELLI-1-375x500.jpg', 1), 
('Ibrahim','Hesar', CONVERT(DATE, '15/11/1993', 103), 'ARG',(select ID from Equipos where Nombre like '%Belgrano%'),'MED','http://belgrano.sandboxmap.com/wp-content/uploads/1993/11/IBRAHIM-HESAR-1-375x500.jpg', 1), 
('Santiago','Longo', CONVERT(DATE, '12/04/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Belgrano%'),'MED','http://belgrano.sandboxmap.com/wp-content/uploads/1998/01/SANTIAGO-LONGO-375x500.jpg', 1), 
('Ariel','Rojas', CONVERT(DATE, '16/01/1986', 103), 'ARG',(select ID from Equipos where Nombre like '%Belgrano%'),'MED','http://belgrano.sandboxmap.com/wp-content/uploads/2022/04/ARIEL-ROJAS-375x500.jpg', 1), 
('Fabián','Bordagaray', CONVERT(DATE, '15/02/1987', 103), 'ARG',(select ID from Equipos where Nombre like '%Belgrano%'),'DEL','http://belgrano.sandboxmap.com/wp-content/uploads/1987/02/FABIAN-BORDAGARAY-375x500.jpg', 1), 
('Pablo','Vegetti', CONVERT(DATE, '15/10/1988', 103), 'ARG',(select ID from Equipos where Nombre like '%Belgrano%'),'DEL','http://belgrano.sandboxmap.com/wp-content/uploads/2018/11/PABLO-VEGETTI-375x500.jpg', 1), 

--Boca

('Sergio','Romero', CONVERT(DATE, '22/02/1987', 103), 'ARG',(select ID from Equipos where Nombre like '%Boca%'),'ARQ','https://www.bocajuniors.com.ar/upload/images/thumbs/im/ag/349x283imagen3_e492e.jpg', 1),
('Luis','Advíncula', CONVERT(DATE, '02/03/1990', 103), 'PER',(select ID from Equipos where Nombre like '%Boca%'),'DEF','https://www.bocajuniors.com.ar/upload/files/advincula_a165f.jpg', 1),
('Bruno','Valdez', CONVERT(DATE, '06/10/1992', 103), 'ARG',(select ID from Equipos where Nombre like '%Boca%'),'DEF','https://www.bocajuniors.com.ar/upload/files/valdez-bruno1_f1ad7.jpg', 1), 
('Nicolás','Figal', CONVERT(DATE, '03/04/1994', 103), 'ARG',(select ID from Equipos where Nombre like '%Boca%'),'DEF','https://www.bocajuniors.com.ar/upload/files/figal_5e7ca.jpg', 1), 
('Frank','Fabra', CONVERT(DATE, '22/02/1991', 103), 'COL',(select ID from Equipos where Nombre like '%Boca%'),'DEF','https://www.bocajuniors.com.ar/upload/files/fabra_ab7d6.jpg', 1), 
('Esteban','Rolon', CONVERT(DATE, '25/03/1995', 103), 'ARG',(select ID from Equipos where Nombre like '%Boca%'),'MED','https://www.bocajuniors.com.ar/upload/files/rolon_235f5.jpg', 1), 
('Alan','Varela', CONVERT(DATE, '04/07/2001', 103), 'ARG',(select ID from Equipos where Nombre like '%Boca%'),'MED','https://www.bocajuniors.com.ar/upload/files/varela_e1065.jpg', 1), 
('Guillermo','Fernández', CONVERT(DATE, '11/10/1991', 103), 'ARG',(select ID from Equipos where Nombre like '%Boca%'),'MED','https://www.bocajuniors.com.ar/upload/files/pol_225ef.jpg', 1), 
('Cristian','Medina', CONVERT(DATE, '01/06/2002', 103), 'ARG',(select ID from Equipos where Nombre like '%Boca%'),'MED','https://www.bocajuniors.com.ar/upload/files/medina_548bd.jpg', 1), 
('Valentín','Barco', CONVERT(DATE, '23/07/2004', 103), 'ARG',(select ID from Equipos where Nombre like '%Boca%'),'MED','https://www.bocajuniors.com.ar/upload/files/barco_9a156.jpg', 1), 
('Darío','Benedetto', CONVERT(DATE, '17/05/1990', 103), 'ARG',(select ID from Equipos where Nombre like '%Boca%'),'DEL','https://www.bocajuniors.com.ar/upload/files/benedetto_84f59.jpg', 1), 

--Central Cordoba

('Matías','Mansilla', CONVERT(DATE, '15/02/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Central Córdoba%'),'ARQ','https://pbs.twimg.com/media/FlCFFxEXwAAg9Ty.jpg', 1), 
('Ciro','Rius', CONVERT(DATE, '27/10/1988', 103), 'ARG',(select ID from Equipos where Nombre like '%Central Córdoba%'),'DEF','https://imageup.me/images/c0a717b0-ba06-471a-8700-f04b71d72b74.png?v=151808', 1), 
('Brian','Blasi', CONVERT(DATE, '08/02/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Central Córdoba%'),'DEF','https://imageup.me/images/4940c9ee-5f0b-4f33-8281-5e3fb16aad90.png', 1), 
('Fabio','Pereyra', CONVERT(DATE, '31/01/1990', 103), 'ARG',(select ID from Equipos where Nombre like '%Central Córdoba%'),'DEF','https://img.a.transfermarkt.technology/portrait/header/610248-1615918446.jpg?lm=1', 1), 
('Gonzalo','Goñi', CONVERT(DATE, '16/08/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Central Córdoba%'),'DEF','https://img.a.transfermarkt.technology/portrait/header/594104-1633628040.JPG?lm=1', 1), 
('José','Gómez', CONVERT(DATE, '06/03/2000', 103), 'ARG',(select ID from Equipos where Nombre like '%Central Córdoba%'),'DEF','https://imageup.me/images/8fc0e09f-b52e-4b3c-88a8-4034e2ceeeec.png', 1), 
('Brian','Farioli', CONVERT(DATE, '19/02/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Central Córdoba%'),'MED','https://imagecache.365scores.com/image/upload/f_png,w_80,h_80,c_limit,q_auto:eco,dpr_2,d_Athletes:default.png,r_max,c_thumb,g_face,z_0.65/Athletes/71948', 1), 
('Mauro','Pittón', CONVERT(DATE, '08/08/1994', 103), 'ARG',(select ID from Equipos where Nombre like '%Central Córdoba%'),'MED','https://oneftbl-cms.imgix.net/https%3A%2F%2Fwww.rincondefutbol.com%2Fwp-content%2Fuploads%2F2023%2F04%2FMauro-Pitton-Central-Cordoba-1000x600-1.png?auto=format%2Ccompress&crop=faces&dpr=2&fit=crop&h=210&q=25&w=280&s=914f0404f543d73388af7b96d798f5b6', 1), 
('Alejandro','Maciel', CONVERT(DATE, '22/04/1997', 103), 'ARG',(select ID from Equipos where Nombre like '%Central Córdoba%'),'MED','https://ultimajugada.com/wp-content/uploads/2020/08/Maciel.jpg', 1), 
('Lucas','Besozzi', CONVERT(DATE, '22/01/2003', 103), 'ARG',(select ID from Equipos where Nombre like '%Central Córdoba%'),'MED','https://lc.cx/5Xs-DN', 1), 
('Lucas','Gamba', CONVERT(DATE, '24/06/1987', 103), 'ARG',(select ID from Equipos where Nombre like '%Central Córdoba%'),'DEL','https://i0.wp.com/diariosanrafael.com.ar/wp-content/uploads/2023/03/IMG_3426.jpg?w=400&ssl=1', 1), 

--Colón

('Ignacio','Chicco', CONVERT(DATE, '30/06/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Colón%'),'ARQ','https://www.radiogol.com.ar/wp-content/uploads/2022/07/FXbdG6WWAAEtoMX.jpg', 1), 
('Facundo','Garcés', CONVERT(DATE, '05/09/1999', 103), 'ARG',(select ID from Equipos where Nombre like '%Colón%'),'DEF','https://pbs.twimg.com/profile_images/1423430887979556870/JSMhKFZt_400x400.jpg', 1),  
('Paolo','Goltz', CONVERT(DATE, '12/05/1985', 103), 'ARG',(select ID from Equipos where Nombre like '%Colón%'),'DEF','https://www.ole.com.ar/images/2021/04/30/WEy9J-hJh_386x280__1.jpg', 1), 
('Gian','Nardelli', CONVERT(DATE, '11/03/2000', 103), 'ARG',(select ID from Equipos where Nombre like '%Colón%'),'DEF','https://media.tycsports.com/files/2022/10/28/498560/gian-nardelli_w416.webp', 1), 
('Eric','Meza', CONVERT(DATE, '08/04/1999', 103), 'ARG',(select ID from Equipos where Nombre like '%Colón%'),'MED','https://desdelaventana.com.ar/zixpanel/cache/med-fecha_2021-10-11_hora_10-17hs_nro-random_747.jpg', 1), 
('Stéfano','Moreyra', CONVERT(DATE, '19/09/2001', 103), 'ARG',(select ID from Equipos where Nombre like '%Colón%'),'MED','https://www.ceroacero.es/img/jogadores/55/896955_med__20220512081558_stefano_moreyra.jpg', 1), 
('Cristian','Vega', CONVERT(DATE, '17/09/1993', 103), 'ARG',(select ID from Equipos where Nombre like '%Colón%'),'MED','https://www.ole.com.ar/images/2022/03/03/HXzZzuZIr_860x575__1.jpg', 1), 
('Baldomero','Perlaza', CONVERT(DATE, '05/06/1992', 103), 'COL',(select ID from Equipos where Nombre like '%Colón%'),'MED','https://www.radiogol.com.ar/wp-content/uploads/2023/02/Baldomero-Perlaza-e1675463596280.jpg', 1),  
('Facundo','Farías', CONVERT(DATE, '28/08/2002', 103), 'ARG',(select ID from Equipos where Nombre like '%Colón%'),'MED','https://media.lacapital.com.ar/p/e8556b2f03ee79c796aa9a265ad8b6a7/adjuntos/204/imagenes/030/732/0030732952/1200x675/smart/facundo-fariasjpg.jpg', 1), 
('Santiago','Pierotti', CONVERT(DATE, '03/04/2001', 103), 'ARG',(select ID from Equipos where Nombre like '%Colón%'),'DEL','https://santafedeportivo.com/wp-content/uploads/2023/04/pierotti-colon-2023-primer-plano.jpg', 1),  
('Ramón','Ábila', CONVERT(DATE, '14/10/1989', 103), 'ARG',(select ID from Equipos where Nombre like '%Colón%'),'DEL','https://image-service.onefootball.com/transform?w=280&h=210&dpr=2&image=https%3A%2F%2Fsantafedeportivo.com%2Fwp-content%2Fuploads%2F2022%2F10%2Fwanchope-colon-1-1-aldosivi-2022-telefono.jpg', 1), 


--Defensa y Justicia

('Luis','Unsain', CONVERT(DATE,'09/03/1995', 103), 'ARG',(select ID from Equipos where Nombre like '%Defensa y%'),'ARQ','http://defensayjusticia.org.ar/wp-content/uploads/2023/03/Usain_Ezequiel_cuaerpo_entero-768x907.png', 1), 
('Agustín','Sant’ Anna',CONVERT(DATE,'27/09/1997', 103), 'URY',(select ID from Equipos where Nombre like '%Defensa y%'),'DEF','http://defensayjusticia.org.ar/wp-content/uploads/2023/03/Sant_Anna_Agustin_cuerpo_entero-768x907.png', 1), 
('Nazareno','Colombo',CONVERT(DATE,'20/03/1999', 103), 'ARG',(select ID from Equipos where Nombre like '%Defensa y%'),'DEF','http://defensayjusticia.org.ar/wp-content/uploads/2023/03/Colombo_Nazareno_cuerpo_entero-768x886.png', 1), 
('Tomás','Cardona',CONVERT(DATE,'10/10/1995', 103), 'ARG',(select ID from Equipos where Nombre like '%Defensa y%'),'DEF','http://defensayjusticia.org.ar/wp-content/uploads/2023/03/Cardona_Tomas_cuerpo_entero-768x886.png', 1), 
('Alexis','Soto',CONVERT(DATE,'20/10/1993', 103), 'ARG',(select ID from Equipos where Nombre like '%Defensa y%'),'DEF','http://defensayjusticia.org.ar/wp-content/uploads/2023/03/Soto_Alexis_cuerpo_entero-768x907.png', 1), 
('Nicolás','Tripichio',CONVERT(DATE,'05/01/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Defensa y%'),'MED','http://defensayjusticia.org.ar/wp-content/uploads/2023/03/Tripichio_Nicolas_cuerpo_entero-768x907.png', 1), 
('Kevin','Gutierrez',CONVERT(DATE,'03/06/1997', 103), 'ARG',(select ID from Equipos where Nombre like '%Defensa y%'),'MED','http://defensayjusticia.org.ar/wp-content/uploads/2023/03/Gutierrez_Kevin_cuerpo_entero-768x907.png', 1), 
('Rodrigo','Bogarín',CONVERT(DATE,'24/05/1997', 103), 'PRY',(select ID from Equipos where Nombre like '%Defensa y%'),'MED','http://defensayjusticia.org.ar/wp-content/uploads/2023/03/Bogarin_Rodrigo_cuerpo_entero-768x886.png', 1), 
('Gabriel','Alanís',CONVERT(DATE,'16/03/1994', 103), 'ARG',(select ID from Equipos where Nombre like '%Defensa y%'),'DEL','http://defensayjusticia.org.ar/wp-content/uploads/2023/03/Gabriel_Alanis_cuerpo_entero-768x886.png', 1), 
('Nicolás','Fernandez',CONVERT(DATE,'08/02/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Defensa y%'),'DEL','http://defensayjusticia.org.ar/wp-content/uploads/2023/03/Fernandez_Nicolas_cuerpo_entero-768x886.png', 1), 
('Gastón','Togni',CONVERT(DATE,'20/09/1997', 103), 'ARG',(select ID from Equipos where Nombre like '%Defensa y%'),'DEL','http://defensayjusticia.org.ar/wp-content/uploads/2023/03/Togni_Gaston_cuerpo_entero-768x907.png', 1) 

--Estudiantes
INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen, Activo)
VALUES ('Mariano', 'Andújar',CONVERT(DATE,'30/07/1983',103) ,'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Estudiantes%'), 'ARQ',
'https://estudiantesdelaplata.com/wp-content/uploads/2018/10/Andujar-2.jpg',1),
('Santiago','Núñez',CONVERT(DATE,'29/04/2000',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Estudiantes%'),'DEF',
'https://i.goalzz.com/?i=o%2Fp%2F171%2F581%2Fsantiago-misael-nune-1.jpg',1),
('Eros','Mancuso',CONVERT(DATE, '17/04/1999', 103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Estudiantes%'),'DEF',
'https://estudiantesdelaplata.com/wp-content/uploads/2022/07/Mancuso-1.jpg',1),
('Luciano','Lollo',CONVERT(DATE, '29/03/1987', 103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Estudiantes%'),'DEF',
'https://estudiantesdelaplata.com/wp-content/uploads/2022/06/Lollo-1.jpg',1),
('Zaid','Romero',CONVERT(DATE, '15/12/1999', 103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Estudiantes%'),'DEF',
'https://estudiantesdelaplata.com/wp-content/uploads/2023/01/Romero.jpg',1),
('Emanuel','Más',CONVERT(DATE, '15/01/1989', 103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Estudiantes%'),'DEF',
'https://estudiantesdelaplata.com/wp-content/uploads/2022/01/Mas-1.jpg',1),
('Santiago','Ascacibar',CONVERT(DATE, '25/02/1997', 103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Estudiantes%'),'MED',
'https://estudiantesdelaplata.com/wp-content/uploads/2023/01/Ascacibar.jpg',1),
('Jorge','Rodríguez',CONVERT(DATE, '15/09/1995', 103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Estudiantes%'),'MED',
'https://estudiantesdelaplata.com/wp-content/uploads/2021/02/Rodriguez.jpg',1),
('Fernando','Zuqui',CONVERT(DATE, '27/11/1991', 103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Estudiantes%'),'MED',
'https://estudiantesdelaplata.com/wp-content/uploads/2021/06/Zuqui.jpg',1),
('Mauro','Méndez',CONVERT(DATE, '17/01/1997', 103),'URY',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Estudiantes%'),'DEL',
'https://estudiantesdelaplata.com/wp-content/uploads/2022/07/mendez.jpg',1),
('Guido','Carrillo',CONVERT(DATE, '25/05/1991', 103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Estudiantes%'),'DEL',
'https://estudiantesdelaplata.com/wp-content/uploads/2023/01/Carrillo-1.jpg',1)

--Gimnasia
INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen, Activo)
VALUES ('Tomás','Durso',CONVERT(DATE,'26/02/1999',103),'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Gimnasia%'), 'ARQ',
'http://www.gimnasia.org.ar/wp-content/uploads/2023/01/galeria-13-2_290x400_acf_cropped-1.jpg',1),
('Bautista','Barros Schelotto',CONVERT(DATE,'13/01/2000',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Gimnasia%'),'DEF',
'http://www.gimnasia.org.ar/wp-content/uploads/2023/02/galeria-164-1_290x400_acf_cropped.jpg',1),
('Leonardo','Morales',CONVERT(DATE,'11/04/1991',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Gimnasia%'),'DEF',
'http://www.gimnasia.org.ar/wp-content/uploads/2023/02/galeria-61-1_290x400_acf_cropped.jpg',1),
('Felipe','Sánchez',CONVERT(DATE,'07/04/2004',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Gimnasia%'),'DEF',
'http://www.gimnasia.org.ar/wp-content/uploads/2023/02/galeria-267_290x400_acf_cropped.jpg',1),
('Nicolás','Colazo',CONVERT(DATE,'08/07/1990',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Gimnasia%'),'DEF',
'http://www.gimnasia.org.ar/wp-content/uploads/2023/02/galeria-129-1_290x400_acf_cropped-1.jpg',1),
('Ignacio','Miramon',CONVERT(DATE,'12/06/2003',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Gimnasia%'),'MED',
'http://www.gimnasia.org.ar/wp-content/uploads/2023/02/galeria-31-1_290x400_acf_cropped.jpg',1),
('Antonio','Napolitano',CONVERT(DATE,'16/02/1999',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Gimnasia%'),'MED',
'http://www.gimnasia.org.ar/wp-content/uploads/2023/02/galeria-21-2_290x400_acf_cropped.jpg',1),
('Franco','Soldano',CONVERT(DATE,'14/09/1994',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Gimnasia%'),'MED',
'http://www.gimnasia.org.ar/wp-content/uploads/2023/02/galeria-145-1_290x400_acf_cropped.jpg',1),
('Alan','Lescano',CONVERT(DATE,'11/11/2001',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Gimnasia%'),'MED',
'http://www.gimnasia.org.ar/wp-content/uploads/2023/02/galeria-233-1_290x400_acf_cropped.jpg',1),
('Benjamín','Domínguez',CONVERT(DATE,'19/09/2003',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Gimnasia%'),'MED',
'http://www.gimnasia.org.ar/wp-content/uploads/2023/02/galeria-197-1_290x400_acf_cropped.jpg',1),
('Cristian','Tarragona',CONVERT(DATE,'09/04/1991',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Gimnasia%'),'DEL',
'http://www.gimnasia.org.ar/wp-content/uploads/2023/02/galeria-190-1_290x400_acf_cropped.jpg',1)

--Godoy Cruz

INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen, Activo)
VALUES ('Diego','Rodríguez',CONVERT(DATE,'25/06/1989',103),'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Godoy%'), 'ARQ',
'https://pbs.twimg.com/media/FzeuICKXoAIdWIj.jpg',1),
('Lucas','Arce',CONVERT(DATE,'14/08/1997',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Godoy%'),'DEF',
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsuRp0LjXnnJdUvdrEfp97w6gBnnAJ5hruYDEqJvzJ9-cjqRtwGlgp143hB3UjMz0aNoQ&usqp=CAU',1),
('Pier','Barrios',CONVERT(DATE,'01/07/1990',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Godoy%'),'DEF',
'https://pbs.twimg.com/media/FUWZ7FgXsAA-swe.jpg:large',1),
('Federico','Rasmussen',CONVERT(DATE,'04/03/1992',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Godoy%'),'DEF',
'https://imagecache.365scores.com/image/upload/f_png,w_250,h_250,c_limit,q_auto:eco,d_Athletes:default.png,r_max,c_thumb,g_face,z_0.65/Athletes/8232',1),
('Thomas','Galdames',CONVERT(DATE,'20/11/1998',103),'CHL',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Godoy%'),'DEF',
'https://imagecache.365scores.com/image/upload/f_png,w_250,h_250,c_limit,q_auto:eco,d_Athletes:default.png,r_max,c_thumb,g_face,z_0.65/Athletes/59708',1),
('Juan','Andrada',CONVERT(DATE,'04/01/1995',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Godoy%'),'MED','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2k7pIH3Z4M1NO7ItIH2L1XVpskQI9bFhvPDh_i4Dyy1JkORR9f-SRoZGRNcRdLL0hE2g&usqp=CAU',1),
('Gonzalo','Abrego',CONVERT(DATE,'06/01/2000',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Godoy%'),'MED','http://clubgodoycruz.com.ar/wp-content/uploads/2000/01/ABREGO-32-219x300.png',1),
('Roberto','Fernández',CONVERT(DATE,'02/03/1998',103),'URY',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Godoy%'),'MED','https://www.soccerpunter.com/player/260893/Roberto-Nicolas-Fernandez-Fagundez',1),
('Hernán','López',CONVERT(DATE,'07/09/2000',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Godoy%'),'MED','https://www.ole.com.ar/2023/07/04/X4KGfnhHe_720x0__1.jpg',1),
('Tadeo','Allende',CONVERT(DATE,'20/02/1999',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Godoy%'),'MED','http://clubgodoycruz.com.ar/wp-content/uploads/1999/09/17-Tadeo-Allende-270x370.png',1),
('Salomón','Rodríguez',CONVERT(DATE,'16/02/2000',103),'URY',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Godoy%'),'DEL','http://clubgodoycruz.com.ar/wp-content/uploads/1998/06/20-Salom%C3%B3n-Rodr%C3%ADguez-270x370.png',1)

--Huracán

INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen, Activo)
VALUES ('Lucas','Chaves',CONVERT(DATE,'09/08/1995',103),'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Hurac%'), 'ARQ',
'https://cahuracan.com/_next/image?url=https%3A%2F%2Fadmin2.cahuracan.com%2Fnew%2Fwp-content%2Fuploads%2F2022%2F09%2F1.-chavez-cahuracan.png-1.png&w=1920&q=75',1),
('Guillermo','Soto',CONVERT(DATE,'19/01/1994',103),'CHL',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Hurac%'),'DEF',
'https://admin2.cahuracan.com/new/wp-content/uploads/2022/09/12.-soto-cahuracan-.png.png',1),
('Fernando','Tobio',CONVERT(DATE,'18/10/1989',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Hurac%'),'DEF','https://admin2.cahuracan.com/new/wp-content/uploads/2022/04/2.-tobio-cahuracan-.png-1.png',1),
('Joaquín','Novillo',CONVERT(DATE,'19/02/1998',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Hurac%'),'DEF','https://admin2.cahuracan.com/new/wp-content/uploads/2023/04/28.-novillo-cahuracan-.png.png',1),
('César','Ibañez',CONVERT(DATE,'17/06/1999',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Hurac%'),'DEF','https://admin2.cahuracan.com/new/wp-content/uploads/2022/04/25.-ibanez-cahuracan-.png.png',1),
('Santiago','Hezze',CONVERT(DATE,'22/10/2001',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Hurac%'),'MED','https://admin2.cahuracan.com/new/wp-content/uploads/2022/04/5.-hezze-cahuracan-.png.png',1),
('Fernando','Godoy',CONVERT(DATE,'01/05/1990',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Hurac%'),'MED','https://admin2.cahuracan.com/new/wp-content/uploads/2022/09/11.-godoy-cahuracan-.png.png',1),
('Federico','Fattori',CONVERT(DATE,'22/07/1992',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Hurac%'),'MED','https://admin2.cahuracan.com/new/wp-content/uploads/2022/04/24.-fattori-cahuracan-.png.png',1),
('Guillermo','Benítez',CONVERT(DATE,'08/12/1993',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Hurac%'),'MED','https://admin2.cahuracan.com/new/wp-content/uploads/2022/09/14.-benitez-cahuracan-.png.png',1),
('Matías','Cóccaro',CONVERT(DATE,'15/11/1997',103),'URY',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Hurac%'),'DEL','https://admin2.cahuracan.com/new/wp-content/uploads/2022/04/7.coccaro-cahuracan-.png.png',1),
('Juan','Gauto',CONVERT(DATE,'02/06/2004',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Hurac%'),'DEL','https://admin2.cahuracan.com/new/wp-content/uploads/2022/04/33.-gauto-cahuracan-.png.png',1)


--Independiente 1 legendaria 3 especiales 7 estandares

INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen, Activo)
VALUES ('Rodrigo','Rey',CONVERT(DATE,'08/03/1991',103),'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Independiente%'), 'ARQ',
'https://clubaindependiente.com.ar/img/plantel/2023/__33_rey.jpg',2,1),
('Luciano','Gómez',CONVERT(DATE,'22/03/1996',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Independiente%'),'DEF','https://clubaindependiente.com.ar/img/plantel/2023/__19_gomez.jpg',3,1),
('Cristian','Báez',CONVERT(DATE,'09/04/1990',103),'PRY',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Independiente%'),'DEF','https://clubaindependiente.com.ar/img/plantel/2023/__13_baez.jpg',3,1),
('Edgar','Elizalde',CONVERT(DATE,'27/02/2000',103),'URY',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Independiente%'),'DEF','https://clubaindependiente.com.ar/img/plantel/2023/__03_elizalde.jpg',3,1),
('Ayrton','Costa',CONVERT(DATE,'12/07/1999',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Independiente%'),'DEF','https://clubaindependiente.com.ar/img/plantel/2023/__79_costa.jpg',2,1),
('Braian','Martínez',CONVERT(DATE,'18/08/1999',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Independiente%'),'MED','https://clubaindependiente.com.ar/img/plantel/30_-_mart%C3%ADnez.jpg',3,1),
('Sergio','Ortíz',CONVERT(DATE,'23/02/2001',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Independiente%'),'MED','https://clubaindependiente.com.ar/img/plantel/2023/__28_ortiz.jpg',3,1),
('Iván','Marcone',CONVERT(DATE,'03/06/1990',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Independiente%'),'MED','https://clubaindependiente.com.ar/img/plantel/2023/__23_marcone.jpg',2,1),
('Martín','Sarrafiore',CONVERT(DATE,'20/07/1997',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Independiente%'),'MED','https://clubaindependiente.com.ar/img/plantel/2023/__14_sarrafiore.jpg',3,1),
('Martín','Cauteruccio',CONVERT(DATE,'14/04/1987',103),'URY',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Independiente%'),'DEL','https://clubaindependiente.com.ar/img/plantel/2023/__09_cauteruccio.jpg',1,1),
('Matías','Giménez',CONVERT(DATE,'06/03/1999',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Independiente%'),'DEL','https://clubaindependiente.com.ar/img/plantel/2023/__34_gimenez.jpg',3,1)

--Instituto 1 especial 10 estandares

INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen, Activo)
VALUES ('Manuel','Roffo',CONVERT(DATE,'04/04/2000',103),'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Instituto%'), 'ARQ',
'https://institutoacc.com.ar/wp-content/uploads/2022/08/54-Mediaday-Futbol-Macro-07032023-1-533x800.jpg',3,1),
('Juan','Franco',CONVERT(DATE,'10/02/1992',103),'PRY',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Instituto%'),'DEF','https://institutoacc.com.ar/wp-content/uploads/2022/08/14-Mediaday-Futbol-Macro-07032023-533x800.jpg',3,1),
('Ezequiel','Parnisari',CONVERT(DATE,'01/06/1990',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Instituto%'),'DEF','https://institutoacc.com.ar/wp-content/uploads/2022/08/44-Mediaday-Futbol-Macro-07032023-533x800.jpg',3,1),
('Fernando','Alarcón',CONVERT(DATE,'16/06/1994',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Instituto%'),'DEF','https://institutoacc.com.ar/wp-content/uploads/2022/08/12-Mediaday-Futbol-Macro-07032023-533x800.jpg',3,1),
('Sebastián','Corda',CONVERT(DATE,'29/06/1995',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Instituto%'),'DEF','https://institutoacc.com.ar/wp-content/uploads/2022/08/18-Mediaday-Futbol-Macro-07032023-533x800.jpg',2,1),
('Gabriel','Graciani',CONVERT(DATE,'28/11/1993',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Instituto%'),'MED','https://institutoacc.com.ar/wp-content/uploads/2022/09/48-Mediaday-Futbol-Macro-07032023-533x800.jpg',3,1),
('Roberto','Bochi',CONVERT(DATE,'06/07/1987',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Instituto%'),'MED','https://institutoacc.com.ar/wp-content/uploads/2022/09/60-Mediaday-Futbol-Macro-07032023-533x800.jpg',3,1),
('Gastón','Lodico',CONVERT(DATE,'28/05/1998',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Instituto%'),'MED','https://institutoacc.com.ar/wp-content/uploads/2022/09/6-Mediaday-Futbol-Macro-07032023-533x800.jpg',3,1),
('Franco','Watson',CONVERT(DATE,'25/07/2002',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Instituto%'),'MED','https://institutoacc.com.ar/wp-content/uploads/2022/09/40-Mediaday-Futbol-Macro-07032023-533x800.jpg',3,1),
('Adrián','Martínez',CONVERT(DATE,'07/07/1992',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Instituto%'),'DEL','https://institutoacc.com.ar/wp-content/uploads/2022/09/58-Mediaday-Futbol-Macro-07032023-533x800.jpg',3,1),
('Santiago','Rodríguez',CONVERT(DATE,'23/08/1997',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Instituto%'),'DEL','https://institutoacc.com.ar/wp-content/uploads/2022/08/36-Mediaday-Futbol-Macro-07032023-533x800.jpg',3,1)



--Lanús 3 especiales 8 estandares

INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen, Activo)
VALUES 
('Lautaro','Morales',CONVERT(DATE,'16/12/1999',103),'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Lanús%'), 'ARQ',
'https://clublanus.com/wp-content/uploads/2022/12/17-LautaroMorales-1-552x1024.png',3,1),
('Juan','Cáceres',CONVERT(DATE,'01/06/2000',103),'PRY',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Lanús%'),'DEF','https://clublanus.com/wp-content/uploads/2023/05/24-JuanCaceres-1-552x1024.png',3,1),
('Felipe','Aguilar',CONVERT(DATE,'20/01/1993',103),'COL',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Lanús%'),'DEF','https://clublanus.com/wp-content/uploads/2023/01/33-FelipeAguilar-1-552x1024.png',3,1),
('Cristian','Lema',CONVERT(DATE,'24/03/1990',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Lanús%'),'DEF','https://clublanus.com/wp-content/uploads/2022/12/02-CristianLema-1-552x1024.png',3,1),
('Juan','Sánchez Miño',CONVERT(DATE,'01/01/1990',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Lanús%'),'DEF','https://clublanus.com/wp-content/uploads/2023/01/14-JuanSancheMino-552x1024.png',2,1),
('Julián','Fernández',CONVERT(DATE,'23/03/1995',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Lanús%'),'MED','https://clublanus.com/wp-content/uploads/2023/01/40-JulianFernandez-1-552x1024.png',3,1),
('Luciano','Boggio',CONVERT(DATE,'10/03/1999',103),'URY',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Lanús%'),'MED','https://clublanus.com/wp-content/uploads/2022/12/08-LucianoBoggio-1-552x1024.png',3,1),
('Matías','Esquivel',CONVERT(DATE,'22/03/1999',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Lanús%'),'MED','https://clublanus.com/wp-content/uploads/2023/01/32-MatiasEsquivel-1-552x1024.png',3,1),
('Franco','Troyansky',CONVERT(DATE,'06/03/1997',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Lanús%'),'DEL','https://clublanus.com/wp-content/uploads/2023/02/20-FrancoTroyansky-1-552x1024.png',3,1),
('José','Sand',CONVERT(DATE,'17/07/1989',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Lanús%'),'DEL','https://clublanus.com/wp-content/uploads/2022/12/9-JoseSand-1-552x1024.png',2,1),
('Pedro','De La Vega',CONVERT(DATE,'07/02/2002',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Lanús%'),'DEL','https://clublanus.com/wp-content/uploads/2022/12/10-PedroDeLaVega-1-552x1024.png',2,1)


--Newell's 3 especiales 8 estandares

INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen, Activo)
VALUES 
('Lucas','Hoyos',CONVERT(DATE,'29/05/1989',103),'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Newell%'), 'ARQ',
'https://newellsoldboys.com.ar/wp-content/uploads/2023/06/Hoyos-Cintura.jpg',2,1),

('Jherson','Mosquero',CONVERT(DATE,'18/09/1999',103),'COL',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Newell%'),'DEF','https://newellsoldboys.com.ar/wp-content/uploads/2023/06/Mosquera-Cintura.jpg',3,1),
('Gustavo','Velázquez',CONVERT(DATE,'17/04/1991',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Newell%'),'DEF','https://newellsoldboys.com.ar/wp-content/uploads/2022/09/Velazquez-Frente.jpg',3,1),
('Guillermo','Ortiz',CONVERT(DATE,'09/11/1992',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Newell%'),'DEF','https://newellsoldboys.com.ar/wp-content/uploads/2023/06/Ortiz-Frente.jpg',3,1),
('Bruno','Pittón',CONVERT(DATE,'02/01/1993',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Newell%'),'DEF','https://newellsoldboys.com.ar/wp-content/uploads/2023/06/Pitton-Cintura.jpg',2,1),
('Marcos','Portillo',CONVERT(DATE,'31/01/2000',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Newell%'),'MED','https://newellsoldboys.com.ar/wp-content/uploads/2022/09/Hoyos-Cintura.jpg',3,1),
('Iván','Gómez',CONVERT(DATE,'28/02/1997',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Newell%'),'MED','https://newellsoldboys.com.ar/wp-content/uploads/2023/06/IvanGomez-Cintura.jpg',3,1),
('Cristian','Ferreira',CONVERT(DATE,'12/09/1999',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Newell%'),'MED','https://newellsoldboys.com.ar/wp-content/uploads/2023/06/Ferreira.jpg',3,1),
('Brian','Aguirre',CONVERT(DATE,'06/01/2003',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Newell%'),'DEL','https://newellsoldboys.com.ar/wp-content/uploads/2022/09/Aguirre-CIntura.jpg',3,1),
('Jorge','Recalde',CONVERT(DATE,'08/05/1992',103),'PRY',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Newell%'),'DEL','https://newellsoldboys.com.ar/wp-content/uploads/2023/06/Recalde-Cintura.jpg',2,1),
('Ramiro','Sordo',CONVERT(DATE,'29/06/2000',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Newell%'),'DEL','https://newellsoldboys.com.ar/wp-content/uploads/2022/09/Sordo-Cintura.jpg',3,1)



--Platense 1 especial 10 estandares

INSERT INTO Jugadores (Nombres, Apellidos, FechaDeNacimiento, Nacionalidad, Equipo, Posicion, Imagen, Activo)
VALUES ('Ramiro','Macagno',CONVERT(DATE,'18/03/1997',103),'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Platense%'), 'ARQ',
'https://cap.org.ar/wp-content/uploads/2023/02/Ramiro-Macagno-12.png',3,1),

('Nicolás','Morgantini',CONVERT(DATE,'11/09/1994',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Platense%'),'DEF','https://cap.org.ar/wp-content/uploads/2023/02/4-Nicolas-Morgantini.png',3,1),
('Ignacio','Vázquez',CONVERT(DATE,'15/05/1997',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Platense%'),'DEF','https://cap.org.ar/wp-content/uploads/2023/02/13-Ignacio-Vazquez-1.png',3,1),
('Marco','Pellegrino',CONVERT(DATE,'18/07/2002',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Platense%'),'DEF','https://cap.org.ar/wp-content/uploads/2023/02/31-Marco-Pellegrino-1.png',3,1),
('Juan','Infante',CONVERT(DATE,'07/01/1996',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Platense%'),'DEF','https://cap.org.ar/wp-content/uploads/2023/02/3-Juan-Infante.png',3,1),
('Ronaldo','Martínez',CONVERT(DATE,'25/04/1996',103),'PRY',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Platense%'),'MED','https://cap.org.ar/wp-content/uploads/2023/02/77-Ronaldo-Martinez.png',3,1),
('Franco','Díaz',CONVERT(DATE,'28/08/2000',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Platense%'),'MED','https://cap.org.ar/wp-content/uploads/2023/02/8-Franco-Diaz.png',3,1),
('Nicolás','Castro',CONVERT(DATE,'11/05/1990',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Platense%'),'MED','https://cap.org.ar/wp-content/uploads/2023/02/11-Nicolas-Castro.png',3,1),
('Sasha','Marcich',CONVERT(DATE,'29/05/1998',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Platense%'),'MED','https://cap.org.ar/wp-content/uploads/2023/02/18-Sasha-Marcich-1.png',3,1),
('Vicente','Taborda',CONVERT(DATE,'14/06/2001',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Platense%'),'DEL','https://cap.org.ar/wp-content/uploads/2023/02/10-Vicente-Taborda.png',2,1),
('Mauro','Quiroga',CONVERT(DATE,'07/12/1989',103),'ARG',(SELECT ID FROM Equipos WHERE Nombre LIKE'%Platense%'),'DEL','https://cap.org.ar/wp-content/uploads/2023/02/9-Mauro-Quiroga.png',3,1)

--Racing 1 legendaria 3 especiales 7 estandares

INSERT INTO Jugadores VALUES
 ('Gabriel','Arias', CONVERT(DATE, '13/09/1987', 103), 'CHL',(select ID from Equipos where Nombre like '%Racing%'),'ARQ','https://www.racingclub.com.ar/img/futbol/plantel/880_arias.jpg?v=2.3',2, 1),
 ('Gabriel','Rojas', CONVERT(DATE, '22/06/1997', 103), 'ARG',(select ID from Equipos where Nombre like '%Racing%'),'DEF','https://www.racingclub.com.ar/img/futbol/plantel/1398_rojas.jpg?v=2.3',3, 1),
 ('Gonzalo','Piovi', CONVERT(DATE, '08/09/1994', 103), 'ARG',(select ID from Equipos where Nombre like '%Racing%'),'DEF','https://www.racingclub.com.ar/img/futbol/plantel/1219_piovi.jpg?v=2.3',3, 1),
 ('Leonardo','Sigali', CONVERT(DATE, '29/05/1987', 103), 'ARG',(select ID from Equipos where Nombre like '%Racing%'),'DEF','https://www.racingclub.com.ar/img/futbol/plantel/794_sigali.jpg?v=2.3',3, 1),
 ('Iván','Pillud', CONVERT(DATE, '24/04/1986', 103), 'ARG',(select ID from Equipos where Nombre like '%Racing%'),'DEF','https://www.racingclub.com.ar/img/futbol/plantel/12_pillud.jpg?v=2.3',1, 1),
 ('Matías','Rojas', CONVERT(DATE, '03/11/1995', 103), 'PRY',(select ID from Equipos where Nombre like '%Racing%'),'MED','https://www.racingclub.com.ar/img/futbol/plantel/992_rojas.jpg?v=2.3',3, 1),
 ('Nicolás','Oroz', CONVERT(DATE, '01/04/1994', 103), 'ARG',(select ID from Equipos where Nombre like '%Racing%'),'MED','https://www.racingclub.com.ar/img/futbol/plantel/1033_moreno.jpg?v=2.3',3, 1),
 ('Juan','Nardoni', CONVERT(DATE, '14/07/2002', 103), 'ARG',(select ID from Equipos where Nombre like '%Racing%'),'MED','https://www.racingclub.com.ar/img/futbol/plantel/1385_nardoni.jpg?v=2.3',3, 1),
 ('Gabriel','Hauche', CONVERT(DATE, '27/11/1986', 103), 'ARG',(select ID from Equipos where Nombre like '%Racing%'),'DEL', 'https://www.racingclub.com.ar/img/futbol/plantel/1220_hauche.jpg?v=2.3',2, 1),
 ('Maximiliano','Romero', CONVERT(DATE, '09/01/1999', 103), 'ARG',(select ID from Equipos where Nombre like '%Racing%'),'DEL', 'https://www.racingclub.com.ar/img/futbol/plantel/1374_romero.jpg?v=2.3',3, 1),
 ('Paolo','Guerrero', CONVERT(DATE, '01/01/1984', 103), 'PER',(select ID from Equipos where Nombre like '%Racing%'),'DEL', 'https://www.racingclub.com.ar/img/futbol/plantel/1386_guerrero.jpg?v=2.3',2, 1)

 --River 2 legendarias 4 especiales 5 estandares

INSERT INTO Jugadores VALUES 
('Franco', 'Armani', CONVERT(DATE, '16/10/1986', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'ARQ', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/1638-01-armani-imagengrillapaginaplantel.png',1, 1 ),
 ('Milton','Casco', CONVERT(DATE, '11/04/1988', 103), 'ARG',(select ID from Equipos where Nombre like '%River%'),'DEF','https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/1230-20-casco-imagengrillapaginaplantel.png',3, 1),
('Jonatan', 'Maidana', CONVERT(DATE, '29/07/1985', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'DEF', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/4-04-maidana-imagengrillapaginaplantel.png',2,1 ),
('Robert','Rojas', CONVERT(DATE, '30/04/1996', 103), 'PRY',(select ID from Equipos where Nombre like '%River%'),'DEF', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/1666-02-rojas-imagengrillapaginaplantel.png',3, 1),
 ('Marcelo','Herrera', CONVERT(DATE, '03/11/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%River%'),'DEF','https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/1829-15-herrera-imagengrillapaginaplantel.png',3, 1),
('Ignacio', 'Fernandez', CONVERT(DATE, '12/01/1990', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'MED', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-12/1254-nacho_270x360.png',2,1 ),
('Nicolás', 'De La Cruz', CONVERT(DATE, '01/06/1997', 103), 'URY', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'MED', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/1623-11-delacruz-imagengrillapaginaplantel.png',2,1 ),
('Enzo', 'Pérez', CONVERT(DATE, '22/02/1986', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'MED', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/1498-24-perez-imagengrillapaginaplantel.png',1,1 ),
('Rodrigo', 'Aliendro', CONVERT(DATE, '16/02/1991', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'MED', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/1830-27-aliendro-imagengrillapaginaplantel.png',3,1 ),
('Lucas', 'Beltrán', CONVERT(DATE, '29/03/2001', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'DEL', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/850-18-beltran-imagengrillapaginaplantel.png',3,1 ),
('Miguel', 'Borja', CONVERT(DATE, '26/01/1993', 103), 'COL', (SELECT ID FROM Equipos WHERE Nombre LIKE '%River%'), 'DEL', 'https://www.cariverplate.com.ar/imagenes/jugadores/2022-08/1831-09-borja-imagengrillapaginaplantel.png',3,1 )

--Rosario Central 3 especiales 8 estandares
INSERT INTO Jugadores VALUES
('Jorge', 'Broun', CONVERT(DATE, '26/05/1986', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Rosario Central%'), 'ARQ', 'https://rosariocentral.com/wp-content/uploads/2021/06/JorgeBroun-1.png',2,1 ),
 ('Alan','Rodríguez', CONVERT(DATE, '15/08/2000', 103), 'PRY',(select ID from Equipos where Nombre like '%Rosario Central%'),'DEF','https://rosariocentral.com/wp-content/uploads/2023/02/AlanRodriguez-16.png',3, 1),
('Facundo', 'Mallo', CONVERT(DATE, '16/01/1995', 103), 'URY', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Rosario Central%'), 'DEF', 'https://rosariocentral.com/wp-content/uploads/2023/02/FacundoMallo-15.png',3,1 ),
('Carlos','Quintana', CONVERT(DATE, '11/02/1988', 103), 'ARG',(select ID from Equipos where Nombre like '%Rosario Central%'),'DEF', 'https://rosariocentral.com/wp-content/uploads/2023/02/CarlosQuintana-2.png',3, 1),
('Damián','Martínez', CONVERT(DATE, '31/01/1990', 103), 'ARG',(select ID from Equipos where Nombre like '%Rosario Central%'),'DEF','https://rosariocentral.com/wp-content/uploads/2021/07/DamianMartinez-4.png',3, 1),
('Francis','Mac Allister', CONVERT(DATE, '30/10/1995', 103), 'ARG',(select ID from Equipos where Nombre like '%Rosario Central%'),'MED','https://rosariocentral.com/wp-content/uploads/2022/08/FrancisMacAllister-5.png',2, 1),
('Víctor Ignacio', 'Malcorra', CONVERT(DATE, '24/07/1987', 103), 'URY', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Rosario Central%'), 'MED', 'https://rosariocentral.com/wp-content/uploads/2022/08/IgnacioMalcorra-10.png',2,1 ),
('Kevin', 'Ortíz', CONVERT(DATE, '18/09/2000', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Rosario Central%'), 'MED', 'https://rosariocentral.com/wp-content/uploads/2022/08/KevinOrtiz-45.png',3,1 ),
('Jaminton', 'Campaz', CONVERT(DATE, '24/05/2000', 103), 'COL', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Rosario Central%'), 'MED', 'https://rosariocentral.com/wp-content/uploads/2023/02/JamintonCampaz13.png',3,1 ),
('Alejo', 'Veliz', CONVERT(DATE, '19/09/2003', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Rosario Central%'), 'DEL', 'https://rosariocentral.com/wp-content/uploads/2022/02/AlejoVeliz-9.png',3,1 ),
('Luca', 'Martínez Dupuy', CONVERT(DATE, '05/06/2001', 103), 'MEX', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Rosario Central%'), 'DEL', 'https://rosariocentral.com/wp-content/uploads/2021/07/MartinezDupuy-29.png',3,1 )

--San Lorenzo 1 legendaria 3 especiales 7 estandares

INSERT INTO Jugadores VALUES
('Augusto', 'Batalla', CONVERT(DATE, '30/04/1996', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%San Lorenzo%'), 'ARQ', 'https://sanlorenzo.com.ar/img/plantel/futbol/2023/g/01-27_1674850514.jpg',2,1 ),
('Rafael','Pérez', CONVERT(DATE, '09/01/1990', 103), 'COL',(select ID from Equipos where Nombre like '%San Lorenzo%'),'DEF','https://sanlorenzo.com.ar/img/plantel/futbol/2023/g/01-27_1674851468.jpg',3, 1),
('Gastón', 'Hernández', CONVERT(DATE, '19/01/1998', 103), 'Arg', (SELECT ID FROM Equipos WHERE Nombre LIKE '%San Lorenzo%'), 'DEF', 'https://sanlorenzo.com.ar/img/plantel/futbol/2023/g/01-27_1674856740.jpg',3,1 ),
('Federico','Gattoni', CONVERT(DATE, '16/02/1999', 103), 'ARG',(select ID from Equipos where Nombre like '%San Lorenzo%'),'DEF', 'https://sanlorenzo.com.ar/img/plantel/futbol/2023/g/01-27_1674847984.jpg',3, 1),
('Gonzalo','Lujan', CONVERT(DATE, '27/04/2001', 103), 'ARG',(select ID from Equipos where Nombre like '%San Lorenzo%'),'DEF','https://sanlorenzo.com.ar/img/plantel/futbol/2023/g/01-27_1674849074.jpg',3, 1),
('Carlos', 'Sánchez', CONVERT(DATE, '06/02/1986', 103), 'COL', (SELECT ID FROM Equipos WHERE Nombre LIKE '%San Lorenzo%'), 'MED', 'https://sanlorenzo.com.ar/img/plantel/futbol/2023/g/01-27_1674855108.jpg',2,1 ),
('Jalil','Elías', CONVERT(DATE, '25/04/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%San Lorenzo%'),'MED','https://sanlorenzo.com.ar/img/plantel/futbol/2023/g/01-27_1674847571.jpg',3, 1),
('Nahuel', 'Barrios', CONVERT(DATE, '07/05/1998', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%San Lorenzo%'), 'MED', 'https://sanlorenzo.com.ar/img/plantel/futbol/2023/g/01-27_1674848557.jpg',2,1 ),
('Iván', 'Leguizamón', CONVERT(DATE, '03/07/2002', 103), 'PRY', (SELECT ID FROM Equipos WHERE Nombre LIKE '%San Lorenzo%'), 'MED', 'https://sanlorenzo.com.ar/img/plantel/futbol/2023/g/01-27_1674854847.jpg',3,1 ),
('Nicolás', 'Blandi', CONVERT(DATE, '13/01/1990', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%San Lorenzo%'), 'DEL', 'https://sanlorenzo.com.ar/img/plantel/futbol/2023/g/01-27_1674847372.jpg',1,1 ),
('Adam', 'Bareiro', CONVERT(DATE, '26/07/1996', 103), 'MEX', (SELECT ID FROM Equipos WHERE Nombre LIKE '%San Lorenzo%'), 'DEL', 'https://sanlorenzo.com.ar/img/plantel/futbol/2023/g/01-27_1674848360.jpg',3,1 )

--Sarmiento 1 especial 10 estandares

INSERT INTO Jugadores VALUES
('Sebastián', 'Meza', CONVERT(DATE, '14/03/2000', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Sarmiento%'), 'ARQ', 'https://clubatleticosarmiento.com/wp-content/uploads/2023/02/plantel-profesional-1-02.jpg',3,1 ),
('Franco','Quinteros', CONVERT(DATE, '26/01/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Sarmiento%'),'DEF','https://clubatleticosarmiento.com/wp-content/uploads/2023/02/plantel-profesional-1-16.jpg',3, 1),
('Juan Manuel', 'Insaurralde', CONVERT(DATE, '03/10/1984', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Sarmiento%'), 'DEF', 'https://clubatleticosarmiento.com/wp-content/uploads/2023/02/plantel-profesional-1-06.jpg',3,1 ),
('Alejandro','Donatti', CONVERT(DATE, '24/10/1986', 103), 'ARG',(select ID from Equipos where Nombre like '%Sarmiento%'),'DEF', 'https://clubatleticosarmiento.com/wp-content/uploads/2023/02/plantel-profesional-1-05.jpg',3, 1),
('Gonzalo','Bettini', CONVERT(DATE, '26/09/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Sarmiento%'),'DEF','https://clubatleticosarmiento.com/wp-content/uploads/2023/02/plantel-profesional-1-13.jpg',3, 1),
('Emiliano', 'Méndez', CONVERT(DATE, '15/02/1989', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Sarmiento%'), 'MED', 'https://clubatleticosarmiento.com/wp-content/uploads/2023/02/plantel-profesional-1-31.jpg',3,1 ),
('Manuel','Mónaco', CONVERT(DATE, '11/05/2002', 103), 'ARG',(select ID from Equipos where Nombre like '%Sarmiento%'),'MED','https://clubatleticosarmiento.com/wp-content/uploads/2023/02/plantel-profesional-1-26.jpg',3, 1),
('Fernando', 'Martínez', CONVERT(DATE, '13/05/1994', 103), 'PRY', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Sarmiento%'), 'MED', 'https://clubatleticosarmiento.com/wp-content/uploads/2023/02/plantel-profesional-1-32.jpg',3,1 ),
('Javier', 'Toledo', CONVERT(DATE, '24/04/1986', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Sarmiento%'), 'DEL', 'https://clubatleticosarmiento.com/wp-content/uploads/2023/02/plantel-profesional-1-33.jpg',3,1 ),
('Lisandro', 'López', CONVERT(DATE, '02/03/1983', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Sarmiento%'), 'DEL', 'https://clubatleticosarmiento.com/wp-content/uploads/2023/02/plantel-profesional-1-09.jpg',2,1 ),
('Luciano', 'Gondou', CONVERT(DATE, '22/06/2001', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Sarmiento%'), 'DEL', 'https://clubatleticosarmiento.com/wp-content/uploads/2023/02/plantel-profesional-1-17.jpg',3,1 )

--Talleres 3 especiales 8 estandares

INSERT INTO Jugadores VALUES
('Guido', 'Herrera', CONVERT(DATE, '29/02/1992', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Talleres%'), 'ARQ', 'https://www.clubtalleres.com.ar/wp-content/uploads/2021/01/WEB_HERRERA-GUIDO-1.png',2,1 ),
('Gastón','Benavídez', CONVERT(DATE, '23/10/1995', 103), 'ARG',(select ID from Equipos where Nombre like '%Talleres%'),'DEF','https://www.clubtalleres.com.ar/wp-content/uploads/2022/03/WEB_BENAVIDEZ-GASTON-1.png',3, 1),
('Matías', 'Catalán', CONVERT(DATE, '19/08/1992', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Talleres%'), 'DEF', 'https://www.clubtalleres.com.ar/wp-content/uploads/2023/02/WEB_CATALAN-MATIAS-2.png',3,1 ),
('Juan','Rodríguez', CONVERT(DATE, '28/02/1994', 103), 'ARG',(select ID from Equipos where Nombre like '%Talleres%'),'DEF', 'https://www.clubtalleres.com.ar/wp-content/uploads/2023/02/WEB_JUAN-GRABRIEL-RODRIGUEZ-2.png',3, 1),
('Juan Carlos','Portillo', CONVERT(DATE, '18/04/2000', 103), 'ARG',(select ID from Equipos where Nombre like '%Talleres%'),'DEF','https://www.clubtalleres.com.ar/wp-content/uploads/2023/02/WEB_JUAN-CARLOS-PORTILLO-1.png',3, 1),
('Diego', 'Ortegoza', CONVERT(DATE, '19/04/1997', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Talleres%'), 'MED', 'https://www.clubtalleres.com.ar/wp-content/uploads/2022/07/WEB_ORTEGOZA-DIEGO-1.png',3,1 ),
('Rodrigo','Villagra', CONVERT(DATE, '14/02/2001', 103), 'ARG',(select ID from Equipos where Nombre like '%Talleres%'),'MED','https://www.clubtalleres.com.ar/wp-content/uploads/2021/08/WEB_VILLAGRA-RODRIGO-1.png',3, 1),
('Rodrigo', 'Garro', CONVERT(DATE, '04/01/1998', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Talleres%'), 'MED', 'https://www.clubtalleres.com.ar/wp-content/uploads/2022/03/WEB_GARRO-RODRIGO-1.png',3,1 ),
('Diego', 'Valoyes', CONVERT(DATE, '22/09/1996', 103), 'COL', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Talleres%'), 'DEL', 'https://www.clubtalleres.com.ar/wp-content/uploads/2021/01/WEB_VALOYES-DIEGO-1.png',2,1 ),
('Michael', 'Santos', CONVERT(DATE, '13/03/1993', 103), 'URY', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Talleres%'), 'DEL', 'https://www.clubtalleres.com.ar/wp-content/uploads/2021/03/WEB_SANTOS-MICHAEL-1.png',2,1 ),
('Nahuel', 'Bustos', CONVERT(DATE, '04/07/1998', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Talleres%'), 'DEL', 'https://www.clubtalleres.com.ar/wp-content/uploads/2023/02/WEB_BUSTOS-NAHUEL-2.png',3,1 )

--Tigre 2 especiales 9 estandares

INSERT INTO Jugadores VALUES
('Gonzalo', 'Marinelli', CONVERT(DATE, '07/02/1989', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Tigre%'), 'ARQ', 'https://desdelaventana.com.ar/zixpanel/cache/med-fecha_2019-09-20_hora_07-54hs_nro-random_782.png',2,1 ),
('Lautaro','Montoya', CONVERT(DATE, '07/10/1994', 103), 'ARG',(select ID from Equipos where Nombre like '%Tigre%'),'DEF','https://pbs.twimg.com/media/FmYcV4sX0AwIlGA?format=jpg&name=900x900',3,1),
('Víctor', 'Cabrera', CONVERT(DATE, '07/02/1993', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Tigre%'), 'DEF', 'https://lh3.googleusercontent.com/-AmRwF--hxI0/YCby91xtNYI/AAAAAAAAdwA/qvIhgY0fhhMml30PphdYnu8_GLV09VVbACLcBGAsYHQ/image.png',3,1 ),
('Brian','Luciatti', CONVERT(DATE, '18/02/1993', 103), 'ARG',(select ID from Equipos where Nombre like '%Tigre%'),'DEF', 'https://sortitoutsi.net/uploads/media/UCvRtvolahlMJimCTCqjrcyKlMREQV4CYB8V5cO5.png',3, 1),
('Lucas','Blondel', CONVERT(DATE, '14/09/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Tigre%'),'DEF','https://www.ceroacero.es/img/jogadores/07/916207_ori__20220728160348_lucas_blondel.png',3, 1),
('Sebastián', 'Prediger', CONVERT(DATE, '04/09/1986', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Tigre%'), 'MED', 'https://www.ceroacero.es//img/jogadores/65/779665_med__20210505203942_sebastian_prediger.png',3,1 ),
('Agustín','Cardozo', CONVERT(DATE, '30/05/1997', 103), 'ARG',(select ID from Equipos where Nombre like '%Tigre%'),'MED','https://scontent.faep25-1.fna.fbcdn.net/v/t1.6435-9/102335744_3107061909383315_2127397949972414464_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=973b4a&_nc_ohc=RpZbm5Z2K3IAX8o_UIK&_nc_ht=scontent.faep25-1.fna&oh=00_AfAPN1l7_rRWp6DVRE2mZVUe0Z0DNOAp-oUN20icvqKWbg&oe=64CFE1D0',3, 1),
('Aaron', 'Molinas', CONVERT(DATE, '02/08/2000', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Tigre%'), 'MED', 'https://pbs.twimg.com/media/FuLG_IvXwAIPyF2?format=jpg&name=900x900',3,1 ),
('Blas', 'Armoa', CONVERT(DATE, '03/02/2000', 103), 'PRY', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Tigre%'), 'DEL', 'https://www.moopio.com/system/entries/images/002/904/885/original/cronica-el-tigre-de-argentina-anuncio-a-blas-armoa-como-su-flamante-refuerzo.png?1644783645',3,1 ),
('Mateo', 'Retegui', CONVERT(DATE, '29/04/1999', 103), 'ITA', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Tigre%'), 'DEL', 'https://blogger.googleusercontent.com/img/a/AVvXsEjzWghazirxGqaWrAW7mY-ph4ThPw-FokGvSe-IaJMnbXME7u3fi16VMap74ZCqzCC4kx0d3IiuMgPWhfCYPIYQ86r89-Wib4aKsujGL4263et5hffFsZNBfaVd_tQ6Ng04-i4c5YJgmzkNhQMSFxwePzf-LxD42oHMgX7pw9iZQyKuZfPHLprJPNpeAQ',2,1 ),
('Facundo', 'Colidio', CONVERT(DATE, '04/01/2000', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Tigre%'), 'DEL', 'https://img.a.transfermarkt.technology/portrait/big/491705-1625049595.jpg?lm=1',3,1 )

-- Union
INSERT INTO Jugadores VALUES
('Sebastián', 'Moyano', CONVERT(DATE, '26/08/1980', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Unión%'), 'ARQ', 'https://i0.wp.com/sinmordaza.com/wp-content/uploads/2020/05/251968_arquero-thumbnail-1280x720-70.jpg?resize=741%2C486&ssl=1',3,1 ),
('Federico','Vera', CONVERT(DATE, '24/03/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Unión%'),'DEF','https://img.fminside.net/facesfm22/14180612.png',3, 1),
('Claudio','Corvalán', CONVERT(DATE, '23/03/1989', 103), 'ARG',(select ID from Equipos where Nombre like '%Unión%'),'DEF', 'https://www.clubaunion.com.ar/wp-content/uploads/2020/07/03-Claudio-Corvalan.png',2, 1),
('Franco','Calderón', CONVERT(DATE, '13/05/1998', 103), 'ARG',(select ID from Equipos where Nombre like '%Unión%'),'DEF','https://www.clubaunion.com.ar/wp-content/uploads/2020/07/02-Franco-Calderon.png',3, 1),
('Kevin', 'Zenón', CONVERT(DATE, '30/07/2001', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Unión%'), 'DEF', 'https://www.tugoyanoticias.com.ar/images/2021/mayo/KEVIN_ZENON1.jpg',3,1 ),
('Enzo', 'Roldán', CONVERT(DATE, '08/12/2000', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Unión%'), 'MED', 'https://cdn.sofifa.net/players/256/501/22_360.png',3,1 ),
('Yeison','Gordillo', CONVERT(DATE, '25/06/1992', 103), 'COL',(select ID from Equipos where Nombre like '%Unión%'),'MED','https://as01.epimg.net/img/comunes/fotos/fichas/deportistas/y/yei/large/28699.png',3, 1),
('Mauro', 'Luna Diale', CONVERT(DATE, '26/04/1999', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Unión%'), 'MED', 'https://cdn.sofifa.net/players/253/908/21_360.png',3,1 ),
('Luciano', 'Aued', CONVERT(DATE, '01/03/1987', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Unión%'), 'MED', 'https://cdn.sofifa.net/players/206/152/22_360.png',3,1 ),
('Imanol', 'Machuca', CONVERT(DATE, '15/01/2000', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Unión%'), 'DEL', 'https://cdn.sofifa.net/players/259/790/22_360.png',3,1 ),
('Jerónimo', 'Dómina', CONVERT(DATE, '17/10/2006', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Unión%'), 'DEL', 'https://imagecache.365scores.com/image/upload/f_png,w_250,h_250,c_limit,q_auto:eco,d_Athletes:default.png,r_max,c_thumb,g_face,z_0.65/Athletes/124971',3,1 )

--Velez Velez 1 legendaria 3 especiales 7 estandares

select * from Jugadores
INSERT INTO Jugadores VALUES
('Leonardo', 'Burián', CONVERT(DATE, '21/01/1984', 103), 'URY', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Velez%'), 'ARQ', 'https://velez.com.ar/img/plantel/2023/lburian23.jpg',3,1 ),
('Francisco','Ortega', CONVERT(DATE, '19/03/1999', 103), 'ARG',(select ID from Equipos where Nombre like '%Velez%'),'DEF','https://velez.com.ar/img/plantel/2023/fortega23.jpg',3, 1),
('Diego', 'Godín', CONVERT(DATE, '16/02/1986', 103), 'URY', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Velez%'), 'DEF', 'https://velez.com.ar/img/plantel/2023/godin_perfil-1.jpg',1,1 ),--especial
('Valentín','Gómez', CONVERT(DATE, '26/06/2003', 103), 'ARG',(select ID from Equipos where Nombre like '%Velez%'),'DEF', 'https://velez.com.ar/img/plantel/2023/perfil_gomez.jpg',2, 1),
('Tomás','Guidara', CONVERT(DATE, '13/03/1996', 103), 'ARG',(select ID from Equipos where Nombre like '%Velez%'),'DEF','https://velez.com.ar/img/plantel/2023/tguidara23.jpg',3, 1),
('Juan', 'Méndez', CONVERT(DATE, '28/04/1997', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Velez%'), 'MED', 'https://velez.com.ar/img/plantel/2023/jmendez__1_.jpg',3,1 ),
('Nicolás','Garayalde', CONVERT(DATE, '21/07/1999', 103), 'ARG',(select ID from Equipos where Nombre like '%Velez%'),'MED','https://velez.com.ar/img/plantel/2023/ngarayalde23.jpg',3, 1),
('José', 'Florentín', CONVERT(DATE, '05/07/1996', 103), 'PRY', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Velez%'), 'MED', 'https://velez.com.ar/img/plantel/2023/jflorentin23.jpg',3,1 ),
('Walter', 'Bou', CONVERT(DATE, '25/08/1993', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Velez%'), 'DEL', 'https://velez.com.ar/img/plantel/2023/wbou23.jpg',2,1 ),
('Lucas', 'Janson', CONVERT(DATE, '18/08/1994', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Velez%'), 'DEL', 'https://velez.com.ar/img/plantel/2023/ljanson23.jpg',2,1 ),
('Abiel', 'Osorio', CONVERT(DATE, '13/06/2002', 103), 'ARG', (SELECT ID FROM Equipos WHERE Nombre LIKE '%Velez%'), 'DEL', 'https://velez.com.ar/img/plantel/2023/aosorio23.jpg',3,1 )

--SELECT DISTINCT A.Id, A.Nombre, A.Codigo, A.Descripcion, M.Descripcion AS Marca, C.Descripcion AS
--Categoria, A.Precio, A.IdMarca, A.IdCategoria FROM ARTICULOS A LEFT JOIN MARCAS M ON M.ID = A.IdMarca
--LEFT JOIN CATEGORIAS C ON C.ID = A.IdCategoria

insert into Niveles 
values
(1,'ADMIN'),
(2,'USER')

INSERT INTO Usuarios (Nombre, Apellido, Email, Clave, Nivel) VALUES
('pru', 'eba', 'prueba@mail.com', 'test', 2)


--idfigu, idalbum, activo, pegada, idjugador, nombre, apellido, imagen

select * from Tipos
select * from Equipos

--River Boca 2 legendarias 4 especiales 5 estandares
--Independiente Racing San Lorenzo Velez Estudiantes 1 legendaria 3 especiales 7 estandares
--Newells Central Lanus Argentinos Talleres Colon Huracan 3 especiales 8 estandares
--Belgrano Union Arsenal Banfield Gimnasia Tucuman Tigre 2 especiales 9 estandares
--el resto 1 especial 10 estandares