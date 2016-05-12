CREATE TRIGGER MENSAJE_PASAJERO
ON PASAJERO
FOR INSERT, UPDATE
AS
PRINT 'MENSAJE DISPARADO DE LA INSERCION O ACTUALIZACION DE LA TABLA PASAJERO'
GO

INSERT INTO PASAJERO VALUES ( 'PAULA VALTIERRA','0010','3333333333', 'pau_val@hotmail.com')
GO

--------------------------------------------------

CREATE TABLE CUENTAPAGOXPASAJERO (IDPASAJERO CHAR(5) NOT NULL, TOTAL INT)
GO


IF OBJECT_ID('TX_CUENTAPAGOXPASAJERO') IS NOT NULL
BEGIN
       DROP TRIGGER TX_CUENTAPAGOXPASAJERO
       PRINT 'TRIGER ELIMINADO CORRECTAMENTE'
END
ELSE
       PRINT 'TRIGGER NO EXISTE'
GO

CREATE TRIGGER TX_CUENTAPAGOXPASAJERO
ON PAGOS
AFTER INSERT
AS
       DECLARE @TOTAL INT, @PAS VARCHAR(40)
       SELECT @TOTAL = COUNT(*)
             FROM INSERTED
             INNER JOIN PAGOS ON PAGOS.IDPASAJERO=inserted.IDPASAJERO

       SELECT @PAS=INSERTED.IDPASAJERO FROM INSERTED

       IF EXISTS (SELECT * FROM CUENTAPAGOXPASAJERO WHERE IDPASAJERO=@PAS)
             UPDATE CUENTAPAGOXPASAJERO
                    SET TOTAL=@TOTAL
                    WHERE IDPASAJERO=@PAS
       ELSE
             INSERT INTO CUENTAPAGOXPASAJERO VALUES(@PAS,@TOTAL)
GO


INSERT INTO PAGOS VALUES(4,2,'P0002','08/10/2011',200)
GO
INSERT INTO PAGOS VALUES(5,2,'P0002','10/10/2011',300)
GO
INSERT INTO PAGOS VALUES(6,6,'P0009','18/12/2011',1000)
GO
INSERT INTO PAGOS VALUES(7,6,'P0009','19/12/2011',700)
GO
INSERT INTO PAGOS VALUES(8,6,'P0009','20/12/2011',200)
GO


------------------------------------------------------------

IF OBJECT_ID('VALIDAPAIS') IS NOT NULL
BEGIN
       DROP TRIGGER VALIDAPAIS
       PRINT 'TRIGGER ELIMINADO CORRECTAMENTE'
END
ELSE
       PRINT 'TRIGGER NO EXISTE'
GO 

CREATE TRIGGER VALIDAPAIS
ON PAIS
FOR INSERT
AS
       IF (SELECT COUNT(*) FROM INSERTED
             INNER JOIN PAIS ON PAIS.PAIS=INSERTED.PAIS
             WHERE INSERTED.PAIS=PAIS.PAIS)>1
       BEGIN
             DECLARE @PAI VARCHAR(30),@IDPA CHAR(5)
             SELECT @PAI=PAIS FROM INSERTED
            
             ROLLBACK
            
             SELECT @IDPA=IDPAIS FROM PAIS
                    WHERE PAIS.PAIS=@PAI
            
             PRINT 'NOMBRE DE PAIS YA REGISTRADO EN LA TABLA'
             PRINT ''
             PRINT 'EL PAIS '+@PAI+' SE ENCUENTRA REGISTRADO CON EL CODIGO: '+@IDPA
            
       END
       ELSE
             PRINT 'PAIS REGISTRADO CORRECTAMENTE'

GO

INSERT INTO PAIS VALUES ('0016','CHILE');

------------------------------------------------------------------


IF OBJECT_ID('ELIMINAPASAJERO') IS NOT NULL
BEGIN
       DROP TRIGGER ELIMINAPASAJERO
END
GO


CREATE TRIGGER ELIMINAPASAJERO
ON PASAJERO
INSTEAD OF DELETE
AS
       IF EXISTS(SELECT * FROM PAGOS  WHERE PAGOS.IDPASAJERO=(SELECT DELETED.IDPASAJERO FROM DELETED))
       BEGIN
             ROLLBACK TRANSACTION
             PRINT 'EL PASAJERO TIENE PAGOS REGISTRADOS, NO PUEDE ELIMINARSE'
       END
       ELSE
             PRINT 'PASAJERO ELIMINADO CORRECTAMENTE'
GO

DELETE PASAJERO WHERE IDPASAJERO = 'P0002'
SELECT * FROM PASAJERO

SELECT * FROM PAGOS  WHERE PAGOS.IDPASAJERO = 'P0002'


------------------------------------------------------


IF OBJECT_ID('VALIDAPAGO') IS NOT NULL
BEGIN
       DROP TRIGGER VALIDAPAGO
END
GO



CREATE TRIGGER VALIDAPAGO
ON PAGOS
FOR INSERT
AS
       IF (SELECT MONTO FROM INSERTED)<=0
       BEGIN
             ROLLBACK TRANSACTION
             PRINT 'NO SE PUEDE REGISTRAR MONTO CERO'
       END
       ELSE
             PRINT 'PAGO REGISTRADO CORRECTAMENTE'
GO



INSERT INTO PAGOS VALUES(8,6,'P0009','20/12/2011',0)
GO

INSERT INTO PAGOS VALUES(8,6,'P0009','20/12/2011',200)
GO

---------------------------------

--1
IF OBJECT_ID('PASAJEROSBAK') IS NOT NULL
BEGIN
       DROP TABLE PASAJEROSBAK
END
GO


--2
CREATE TABLE PASAJEROSBAK(
       IDPASAJERO    CHAR(5)                    NOT NULL PRIMARY KEY,
       NOMBRES             VARCHAR(50)         NOT NULL,
       IDPAIS        CHAR(4)                    NOT NULL,
       TELEFONO      CHAR(15)            NOT NULL,
       EMAIL         VARCHAR(50)         NOT NULL     
)
GO


--3
IF OBJECT_ID('EVE_ALUMNO_LOG') IS NOT NULL
BEGIN
       DROP TRIGGER EVE_ALUMNO_LOG
END
GO


--4
CREATE TRIGGER EVE_ALUMNO_LOG
ON Alumnos
AFTER INSERT, UPDATE
AS
BEGIN

	PRINT 'MENSAJE DISPARADO DE LA INSERCION O ACTUALIZACION DE LA TABLA PASAJERO'

	DECLARE @IDALUMNO INT, @NOMBRE VARCHAR(50), @APELLIDO VARCHAR(50),@DIRECCION VARCHAR(1000), @CONDICION VARCHAR(50), @FECHA_NACIMIENTO date


    SELECT @IDALUMNO=INSERTED.Id, @NOMBRE=INSERTED.Nombre, @APELLIDO=INSERTED.Apellido,@DIRECCION =INSERTED.Direccion,  @FECHA_NACIMIENTO = INSERTED.Fecha_nacimiento  FROM INSERTED

	begin
        --Si hay valores en la tabla deleted y además todos(excepto 
        --editable y id) son diferentes a los nuevos valores insertados,
        --significa que ha habido un update
        if exists(select * from deleted d join inserted i on  d.id=i.id 
		where d.nombre != i.nombre or d.apellido != i.apellido or d.Direccion != i.Direccion or d.Fecha_nacimiento != i.Fecha_nacimiento)
        begin
            set @CONDICION ='Accion Actualizacion'
            
			INSERT INTO [dbo].[ALUMNO_LOG]([IDALUMNO],[NOMBRE],[APELLIDO],[DIRECCION],[FECHA_NACIMIENTO],[CONDICION],[FECHAEVENTO])
            VALUES(@IDALUMNO,@NOMBRE,@APELLIDO,@DIRECCION, @FECHA_NACIMIENTO,@CONDICION,GETDATE())
        end
        --Si no ha habido un update hay valores sólo en la tabla inserted
        --y eso significa que ha habido un insert.No se debe olvidar
        --que un update es un delete y un insert.
        else if exists(select id from inserted) and not exists(select id from deleted)
        begin
            set @CONDICION ='Accion Creado'
            INSERT INTO [dbo].[ALUMNO_LOG]([IDALUMNO],[NOMBRE],[APELLIDO],[DIRECCION],[FECHA_NACIMIENTO],[CONDICION],[FECHAEVENTO])
            VALUES(@IDALUMNO,@NOMBRE,@APELLIDO,@DIRECCION, @FECHA_NACIMIENTO,@CONDICION,GETDATE())
        end
    end
END

GO


create trigger trg_Example
on Empleado
after insert,update
as
begin
    declare
    @idEmp int,
    @nombre varchar(20),
    @apellido varchar(20),
    @edad int,
    @editable varchar(2),
    @accion varchar (20)

    select @idEmp=id,@nombre=nombre,@apellido=apellido,@edad=edad,
            @editable=editable
            from inserted
    begin
        --Si hay valores en la tabla deleted y además todos(excepto 
        --editable y id) son diferentes a los nuevos valores insertados,
        --significa que ha habido un update
        if exists(select * from deleted d join inserted i on 
                    d.id=i.id where d.nombre != i.nombre or 
                    d.apellido != i.apellido or d.edad != i.edad)
        begin
            set @accion ='record updated'
            insert into Empleado_Log values(@idEmp,@nombre,@apellido,
                                            @edad,@editable,@accion)
        end
        --Si no ha habido un update hay valores sólo en la tabla inserted
        --y eso significa que ha habido un insert.No se debe olvidar
        --que un update es un delete y un insert.
        else if exists(select id from inserted) 
                            and not exists(select id from deleted)
        begin
            set @accion ='record inserted'
            insert into Empleado_Log values(@idEmp,@nombre,@apellido,
                                                @edad,@editable,@accion)
        end
    end
end



INSERT INTO PASAJERO
       VALUES('P0016','EMMANUEL URIAS','0010','98888888','LEUR0985@GMAIL.COM')

