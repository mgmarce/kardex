use master
go
drop database DBPROYECTO
GO
CREATE DATABASE DBPROYECTO
GO
USE DBPROYECTO
GO

--(1) TABLA TIENDA/ SALA VENTA
create table SALA_VENTA(
IdSala int primary key identity(1,1),
Nombre varchar(60),
Direccion varchar(100),
Telefono varchar(50),
FechaRegistro datetime default getdate()
)
GO

--(2) TABLA USUARIO
create table USUARIO(
IdUsuario int primary key identity(1,1),
Nombres varchar(60),
Apellidos varchar(60),
Correo varchar(60),
Usuario varchar(60),
Clave varchar(60),
IdSala int,
Tipousuario varchar(15) DEFAULT 'Usuario',
Estado varchar(10) DEFAULT 'Activo',
FechaRegistro datetime default getdate()
)
GO

--(3) TABLA PROVEEDOR
create table PROVEEDOR(
IdProveedor int primary key identity(1,1),
FechaRegistro datetime default getdate(),
empresa varchar(100),
rubro varchar(100) NULL,
razon_social varchar(100),
NIT varchar(20),
telefono varchar(9)NULL,
correo varchar(100)NULL,
direccion varchar(100) NULL
)
GO



----TABLAS CON RELACION A LA KARDEX
--(4) TABLA PRODUCTO
create table PRODUCTO(
IdProducto int primary key identity(1,1),--CAMPO NECESARIO.
proveedor int,
NombreProducto varchar(100),
FechaRegistro datetime default getdate(),
IdCategoriaGrupo int,
IdCategoriaSubGrupo int,
IdCategoriaFamiliar int,
)
go

--(5) TABLA PRODUCTO_TIENDA/INVENTARIO/*****BODEGA
create table BODEGA(
IdSala int,
IdProducto int,		
NombreProducto varchar(100),
PrecioUnidadCompra decimal (10,2),
PrecioUnidadVenta decimal (10,2),
ingresos int,
egresos int,
Stock int ,
Estado varchar(20),
FechaRegistro datetime default getdate()
)
go

--(6) TABLA CATEGORIA GRUPO
create table CATEGORIA_GRUPO(
IdCategoriaGrupo int primary key identity(1,1),--CAMPO NECESARIO
IdCategoriaFamiliar int,
categoria_grupo varchar(100),--CAMPO NECESARIO
FechaRegistro datetime default getdate()
)

--(7) TABLA CATEGORIA SUBGRUPO
create table CATEGORIA_SUBGRUPO(
IdCategoriaSubGrupo int primary key identity(1,1),--CAMPO NECESARIO
IdCategoriaGrupo int,
categoria_sudgrupo varchar(100),--CAMPO NECESARIO,
FechaRegistro datetime default getdate()/*RECORDAR QUE LE CAMBIE EL TIPO DE CAMPO*/
)

--(8) TABLA CATEGORIA FAMILIAR
create table CATEGORIA_FAMILIAR(
IdCategoriaFamiliar int primary key identity(1,1),--CAMPO NECESARIO
categoria_familia varchar(100),--CAMPO NECESARIO
FechaRegistro datetime default getdate()
)

--TABLAS KARDEX INFORMACION
--(10) TABLA DETALLE_VENTA
create table DETALLE_VENTA(
IdDetalleVenta int primary key identity,--CAMPO NECESARIO
fecha smalldatetime default getdate(),
--SI SE HACE UNA DEVOLUCION (ELIMINAR VENTA) ESTE CAMPO SERÁ EL AFECTADO (numeroVenta), ES DECIR, SE EDITARA COMO 'DEVOLUCION VENTA Nº00...' POR LAS KARDEX
numeroVenta as(Right('Venta N°00'+Convert(varchar, IdDetalleVenta),(100))),--CAMPO NECESARIO
IdVenta int,
IdSala int NULL,
IdProducto int,--CAMPO NECESARIO
cantidad_producto int not null,--CAMPO NECESARIO
nombre_producto varchar(60) not null,--CAMPO NECESARIO
precio_unitario decimal(10,2)NOT NULL,--CAMPO NECESARIO
venta_Total decimal(10,2) not null, --CAMPO NECESARIO
nombre_cliente varchar(100),
tipoDocumento varchar(100),
NRC char(22) null,
NIT char(18) null,
direccioncliente varchar(100) null,
giro varchar(100) null
)
go
--(11) TABLA DETALLE_COMPRA
create table DETALLE_COMPRA(
IdDetalleCompra int primary key identity,--CAMPO NECESARIO
IdCompra int,
IdSala int NULL,
IdProveedor int NULL,
FechaRegistro datetime default getdate(),
--SI SE HACE UNA DEVOLUCION (ELIMINAR COMPRA) ESTE CAMPO SERÁ EL AFECTADO (numeroCompra), ES DECIR, SE EDITARA COMO 'DEVOLUCION COMPRA Nº00...' POR LAS KARDEX
numeroCompra as(Right('Compra N°00'+Convert(varchar, IdDetalleCompra),(100))),--CAMPO NECESARIO 
tipoDocumento varchar(100), 
nombre_proveedor varchar (50) null,
--------------------
idproducto int not null,--CAMPO NECESARIO
cantidad_producto int not null,--CAMPO NECESARIO
nombre_producto varchar(60) not null,--CAMPO NECESARIO
precio_unitario decimal(10,2),--CAMPO NECESARIO
Compra_Total decimal(10,2)not null,--CAMPO NECESARIO // EL TOTAL DE TODA LA COMPRA SERÁ ESTE, SIN IMPORTAR EL TIPO QUE SE REGISTRO

)
go
--------------------------------------------------------------------------------------------------------
/*CON ESTA TABLA 'HISTORIAL' TRABAJO LAS KARDEX ASI QUE ES NECESARIA*/
--(13) TABLA HISTORIAL
CREATE TABLE HISTORIAL(
IdHistorial int primary key IDENTITY,
Fecha datetime default getdate(),
IdDetalleVenta int null,
IdDetalleCompra int null,
detalle varchar(35),
Categoria_grupo varchar(50),
Categoria_subgrupo varchar(50),
Categoria_familiar varchar(50),
IdProducto int,
NombreProducto varchar(100),
cantidad int,
valorUnitario decimal(10,2) null,
total decimal(10,2)
);
GO

----TABLAS KARDEX
--(14) TABLA KARDX GRUPOS
create table KARDEX_GRUPOS(
idKardexGrupo int primary key identity,
IdHistorial int,
FechaRegistro datetime default getdate(),
detalle varchar(70) null,
producto varchar(70) null,
categoria_grupo varchar(100) null,
cantidad_entradas int null,
valorUnitario_entradas decimal(10,2) null,
total_entrada decimal(10,2) null,
cantidad_salidas int null,
valorUnitario_salidas decimal(10,2) null,
total_salidas decimal(10,2) null,
cantidad_saldos int null,
valorUnitario_saldos decimal(10,2) null,
total_saldos decimal(10,2)null
)
go

--(15) TABLA KARDEX SUBGRUPOS
create table KARDEX_SUBGRUPOS(
idKardexSub int primary key identity,
IdHistorial int,
FechaRegistro datetime default getdate(),
detalle varchar(70) null,
producto varchar(70) null,
categoria_subgrupos varchar(100) not null,
cantidad_entradas int null,
valorUnitario_entradas decimal(10,2) null,
total_entrada decimal(10,2) null,
cantidad_salidas int null,
valorUnitario_salidas decimal(10,2) null,
total_salidas decimal(10,2) null,
cantidad_saldos int null,
valorUnitario_saldos decimal(10,2) null,
total_saldos decimal(10,2) null
)
go

--(16)TABLA KARDEX FAMILIA
create table KARDEX_FAMILIAR(
idKardexFamiliar int primary key identity,
IdHistorial int,
FechaRegistro datetime default getdate(),
detalle varchar(70) null,
producto varchar(70) null,
categoria_familia varchar(100),
cantidad_entradas int null,
valorUnitario_entradas decimal(10,2) null,
total_entrada decimal(10,2) null,
cantidad_salidas int null,
valorUnitario_salidas decimal(10,2) null,
total_salidas decimal(10,2) null,
cantidad_saldos int null,
valorUnitario_saldos decimal(10,2) null,
total_saldos decimal(10,2)null
)
go

--***********RELACIONES************************

alter table KARDEX_GRUPOS add constraint FK_KARDEX_GRUPO_HISTORIAL foreign key (IdHistorial)
references HISTORIAL(IdHistorial)

alter table KARDEX_SUBGRUPOS add constraint FK_KARDEX_SUDGRUPO_HISTORIAL foreign key (IdHistorial)
references HISTORIAL(IdHistorial)

alter table KARDEX_FAMILIAR add constraint FK_KARDEX_FAMILIAR_HISTORIAL foreign key (IdHistorial)
references HISTORIAL(IdHistorial)

alter table PRODUCTO add constraint FK_Producto_SubGrupo foreign key (IdCategoriaSubGrupo)
references CATEGORIA_SUBGRUPO(IdCategoriaSubGrupo)

alter table PRODUCTO add constraint FK_Producto_Grupo foreign key (IdCategoriaGrupo)
references CATEGORIA_GRUPO(IdCategoriaGrupo)

alter table PRODUCTO add constraint FK_Producto_Familia foreign key (IdCategoriaFamiliar)
references CATEGORIA_FAMILIAR(IdCategoriaFamiliar)
--
alter table CATEGORIA_GRUPO add constraint FK_Categoria_Familia foreign key (IdCategoriaFamiliar)
references CATEGORIA_FAMILIAR(IdCategoriaFamiliar)

alter table CATEGORIA_SUBGRUPO add constraint FK_GRUPO_SUBGRUPO foreign key (IdCategoriaGrupo)
references CATEGORIA_GRUPO(IdCategoriaGrupo)

alter table USUARIO add constraint FK_USUARIO_SALAVENTA foreign key (IdSala)
references SALA_VENTA(IdSala)

alter table DETALLE_COMPRA add constraint FK_DETALLE_COMPRA_SALAVENTA foreign key (IdSala)
references SALA_VENTA(IdSala)

alter table DETALLE_VENTA add constraint FK_DETALLE_COMPRA_VENTA foreign key (IdSala)
references SALA_VENTA(IdSala)

alter table BODEGA add constraint FK_COMPRA_BODEGA foreign key (IdSala)
references SALA_VENTA(IdSala)



alter table DETALLE_COMPRA add constraint FK_DETALLE_COMPRA_PRODUCTO foreign key (IdProducto)
references PRODUCTO(IdProducto)

alter table DETALLE_VENTA add constraint FK_DETALLE_VENTA_PRODUCTO foreign key (IdProducto)
references PRODUCTO(IdProducto)

alter table BODEGA add constraint FK_BODEGA_PRODUCTO foreign key (IdProducto)
references PRODUCTO(IdProducto)

alter table HISTORIAL add constraint FK_HISTORIAL_VENTA foreign key (IdDetalleVenta)
references DETALLE_VENTA(IdDetalleVenta)

alter table HISTORIAL add constraint FK_HISTORIAL_COMPRA foreign key (IdDetalleCompra)
references DETALLE_COMPRA(IdDetalleCompra)

--Nueva relacion para producto y proveedor
alter table PRODUCTO add constraint FK_Producto_Proveedor foreign key (proveedor)
references PROVEEDOR(IdProveedor)


--Procedimientos--
--Login--
go
create procedure PaLogin
@usuario varchar(50),
@pass varchar (50)
AS
BEGIN
	Select Nombres,Apellidos,Tipousuario from USUARIO where usuario = @usuario and Clave = @pass
END

go
create procedure ListarProductos
as
begin 
select IdProducto as 'Codigo', proveedor as 'Codigo Proveedor',NombreProducto as 'Nombre',IdCategoriaFamiliar as 'Codigo Familia',
IdCategoriaGrupo as 'Codigo Grupo', IdCategoriaSubGrupo as 'Codigo Subgrupo',FechaRegistro as 'Fecha de registro' from PRODUCTO
end

go
create procedure InsertarProductos
@proveedor int,
@nombre varchar(100),
@familia int,
@grupo int,
@subgrupo int
as
begin
Insert into PRODUCTO(proveedor,NombreProducto,IdCategoriaFamiliar,IdCategoriaGrupo,IdCategoriaSubGrupo) 
values(@proveedor,@nombre,@familia,@grupo,@subgrupo)
end

go
create procedure EliminarProductos
@cod nvarchar(50)
as
begin
delete PRODUCTO where IdProducto=@cod;
end

select * from PRODUCTO

go
create procedure EditarProductos
@cod int,
@proveedor int,
@nombre varchar(100),
@familia int,
@grupo int,
@subgrupo int
as
begin
update PRODUCTO set proveedor=  @proveedor,NombreProducto = @nombre, IdCategoriaFamiliar = @familia,IdCategoriaGrupo = @grupo,IdCategoriaSubGrupo= @subgrupo 
where IdProducto = @cod;
end




go
create procedure ListarBodegas
as
begin 
select IdSala as 'Codigo Sala',IdProducto as 'Codigo Producto', NombreProducto as 'Nombre Producto', PrecioUnidadCompra  as 'Precio Compra',
PrecioUnidadVenta as 'Precio Venta', ingresos as 'Ingresos',egresos as 'Egresos',stock as 'Stock', Estado as 'Estado', FechaRegistro as 'Fecha de Registro' from BODEGA
end

go 
create procedure CodProductos
@cod int
as
begin
select IdProducto,NombreProducto from PRODUCTO where IdProducto = @cod;
end

go
create procedure InsertarProducBodega
@IdSala int,
@IdProducto int,		
@NombreProducto varchar(100),
@PrecioUnidadCompra decimal (10,2),
@PrecioUnidadVenta decimal (10,2),
@ingresos int,
@egresos int,
@Stock int 
as
begin
insert into BODEGA (IdSala,IdProducto,NombreProducto,PrecioUnidadCompra,PrecioUnidadVenta,
ingresos,egresos,Stock) values(@IdSala,@IdProducto,@NombreProducto,@PrecioUnidadCompra,@PrecioUnidadVenta,
@ingresos,@egresos,@Stock);
end



go
create trigger Stock_ingreso
on DETALLE_COMPRA for insert
as
begin
	declare @cantidad_producto int
	declare @egreso int
	declare @ingreso int
	declare @IdProducto int
	declare @IdSala int
	declare @ttlingreso int
	declare @stock int
	select @cantidad_producto = cantidad_producto, @IdProducto=idproducto, @IdSala=IdSala FROM inserted
	set @egreso = (select egresos from bodega where IdProducto=@IdProducto and IdSala=@IdSala)
	set @ingreso = (select ingresos from BODEGA where IdProducto=@IdProducto and IdSala=@IdSala)
	set @ttlingreso = @ingreso + @cantidad_producto
	set @stock=@ttlingreso-@egreso
	update BODEGA set ingresos = @ttlingreso, stock=@stock where IdProducto = @IdProducto  and IdSala=@IdSala
	IF (@stock >0) 
	BEGIN
     update BODEGA set estado =' En Existencia' where IdProducto = @IdProducto and IdSala=@IdSala
    END;
end
go

create trigger Stock_egreso
on DETALLE_VENTA for insert
as
begin
	declare @cantidad_producto int
	declare @egreso int
	declare @ingreso int
	declare @IdProducto int
	declare @IdSala int
	declare @ttlegreso int
	declare @stock int
	select @cantidad_producto = cantidad_producto, @IdProducto=idproducto, @IdSala=IdSala FROM inserted
	set @ingreso = (select ingresos from bodega where IdProducto=@IdProducto and IdSala=@IdSala)
	set @egreso = (select egresos from BODEGA where IdProducto=@IdProducto and IdSala=@IdSala)
	set @ttlegreso = @egreso + @cantidad_producto
	set @stock=@ingreso-@ttlegreso
	update BODEGA set egresos = @ttlegreso, stock=@stock where IdProducto = @IdProducto and IdSala=@IdSala
	IF (@stock <=0) 
	BEGIN
     update BODEGA set estado ='Agotado' where IdProducto = @IdProducto and IdSala=@IdSala
    END;
end
go


truncate table Bodega
select * from BODEGA

go
create procedure ListarProveedores
as
begin 
select IdProveedor as 'Codigo Proveedor',empresa as 'Nombre', rubro as 'Rubro', razon_social  as 'Razon Social',
NIT as 'NIT', telefono as 'Telefono',correo as 'Correo',direccion as 'Direccion',FechaRegistro as 'Fecha de Registro' from PROVEEDOR
end

go
create procedure InsertarProveedor
@empresa varchar(30),
@rubro varchar(30),		
@razon varchar(50),
@nit varchar(20),
@telefono varchar(15),
@correo varchar(100),
@direccion varchar(100)
as
begin
insert into PROVEEDOR(empresa,rubro,razon_social,NIT,telefono,correo,direccion) values(@empresa,@rubro,@razon,@nit,@telefono,@correo,@direccion);
end

select * from PROVEEDOR

go
create procedure EditarProveedor
@cod int,
@empresa varchar(30),
@rubro varchar(30),		
@razon varchar(50),
@nit varchar(20),
@telefono varchar(15),
@correo varchar(100),
@direccion varchar(100)
as
begin
update PROVEEDOR set empresa = @empresa,rubro = @rubro,razon_social = @razon,NIT = @nit,telefono = @telefono,correo = @correo,direccion = @direccion 
where IdProveedor = @cod
end

go
create procedure EliminarProveedores
@cod nvarchar(50)
as
begin
delete PROVEEDOR where IdProveedor=@cod;
end


---PROCEDIMIENTO PARA LISTAR LA CATEGORIA FAMILIA
go
CREATE PROCEDURE listar_CategoriaFamiliar
as
begin 
select IdCategoriaFamiliar as 'ID', categoria_familia as 'Nombre de la categoria',FechaRegistro as 'Fecha de registro' from CATEGORIA_FAMILIAR
end
go

--Procedimiento para almacenar una categoria familia
CREATE PROCEDURE agregar_categoriaFamiliar
@categoria_familia varchar(100)
as
begin
insert into CATEGORIA_FAMILIAR(categoria_familia)
values (@categoria_familia)
end
go

--PROCEDIMIENTO PARA EDITAR ALGUNA CATEGORIA FAMILIA
create procedure Editar_categoriaFamiliar
@IdCategoriaFamiliar int,
@categoria_familiar varchar(100)
as 
begin
update CATEGORIA_FAMILIAR
	set categoria_familia=@categoria_familiar
	where IdCategoriaFamiliar=@IdCategoriaFamiliar
end
go

-----------------------**********************************************************************
create proc Listar_KardexFamilia
@categoria varchar(100)
as
begin
Select idKardexFamiliar as 'ID', FechaRegistro AS 'Fecha', detalle as 'Detalle', producto AS 'Producto',
categoria_familia as 'Nombre de categoria', cantidad_entradas as 'Cantidad Entradas', valorUnitario_entradas as 'V/u Entradas', total_entrada as 'Total Entradas',
cantidad_salidas as 'cantidad Salidas', valorUnitario_salidas as 'V/u Salidas' , total_salidas as 'Total Salidas', cantidad_saldos as 'Cantidad Saldos',
valorUnitario_saldos as 'Costo Promedio', total_saldos as 'Total Saldos'
from KARDEX_FAMILIAR WHERE categoria_familia = @categoria
end
go

create proc Listar_KardexGrupo
@categoria varchar(100)
as
begin
Select idKardexGrupo as 'ID', FechaRegistro AS 'Fecha Registro', detalle as 'Detalle', producto AS 'Producto',
categoria_grupo as 'Nombre de categoria', cantidad_entradas as 'Cantidad Entradas', valorUnitario_entradas as 'V/U entradas', total_entrada as 'Total Entradas',
cantidad_salidas as 'cantidad Salidas', valorUnitario_salidas as 'V/u Salidas', total_salidas as 'Total Salidas', cantidad_saldos as 'Cantidad Saldos',
valorUnitario_saldos as 'Costo Promedio', total_saldos as 'Total Saldos'
from KARDEX_GRUPOS WHERE categoria_grupo = @categoria
end
go


create proc Listar_KardexSubGrupo
@categoria varchar(100)
as
begin
Select idKardexSub as 'ID', FechaRegistro AS 'Fecha Registro', detalle as 'Detalle', producto AS 'Producto',
categoria_subgrupos as 'Nombre de categoria', cantidad_entradas as 'Cantidad Entradas', valorUnitario_entradas as 'V/U entradas', total_entrada as 'Total Entradas',
cantidad_salidas as 'cantidad Salidas', valorUnitario_salidas as 'V/u Salidas', total_salidas as 'Total Salidas', cantidad_saldos as 'Cantidad Saldos',
valorUnitario_saldos as 'Costo Promedio', total_saldos as 'Total Saldos'
from KARDEX_SUBGRUPOS WHERE categoria_subgrupos = @categoria
end
go

CREATE PROCEDURE seleccionar_categorias
@categoria varchar(10)
as
if @categoria = 'familiar'
begin
	select IdCategoriaFamiliar as 'ID', categoria_familia as 'Nombre categoria' from CATEGORIA_FAMILIAR
end
if @categoria = 'grupo'
begin 
	select IdCategoriaGrupo as 'ID', CATEGORIA_GRUPO as 'Nombre Categoria' from CATEGORIA_GRUPO
end
if @categoria = 'subgrupo'
begin
	select IdCategoriaSubGrupo as 'ID', categoria_sudgrupo as 'Nombre Categoria' from CATEGORIA_SUBGRUPO
end
go
---*******************************TRIGGER DE COMPRA INSERTADA****************************
create trigger Compra_Insertada
on DETALLE_COMPRA for insert
as
set nocount on
declare @IdDetalleCompra int
declare @detalle varchar(25)
declare @IdFamilia int
declare @categoria_familia varchar(100)--NO ESTA EN COMPRA ESTA EN CATEGORIA FAMILIAR
declare @IdGrupo int
declare @categoria_grupo varchar(100)--NO ESTA EN COMPRA ESTA EN CATEGORIA GRUPO
declare @IdSubGrupo int
declare @categoria_subgrupo varchar(100) --no esta en compra ESTA EN CATEGORIA SUBGRUPO
declare @IdProducto int
declare @nombre_producto varchar(100)--ESTA EN COMPRA
declare @cantidad int
declare @valor decimal(10,2)
declare @total decimal(10,2)

SELECT @IdDetalleCompra = IdDetalleCompra, @detalle = numeroCompra, @IdProducto = idproducto, @nombre_producto = nombre_producto,
@cantidad = cantidad_producto, @valor = precio_unitario, @total = Compra_total from inserted
set @IdFamilia = (select idCategoriaFamiliar from PRODUCTO WHERE IdProducto = @IdProducto and NombreProducto = @nombre_producto)
set @categoria_familia = (select categoria_familia from CATEGORIA_FAMILIAR WHERE IdCategoriaFamiliar = @IdFamilia)
set @IdGrupo = (select IdCategoriaGrupo from PRODUCTO WHERE IdProducto = @IdProducto and NombreProducto = @nombre_producto)
set @categoria_grupo = (select categoria_grupo from CATEGORIA_GRUPO WHERE IdCategoriaGrupo = @IdGrupo)
set @IdSubGrupo = (select IdCategoriaSubGrupo from PRODUCTO WHERE IdProducto = @IdProducto and NombreProducto = @nombre_producto)
set @categoria_subgrupo = (select categoria_sudgrupo from CATEGORIA_SUBGRUPO WHERE IdCategoriaSubGrupo = @IdSubGrupo)
INSERT INTO HISTORIAL(IdDetalleCompra, detalle, Categoria_grupo, Categoria_familiar, Categoria_subgrupo, IdProducto, NombreProducto, cantidad, valorUnitario, total)
values(@IdDetalleCompra, @detalle, @categoria_grupo, @categoria_familia, @categoria_subgrupo, @IdProducto, @nombre_producto, @cantidad, @valor, @total)
go
---------******************************TRIGGER DE VENTA INSERTADA******************************************
create trigger Venta_Insertada
on DETALLE_VENTA for insert
as
set nocount on
declare @IdDetalleVenta int
declare @detalle varchar(25)
declare @IdFamilia int
declare @categoria_familia varchar(100)--NO ESTA EN COMPRA ESTA EN CATEGORIA FAMILIAR
declare @IdGrupo int
declare @categoria_grupo varchar(100)--NO ESTA EN COMPRA ESTA EN CATEGORIA GRUPO
declare @IdSubGrupo int
declare @categoria_subgrupo varchar(100) --no esta en compra ESTA EN CATEGORIA SUBGRUPO
declare @IdProducto int
declare @nombre_producto varchar(100)--ESTA EN COMPRA
declare @cantidad int
declare @valor decimal(10,2)
declare @total decimal(10,2)

SELECT @IdDetalleVenta = IdDetalleVenta, @detalle = numeroVenta, @IdProducto = idproducto, @nombre_producto = nombre_producto,
@cantidad = cantidad_producto, @valor = precio_unitario, @total = venta_Total from inserted
set @IdFamilia = (select idCategoriaFamiliar from PRODUCTO WHERE IdProducto = @IdProducto and NombreProducto = @nombre_producto)
set @categoria_familia = (select categoria_familia from CATEGORIA_FAMILIAR WHERE IdCategoriaFamiliar = @IdFamilia)
set @IdGrupo = (select IdCategoriaGrupo from PRODUCTO WHERE IdProducto = @IdProducto and NombreProducto = @nombre_producto)
set @categoria_grupo = (select categoria_grupo from CATEGORIA_GRUPO WHERE IdCategoriaGrupo = @IdGrupo)
set @IdSubGrupo = (select IdCategoriaSubGrupo from PRODUCTO WHERE IdProducto = @IdProducto and NombreProducto = @nombre_producto)
set @categoria_subgrupo = (select categoria_sudgrupo from CATEGORIA_SUBGRUPO WHERE IdCategoriaSubGrupo = @IdSubGrupo)
INSERT INTO HISTORIAL(IdDetalleVenta, detalle, Categoria_grupo, Categoria_familiar, Categoria_subgrupo, IdProducto, NombreProducto, cantidad, valorUnitario, total)
values(@IdDetalleVenta, @detalle, @categoria_grupo, @categoria_familia, @categoria_subgrupo, @IdProducto, @nombre_producto, @cantidad, @valor, @total)
go
------*******************************trigger kardex familia*********************************
CREATE TRIGGER Insertar_kardexFamilia
on HISTORIAL for insert
as
set nocount on
	declare @IdHistorial int
	declare @detalle varchar(25)
	declare @producto varchar(100)
	declare @categoria_familiar varchar(50)
	declare @cantidad int
	declare @valorUnitario decimal(10,2)
	declare @ttlHistorial decimal(10,2)---HASTA ACÁ
	declare @ultregistro int
	declare @ultimoCant_saldo int
	declare @cantidad_saldo int
	declare @ultimottl_saldo decimal(10,2)
	declare @totalEntrada decimal(10,2)
	declare @nuevoCant_saldo int
	declare @nuevottl_saldo decimal(10,2)
	declare @nuevovu_saldo decimal(10,2)
SELECT @IdHistorial = IdHistorial, @detalle = detalle, @producto = NombreProducto,@categoria_familiar = Categoria_familiar, @cantidad = cantidad,
@valorUnitario = valorUnitario, @ttlHistorial = total from inserted
set @ultregistro = (SELECT MAX(idKardexFamiliar) from kardex_familiar where categoria_familia=@categoria_familiar)
set @ultimoCant_saldo = (SELECT cantidad_saldos from kardex_familiar where idKardexFamiliar=@ultRegistro)
set @ultimottl_saldo = (SELECT total_saldos from kardex_familiar where idKardexFamiliar=@ultRegistro)
if @detalle like '%Compra%'
		begin
		
		IF @ultregistro > 0
	begin
		set @nuevoCant_saldo = @ultimoCant_saldo+@cantidad
		set @nuevottl_saldo=@ultimottl_saldo+@ttlHistorial
		set @nuevovu_saldo = @nuevottl_saldo/@nuevoCant_saldo
		
		insert into kardex_familiar (IdHistorial,detalle, producto, categoria_familia,cantidad_entradas, valorUnitario_entradas,total_entrada,
		cantidad_saldos, valorUnitario_saldos,total_saldos)
		values (@IdHistorial,@detalle, @producto, @categoria_familiar,@cantidad ,@valorUnitario, @ttlHistorial, 
		@nuevoCant_saldo, @nuevovu_saldo,@nuevottl_saldo)
	end
		else
	begin
		insert into kardex_familiar (IdHistorial,detalle, producto, categoria_familia,cantidad_entradas, valorUnitario_entradas,total_entrada,
		cantidad_saldos, valorUnitario_saldos,total_saldos)
		values (@IdHistorial,@detalle, @producto, @categoria_familiar,@cantidad ,@valorUnitario, @ttlHistorial, 
		@cantidad ,@valorUnitario, @ttlHistorial)
	end
end
if @detalle like '%Venta%'
		begin
		set @nuevoCant_saldo = @ultimoCant_saldo-@cantidad
		IF @nuevoCant_saldo = 0
			begin
				set @nuevottl_saldo=0
				set @nuevovu_saldo =0
		
				insert into kardex_familiar (IdHistorial,detalle, producto, categoria_familia,cantidad_salidas, valorUnitario_salidas,total_salidas,
				cantidad_saldos, valorUnitario_saldos,total_saldos)
				values (@IdHistorial,@detalle, @producto, @categoria_familiar,@cantidad ,@valorUnitario, @ttlHistorial, 
				@nuevoCant_saldo, @nuevovu_saldo,@nuevottl_saldo)
			end
			else
			begin
				set @nuevottl_saldo=@ultimottl_saldo-@ttlHistorial
				set @nuevovu_saldo = @nuevottl_saldo/@nuevoCant_saldo
		
				insert into kardex_familiar (IdHistorial,detalle, producto, categoria_familia,cantidad_salidas, valorUnitario_salidas,total_salidas,
				cantidad_saldos, valorUnitario_saldos,total_saldos)
				values (@IdHistorial,@detalle, @producto, @categoria_familiar,@cantidad ,@valorUnitario, @ttlHistorial, 
				@nuevoCant_saldo, @nuevovu_saldo,@nuevottl_saldo)
			end
	end		
go
------*******************************TRIGGER kardex GRUPO*********************************
CREATE TRIGGER Insertar_kardexGrupos
on HISTORIAL for insert
as
set nocount on
	declare @IdHistorial int
	declare @detalle varchar(25)
	declare @producto varchar(100)
	declare @categoria_grupos varchar(50)
	declare @cantidad int
	declare @valorUnitario decimal(10,2)
	declare @ttlHistorial decimal(10,2)---HASTA ACÁ
	declare @ultregistro int
	declare @ultimoCant_saldo int
	declare @cantidad_saldo int
	declare @ultimottl_saldo decimal(10,2)
	declare @totalEntrada decimal(10,2)
	declare @nuevoCant_saldo int
	declare @nuevottl_saldo decimal(10,2)   
	declare @nuevovu_saldo decimal(10,2)
SELECT @IdHistorial = IdHistorial, @detalle = detalle, @producto = NombreProducto,@categoria_grupos = CATEGORIA_GRUPO, @cantidad = cantidad,
@valorUnitario = valorUnitario, @ttlHistorial = total from inserted
set @ultregistro = (SELECT MAX(idKardexGrupo) from KARDEX_GRUPOS where categoria_grupo=@categoria_grupos)
set @ultimoCant_saldo = (SELECT cantidad_saldos from KARDEX_GRUPOS where idKardexGrupo=@ultRegistro)
set @ultimottl_saldo = (SELECT total_saldos from KARDEX_GRUPOS where idKardexGrupo=@ultRegistro)
if @detalle like '%Compra%'
		begin
		
		IF @ultregistro > 0
	begin
		set @nuevoCant_saldo = @ultimoCant_saldo+@cantidad
		set @nuevottl_saldo=@ultimottl_saldo+@ttlHistorial
		set @nuevovu_saldo = @nuevottl_saldo/@nuevoCant_saldo
		
		insert into kardex_grupos (IdHistorial,detalle, producto, categoria_grupo,cantidad_entradas, valorUnitario_entradas,total_entrada,
		cantidad_saldos, valorUnitario_saldos,total_saldos)
		values (@IdHistorial,@detalle, @producto, @categoria_grupos,@cantidad ,@valorUnitario, @ttlHistorial, 
		@nuevoCant_saldo, @nuevovu_saldo,@nuevottl_saldo)
	end
	else
	begin
		insert into kardex_grupos (IdHistorial,detalle, producto, categoria_grupo,cantidad_entradas, valorUnitario_entradas,total_entrada,
		cantidad_saldos, valorUnitario_saldos,total_saldos)
		values (@IdHistorial,@detalle, @producto, @categoria_grupos,@cantidad ,@valorUnitario, @ttlHistorial, 
		@cantidad ,@valorUnitario, @ttlHistorial)
	end
	end
if @detalle like '%Venta%'
		begin
		set @nuevoCant_saldo = @ultimoCant_saldo-@cantidad
		IF @nuevoCant_saldo = 0
			begin
				set @nuevottl_saldo=0
				set @nuevovu_saldo =0
		
				insert into KARDEX_GRUPOS (IdHistorial,detalle, producto, categoria_grupo,cantidad_salidas, valorUnitario_salidas,total_salidas,
				cantidad_saldos, valorUnitario_saldos,total_saldos)
				values (@IdHistorial,@detalle, @producto, @categoria_grupos,@cantidad ,@valorUnitario, @ttlHistorial, 
				@nuevoCant_saldo, @nuevovu_saldo,@nuevottl_saldo)
			end
			else
			begin
				set @nuevottl_saldo=@ultimottl_saldo-@ttlHistorial
				set @nuevovu_saldo = @nuevottl_saldo/@nuevoCant_saldo
		
				insert into KARDEX_GRUPOS(IdHistorial,detalle, producto, categoria_grupo,cantidad_salidas, valorUnitario_salidas,total_salidas,
				cantidad_saldos, valorUnitario_saldos,total_saldos)
				values (@IdHistorial,@detalle, @producto, @categoria_grupos,@cantidad ,@valorUnitario, @ttlHistorial, 
				@nuevoCant_saldo, @nuevovu_saldo,@nuevottl_saldo)
			end
	end		
go
------*******************************TRIGGER kardex SUBGRUPO*********************************
CREATE TRIGGER Insertar_kardexSubGrupo
on HISTORIAL for insert
as
set nocount on
	declare @IdHistorial int
	declare @detalle varchar(25)
	declare @producto varchar(100)
	declare @categoria_Subgrupos varchar(50)
	declare @cantidad int
	declare @valorUnitario decimal(10,2)
	declare @ttlHistorial decimal(10,2)---HASTA ACÁ
	declare @ultregistro int
	declare @ultimoCant_saldo int
	declare @cantidad_saldo int
	declare @ultimottl_saldo decimal(10,2)
	declare @totalEntrada decimal(10,2)
	declare @nuevoCant_saldo int
	declare @nuevottl_saldo decimal(10,2)   
	declare @nuevovu_saldo decimal(10,2)
SELECT @IdHistorial = IdHistorial, @detalle = detalle, @producto = NombreProducto,@categoria_Subgrupos = Categoria_subgrupo, @cantidad = cantidad,
@valorUnitario = valorUnitario, @ttlHistorial = total from inserted
set @ultregistro = (SELECT MAX(idKardexSub) from KARDEX_SUBGRUPOS where categoria_subgrupos=@categoria_Subgrupos)
set @ultimoCant_saldo = (SELECT cantidad_saldos from KARDEX_SUBGRUPOS where idKardexSub=@ultRegistro)
set @ultimottl_saldo = (SELECT total_saldos from KARDEX_SUBGRUPOS where idKardexSub=@ultRegistro)
if @detalle like '%Compra%'
		begin
		
		IF @ultregistro > 0
	begin
		set @nuevoCant_saldo = @ultimoCant_saldo+@cantidad
		set @nuevottl_saldo=@ultimottl_saldo+@ttlHistorial
		set @nuevovu_saldo = @nuevottl_saldo/@nuevoCant_saldo
		
		insert into KARDEX_SUBGRUPOS (IdHistorial,detalle, producto, categoria_subgrupos,cantidad_entradas, valorUnitario_entradas,total_entrada,
		cantidad_saldos, valorUnitario_saldos,total_saldos)
		values (@IdHistorial,@detalle, @producto, @categoria_Subgrupos,@cantidad ,@valorUnitario, @ttlHistorial, 
		@nuevoCant_saldo, @nuevovu_saldo,@nuevottl_saldo)
	end
	else
	begin
		insert into KARDEX_SUBGRUPOS (IdHistorial,detalle, producto, categoria_subgrupos,cantidad_entradas, valorUnitario_entradas,total_entrada,
		cantidad_saldos, valorUnitario_saldos,total_saldos)
		values (@IdHistorial,@detalle, @producto, @categoria_Subgrupos,@cantidad ,@valorUnitario, @ttlHistorial, 
		@cantidad ,@valorUnitario, @ttlHistorial)
	end
	end
if @detalle like '%Venta%'
		begin
		set @nuevoCant_saldo = @ultimoCant_saldo-@cantidad
		IF @nuevoCant_saldo = 0
			begin
				set @nuevottl_saldo=0
				set @nuevovu_saldo =0
		
				insert into KARDEX_SUBGRUPOS (IdHistorial,detalle, producto, categoria_subgrupos,cantidad_salidas, valorUnitario_salidas,total_salidas,
				cantidad_saldos, valorUnitario_saldos,total_saldos)
				values (@IdHistorial,@detalle, @producto, @categoria_Subgrupos,@cantidad ,@valorUnitario, @ttlHistorial, 
				@nuevoCant_saldo, @nuevovu_saldo,@nuevottl_saldo)
			end
			else
			begin
				set @nuevottl_saldo=@ultimottl_saldo-@ttlHistorial
				set @nuevovu_saldo = @nuevottl_saldo/@nuevoCant_saldo
		
				insert into KARDEX_SUBGRUPOS(IdHistorial,detalle, producto, categoria_subgrupos,cantidad_salidas, valorUnitario_salidas,total_salidas,
				cantidad_saldos, valorUnitario_saldos,total_saldos)
				values (@IdHistorial,@detalle, @producto, @categoria_Subgrupos,@cantidad ,@valorUnitario, @ttlHistorial, 
				@nuevoCant_saldo, @nuevovu_saldo,@nuevottl_saldo)
			end
	end		
go



go
create procedure ListarUsuarios
as
begin 
select IdUsuario as 'ID', Nombres as 'NOMBRES', Apellidos as 'APELLIDOS', Correo as 'CORREO', Usuario as 'USUARIO', Clave as 'Clave', IdSala as 'NUMERO DE SALA', Tipousuario as 'TIPO DE USUARIO', Estado as 'ESTADO DE USUARIO', FechaRegistro as 'FECHA' from USUARIO
end



go
create procedure InsertarUsuarios
@Nombres varchar(60),
@Apellidos varchar(60),
@Correo varchar(60),
@Usuario varchar(60),
@Clave varchar(60),
@IdSala int,
@Tipousuario varchar(15), 
@Estado varchar(10)
as
begin
Insert into USUARIO(Nombres, Apellidos, Correo, Usuario, Clave, IdSala, Tipousuario, Estado) 
values(@Nombres, @Apellidos, @Correo, @Usuario, @Clave, @IdSala, @Tipousuario, @Estado)
end


go
create procedure EliminarUsuarios
@IdUsuario int
as
begin
delete USUARIO where IdUsuario = @IdUsuario;
end

go
create procedure ActualizarUsuarios
@IdUsuario int,
@Nombres varchar(60),
@Apellidos varchar(60),
@Correo varchar(60),
@Usuario varchar(60),
@Clave varchar(60),
@IdSala int,
@Tipousuario varchar(15), 
@Estado varchar(10)
as
begin
update USUARIO set Nombres = @Nombres, Apellidos = @Apellidos, Correo = @Correo, Usuario = @Usuario, Clave = @Clave, IdSala = @IdSala, Tipousuario = @Tipousuario, Estado = @Estado
where IdUsuario = @IdUsuario
end
GO


Create procedure BuscarProducto
@cod varchar(50)
as
begin
select * from BODEGA where IdProducto=@cod
end
GO


go
 ---PROCEDIMIENTO PARA LISTAR LA CATEGORIA FAMILIA
CREATE PROCEDURE listar_CategoriaGrupo
as
begin 
select IdCategoriaGrupo as 'ID', IdCategoriaFamiliar as 'ID Familiar', categoria_grupo as 'Nombre de la categoria',FechaRegistro as 'Fecha de registro' from CATEGORIA_GRUPO
end

--Procedimiento para almacenar una categoria familia
go
CREATE PROCEDURE agregar_categoriaGrupo
@categoria_grupo varchar(100),
@IdCategoriaFamilia int
as
begin
insert into CATEGORIA_GRUPO(IdCategoriaFamiliar, categoria_grupo )
values (@IdCategoriaFamilia,@categoria_grupo)
end
go
 --PROCEDIMIENTO PARA EDITAR ALGUNA CATEGORIA FAMILIA
create procedure Editar_categoriaGrupo
@IdCategoriaFamiliar int,
@IdCategoriaGrupo int,
@categoria_grupo varchar(100)
as 
begin
update CATEGORIA_Grupo
	set categoria_grupo=@categoria_grupo, IdCategoriaFamiliar=@IdCategoriaFamiliar
	where IdCategoriaGrupo=@IdCategoriaGrupo
end
go

--PROCEDIMIENTO PARA ELIMINAR CATEGORIA FAMILIA
create procedure Eliminar_categoriaGrupo
@IdCategoriaGrupo int
as
begin
delete from CATEGORIA_GRUPO where IdCategoriaGrupo = @IdCategoriaGrupo
end
go
---PROCEDIMIENTO PARA LISTAR LA CATEGORIA FAMILIA
CREATE PROCEDURE listar_CategoriaSubGrupo
as
begin 
select IdCategoriaSubGrupo as 'ID', IdCategoriaGrupo as 'ID Grupo', categoria_sudgrupo as 'Nombre de la categoria',FechaRegistro as 'Fecha de registro' from CATEGORIA_SUBGRUPO
end

--Procedimiento para almacenar una categoria Sub Grupo
go
CREATE PROCEDURE agregar_categoriaSubGrupo
@categoria_subgrupo varchar(100),
@IdCategoriaGrupo int
as
begin
insert into CATEGORIA_SUBGRUPO(IdCategoriaGrupo, categoria_sudgrupo )
values (@IdCategoriaGrupo,@categoria_subgrupo)
end
go
 --PROCEDIMIENTO PARA EDITAR ALGUNA CATEGORIA SUB GRUPO
create procedure Editar_categoriaSubGrupo
@IdCategoriaGrupo int,
@IdCategoriaSubGrupo int,
@categoria_subgrupo varchar(100)
as 
begin
update CATEGORIA_SUBGRUPO
	set categoria_sudgrupo=@categoria_subgrupo, IdCategoriaGrupo=@IdCategoriaGrupo
	where IdCategoriaSubGrupo=@IdCategoriaSubGrupo
end
go

--PROCEDIMIENTO PARA ELIMINAR CATEGORIA SUB GRUPO
create procedure Eliminar_categoriaSubGrupo
@IdCategoriaSubGrupo int
as
begin
delete from CATEGORIA_SUBGRUPO where IdCategoriaSubGrupo = @IdCategoriaSubGrupo
end
go
---PROCEDIMIENTO PARA LISTAR LAS Salas de Ventas
CREATE PROCEDURE listar_SalaVentas
as
begin 
select IdSala as 'ID', Nombre as 'Nombre de la Sala', Direccion as 'Direccion',Telefono as 'Telefono',FechaRegistro as 'Fecha de registro' from SALA_VENTA
end
go
--Procedimiento para almacenar una Sala de Ventas
CREATE PROCEDURE agregar_SalaVentas
@Nombre varchar(60),
@Direccion varchar(100),
@Telefono varchar (50)
as
begin
insert into SALA_VENTA(Nombre,Direccion,Telefono)
values (@Nombre,@Direccion,@Telefono)
end
go
 --PROCEDIMIENTO PARA EDITAR ALGUNA SALA DE VENTAS
create procedure Editar_SalaVentas
@IdSala int,
@Nombre varchar(60),
@Direccion varchar(100),
@Telefono varchar (50)
as 
begin
update SALA_VENTA
	set Nombre=@Nombre, Direccion=@Direccion, Telefono=@Telefono
	where IdSala=@IdSala
end
go

--PROCEDIMIENTO PARA ELIMINAR SALA DE VENTAS
create procedure Eliminar_SalaVentas
@IdSala int
as
begin
delete from SALA_VENTA where IdSala = @IdSala
end
go


----------------------********************************************************NUEVOS PROCEDIMIENTOS VENTA
create procedure SeleccionarDetalleVenta
@IdVenta int
as
begin
SELECT IdVenta as 'ID comprobante', cantidad_producto as 'Cantidad', nombre_producto as 'Nombre producto',
precio_unitario as 'Precio Unitario', venta_Total as 'Total'  from DETALLE_VENTA where IdVenta = @IdVenta
end
go
create procedure ListarCompras
as
begin
select fechaRegistro as 'Fecha', IdSala as 'Id Sala', IdCompra as 'Id comprobante', tipoDocumento as 'Tipo Documento', IdProveedor as 'Id Proveedor', 
nombre_proveedor as 'Proveedor', idproducto as 'Id producto', cantidad_producto as 'Cantidad', nombre_producto as 'Nom. Producto', precio_unitario as 'V/u',
compra_total as 'Compta Total'
from DETALLE_COMPRA
end
go
create procedure ListarVentasDetalle
AS
Select fecha as 'Fecha', IdVenta as 'ID', IdSala as 'Id Sala', IdProducto as 'Id producto', cantidad_producto as 'Cantidad', 
nombre_producto as 'Nombre Producto', venta_total as 'Total', tipoDocumento AS 'Documento emitido' from DETALLE_VENTA
go


--Validaciones--
go

CREATE PROCEDURE ValidacionProveedor_Producto
@cod varchar(10)
AS
BEGIN
select * from PRODUCTO where proveedor = @cod
END

go
CREATE PROCEDURE ValidacionFamilia_Producto
@cod varchar(10)
AS
BEGIN
select * from PRODUCTO where IdCategoriaFamiliar = @cod
END

go
CREATE PROCEDURE ValidacionFamilia_Grupo
@cod varchar(10)
AS
BEGIN
select * from CATEGORIA_GRUPO where IdCategoriaFamiliar = @cod
END

go
CREATE PROCEDURE ValidacionCatGrupo_Producto
@cod varchar(10)
AS
BEGIN
select * from PRODUCTO where IdCategoriaGrupo = @cod
END

go
CREATE PROCEDURE ValidacionCatGrupo_CatSubgrupo
@cod varchar(10)
AS
BEGIN
select * from CATEGORIA_SUBGRUPO where IdCategoriaGrupo = @cod
END

go
CREATE PROCEDURE ValidacionCatSubGrupo_Producto
@cod varchar(10)
AS
BEGIN
select * from PRODUCTO where IdCategoriaSubGrupo = @cod
END

--Nuevos procedimientos entrega final--
go
create procedure EliminarFamilias
@IdCategoriaFamiliar int
as
begin
delete CATEGORIA_FAMILIAR where IdCategoriaFamiliar = @IdCategoriaFamiliar;
end

go

----Eliminar Grupo
go
create procedure EliminarGrupo
@IdCategoriaGrupo int
as
begin
delete CATEGORIA_GRUPO where IdCategoriaGrupo = @IdCategoriaGrupo;
end

go

-----Eliminar SubGrupo
go
create procedure EliminarSubGrupo
@IdCategoriaSubGrupo int
as
begin
delete CATEGORIA_SUBGRUPO where IdCategoriaSubGrupo = @IdCategoriaSubGrupo;
end

go

--Insercion de datos--

--Sala de ventas--
INSERT INTO SALA_VENTA (Nombre,Direccion,Telefono) VALUES('Sala 1','San Salvador','26359874')
INSERT INTO SALA_VENTA (Nombre,Direccion,Telefono) VALUES('Sala 2','Santa Ana','2357851')
INSERT INTO SALA_VENTA (Nombre,Direccion,Telefono) VALUES('Sala 3','San Miguel','225748932')

--Usuarios--
INSERT INTO USUARIO (Nombres,Apellidos,Correo,Usuario,Clave,IdSala,Tipousuario,Estado) VALUES ('admin','admin','admin@gmail.com','admin','12345',3,'Administrador','Activo')
INSERT INTO USUARIO (Nombres,Apellidos,Correo,Usuario,Clave,IdSala,Tipousuario,Estado) VALUES ('juan','Perez','juan@gmail.com','juan123','juancontra',3,'Usuario','Activo')
INSERT INTO USUARIO (Nombres,Apellidos,Correo,Usuario,Clave,IdSala,Tipousuario,Estado) VALUES ('Marcela','Menjivar','marce@gmail.com','marcela20','12345',1,'Administrador','Activo')
INSERT INTO USUARIO (Nombres,Apellidos,Correo,Usuario,Clave,IdSala,Tipousuario,Estado) VALUES ('Adriana','Martinez','adriana@gmail.com','adrianamartinez','12345',2,'Usuario','Activo')

--proveedores--
insert into PROVEEDOR(empresa,rubro,razon_social,NIT,telefono,correo,direccion) values('Nike','Manofactura','Nike S.A','145782','22586472','nikesv@hotmail.com','San Salvador');
insert into PROVEEDOR(empresa,rubro,razon_social,NIT,telefono,correo,direccion) values('Sello de Oro','Alimentos','Sello de Oro S.A','57913','22582358','selloro@hotmail.com','Cojutepeque');
insert into PROVEEDOR(empresa,rubro,razon_social,NIT,telefono,correo,direccion) values('ADOC','Calzado','Empresas ADOC S.A','147895','22583024','Empresasadoc@hotmail.com','San Salvador');

--Familias de productos--
insert into CATEGORIA_FAMILIAR(categoria_familia) values ('Ropa')
insert into CATEGORIA_FAMILIAR(categoria_familia) values ('Alimentos')
insert into CATEGORIA_FAMILIAR(categoria_familia) values ('Calzado')

--Grupos de Productos--
insert into CATEGORIA_GRUPO(IdCategoriaFamiliar, categoria_grupo ) values (1,'Ropa Hombre')
insert into CATEGORIA_GRUPO(IdCategoriaFamiliar, categoria_grupo ) values (2,'Carnes')
insert into CATEGORIA_GRUPO(IdCategoriaFamiliar, categoria_grupo ) values (3,'Zapatos Mujer')

--Subgrupos de productos--
insert into CATEGORIA_SUBGRUPO(IdCategoriaGrupo, categoria_sudgrupo ) values (1,'Camisas')
insert into CATEGORIA_SUBGRUPO(IdCategoriaGrupo, categoria_sudgrupo ) values (2,'Pollo')
insert into CATEGORIA_SUBGRUPO(IdCategoriaGrupo, categoria_sudgrupo ) values (3,'Tacones')

--Productos--
Insert into PRODUCTO(proveedor,NombreProducto,IdCategoriaFamiliar,IdCategoriaGrupo,IdCategoriaSubGrupo) values (1,'Camisa deportiva',1,1,1)
Insert into PRODUCTO(proveedor,NombreProducto,IdCategoriaFamiliar,IdCategoriaGrupo,IdCategoriaSubGrupo) values (2,'Pollo Empanizado',2,2,2)
Insert into PRODUCTO(proveedor,NombreProducto,IdCategoriaFamiliar,IdCategoriaGrupo,IdCategoriaSubGrupo) values (3,'Tacones altos',3,3,3)

--bodegas--
insert into BODEGA (IdSala,IdProducto,NombreProducto,PrecioUnidadCompra,PrecioUnidadVenta,ingresos,egresos,Stock) values(3,2,'Pollo Empanizado',1.50,4.50,0,0,0);
insert into BODEGA (IdSala,IdProducto,NombreProducto,PrecioUnidadCompra,PrecioUnidadVenta,ingresos,egresos,Stock) values(1,3,'Tacones altos',15.50,29.99,0,0,0);
insert into BODEGA (IdSala,IdProducto,NombreProducto,PrecioUnidadCompra,PrecioUnidadVenta,ingresos,egresos,Stock) values(2,1,'Camisa deportiva',3.25,5.99,0,0,0);

--compras--
insert into DETALLE_COMPRA (IdCompra, IdSala, tipoDocumento, idproducto, cantidad_producto, nombre_producto, precio_unitario, Compra_Total)
values (23312, 2,'Ticket', 1, 30, 'Camisa deportiva', 5, 180)
insert into DETALLE_COMPRA (IdCompra, IdSala, tipoDocumento, idproducto, cantidad_producto, nombre_producto, precio_unitario, Compra_Total)
values (33433, 3,'Ticket', 2, 48, 'Pollo Empanizado', 1.6, 76.8)
insert into DETALLE_COMPRA (IdCompra, IdSala, tipoDocumento, idproducto, cantidad_producto, nombre_producto, precio_unitario, Compra_Total)
values (33433, 1,'Ticket', 3, 24, 'Tacones altos', 20, 480)

--ventas--
insert into DETALLE_VENTA(IdVenta, IdSala, IdProducto, cantidad_producto, nombre_producto, precio_unitario, venta_Total, tipoDocumento)
values(23234, 1, 3, 3, 'Tacones altos', 15.5, 46.5, 'Ticket')
insert into DETALLE_VENTA(IdVenta, IdSala, IdProducto, cantidad_producto, nombre_producto, precio_unitario, venta_Total, tipoDocumento)
values(11232, 3, 2, 5, 'Pollo Empanizado', 1.5, 7.5, 'Ticket')

--compras de nuevo--
insert into DETALLE_COMPRA (IdCompra, IdSala, idProveedor,tipoDocumento, nombre_proveedor, idproducto, cantidad_producto, nombre_producto, precio_unitario, Compra_Total)
values (4343, 2,1,'Factura', 'Nike', 1, 24,'Camisa deportiva',3.25, 78)

--venta de nuevo--
insert into DETALLE_VENTA(IdVenta, IdSala, IdProducto, cantidad_producto, nombre_producto, precio_unitario, venta_Total, tipoDocumento)
values(00231, 2, 1, 5, 'Camisa deportiva', 3.25, 16.25, 'Ticket')

