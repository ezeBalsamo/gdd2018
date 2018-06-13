--Usamos la Base de Datos
USE [GD1C2018]
GO
--Creamos el esquema
CREATE SCHEMA [FOUR_STARS]
GO


--Creamos las tablas

create table FOUR_STARS.Funciones(
cod_Funcion int primary key,
funcion_nombre varchar(35),
estado int default (1),
)
go
create table FOUR_STARS.Roles(
cod_Rol int identity (1,1)primary key,
rol_nombre varchar(20),
estado int default (1)
)
go
create table FOUR_STARS.Rol_Por_Funcion(
codRxF int identity (1,1) primary key,
cod_Funcion int not null foreign key references FOUR_STARS.Funciones (cod_Funcion),
cod_Rol int not null foreign key references FOUR_STARS.Roles (cod_Rol),
)
go


create table FOUR_STARS.Usuario(
username varchar(50) primary key,
password varbinary(32) not null,
cod_Rol int not null foreign key references FOUR_STARS.Roles (cod_Rol),
nombre varchar(255),
apellido varchar(255),
tipoDocumento varchar(255),
numeroDocumento varchar(12),
email nvarchar(255),
telefono varchar(12),
direccion varchar(225),
fechaDeNacimiento datetime,
estado int default (1)
)
go
create table FOUR_STARS.Regimen(
codigoRegimen int identity(1,1) primary key,
descripcion varchar(225) not null,
precio int not null,
estado int default (1))
go
create table FOUR_STARS.Hotel(
codHotel int identity (1,1) primary key,
email nvarchar(255)  null,
nombre varchar(50)  null,
telefono varchar(12)  null,
direccion varchar(255) not null,
estrellas int not null,
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
tipoPorcentual decimal(18, 2) not null
)
go

create table FOUR_STARS.Cliente(
codCliente int identity(1,1) primary key,
nombre varchar (200) not null,
apellido varchar(200) not null,
tipoDocumento varchar(255) not null,
numeroDocumento varchar(12) not null,
email nvarchar(255) unique,
telefono varchar(12) null ,
direccion varchar(225) not null ,
localidad varchar(255) null,
nacionalidad varchar(255) not null,
paisOrigen varchar(255) not null,
fechaDeNacimiento datetime null,
estado int default (1)
)
go

create table FOUR_STARS.Reservas_Estados(
cod_Estado int identity(1,1) primary key,
descripcion nvarchar(50)
)
go

create table FOUR_STARS.Reserva(
num_Reserva int primary key,
codCliente int foreign key references FOUR_STARS.Cliente(codCliente),
fechaSistema datetime default getdate(),
fecha_inicio datetime not null,
fecha_fin datetime not null,
codigoRegimen int not null foreign key references FOUR_STARS.Regimen (codigoRegimen),
estado int default (1) foreign key references FOUR_STARS.Reservas_Estados(cod_Estado))
go
create table FOUR_STARS.ReservasCanceladas(
cod_RC int identity (1,1) primary key,
num_Reserva int not null foreign key references FOUR_STARS.Reserva (num_Reserva),
username varchar(50) null foreign key references FOUR_STARS.Usuario (username),
motivo varchar(225),
fecha datetime default getdate())
go
create table FOUR_STARS.Habitacion(
num_Habitacion int,
codHotel int foreign key references FOUR_STARS.Hotel (codHotel),
piso int not null,
ubicacion nvarchar(8) null,
codTipo int not null foreign key references FOUR_STARS.TipoHabitacion (codTipo),
descripcion varchar(255),
estado int default (1),
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
num_Reserva int not null,
fechaIngreso datetime not null,
fechaEgreso datetime null,
)
go
create table FOUR_STARS.Factura(
numFactura int primary key,
numeroEstadia int not null foreign key references FOUR_STARS.Estadia (numeroEstadia),
fechaFacturacion datetime default getdate(),
totalEstadia decimal (18,2) null,
totalConsumibles decimal (18,2) null,
importe decimal(18,2) null,
tipoPago varchar(255) default 'Efectivo',
)
go
create table FOUR_STARS.Consumible(
consumibleCodigo int primary key,
nombreConsumible nvarchar(255),
costo int not null
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
num_Habitacion int,
codHotel int,
itemCantidad int null,
itemMonto int null,
foreign key (num_Habitacion, codHotel) references  FOUR_STARS.Habitacion(num_Habitacion, codHotel)
)
go

CREATE TABLE FOUR_STARS.Reservas_Con_Modificacion(

cod_RM int identity (1,1) primary key,
num_Reserva int not null foreign key references FOUR_STARS.Reserva (num_Reserva),
username varchar(50),
accion int foreign key references FOUR_STARS.Reservas_Estados(cod_Estado),
fecha datetime default getdate())
go

--Creamos tablas auxiliares
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

insert into FOUR_STARS.Reservas_Estados (descripcion) values ('Reserva Correcta')
insert into FOUR_STARS.Reservas_Estados (descripcion) values ('Reserva Modificada')
insert into FOUR_STARS.Reservas_Estados (descripcion) values ('Reserva Cancelada por Recepcion')
insert into FOUR_STARS.Reservas_Estados (descripcion) values ('Reserva Cancelada por Usuario')
insert into FOUR_STARS.Reservas_Estados (descripcion) values ('Reserva Cancelada por No-Show')
insert into FOUR_STARS.Reservas_Estados (descripcion) values ('Reserva Efectivizada')
go

create function FOUR_STARS.MigrarEstadosDeReservas(@estadia datetime, @inicio datetime)
returns int
begin
	declare @estado int
	if(@estadia is not null) select @estado = 6
	else
		begin
			declare @hoy datetime = getdate()
			if(@inicio >= @hoy) select @estado = 1
			else select @estado = 5
		end

	return @estado
end
go

--Calcular importe

create function FOUR_STARS.MultiplicarEstadia(@estrellas int, @regimen decimal(18,2), @habitacion decimal(18,2), @fechaR datetime, @fechaE datetime, @nochesR numeric(18,0), @nochesE numeric(18,0))
returns decimal(18,2)
as
begin
	declare @precio decimal(18,2) = (@regimen * @habitacion) + 10 * @estrellas
		declare @nochesTotal numeric(10,0) = @nochesE
		if @fechaE = @fechaR
		begin
				if (@nochesE < @nochesR) select @nochesTotal = @nochesR
		end
		select @precio = @precio * @nochesTotal

	return @precio
end
go

create function FOUR_STARS.CalcularConsumibles(@tipoRegimen nvarchar(255), @consumibles numeric(18,2))
returns decimal(18,2)
as
begin
	declare @precio decimal(18,2) = 0
	
		if not (@tipoRegimen like 'All inclusive*') select @precio = @consumibles
		
		return @precio
end
go



--Proceso maestra
create procedure FOUR_STARS.maestra
as
begin
		insert into FOUR_STARS.HotelAuxiliar (ciudad, calle, numero, estrella)  select distinct Hotel_Ciudad, Hotel_Calle, Hotel_Nro_Calle, Hotel_CantEstrella from gd_esquema.Maestra 
		insert into FOUR_STARS.Hotel (direccion, estrellas, ciudad, pais) select (calle + ' ' + cast(numero as nvarchar(8))), estrella, ciudad, 'Argentina'  from FOUR_STARS.HotelAuxiliar
		insert into FOUR_STARS.TipoHabitacion (codTipo, descripcion, tipoPorcentual) select distinct Habitacion_Tipo_Codigo, Habitacion_Tipo_Descripcion, Habitacion_Tipo_Porcentual from gd_esquema.Maestra
		insert into FOUR_STARS.Habitacion (num_Habitacion, codHotel, piso, ubicacion, codTipo) select distinct m.Habitacion_Numero, h.id, m.Habitacion_Piso, (select FOUR_STARS.ubicacion(m.Habitacion_Frente)), m.Habitacion_Tipo_Codigo from gd_esquema.Maestra m join FOUR_STARS.HotelAuxiliar h on (m.Hotel_Ciudad = h.ciudad and m.Hotel_Calle = h.calle and m.Hotel_Nro_Calle = h.numero)
		insert into FOUR_STARS.Regimen (descripcion, precio) select distinct Regimen_Descripcion, Regimen_Precio from gd_esquema.Maestra
		insert into FOUR_STARS.Estadia(num_Reserva, fechaIngreso, fechaEgreso) select distinct Reserva_Codigo, Estadia_Fecha_Inicio, DATEADD(DAY, Estadia_Cant_Noches, Estadia_Fecha_Inicio) from gd_esquema.Maestra where Estadia_Fecha_Inicio is not null
		insert into FOUR_STARS.Cliente (nombre, apellido, tipoDocumento, numeroDocumento, email, direccion, nacionalidad, paisOrigen) select distinct m.Cliente_Nombre, m.Cliente_Apellido, 'Pasaporte', cast (m.Cliente_Pasaporte_Nro as varchar(12)), m.Cliente_Mail, (select FOUR_STARS.direccionizar(m.Cliente_Dom_Calle, m.Cliente_Nro_Calle, m.Cliente_Piso, m.Cliente_Depto)), m.Cliente_Nacionalidad, m.Cliente_Nacionalidad from  gd_esquema.Maestra m join (select Cliente_Mail, max(Cliente_Pasaporte_Nro) Pasaporte from gd_esquema.Maestra group by Cliente_Mail) a on (a.Cliente_Mail = m.Cliente_Mail and m.Cliente_Pasaporte_Nro = a.Pasaporte)
		insert into FOUR_STARS.Reserva(num_Reserva, codCliente, fecha_inicio, fecha_fin, codigoRegimen, estado) select distinct m.Reserva_Codigo, c.codCliente, m.Reserva_Fecha_Inicio, DATEADD(DAY, m.Reserva_Cant_Noches, m.Reserva_Fecha_Inicio), r.codigoRegimen, (select FOUR_STARS.MigrarEstadosDeReservas(e.fechaEgreso, m.Reserva_Fecha_Inicio)) from gd_esquema.Maestra m join FOUR_STARS.Regimen r on (m.Regimen_Descripcion = r.descripcion) left join FOUR_STARS.Estadia e on (e.num_Reserva = m.Reserva_Codigo) join FOUR_STARS.Cliente c on (c.email = m.Cliente_Mail)  where m.Estadia_Fecha_Inicio is null
		insert into FOUR_STARS.Consumible(consumibleCodigo, nombreConsumible, costo) select distinct Consumible_Codigo, Consumible_Descripcion, Consumible_Precio from gd_esquema.Maestra where Consumible_Codigo is not null
		insert into FOUR_STARS.Reserva_Por_Habitacion(num_Reserva, num_Habitacion, codHotel) select distinct m.Reserva_Codigo, m.Habitacion_Numero, h.id from gd_esquema.Maestra m join FOUR_STARS.HotelAuxiliar h on (m.Hotel_Ciudad = h.ciudad and m.Hotel_Calle = h.calle and m.Hotel_Nro_Calle = h.numero)
		insert into FOUR_STARS.Item(numeroEstadia, consumibleCodigo, itemCantidad, itemMonto, num_Habitacion, codHotel) select distinct e.numeroEstadia, m.Consumible_Codigo, m.Item_Factura_Monto, (m.Item_Factura_Monto * m.Consumible_Precio), rh.num_Habitacion, rh.codHotel from gd_esquema.Maestra m join FOUR_STARS.Estadia e on (m.Reserva_Codigo = e.num_Reserva) join FOUR_STARS.Reserva_Por_Habitacion rh on (rh.num_Reserva = e.num_Reserva) where m.Consumible_Codigo is not null
		insert into FOUR_STARS.Hotel_Por_Regimen(codigoRegimen, codHotel) select distinct r.codigoRegimen, h.id from gd_esquema.Maestra m join  FOUR_STARS.HotelAuxiliar h on (m.Hotel_Ciudad = h.ciudad and m.Hotel_Calle = h.calle and m.Hotel_Nro_Calle = h.numero) join FOUR_STARS.Regimen r on (m.Regimen_Descripcion = r.descripcion)
		insert into FOUR_STARS.Cliente_Por_Estadia(codCliente, numeroEstadia) select distinct c.codCliente, e.numeroEstadia from gd_esquema.Maestra m join FOUR_STARS.Cliente c on (m.Cliente_Pasaporte_Nro = c.numeroDocumento) join FOUR_STARS.Estadia e on (m.Reserva_Codigo = e.num_Reserva)
		
		--Facturas
		insert into FOUR_STARS.Factura (numFactura, numeroEstadia, fechaFacturacion, totalEstadia, totalConsumibles, importe)
		select distinct m.Factura_Nro, e.numeroEstadia, m.Factura_Fecha,
		(SELECT FOUR_STARS.MultiplicarEstadia (m.Hotel_CantEstrella, m.Regimen_Precio, m.Habitacion_Tipo_Porcentual, m.Reserva_Fecha_Inicio, m.Estadia_Fecha_Inicio, m.Reserva_Cant_Noches, m.Estadia_Cant_Noches)),
		(SELECT FOUR_STARS.CalcularConsumibles(m.Regimen_Descripcion, sum(i.itemMonto) )), 0
		from gd_esquema.Maestra m
		join FOUR_STARS.Estadia e
		on (e.num_Reserva = m.Reserva_Codigo)
		join FOUR_STARS.Item i
		on (i.numeroEstadia = e.numeroEstadia)
		where m.Factura_Nro is not null
		group by m.Factura_Nro, e.numeroEstadia, m.Hotel_CantEstrella, m.Factura_Fecha, m.Regimen_Precio, m.Habitacion_Tipo_Porcentual, m.Reserva_Fecha_Inicio, m.Estadia_Fecha_Inicio, m.Reserva_Cant_Noches, m.Estadia_Cant_Noches, m.Regimen_Descripcion

		update FOUR_STARS.Factura SET importe = totalConsumibles + totalEstadia
end
go

execute FOUR_STARS.maestra
go

insert into FOUR_STARS.ReservasCanceladas (num_Reserva, fecha, motivo) select num_Reserva, fecha_fin, 'No especifica' from FOUR_STARS.Reserva WHERE estado between 3 and 5
		
drop table FOUR_STARS.HotelAuxiliar
go

drop function FOUR_STARS.ubicacion
go

ALTER TABLE FOUR_STARS.Estadia
ADD foreign key (num_Reserva) references FOUR_STARS.Reserva (num_Reserva)
go

drop function FOUR_STARS.direccionizar
go
drop function FOUR_STARS.MigrarEstadosDeReservas
go
drop table gd_esquema.Maestra
go

drop function FOUR_STARS.CalcularConsumibles
GO
drop function FOUR_STARS.MultiplicarEstadia
go


--Ingresamos las Funciones del Sistema
insert into FOUR_STARS.Funciones(cod_Funcion, funcion_nombre)
values(1, 'AMB de Rol'), (2, 'Login y seguridad'), (3, 'AMB de Usuario'), (4, 'AMB de Cliente (huespedes)'),(5, 'AMB de Hotel'),
(6, 'AMB de Habitacion'), (7, 'AMB Regmien de estadia'), (8, 'Generar o modificar una reserva'), (9, 'Cancelar Reserva'), (10, 'Registrar Estadia'),
(11, 'Registrar consumibles'), (12, 'Facturar estadia'), (13, 'Listado Estadistico')
go

--Ingresamos las funciones para ingresar los Roles
create procedure FOUR_STARS.Insertar_Roles(@nombre nvarchar(20))
as
begin
		insert into FOUR_STARS.Roles(rol_nombre) values (@nombre)
end
go

create procedure FOUR_STARS.Insertar_Funcion_Por_Rol(@rol int, @funcion int)
as
begin
	insert into FOUR_STARS.Rol_Por_Funcion(cod_Rol, cod_Funcion) values (@rol, @funcion)
end
go

create function FOUR_STARS.EncontrarID_Rol(@rol nvarchar(20))
returns int
begin
	declare @codigo int
	select @codigo = cod_Rol from FOUR_STARS.Roles where rol_nombre = @rol
	return @codigo
end
go

create procedure FOUR_STARS.Roles_Bajas_Altas(@rol int, @estado bit)
as
begin
	update FOUR_STARS.Roles
	set estado = @estado
	where cod_Rol = @rol
end
go

create procedure FOUR_STARS.Rol_Dar_Alta(@rol int)
as
begin
	execute FOUR_STARS.Roles_Bajas_Altas @rol, 1
end
go


create procedure FOUR_STARS.Rol_Dar_Baja(@rol int)
as
begin
	execute FOUR_STARS.Roles_Bajas_Altas @rol, 0
end
go

create procedure FOUR_STARS.Roles_Quitar_Funciones(@rol int, @funcion int)
as
begin
	delete FOUR_STARS.Rol_Por_Funcion
	where cod_Rol = @rol and cod_Funcion = @funcion
end
go


--Ingresamos los Tres Roles basicos dados por el sistema
create procedure FOUR_STARS.Ingresar_Roles_Basicos
as
begin
	declare @nombre nvarchar(20) = 'Administrador'
	execute FOUR_STARS.Insertar_Roles @nombre
	declare @codigo int = (select FOUR_STARS.EncontrarID_Rol(@nombre))
	declare @contador int = 0
	while @contador < 13
	begin
		select @contador += 1
		execute FOUR_STARS.Insertar_Funcion_Por_Rol @codigo, @contador
	end
	select @nombre = 'Recepcionista'
	execute FOUR_STARS.Insertar_Roles @nombre
	select @codigo = (select FOUR_STARS.EncontrarID_Rol(@nombre))
	select @contador = 0
	while @contador < 13
	begin
		select @contador += 1
		if (@contador in (2, 4, 8, 9, 10, 11, 12)) execute FOUR_STARS.Insertar_Funcion_Por_Rol @codigo, @contador
	end
	select @nombre = 'Guest'
	execute FOUR_STARS.Insertar_Roles @nombre
	select @codigo = (select FOUR_STARS.EncontrarID_Rol(@nombre))
	select @contador = 7
	while @contador < 9
	begin
		select @contador += 1
		execute FOUR_STARS.Insertar_Funcion_Por_Rol @codigo, @contador
	end
end
go

execute FOUR_STARS.Ingresar_Roles_Basicos
drop procedure FOUR_STARS.Ingresar_Roles_Basicos
go

--Encontar ID_Funcion
create function FOUR_STARS.EncontrarID_Funcion(@funcion nvarchar(20))
returns int
begin
	declare @codigo int
	select @codigo = cod_Funcion from FOUR_STARS.Funciones where funcion_nombre = @funcion
	return @codigo
end
go


--Usuarios

create procedure FOUR_STARS.IngresarUsuarios(@username varchar(50), @password varchar(225), @cod_Rol int, @nombre varchar(255), @apellido varchar(255), @tipoDocumento varchar(255), @numeroDocumento nvarchar(12), @email nvarchar(255), @telefono varchar(12), @direccion varchar(225), @fechaDeNacimiento datetime)
as
begin
		declare @contraseniaEnClave varbinary(32) = HASHBYTES('SHA2_256', @password)
	insert into FOUR_STARS.Usuario (username, password, cod_Rol, nombre, apellido, tipoDocumento, numeroDocumento, email, telefono, direccion, fechaDeNacimiento)
	values (@username, @contraseniaEnClave, @cod_Rol, @nombre, @apellido, @tipoDocumento, @numeroDocumento, @email, @telefono, @direccion, @fechaDeNacimiento)
end
go

create procedure FOUR_STARS.ModificarUsuarios(@usuarioOriginal varchar(50), @username varchar(50), @cod_Rol int, @nombre varchar(255), @apellido varchar(255), @tipoDocumento varchar(255), @numeroDocumento nvarchar(12), @email nvarchar(255), @telefono varchar(12), @direccion varchar(225), @fechaDeNacimiento datetime)
as
begin
		
		update FOUR_STARS.Usuario
		set username = @username, cod_Rol = @cod_Rol, nombre = @nombre, apellido = @apellido, tipoDocumento = @tipoDocumento, numeroDocumento = @numeroDocumento, email = @email, telefono = @telefono, direccion = @direccion, fechaDeNacimiento = @fechaDeNacimiento
		where username = @usuarioOriginal
end
go

create trigger FOUR_STARS.eliminarUsuario
ON FOUR_STARS.Usuario_Por_Hotel
AFTER delete
as
begin
	declare @nombreUsuario varchar(50)
	select @nombreUsuario username from deleted
	if NOT EXISTS (select * from FOUR_STARS.Usuario_Por_Hotel where username = @nombreUsuario) update FOUR_STARS.Usuario set estado = 0 where username = @nombreUsuario 
end
go

create procedure FOUR_STARS.Insertar_Hoteles_Para_Usuarios(@usuario nvarchar(50), @codHotel int)
as
begin
	insert into FOUR_STARS.Usuario_Por_Hotel (username, codHotel) values (@usuario, @codHotel)
end
go

execute FOUR_STARS.IngresarUsuarios 'admin', 'w23e', 1, 'Administrador', 'General', null, null, null, null, null, null
go

create procedure FOUR_STARS.IngresarHotelesAdmin
as
begin
	declare @hotel int
	declare hoteles cursor for select codHotel from FOUR_STARS.Hotel
	open hoteles
	fetch next from hoteles into @hotel
	while @@FETCH_STATUS = 0
	begin
	execute FOUR_STARS.Insertar_Hoteles_Para_Usuarios 'admin', @hotel
	fetch next from hoteles into @hotel
	end
	close hoteles
	deallocate hoteles 
end
go

execute FOUR_STARS.IngresarHotelesAdmin
go

drop procedure FOUR_STARS.IngresarHotelesAdmin
go
create procedure FOUR_STARS.Usuarios_Bajas_Altas(@usuario nvarchar(50), @estado bit)
as
begin
	update FOUR_STARS.Usuario
	set estado = @estado
	where username = @usuario
end
go

create procedure FOUR_STARS.Usuarios_Dar_Alta(@usuario nvarchar(50))
as
begin
	execute FOUR_STARS.Usuarios_Bajas_Altas @usuario, 1
end
go

create procedure FOUR_STARS.Usuarios_Dar_Baja(@usuario nvarchar(50))
as
begin
	execute FOUR_STARS.Usuarios_Bajas_Altas @usuario, 0
end
go



--Login
create function FOUR_STARS.Login(@usuario nvarchar(50), @password varchar(255))
returns int
as
begin
	declare @valido int = 2
	if exists (select username from FOUR_STARS.Usuario where username = @usuario and password = (HASHBYTES('SHA2_256', @password)) and estado = 1) select @valido = 1
	
	return @valido
end
go

--Clientes
create procedure FOUR_STARS.InsertarCliente (@nombre varchar(200), @apellido varchar(200), @tipoDocumento varchar(255), @ndocumento varchar(12), @email nvarchar(255), @telefono varchar(12), @direccion varchar(255), @localidad varchar(255), @paisOrigen varchar(255), @nacionalidad varchar(255), @fechaDeNacimiento datetime)
as
begin
	
	
	insert into FOUR_STARS.Cliente(nombre, apellido, tipoDocumento, numeroDocumento, email, telefono, direccion, localidad, nacionalidad, paisOrigen, fechaDeNacimiento)
	values (@nombre, @apellido, @tipoDocumento, @ndocumento, @email, @telefono, @direccion, @localidad, @nacionalidad, @paisOrigen, @fechaDeNacimiento)
end
go

create procedure FOUR_STARS.ModificarCliente (@nombre varchar(200), @apellido varchar(200), @tipoDocumento varchar(255), @ndocumento varchar(12), @email nvarchar(255), @telefono varchar(12), @direccion varchar(255), @localidad varchar(255),  @paisOrigen varchar(255), @nacionalidad varchar(255), @fechaDeNacimiento datetime, @viejoMail nvarchar(255))
as
begin
	
	
	update FOUR_STARS.Cliente
	set nombre = @nombre, apellido = @apellido, tipoDocumento = @tipoDocumento, numeroDocumento = @ndocumento, email = @email, telefono = @telefono, direccion = @direccion, localidad = @localidad, nacionalidad = @nacionalidad, paisOrigen = @paisOrigen, fechaDeNacimiento = @fechaDeNacimiento
	where email = @viejoMail	
end
go

create function FOUR_STARS.AutorizacionInsertarCliente (@mail nvarchar(255))
returns int
as
begin
	declare @autorizacion int = 1
	if exists (select * from FOUR_STARS.Cliente where email like @mail) select @autorizacion = 0

	return @autorizacion
end
go


--Hoteles
create procedure FOUR_STARS.IngresarHotel(@mail nvarchar(255), @nombre varchar(50), @telefono varchar(12), @direccion varchar(255), @estrellas int, @ciudad varchar(255), @pais varchar(255), @creacion datetime)
as
begin
	insert into FOUR_STARS.Hotel (email, nombre, telefono,direccion, estrellas, ciudad, pais, creacion)
	values (@mail, @nombre, @telefono, @direccion, @estrellas, @ciudad, @pais, @creacion)
end
go

create function FOUR_STARS.BuscarCodHotel (@ciudad varchar(255), @direccion varchar(255), @pais varchar(255))
returns int
as
begin
	declare @codHotel int
	select @codHotel = codHotel FROM FOUR_STARS.Hotel where ciudad = @ciudad and direccion = @direccion and pais = @pais
	return @codHotel
end
go

create procedure FOUR_STARS.ModificarHotel(@mail nvarchar(255), @nombre varchar(50), @telefono varchar(12), @direccion varchar(255), @estrellas int, @ciudad varchar(255), @pais varchar(255), @creacion datetime, @codHotel int)
as
begin
	update FOUR_STARS.Hotel
	set	email = @mail, nombre = @nombre, telefono = @telefono, direccion = @direccion, estrellas = @estrellas, ciudad = @ciudad, pais = @pais, creacion = @creacion
	where codHotel = @codHotel
end
go

create procedure FOUR_STARS.QuitarRegimenHotel(@nombre nvarchar(255), @codHotel int)
as
begin
	declare @codigo int
	select @codigo = codigoRegimen from FOUR_STARS.Regimen where descripcion = @nombre
	delete FOUR_STARS.Hotel_Por_Regimen where codHotel = @codHotel and codigoRegimen = @codigo
	
end
go

create procedure FOUR_STARS.AgregarRegimenHotel(@nombre nvarchar(255), @codHotel int)
as
begin
	declare @codigo int
	select @codigo = codigoRegimen from FOUR_STARS.Regimen where descripcion = @nombre
	insert into FOUR_STARS.Hotel_Por_Regimen (codHotel, codigoRegimen) values (@codHotel, @codigo)
	
end
go

create function FOUR_STARS.CompararFechasParaCancelarHoteles (@inicioReserva datetime, @finReserva datetime, @inicioCancel datetime, @finCancel datetime)
returns int
as
begin
	declare @resultado int = 0
	if (@inicioReserva between @inicioCancel and @finReserva) select @resultado = 1
	else if (@finReserva between @inicioCancel and @finReserva) select @resultado = 1
		else if (@inicioReserva >= @inicioCancel and @finCancel >= @finReserva) select @resultado = 1

	return @resultado
end
go

create function FOUR_STARS.RequerimientosParaCancelarHoteles(@estado int, @inicioEstadia datetime, @finEstadia datetime, @inicioReserva datetime, @finReserva datetime, @inicioCancel datetime, @finCancel datetime)
returns int
as
begin
	declare @resultado int = 0
	if (@estado = 1 or @estado = 2)
		begin
		select @resultado = (select FOUR_STARS.CompararFechasParaCancelarHoteles(@inicioReserva, @finReserva, @inicioCancel, @finCancel))
		end
	else if (@estado = 6 and @finEstadia is null)
		begin
		select @resultado = (select FOUR_STARS.CompararFechasParaCancelarHoteles(@inicioEstadia, @finReserva, @inicioCancel, @finCancel))
		end

	return @resultado
end
go


--Hoteles para eliminar: todos, varia dependiendo de las fechas
create function FOUR_STARS.AutorizacionBajaHotel (@codHotel int, @fechaInicio datetime, @fechaFin datetime)
returns int
as
begin
	declare @autorizacion int = 1
	if exists (
	select * from
	FOUR_STARS.Reserva_Por_Habitacion rh
	join FOUR_STARS.Reserva r on (r.num_Reserva = rh.num_Reserva) 
	join FOUR_STARS.Estadia e on (e.num_Reserva = r.num_Reserva)
	where codHotel = @codHotel and  (select FOUR_STARS.RequerimientosParaCancelarHoteles(r.estado, e.fechaIngreso, e.fechaEgreso, r.fecha_inicio, r.fecha_fin, @fechaInicio, @fechaFin)) = 1
			)select @autorizacion = 0
	return @autorizacion
end
go




create function FOUR_STARS.AutorizacionBajaRegimen (@codHotel int, @regimen nvarchar(255))
returns int
as
begin
	declare @autorizacion int = 1
	declare @codigoRegimen int
	declare @hoy datetime = getdate()
	select @codigoRegimen = codigoRegimen from FOUR_STARS.Regimen WHERE descripcion = @regimen

	if exists (select * from FOUR_STARS.Reserva_Por_Habitacion rh left join FOUR_STARS.Reserva r on (r.num_Reserva = rh.num_Reserva) left join FOUR_STARS.Estadia e on (r.num_Reserva = e.num_Reserva) where rh.codHotel= @codHotel and r.estado = 1 and r.codigoRegimen = @codigoRegimen
	and (select FOUR_STARS.RequerimientosParaCancelarHoteles (r.estado, e.fechaIngreso, e.fechaEgreso, r.fecha_inicio, r.fecha_fin, @hoy, @hoy)  ) = 1
	  ) select @autorizacion = 0

	return @autorizacion
end
go


--Funciones Habitaciones
create procedure FOUR_STARS.InsertarHabitacion (@hotel int, @numero int, @piso int, @descripcion nvarchar(255), @ubicacion nvarchar(8), @tipo nvarchar(50))
as
begin
	declare @codTipo int
	select @codTipo = codTipo from FOUR_STARS.TipoHabitacion where descripcion = @tipo
	insert into FOUR_STARS.Habitacion (codHotel, num_Habitacion, piso, descripcion, ubicacion, codTipo)
	VALUES (@hotel, @numero, @piso, @descripcion, @ubicacion, @codTipo)
end
go


create function FOUR_STARS.AutorizacionInsertarHabitacion (@hotel int, @numero int)
returns int
as
begin
	declare @autorizacion int = 1
	if exists (select * from FOUR_STARS.Habitacion WHERE codHotel = @hotel and num_Habitacion = @numero) select @autorizacion = 0
	return @autorizacion
end
go

create procedure FOUR_STARS.ModificarHabitacion (@hotel int, @numero int, @piso int, @descripcion nvarchar(255), @ubicacion nvarchar(8))
as
begin
	update FOUR_STARS.Habitacion
	set num_Habitacion = @numero, piso = @piso, descripcion = @descripcion, ubicacion = @ubicacion
	where codHotel = @hotel and num_Habitacion = @numero
end
go

--Habitaciones para eliminar

create function FOUR_STARS.PuedeReservarHabitacion(@hotel int, @numero int, @fechaInicio datetime, @fechaFin datetime)
returns int
as
begin
	declare @autorizacion int = 1
	
	if exists (select * from FOUR_STARS.Habitacion h
	join FOUR_STARS.Reserva_Por_Habitacion r
	on (r.codHotel = h.codHotel and r.num_Habitacion = h.num_Habitacion)
	join FOUR_STARS.Reserva re
	on(r.num_Reserva = re.num_Reserva)
	join FOUR_STARS.Estadia e
	ON (e.num_Reserva = re.num_Reserva)
	where
	h.num_Habitacion = @numero and
	h.codHotel = @hotel and (select FOUR_STARS.RequerimientosParaCancelarHoteles (re.estado, e.fechaIngreso, e.fechaEgreso, re.fecha_inicio, re.fecha_fin, @fechaInicio, @fechaFin)) = 1
	) select @autorizacion = 0
	return @autorizacion
end
go


create procedure FOUR_STARS.EliminarHabitacion(@hotel int, @numero int)
as
begin
	update FOUR_STARS.Habitacion
	set estado = 0
	where codHotel = @hotel and num_Habitacion = @numero
end
go

--Reservas

create function FOUR_STARS.ProximaReserva()
returns int
begin
	declare @maximo int
	select @maximo = max(num_Reserva) from FOUR_STARS.Reserva
	select @maximo = @maximo + 1
	return @maximo
end
go



create function FOUR_STARS.AutorizacionBajaHabitacion(@hotel int, @numero int)
returns int
as
begin
	declare @hoy datetime = getdate()
	declare @autorizacion int = 1
	select @autorizacion = (select FOUR_STARS.PuedeReservarHabitacion(@hotel, @numero, @hoy, @hoy))
	return @autorizacion
end
go


create procedure FOUR_STARS.Reservar (@reserva int, @cliente int, @regimen nvarchar(255), @fechaIngreso datetime, @fechaEgreso datetime, @usuario varchar(50))
as
begin
	declare @nuevo varchar(50)
	if (@usuario is null) select @nuevo = 'Guest' else select @nuevo = @usuario
	declare @codRegimen int = (select codigoRegimen from FOUR_STARS.Regimen where descripcion = @regimen)
	insert into FOUR_STARS.Reserva (num_Reserva, codCliente, fecha_inicio, fecha_fin, codigoRegimen) values(@reserva, @cliente, @fechaIngreso, @fechaEgreso, @codRegimen)
	insert into FOUR_STARS.Reservas_Con_Modificacion (num_Reserva, username, accion) values (@reserva, @nuevo, 1)
end
go


create procedure FOUR_STARS.ReservarHabitacion (@reserva int, @hotel int, @numHab int)
as
begin
	insert into FOUR_STARS.Reserva_Por_Habitacion(codHotel, num_Habitacion, num_Reserva) values (@hotel, @numHab, @reserva)
end
go

create function FOUR_STARS.AutorizarHotel (@hotel int, @fechaInicio datetime, @fechaFin datetime)
returns int
as
begin
	declare @autorizacion int = 1
	if exists (select * from FOUR_STARS.HotelesInhabilitados WHERE (SELECT FOUR_STARS.CompararFechasParaCancelarHoteles(@fechaInicio, @fechaFin, inicioClausura, finClausura))=1) select @autorizacion = 0
	return @autorizacion
end
go

create procedure FOUR_STARS.Modificar (@reserva int, @user varchar(50))
as
begin
	declare @nuevo varchar(50)
	if (@user is null) select @nuevo = 'Guest' else select @nuevo = @user
	insert into FOUR_STARS.Reservas_Con_Modificacion (num_Reserva, username, accion) values (@reserva, @nuevo, 2)
end
go

create procedure FOUR_STARS.ModificarDatos (@reserva int, @ingreso datetime, @egreso datetime, @regimen varchar(50))
as
begin
	declare @codRegimen int = (select codigoRegimen from FOUR_STARS.Regimen where descripcion = @regimen)
	update FOUR_STARS.Reserva set fecha_inicio= @ingreso, fecha_fin = @egreso, codigoRegimen = @codRegimen where num_Reserva = @reserva
end
go

create function FOUR_STARS.PuedeBorrar (@reserva int, @hotel int)
returns int
as
begin
	declare @autorizacion int = 0
	if(@hotel = 0) select @autorizacion = 1
	else if exists (select * from FOUR_STARS.Reserva_Por_Habitacion  rph
	join FOUR_STARS.Reserva r on (r.num_Reserva = rph.num_Reserva)
	where rph.num_Reserva = @reserva and rph.codHotel = @hotel
	and r.estado < 3  
	) select @autorizacion = 1
	return @autorizacion
end
go

create procedure FOUR_STARS.Cancelar (@reserva int, @user varchar(50), @motivo varchar(255))
as
begin
	declare @nuevo varchar(50)
	declare @tipo int
	if (@user is null)
	begin
	select @nuevo = 'Guest'
	select @tipo = 4
	end
	 else
	 begin
	 select @nuevo = @user
	 select @tipo = 3
	 end
	update FOUR_STARS.Reserva SET estado = @tipo where num_Reserva = @reserva
	insert into ReservasCanceladas (num_Reserva, username, motivo) values (@reserva, @nuevo, @motivo)
end
go

--Estadia
--Existe la reserva en el hotel
create function FOUR_STARS.ExisteReservaEnHotel (@reserva int, @hotel int)
returns int
as
begin
	declare @existe int = 0
	if exists (select * from FOUR_STARS.Reserva_Por_Habitacion rh join FOUR_STARS.Reserva r on (r.num_Reserva = rh.num_Reserva) WHERE r.num_Reserva = @reserva and codHotel = @hotel and estado < 3) select @existe = 1
	else if exists (select * from FOUR_STARS.Reserva_Por_Habitacion rh join FOUR_STARS.Reserva r on (r.num_Reserva = rh.num_Reserva) WHERE r.num_Reserva = @reserva and codHotel = @hotel and estado = 6) select @existe = 2
	return @existe
end
go

--Se puede ingresar. 1 si es correcto, 2 si es muy temprano, 0 si ya es tarde y se cancelarà
create function FOUR_STARS.EstadiaEnFecha (@reserva int)
returns int
as
begin
	declare @estado int
	declare @ingresoReserva datetime
	declare @hoy datetime = getdate()
	select @ingresoReserva = fecha_inicio from FOUR_STARS.Reserva
	if (@ingresoReserva = @hoy) select @estado = 1
	else if (@ingresoReserva > @hoy) select @estado = 2
	else select @estado = 0
	return @estado
end
go

create procedure FOUR_STARS.CancelarPorMoroso (@reserva int, @user varchar(50))
as
begin
	
	update FOUR_STARS.Reserva SET estado = 5 where num_Reserva = @reserva
	insert into ReservasCanceladas (num_Reserva, username, motivo) values (@reserva, @user, 'No se presentó')
end
go

create procedure FOUR_STARS.Ingresar(@reserva int)
as
begin
	declare @hoy datetime = getdate()
	insert into FOUR_STARS.Estadia (num_Reserva, fechaIngreso, fechaEgreso) values (@reserva, @hoy, null)
end 
go

create procedure FOUR_STARS.IngresarHuespedes(@reserva int, @mail varchar(255))
as
begin
	declare @codigo int
	declare @estadia int
	select @codigo = codCliente FROM FOUR_STARS.Cliente WHERE email = @mail
	select @estadia = numeroEstadia FROM FOUR_STARS.Estadia WHERE num_Reserva = @reserva
	insert into FOUR_STARS.Cliente_Por_Estadia (numeroEstadia, codCliente) values (@estadia, @codigo)
end
go

create function FOUR_STARS.ExisteEstadiaEnHotel (@reserva int, @hotel int)
returns int
as
begin
	declare @existe int = 0
	if exists (select * FROM FOUR_STARS.Estadia e join FOUR_STARS.Reserva_Por_Habitacion rh on (rh.num_Reserva = e. num_Reserva) where e.num_Reserva = @reserva and rh.codHotel = @hotel)
	begin
	select @existe = 2
	declare @fecha datetime
	select @fecha = fechaEgreso from FOUR_STARS.Estadia where num_Reserva = @reserva
	if (@fecha is null) select @existe = 1
	end
	return @existe
end
go

create function FOUR_STARS.EgresoEnFecha (@reserva int)
returns int
as
begin
	declare @estado int
	declare @egresoReserva datetime
	declare @hoy datetime = getdate()
	select @egresoReserva = fecha_fin from FOUR_STARS.Reserva
	if (@egresoReserva = @hoy) select @estado = 1
	else if (@egresoReserva > @hoy) select @estado = 2
	else select @estado = 0
	return @estado
end
go

create procedure FOUR_STARS.EgresoEstadia (@reserva int, @fecha datetime)
as
begin
	update FOUR_STARS.Estadia set fechaEgreso = @fecha WHERE num_Reserva = @reserva
end
go


create procedure FOUR_STARS.EstadiaTardia (@reserva int)
as
begin
	declare @egresoEstadiaOriginal datetime
	select @egresoEstadiaOriginal = fecha_fin FROM FOUR_STARS.Reserva where num_Reserva = @reserva
	execute FOUR_STARS.EgresoEstadia @reserva, @egresoEstadiaOriginal
end
go


create procedure FOUR_STARS.EgresoHoy (@reserva int)
as
begin
	declare @hoy datetime = getdate()
	execute FOUR_STARS.EgresoEstadia @reserva, @hoy
end
go




create procedure FOUR_STARS.reservaAdicional(@reserva int, @user varchar(50))
as
begin
	declare @egresoEstadiaOriginal datetime
	declare @hoy datetime = getdate()
	declare @regimen int
	declare @cliente int
	select @egresoEstadiaOriginal = fecha_fin, @regimen = codigoRegimen, @cliente = codCliente FROM FOUR_STARS.Reserva where num_Reserva = @reserva
	declare @nuevaReserva int = (select FOUR_STARS.ProximaReserva())
	insert into FOUR_STARS.Reserva (num_Reserva, fecha_inicio, fecha_fin, estado, codigoRegimen, codCliente) values (@nuevaReserva, @egresoEstadiaOriginal, @hoy, 6, @regimen, @cliente)

	insert into FOUR_STARS.Reserva_Por_Habitacion (num_Habitacion, num_Reserva) SELECT num_Habitacion, @nuevaReserva from FOUR_STARS.Reserva_Por_Habitacion where num_Reserva = @reserva

	insert into FOUR_STARS.Reservas_Con_Modificacion(accion, username) values (1, @user)
	insert into FOUR_STARS.Estadia (num_Reserva, fechaIngreso, fechaEgreso) values (@nuevaReserva, @egresoEstadiaOriginal, @hoy)
	declare @nuevaEstadia int
	select @nuevaEstadia = numeroEstadia from FOUR_STARS.Estadia	WHERE num_Reserva = @nuevaReserva
	declare @viejaEstadia int
	select @viejaEstadia = numeroEstadia from FOUR_STARS.Estadia	WHERE num_Reserva = @reserva
	insert into FOUR_STARS.Cliente_Por_Estadia (codCliente, numeroEstadia) select codCliente, @nuevaEstadia from FOUR_STARS.Cliente_Por_Estadia where numeroEstadia = @viejaEstadia

end
go

--Items

create procedure FOUR_STARS.CargarItems (@nombre varchar(255), @cantidad int, @reserva int, @habitacion int)
as
begin
	declare @hotel int
	declare @codigo int
	declare @monto decimal(18,2)
	declare @estadia int
	select @estadia = numeroEstadia FROM FOUR_STARS.Estadia where num_Reserva = @reserva
	select @hotel = codHotel FROM FOUR_STARS.Reserva_Por_Habitacion where num_Habitacion = @habitacion and num_Reserva = @reserva
	select @codigo = consumibleCodigo, @monto = (costo * @cantidad) FROM FOUR_STARS.Consumible where nombreConsumible = @nombre
	insert into FOUR_STARS.Item (numeroEstadia, num_Habitacion, codHotel, consumibleCodigo, itemCantidad, itemMonto) values (@estadia, @habitacion, @hotel, @codigo, @cantidad, @monto)
end
go

CREATE function FOUR_STARS.BuscarHabitacionesParaItems (@reserva int)
RETURNS TABLE
AS
	RETURN (SELECT distinct h.num_Habitacion FROM FOUR_STARS.Reserva_Por_Habitacion h WHERE h.num_Reserva = @reserva
	EXCEPT
	SELECT distinct h.num_habitacion FROM FOUR_STARS.Reserva_Por_Habitacion h
	join FOUR_STARS.Item i on (i.num_Habitacion = h.num_Habitacion)
	WHERE i.numeroEstadia = (SELECT numeroEstadia FROM FOUR_STARS.Estadia WHERE num_Reserva = @reserva) and num_Reserva = @reserva)

GO

create function FOUR_STARS.ReservaEnHotel (@reserva int, @hotel int)
returns int
as
begin
	declare @resultado int = 0
	if exists(SELECT * FROM FOUR_STARS.Reserva_Por_Habitacion where num_Reserva = @reserva and codHotel = @hotel) select @resultado = 1

	return @resultado
end
go

--Facturas

create function FOUR_STARS.ProximaFactura()
returns int
as
begin
	declare @maximo int
	select @maximo = max(numFactura) from FOUR_STARS.Factura
	select @maximo = @maximo + 1
	return @maximo
end
go

create function FOUR_STARS.AutorizacionFacturar (@reserva int, @hotel int)
returns int
as
begin
	declare @autorizacion int = 0
	if ((SELECT FOUR_STARS.ReservaEnHotel (@reserva, @hotel)) = 1 )
	BEGIN
		if exists (SELECT * FROM FOUR_STARS.Estadia where num_Reserva = @reserva AND fechaEgreso is not null)
		BEGIN
			declare @estadia int
			select @estadia = numeroEstadia FROM FOUR_STARS.Estadia where num_Reserva = @reserva	
			if ( not exists(select * from FOUR_STARS.Factura where numeroEstadia = @estadia)) select @autorizacion = 1
		END
	END
	
	return @autorizacion
end
go

create function FOUR_STARS.ImportePorDia (@reserva int)
returns decimal(18,2)
as
begin
	declare @porDia decimal(18,2)
	declare @estrellas int
	declare @regimen int
	declare @habitacion decimal(18,2)

	select @estrellas = estrellas, @habitacion = sum(th.tipoPorcentual) FROM FOUR_STARS.Reserva_Por_Habitacion rh
	join FOUR_STARS.Hotel h on (rh.codHotel = h.codHotel)
	join FOUR_STARS.Habitacion ha on (rh.num_Habitacion = ha.num_Habitacion and rh.codHotel = ha.codHotel)
	join FOUR_STARS.TipoHabitacion th on (th.codTipo = ha.codTipo)
	where rh.num_Reserva = @reserva
	group by estrellas


	select @regimen = rg.precio FROM FOUR_STARS.Reserva rs
	join FOUR_STARS.Regimen rg on (rs.codigoRegimen = rg.descripcion)

	select @porDia = 10 * @estrellas + @regimen * @habitacion
	return @porDia
end
go

create function FOUR_STARS.Dias(@reserva int)
returns int
as
begin
	declare @dias int
	
	select @dias = DATEDIFF(DAY, fecha_inicio, fecha_fin) from FOUR_STARS.Reserva WHERE num_Reserva = @reserva

	return @dias
end
go





create function FOUR_STARS.Descuento(@reserva int)
returns decimal(18,2)
as
begin
	declare @auto decimal(18, 2) = 0
	if exists (select * FROM FOUR_STARS.Reserva rs
	join FOUR_STARS.Regimen rg
	on (rs.codigoRegimen = rg.codigoRegimen)
	where rs.num_Reserva = @reserva
	and rg.descripcion like 'All inclusive%') select @auto = 1

	return @auto
end
go

create procedure FOUR_STARS.Facturar(@reserva int, @tipoDePago varchar(50))
as
begin
	declare @numero int = (select FOUR_STARS.ProximaFactura())
	declare @tipoRegimen varchar(255)
	declare @costoEstadia decimal(18,2)
	declare @costoConsumibles decimal(18,2) = 0
	declare @estadia int
	select @estadia = numeroEstadia FROM FOUR_STARS.Estadia WHERE num_Reserva = @reserva
	select @costoEstadia = (select FOUR_STARS.ImportePorDia (@reserva)) * (select FOUR_STARS.Dias(@reserva))
	select @costoConsumibles = (select FOUR_STARS.Descuento(@reserva))


	insert into FOUR_STARS.Factura (numFactura, numeroEstadia, totalEstadia, totalConsumibles, importe, tipoPago) values (@numero, @estadia, @costoEstadia, @costoConsumibles, @costoEstadia * @costoConsumibles, @tipoDePago)
end
go

CREATE FUNCTION FOUR_STARS.ListadoEstadistico1(@fechaInicio datetime, @fechaFin datetime)
returns TABLE
as
return (select TOP 5 h.nombre, h.ciudad, h.direccion, count (distinct rh.num_Reserva) Reservas FROM FOUR_STARS.Hotel h
join FOUR_STARS.Reserva_Por_Habitacion rh on (rh.codHotel = h.codHotel)
join FOUR_STARS.ReservasCanceladas c on (c.num_Reserva = rh.num_Reserva)
where c.fecha between @fechaInicio and @fechaFin
group by h.nombre, h.ciudad, h.direccion
order by sum (distinct rh.num_Reserva) desc)
go

CREATE FUNCTION FOUR_STARS.ListadoEstadistico2(@fechaInicio datetime, @fechaFin datetime)
returns TABLE
as
return (SELECT TOP 5 h.nombre, h.ciudad, h.direccion, SUM(i.itemCantidad) Cantidad FROM FOUR_STARS.Hotel h
join FOUR_STARS.Reserva_Por_Habitacion rh on (rh.codHotel = h.codHotel)
join FOUR_STARS.Estadia e on (e.num_Reserva = rh.num_Reserva)
join FOUR_STARS.Factura f on (f.numeroEstadia = e.numeroEstadia)
join FOUR_STARS.Item i on (i.numeroEstadia = e.numeroEstadia)
where f.fechaFacturacion between @fechaInicio and @fechaFin
group by h.nombre, h.ciudad, h.direccion, rh.num_Reserva
order by SUM(i.itemCantidad) desc)
go

create function FOUR_STARS.CalcularDiasDiferencia (@fechaInicio datetime, @fechaFin datetime, @inicioCan datetime, @finCan datetime)
returns int
as
begin
	declare @dias int
	if (@finCan < @fechaInicio or @fechaFin < @inicioCan) select @dias = 0
	else
	BEGIN
	declare @principio datetime
	declare @final datetime
		if(@fechaInicio <= @inicioCan) select @principio = @inicioCan else select @principio = @fechaInicio
		if( @fechaFin <= @finCan) select @final = @fechaFin else select @final = @finCan
		 select @dias = DATEDIFF(DAY, @principio, @final) 
	END
		
	return @dias
end
go


CREATE FUNCTION FOUR_STARS.ListadoEstadistico3(@fechaInicio datetime, @fechaFin datetime)
returns TABLE
as
return (select TOP 5 h.nombre, h.ciudad, h.direccion, SUM(FOUR_STARS.CalcularDiasDiferencia ( @fechaInicio, @fechaFin, hi.inicioClausura, hi.finClausura)) Cantidad FROM FOUR_STARS.Hotel h
join FOUR_STARS.HotelesInhabilitados hi on (hi.codHotel = h.codHotel)
group by h.nombre, h.ciudad, h.direccion
order by SUM(FOUR_STARS.CalcularDiasDiferencia ( @fechaInicio, @fechaFin, hi.inicioClausura, hi.finClausura)) desc)
go

CREATE FUNCTION FOUR_STARS.ListadoEstadistico4(@fechaInicio datetime, @fechaFin datetime)
returns TABLE
as
return (SELECT top 5 ha.num_Habitacion, h.nombre, h.ciudad, h.direccion, SUM(FOUR_STARS.CalcularDiasDiferencia (@fechaInicio, @fechaFin, r.fecha_inicio, r.fecha_fin)) Cantidad from FOUR_STARS.Habitacion ha
join FOUR_STARS.Hotel h on (h.codHotel = ha.codHotel)
join FOUR_STARS.Reserva_Por_Habitacion rh on (rh.codHotel = ha.codHotel and rh.num_Habitacion = ha.num_Habitacion)
join FOUR_STARS.Reserva r on (r.num_Reserva = rh.num_Reserva)
where r.estado = 6
group by ha.num_Habitacion, h.nombre, h.ciudad, h.direccion
order by SUM(FOUR_STARS.CalcularDiasDiferencia (@fechaInicio, @fechaFin, r.fecha_inicio, r.fecha_fin)) desc)
go


CREATE FUNCTION FOUR_STARS.ListadoEstadistico5(@fechaInicio datetime, @fechaFin datetime)
returns TABLE
as
return (select top 5 c.apellido, c.nombre, c.email, SUM(f.totalEstadia /20 + f.totalConsumibles/10) Puntos FROM FOUR_STARS.Cliente c
join FOUR_STARS.Reserva r on (r.codCliente = c.codCliente)
join FOUR_STARS.Estadia e on (e.num_Reserva = r.num_Reserva)
join FOUR_STARS.Factura f on (f.numeroEstadia = e.numeroEstadia)
where f.fechaFacturacion between @fechaInicio and @fechaFin
group by c.apellido, c.nombre, c.email
order by SUM(f.totalEstadia /20 + f.totalConsumibles/10) desc)
go


