	use master
	go
	drop database cshop
go

create database cshop
go
use cshop
create table tipousuarios (
tipouser int not null default 1,
detalle varchar(50)
constraint pk_tipouser Primary Key (tipouser)
)
create table usuarios (
C_usuario int identity(1,1) not null,
nombre varchar(60) not null,
apellido varchar(60) not null,
dni varchar(10) not null,
email varchar(300) unique not null,
contraseña varchar(300)  not null,
tipouser int not null,
estado int not null,
constraint pk_usuarios primary key (c_usuario)
)
create table tipoRopa(
c_tiporopa int identity(1,1) not null,
detalle varchar(200) not null,
constraint pk_tiporopa primary key (c_tiporopa)
)
create table colores(
c_color int identity(1,1) not null,
nombre varchar(200) not null,
url varchar(500),
constraint pk_colores primary key (c_color)
)
create table ColoresxArticulos(
c_color int not null,
c_articulo int not null,
constraint pk_colorxropa primary key  (c_color,c_articulo)
)
create table Articulos (
c_articulo int identity(1,1) not null,
c_tiporopa int not null,
nombreArt nvarchar(100) not null,
detallear nvarchar(400),
precio money not null,
url varchar(500) not null,
constraint pk_articulo primary key (c_articulo)
)
create table sucursales (
c_sucursal int identity (1,1) not null,
nombre varchar(200) not null,
direccion varchar(200) not null,
constraint pk_sucursales primary key (c_sucursal)
)
create table talles (
c_talle int identity(1,1) not null,
detalle varchar(100) not null,
constraint pk_talles primary key (c_talle)
)

create table tallesxarticulo(
c_talle int  not null,
c_articulo int not null,
constraint pk_tallesxarticulo primary key (c_talle,c_articulo)
)
create table articulosxsucursales(
c_articulo int not null,
c_sucursal int not null,
c_talle int not null,
stock int ,
baja int not null,
constraint pk_artxsuc primary key (c_articulo,c_sucursal,c_talle)
)

create table MensajeContacto (
ID int identity(1,1) not null,
Nombre varchar(30) not null,
Email varchar(30) not null,
tipoConsulta varchar(30) not null,
Mensaje text not null,
constraint pk_mensajes primary key (ID)
)

select * from MensajeContacto

create table articulosseleccionados(
c_usuario int not null,
c_articulo int not null,
c_talle int not null,
c_color int not null,
cantidad int not null default 1,
fecha date not null default getdate(),
constraint pk_articulosseleccionados primary key (c_usuario,c_articulo,c_talle,c_color)
)

create table historico(
c_usuario int not null,
c_articulo int not null,
c_talle int not null,
c_color int not null,
cantidad int not null default 1,
fecha date not null default getdate(),
constraint pk_historico primary key (c_usuario,c_articulo,c_talle)
)

create table facturas(
c_factura int identity(1,1) not null,
c_usuario int not null,
fecha date not null default getdate(),
forma_pago nvarchar(1000) default 'VIA WEB',
constraint pk_facturas primary key (c_factura,c_usuario)
)
create table detallefactura(
c_factura int  not null,
c_usuario int  not null,
c_talle int  not null,
c_articulo int not null,
c_color int not null,
precio money not null,
cantidad int not null default 1,
constraint pk_detallefactura primary key (c_factura,c_talle,c_articulo)
)
--detalle facturas------------------
alter table detallefactura add constraint fk_detallefacturaxfact
foreign key (c_factura,c_usuario) references facturas (c_factura,c_usuario)
alter table detallefactura add constraint fk_detallefacturaxarts
foreign key (c_talle,c_articulo) references tallesxarticulo (c_talle,c_articulo)
--Facturas------------------
alter table facturas add constraint fk_facturasxuser
foreign key (c_usuario) references usuarios (c_usuario)
--articulos seleccionados--
alter table articulosseleccionados add constraint fk_articulosseleccionadosxuser
foreign key (c_usuario) references usuarios (c_usuario)
alter table articulosseleccionados add constraint fk_articulosseleccionadosxarticulos
foreign key (c_talle,c_articulo) references tallesxarticulo (c_talle,c_articulo)


--usuarios ---------------------
alter table usuarios add constraint fk_userxtipousuario
foreign key (tipouser) references tipousuarios (tipouser)
--colores x ropa -------------
alter table ColoresxArticulos add constraint fk_coloresxropaxcolores
foreign key (c_color) references colores (c_color)
alter table ColoresxArticulos add constraint fk_colorexropaarti
foreign key (c_articulo) references articulos (c_articulo)
-------------Articulos --------------------
alter table articulos add constraint fk_articulostiporopa
foreign key (c_tiporopa) references tiporopa(c_tiporopa)
--------------------talles x articulos------------------------------
--tallesxarticulo
alter table tallesxarticulo add constraint fk_artxartxtalles
foreign key (c_articulo) references articulos(c_articulo)
alter table tallesxarticulo add constraint fk_tallesxtallexarts
foreign key (c_talle) references talles (c_talle)
-----------------articulos x sucursales-----------------------------

alter table articulosxsucursales add constraint fk_artxsucxsucursa
foreign key (c_sucursal) references sucursales(c_sucursal)
alter table articulosxsucursales add constraint fk_artxsucxtallesxart
foreign key (c_talle,c_articulo) references tallesxarticulo(c_talle,c_articulo)

SET IDENTITY_INSERT [talles] ON
INSERT [talles] ([c_talle], [detalle]) VALUES (1, N'38')
INSERT [talles] ([c_talle], [detalle]) VALUES (2, N'39')
INSERT [talles] ([c_talle], [detalle]) VALUES (3, N'40')
INSERT [talles] ([c_talle], [detalle]) VALUES (4, N'41')
INSERT [talles] ([c_talle], [detalle]) VALUES (5, N'L')
INSERT [talles] ([c_talle], [detalle]) VALUES (6, N'M')
INSERT [talles] ([c_talle], [detalle]) VALUES (7, N'S')
INSERT [talles] ([c_talle], [detalle]) VALUES (8, N'XL')
INSERT [talles] ([c_talle], [detalle]) VALUES (9, N'XXL')
SET IDENTITY_INSERT [talles] OFF
SET IDENTITY_INSERT [sucursales] ON
INSERT [sucursales] ([c_sucursal], [nombre], [direccion]) VALUES (1, N'CENTRAL', N'WEB')
SET IDENTITY_INSERT [sucursales] OFF
SET IDENTITY_INSERT [MensajeContacto] ON
INSERT [MensajeContacto] ([ID], [Nombre], [Email], [tipoConsulta], [Mensaje]) VALUES (1, N'Carlos', N'mail@ejemplo.com', N'Pedido', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque purus neque, sollicitudin vel eros sodales, tempus fringilla ante. Nulla facilisi. Nullam scelerisque finibus mauris, at accumsan dolor rutrum et. Proin enim eros, pulvinar a scelerisque vel, scelerisque et leo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin lobortis sem at cursus euismod. Pellentesque viverra sollicitudin lectus ut suscipit. Fusce auctor metus et augue ultrices, vel iaculis nisl porttitor. Nam scelerisque ipsum sed pretium ultrices. Fusce tortor justo, iaculis id mauris ut, bibendum consectetur lorem. Nullam tempus, dolor eu accumsan convallis, urna lacus tristique orci.')
INSERT [MensajeContacto] ([ID], [Nombre], [Email], [tipoConsulta], [Mensaje]) VALUES (2, N'Fernando', N'mail@ejemplo.com', N'Consulta General', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque purus neque, sollicitudin vel eros sodales, tempus fringilla ante. Nulla facilisi. Nullam scelerisque finibus mauris, at accumsan dolor rutrum et. Proin enim eros, pulvinar a scelerisque vel, scelerisque et leo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin lobortis sem at cursus euismod. Pellentesque viverra sollicitudin lectus ut suscipit. Fusce auctor metus et augue ultrices, vel iaculis nisl porttitor. Nam scelerisque ipsum sed pretium ultrices. Fusce tortor justo, iaculis id mauris ut, bibendum consectetur lorem. Nullam tempus, dolor eu accumsan convallis, urna lacus tristique orci.')
INSERT [MensajeContacto] ([ID], [Nombre], [Email], [tipoConsulta], [Mensaje]) VALUES (3, N'Leandro', N'mail@ejemplo.com', N'Informe de un problema', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque purus neque, sollicitudin vel eros sodales, tempus fringilla ante. Nulla facilisi. Nullam scelerisque finibus mauris, at accumsan dolor rutrum et. Proin enim eros, pulvinar a scelerisque vel, scelerisque et leo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin lobortis sem at cursus euismod. Pellentesque viverra sollicitudin lectus ut suscipit. Fusce auctor metus et augue ultrices, vel iaculis nisl porttitor. Nam scelerisque ipsum sed pretium ultrices. Fusce tortor justo, iaculis id mauris ut, bibendum consectetur lorem. Nullam tempus, dolor eu accumsan convallis, urna lacus tristique orci.')
INSERT [MensajeContacto] ([ID], [Nombre], [Email], [tipoConsulta], [Mensaje]) VALUES (4, N'Martin', N'mail@ejemplo.com', N'Consulta General', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque purus neque, sollicitudin vel eros sodales, tempus fringilla ante. Nulla facilisi. Nullam scelerisque finibus mauris, at accumsan dolor rutrum et. Proin enim eros, pulvinar a scelerisque vel, scelerisque et leo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin lobortis sem at cursus euismod. Pellentesque viverra sollicitudin lectus ut suscipit. Fusce auctor metus et augue ultrices, vel iaculis nisl porttitor. Nam scelerisque ipsum sed pretium ultrices. Fusce tortor justo, iaculis id mauris ut, bibendum consectetur lorem. Nullam tempus, dolor eu accumsan convallis, urna lacus tristique orci.')
SET IDENTITY_INSERT [MensajeContacto] OFF
INSERT [historico] ([c_usuario], [c_articulo], [c_talle], [c_color], [cantidad], [fecha]) VALUES (1, 1, 1, 3, 10, CAST(0x083F0B00 AS Date))
INSERT [historico] ([c_usuario], [c_articulo], [c_talle], [c_color], [cantidad], [fecha]) VALUES (1, 1, 2, 1, 1, CAST(0x083F0B00 AS Date))
INSERT [historico] ([c_usuario], [c_articulo], [c_talle], [c_color], [cantidad], [fecha]) VALUES (1, 10, 1, 1, 2, CAST(0x093F0B00 AS Date))
INSERT [historico] ([c_usuario], [c_articulo], [c_talle], [c_color], [cantidad], [fecha]) VALUES (1, 10, 2, 1, 1, CAST(0x083F0B00 AS Date))
INSERT [historico] ([c_usuario], [c_articulo], [c_talle], [c_color], [cantidad], [fecha]) VALUES (1, 10, 5, 1, 2, CAST(0x083F0B00 AS Date))
INSERT [tipousuarios] ([tipouser], [detalle]) VALUES (0, N'ADMINISTRADOR')
INSERT [tipousuarios] ([tipouser], [detalle]) VALUES (1, N'USUARIO')
SET IDENTITY_INSERT [tipoRopa] ON
INSERT [tipoRopa] ([c_tiporopa], [detalle]) VALUES (1, N'Remeras')
INSERT [tipoRopa] ([c_tiporopa], [detalle]) VALUES (2, N'Camisetas')
SET IDENTITY_INSERT [tipoRopa] OFF
SET IDENTITY_INSERT [colores] ON
INSERT [colores] ([c_color], [nombre], [url]) VALUES (1, N'ROJO FUERTE', N'\images\ROJO.PNG')
INSERT [colores] ([c_color], [nombre], [url]) VALUES (2, N'ROJO suave', N'\images\ROJO2.PNG')
INSERT [colores] ([c_color], [nombre], [url]) VALUES (3, N'ROJO v2', N'\images\ROJO3.PNG')
INSERT [colores] ([c_color], [nombre], [url]) VALUES (4, N'ROJO v3', N'\images\ROJOv3.PNG')
INSERT [colores] ([c_color], [nombre], [url]) VALUES (5, N'ROJO v4', N'\images\ROJOv4.PNG')
SET IDENTITY_INSERT [colores] OFF
SET IDENTITY_INSERT [usuarios] ON
INSERT [usuarios] ([C_usuario], [nombre], [apellido], [dni], [email], [contraseña], [tipouser], [estado]) VALUES (1, N'Nehuen', N'Fortes', N'40731857', N'nfortes@grupopiero.com', N'123', 0, 0)
INSERT [usuarios] ([C_usuario], [nombre], [apellido], [dni], [email], [contraseña], [tipouser], [estado]) VALUES (2, N'Leandro', N'Arroyo', N'40459112', N'larroyo@red.frgp.utn.edu.ar', N'123', 0, 0)
INSERT [usuarios] ([C_usuario], [nombre], [apellido], [dni], [email], [contraseña], [tipouser], [estado]) VALUES (3, N'Usuario', N'Prueba', N'12345678', N'mail@ejemplo.com', N'123', 1, 0)
SET IDENTITY_INSERT [usuarios] OFF
SET IDENTITY_INSERT [Articulos] ON
INSERT [Articulos] ([c_articulo], [c_tiporopa], [nombreArt], [detallear], [precio], [url]) VALUES (1, 1, N'Remera Argentina', N'Remera Argentina', 7000.0000, N'\images\remera-arg.jpg')
INSERT [Articulos] ([c_articulo], [c_tiporopa], [nombreArt], [detallear], [precio], [url]) VALUES (2, 1, N'Remera Argentina Alt', N'Remera Argentina Alternativa', 6500.0000, N'\images\remera-arg2.jpg')
INSERT [Articulos] ([c_articulo], [c_tiporopa], [nombreArt], [detallear], [precio], [url]) VALUES (3, 1, N'Remera No Marca Bordo', N'Remera Manga Corta Bordo', 350.0000, N'\images\remera-bordo.jpg')
INSERT [Articulos] ([c_articulo], [c_tiporopa], [nombreArt], [detallear], [precio], [url]) VALUES (4, 1, N'Remera No Marca Gris', N'Remera Gris con Estmapado ', 250.0000, N'\images\remera-gris-bola.jpg')
INSERT [Articulos] ([c_articulo], [c_tiporopa], [nombreArt], [detallear], [precio], [url]) VALUES (5, 1, N'Remera No Marca Naranja', N'Remera Manga Corta Naranja', 400.0000, N'\images\remera-naranja-noEstampa.jpg')
INSERT [Articulos] ([c_articulo], [c_tiporopa], [nombreArt], [detallear], [precio], [url]) VALUES (6, 2, N'Remera Nike', N'Remera Marca Nike Color Azul', 500.0000, N'\images\remera-nike-azul.png')
INSERT [Articulos] ([c_articulo], [c_tiporopa], [nombreArt], [detallear], [precio], [url]) VALUES (7, 2, N'Remera No Estampado', N'Remera Blanca sin estampa', 250.0000, N'\images\remera-blanca.jpg')
INSERT [Articulos] ([c_articulo], [c_tiporopa], [nombreArt], [detallear], [precio], [url]) VALUES (8, 2, N'Remera River', N'Remera River Plate', 5000.0000, N'\images\remera-river.jpg')
INSERT [Articulos] ([c_articulo], [c_tiporopa], [nombreArt], [detallear], [precio], [url]) VALUES (9, 2, N'Remera River Alt', N'Remera River Plate Alternativa', 3400.0000, N'\images\remera-river2.jpg')
INSERT [Articulos] ([c_articulo], [c_tiporopa], [nombreArt], [detallear], [precio], [url]) VALUES (10, 2, N'Camisa', N'Camisa a Cuadros', 700.5500, N'\images\camisa_cuadros1.jpg')
SET IDENTITY_INSERT [Articulos] OFF
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (1, 1)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (1, 2)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (1, 3)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (1, 4)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (1, 5)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (1, 6)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (1, 7)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (1, 8)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (1, 9)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (1, 10)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (2, 1)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (2, 10)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (3, 1)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (4, 1)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (5, 1)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (5, 10)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (6, 1)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (7, 1)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (7, 10)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (8, 1)
INSERT [tallesxarticulo] ([c_talle], [c_articulo]) VALUES (9, 1)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (1, 1)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (1, 2)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (1, 3)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (1, 10)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (2, 1)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (2, 2)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (2, 10)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (3, 1)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (3, 2)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (3, 10)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (4, 2)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (5, 1)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (5, 2)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (5, 3)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (5, 4)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (5, 6)
INSERT [ColoresxArticulos] ([c_color], [c_articulo]) VALUES (5, 7)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (1, 1, 1, 40, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (1, 1, 2, 80, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (1, 1, 3, 1, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (1, 1, 4, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (1, 1, 5, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (1, 1, 6, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (1, 1, 7, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (1, 1, 8, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (1, 1, 9, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (2, 1, 1, 1, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (3, 1, 1, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (4, 1, 1, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (5, 1, 1, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (6, 1, 1, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (7, 1, 1, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (8, 1, 1, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (9, 1, 1, 31, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (10, 1, 1, 40, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (10, 1, 2, 40, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (10, 1, 5, 40, 0)
INSERT [articulosxsucursales] ([c_articulo], [c_sucursal], [c_talle], [stock], [baja]) VALUES (10, 1, 7, 1, 0)







select * from usuarios
select * from tipousuarios

select estado, tipousuarios.detalle, usuarios.nombre, usuarios.apellido,usuarios.dni, usuarios.email from usuarios inner join tipousuarios on usuarios.tipouser = tipousuarios.tipouser where usuarios.C_usuario = 2
 
