--Usamos la Base de Datos
USE [GD1C2018]
GO
--Creamos el esquema
CREATE SCHEMA [FOUR_STARS]
GO


--Creamos las tablas

create table FOUR_STARS.Funciones(
cod_Funcion tinyint primary key,
funcion_nombre varchar(35),
estado bit default (1),
)
go
create table FOUR_STARS.Roles(
cod_Rol tinyint primary key,
rol_nombre varchar(20),
estado bit default (1)
)
go
create table FOUR_STARS.Rol_Por_Funcion(
codRxF int identity (1,1) primary key,
cod_Funcion tinyint not null foreign key references FOUR_STARS.Funciones (cod_Funcion),
cod_Rol tinyint not null foreign key references FOUR_STARS.Roles (cod_Rol),
)
go

create table FOUR_STARS.Usuario(
username varchar(50) primary key,
password varchar(225) not null,
cod_Rol tinyint not null foreign key references FOUR_STARS.Roles (cod_Rol),
nombre varchar(255),
apellido varchar(255),
tipoDocumento varchar(255),
numeroDocumento numeric(18,2),
email nvarchar(255),
telefono varchar(12),
direccion varchar(225),
fechaDeNacimiento datetime,
estado bit default (1)
)
go
create table FOUR_STARS.Regimen(
codigoRegimen int identity(1,1) primary key,
descripcion varchar(225) not null,
precio int not null,
estado bit default (1))
go
create table FOUR_STARS.Hotel(
codHotel int identity (1,1) primary key,
email nvarchar(255)  null,
nombre varchar(50)  null,
telefono varchar(12)  null,
direccion varchar(255) not null,
estrellas smallint not null,
ciudad varchar(225) not null,
pais varchar(255) null,
creacion datetime null)
go
create table FOUR_STARS.Usuario_Por_Hotel(
codUxH int identity (1,1) primary key,
username varchar(50) not null foreign key references FOUR_STARS.Usuario (username),
codHotel int not null foreign key references FOUR_STARS.Hotel (codHotel)
)
go
create table FOUR_STARS.HotelesInhabilitados(
codHotelInhabilitado int identity (1,1) primary key,
codHotel int not null foreign key references FOUR_STARS.Hotel (codHotel),
inicioClausura datetime not null,
finClausura datetime not null
)
go
create table FOUR_STARS.ActividadesHotelesInhabilitados(
codActividad int identity(1,1) primary key,
codHotelInhabilitado int foreign key references FOUR_STARS.HotelesInhabilitados(codHotelInhabilitado),
descripcion varchar(50),
fecha datetime
)
go

create table FOUR_STARS.Hotel_Por_Regimen(
codHxR int identity (1,1) primary key,
codigoRegimen int not null foreign key references FOUR_STARS.Regimen (codigoRegimen),
codHotel int not null foreign key references FOUR_STARS.Hotel (codHotel)
)
go
create table FOUR_STARS.TipoHabitacion(
codTipo int primary key,
descripcion varchar(50) not null,
tipoPorcentual numeric(18,2) not null
)
go
create table FOUR_STARS.Reserva(
num_Reserva int primary key,
fechaSistema datetime default getdate(),
fecha_inicio datetime not null,
fecha_fin datetime not null,
codTipo int not null foreign key references FOUR_STARS.TipoHabitacion (codTipo),
codigoRegimen int not null foreign key references FOUR_STARS.Regimen (codigoRegimen),
estado bit default (1))
go
create table FOUR_STARS.ReservasCanceladas(
cod_RC int identity (1,1) primary key,
num_Reserva int not null foreign key references FOUR_STARS.Reserva (num_Reserva),
username varchar(50) not null foreign key references FOUR_STARS.Usuario (username),
motivo varchar(225),
fecha datetime default getdate())
go
create table FOUR_STARS.Habitacion(
num_Habitacion int,
codHotel int foreign key references FOUR_STARS.Hotel (codHotel),
piso smallint not null,
ubicacion nvarchar(8) null,
codTipo int not null foreign key references FOUR_STARS.TipoHabitacion (codTipo),
descripcion varchar(255),
estado bit default (1),
primary key(num_Habitacion, codHotel),
check (ubicacion ='Interior' or ubicacion = 'Exterior')
)
go
create table FOUR_STARS.Reserva_Por_Habitacion(
codRxH int identity (1,1) primary key,
num_Reserva int not null foreign key references FOUR_STARS.Reserva (num_Reserva),
num_Habitacion int not null,
codHotel int not null,
foreign key (num_Habitacion, codHotel) references  FOUR_STARS.Habitacion(num_Habitacion, codHotel)
)
go
create table FOUR_STARS.Estadia(
numeroEstadia int identity (1,1) primary key,
num_Reserva int not null foreign key references FOUR_STARS.Reserva (num_Reserva),
fechaIngreso datetime not null,
fechaEgreso datetime not null,
)
go
create table FOUR_STARS.Factura(
numFactura int primary key,
numeroEstadia int not null foreign key references FOUR_STARS.Estadia (numeroEstadia),
fechaFacturacion datetime default getdate(),
importe int null,
tipoPago varchar(255) default 'Efectivo',
)
go
create table FOUR_STARS.Consumible(
consumibleCodigo int primary key,
nombreConsumible nvarchar(255),
costo smallint not null
)
go

create table FOUR_STARS.Cliente(
codCliente int identity(1,1) primary key,
nombre varchar (200) not null,
apellido varchar(200) not null,
tipoDocumento varchar(255) not null,
numeroDocumento numeric(18,2) not null,
email nvarchar(255) not null,
telefono varchar(12) null,
direccion varchar(225) not null,
localidad varchar(255) null,
paisOrigen varchar(255) null,
nacionalidad varchar(255) not null,
fechaDeNacimiento datetime null,
estado bit default (1)
)
go
create table FOUR_STARS.Cliente_Por_Estadia(
codCxE int identity (1,1) primary key,
codCliente int not null foreign key references FOUR_STARS.Cliente (codCliente),
numeroEstadia int not null foreign key references FOUR_STARS.Estadia (numeroEstadia)
)
go


create table FOUR_STARS.Item(
itemNum int identity (1,1) primary key,
numeroEstadia int not null foreign key references FOUR_STARS.Estadia(numeroEstadia),
consumibleCodigo int null foreign key references FOUR_STARS.Consumible(consumibleCodigo),
itemCantidad int null,
itemMonto int null,
)
go


--Creamos una tabla auxiliar
create table FOUR_STARS.HotelAuxiliar(
id int identity(1,1),
ciudad nvarchar(255),
calle nvarchar(255),
numero numeric(18,0),
estrella numeric(18,0)
)
go

--Creamos una funciones exclusivas para la migracion

create function FOUR_STARS.ubicacion (@frente nvarchar(50))
returns nvarchar(8)
as
begin
	declare @ubicacion nvarchar(8)
	if @frente = 'S' select @ubicacion = 'EXTERIOR'
	else select @ubicacion = 'INTERIOR'
	return @ubicacion
end
go

create function FOUR_STARS.direccionizar (@calle nvarchar(255), @numero nvarchar(255), @piso numeric(18,0), @depto nvarchar(50))
returns nvarchar(255)
as
begin
	declare @direccion nvarchar(255) = @calle + ' ' + cast(@numero as nvarchar(8))
	if @piso is not null begin
						select @direccion += ', ' + cast(@piso as nvarchar(8))
						if @depto is not null select @direccion += ' ' + @depto
						end
	return @direccion
end
go

--Funcion para facturar

create function FOUR_STARS.Calcular_Importe(@regimen numeric(18,2), @habitacion numeric(18,2), @fechaR datetime, @fechaE datetime, @nochesR numeric(18,0), @nochesE numeric(18,0), @tipoRegimen nvarchar(255), @consumibles numeric(18,2))
returns numeric(18,2)
as
begin
		declare @precio numeric(18,2) = (@regimen * @habitacion) + 50
		declare @nochesTotal numeric(10,0) = @nochesE
		if @fechaE = @fechaR
		begin
				if (@nochesE < @nochesR) select @nochesTotal = @nochesR
		end
		select @precio = @precio * @nochesTotal
		if not (@tipoRegimen like 'All inclusive*') select @precio += @consumibles
		
		return @precio
end
go

--Proceso maestra
create procedure FOUR_STARS.maestra
as
begin
		insert into FOUR_STARS.HotelAuxiliar (ciudad, calle, numero, estrella)  select distinct Hotel_Ciudad, Hotel_Calle, Hotel_Nro_Calle, Hotel_CantEstrella from gd_esquema.Maestra 
		insert into FOUR_STARS.Hotel (direccion, estrellas, ciudad) select (calle + ' ' + cast(numero as nvarchar(8))), estrella, ciudad from FOUR_STARS.HotelAuxiliar
		insert into FOUR_STARS.TipoHabitacion (codTipo, descripcion, tipoPorcentual) select distinct Habitacion_Tipo_Codigo, Habitacion_Tipo_Descripcion, Habitacion_Tipo_Porcentual from gd_esquema.Maestra
		insert into FOUR_STARS.Habitacion (num_Habitacion, codHotel, piso, ubicacion, codTipo) select distinct m.Habitacion_Numero, h.id, m.Habitacion_Piso, (select FOUR_STARS.ubicacion(m.Habitacion_Frente)), m.Habitacion_Tipo_Codigo from gd_esquema.Maestra m join FOUR_STARS.HotelAuxiliar h on (m.Hotel_Ciudad = h.ciudad and m.Hotel_Calle = h.calle and m.Hotel_Nro_Calle = h.numero)
		insert into FOUR_STARS.Regimen (descripcion, precio) select distinct Regimen_Descripcion, Regimen_Precio from gd_esquema.Maestra
		insert into FOUR_STARS.Reserva(num_Reserva, fecha_inicio, fecha_fin, codTipo, codigoRegimen) select distinct m.Reserva_Codigo, m.Reserva_Fecha_Inicio, DATEADD(DAY, m.Reserva_Cant_Noches, m.Reserva_Fecha_Inicio), m.Habitacion_Tipo_Codigo, r.codigoRegimen from gd_esquema.Maestra m join FOUR_STARS.Regimen r on (m.Regimen_Descripcion = r.descripcion)
		insert into FOUR_STARS.Estadia(num_Reserva, fechaIngreso, fechaEgreso) select distinct Reserva_Codigo, Estadia_Fecha_Inicio, DATEADD(DAY, Estadia_Cant_Noches, Estadia_Fecha_Inicio) from gd_esquema.Maestra where Estadia_Fecha_Inicio is not null
		insert into FOUR_STARS.Consumible(consumibleCodigo, nombreConsumible, costo) select distinct Consumible_Codigo, Consumible_Descripcion, Consumible_Precio from gd_esquema.Maestra where Consumible_Codigo is not null
		insert into FOUR_STARS.Cliente (nombre, apellido, tipoDocumento, numeroDocumento, email, direccion, nacionalidad, paisOrigen) select distinct Cliente_Nombre, Cliente_Apellido, 'Pasaporte', Cliente_Pasaporte_Nro, Cliente_Mail, (select FOUR_STARS.direccionizar(Cliente_Dom_Calle, Cliente_Nro_Calle, Cliente_Piso, Cliente_Depto)), Cliente_Nacionalidad, Cliente_Nacionalidad from gd_esquema.Maestra
		insert into FOUR_STARS.Item(numeroEstadia, consumibleCodigo, itemCantidad, itemMonto) select distinct e.numeroEstadia, m.Consumible_Codigo, m.Item_Factura_Monto, (m.Item_Factura_Monto * m.Consumible_Precio)  from gd_esquema.Maestra m join FOUR_STARS.Estadia e on (m.Reserva_Codigo = e.num_Reserva) where m.Consumible_Codigo is not null
		insert into FOUR_STARS.Reserva_Por_Habitacion(num_Reserva, num_Habitacion, codHotel) select distinct m.Reserva_Codigo, m.Habitacion_Numero, h.id from gd_esquema.Maestra m join FOUR_STARS.HotelAuxiliar h on (m.Hotel_Ciudad = h.ciudad and m.Hotel_Calle = h.calle and m.Hotel_Nro_Calle = h.numero)
		insert into FOUR_STARS.Hotel_Por_Regimen(codigoRegimen, codHotel) select distinct r.codigoRegimen, h.id from gd_esquema.Maestra m join  FOUR_STARS.HotelAuxiliar h on (m.Hotel_Ciudad = h.ciudad and m.Hotel_Calle = h.calle and m.Hotel_Nro_Calle = h.numero) join FOUR_STARS.Regimen r on (m.Regimen_Descripcion = r.descripcion)
		insert into FOUR_STARS.Cliente_Por_Estadia(codCliente, numeroEstadia) select distinct c.codCliente, e.numeroEstadia from gd_esquema.Maestra m join FOUR_STARS.Cliente c on (m.Cliente_Pasaporte_Nro = c.numeroDocumento) join FOUR_STARS.Estadia e on (m.Reserva_Codigo = e.num_Reserva)

		--Facturas
		insert into FOUR_STARS.Factura (numFactura, numeroEstadia, fechaFacturacion, importe)
		select distinct m.Factura_Nro, e.numeroEstadia, m.Factura_Fecha, (select FOUR_STARS.Calcular_Importe(m.Regimen_Precio, m.Habitacion_Tipo_Porcentual, m.Reserva_Fecha_Inicio, m.Estadia_Fecha_Inicio, m.Reserva_Cant_Noches, m.Estadia_Cant_Noches, m.Regimen_Descripcion, sum(i.itemMonto)))
		from gd_esquema.Maestra m
		join FOUR_STARS.Estadia e
		on (e.num_Reserva = m.Reserva_Codigo)
		join FOUR_STARS.Item i
		on (i.numeroEstadia = e.numeroEstadia)
		where m.Factura_Nro is not null
		group by m.Factura_Nro, e.numeroEstadia, m.Factura_Fecha, m.Regimen_Precio, m.Habitacion_Tipo_Porcentual, m.Reserva_Fecha_Inicio, m.Estadia_Fecha_Inicio, m.Reserva_Cant_Noches, m.Estadia_Cant_Noches, m.Regimen_Descripcion

end
go

execute FOUR_STARS.maestra
go		
drop table FOUR_STARS.HotelAuxiliar
go
drop function FOUR_STARS.ubicacion
go

drop function FOUR_STARS.direccionizar
go

drop table gd_esquema.Maestra
go

select * from FOUR_STARS.Funciones


insert into FOUR_STARS.Funciones(cod_Funcion, funcion_nombre)
values(1, 'AMB de Rol'), (2, 'Login y seguridad'), (3, 'AMB de Usuario'), (4, 'AMB de Cliente (huespedes)'),(5, 'AMB de Hotel'),
(6, 'AMB de Habitacion'), (7, 'AMB Regmien de estadia'), (8, 'Generar o modificar una reserva'), (9, 'Cancelar Reserva'), (10, 'Registrar Estadia'),
(11, 'Registrar consumibles'), (12, 'Facturar estadia'), (13, 'Listado Estadistico')
go

insert into FOUR_STARS.Roles(cod_Rol, rol_nombre)
values(1, 'Administrador'), (2, 'Recepcionista'), (3, 'Guest')
go

insert into FOUR_STARS.Rol_Por_Funcion(cod_Funcion, cod_Rol)
--Login: solo administradores y recepcionistas
values (2, 1), (2, 2),
--AMB Usuario, solo Administrador
(3, 1),
--AMB Clientes, solo recepcionistas y administradores
(4,1 ), (4, 2),
--AMb de Hotel, solo Administrador
(5, 1),
--AMB de Habitacion, solo Administrador
(6, 1),
-- AMB de Regmien de estadia, solo Administrador
(7, 1),
--Generar/modificar reserva, recepcionistas y usuarios y administradores
(8, 1), (8, 2), (8,3),
--Cancelar reserva, usuario o recepcionistas o administradores
(9,1), (9,2), (9, 3),
--Registrar Estadia, recepcionista, o administrador
(10, 1), (10, 2),
--Registrar consumibles, facturar y listado estadistico, todas de administrador
(11, 1), (12, 1), (13, 1)
go

