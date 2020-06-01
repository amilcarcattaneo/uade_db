-- --------- --
--  INSERTS  --
-- --------- --

--INSERT INTO TurnoPaciente (idTurno, idPaciente, idMedico) VALUES (3, 50, 2);
--INSERT INTO Historia (idHistoria, fechaHistoria, observacion, fechaAlta) VALUES (1, GETDATE(), 50, 2);
--INSERT INTO HistoriaPaciente (idHistoria, idPaciente, idMedico) VALUES (1, 50, 2);



-- --------------------------------- --
-- Obtener los turnos de un paciente --
-- --------------------------------- --

CREATE PROCEDURE obtenerTurnosPaciente
@idPaciente INT
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM Paciente WHERE idPaciente = @idPaciente)
    BEGIN
        PRINT 'El paciente no existe.'
        RETURN
    END
    ELSE
    BEGIN
        -- Sólo trae turnos activos, no los que están con estado 1 => eliminados
        SELECT * FROM turno AS t INNER JOIN TurnoPaciente AS tp ON tp.idTurno = t.idTurno WHERE tp.idPaciente = @idPaciente AND t.estado != 1
        RETURN
    END
END
GO

-- --------------------- --
-- Por Nombre y Apellido --
-- --------------------- --
CREATE PROCEDURE ConsultaTurnos
@Nombre		varchar(50),
@Apellido	varchar(50)
as
BEGIN
	IF EXISTS (SELECT * FROM PACIENTE WHERE nombre=@NOMBRE AND apellido=@APELLIDO)
	BEGIN
		DECLARE @TURNO VARCHAR (50)
		IF EXISTS(SELECT t.fechaTurno from TURNO T
					JOIN TURNOPACIENTE TP ON T.idTurno=TP.idTurno
					JOIN PACIENTE P ON TP.IDPACIENTE = P.IDPACIENTE
					join TurnoEstado te on t.estado=te.idestado
					WHERE P.nombre=@NOMBRE AND P.apellido=@APELLIDO)
			SET @TURNO=(SELECT convert(varchar,t.fechaTurno,3) +' estado del turno: '+ te.descripcion from TURNO T
					JOIN TURNOPACIENTE TP ON T.idTurno=TP.idTurno
					JOIN PACIENTE P ON TP.IDPACIENTE = P.IDPACIENTE
					join TurnoEstado te on t.estado=te.idestado
					WHERE P.nombre=@NOMBRE AND P.apellido=@APELLIDO)
		BEGIN
			IF 
			@TURNO IS NOT NULL 
			BEGIN  
			PRINT @TURNO
			return
			END
			ELSE 
			BEGIN
			PRINT 'NO HAY TURNOS'
			END
		END
	END
	ELSE
	BEGIN
		PRINT 'NO EXISTE PACIENTE'
		RETURN
	END
END
GO

-- --------------------------------------- --
-- Obtener historia clínica de un paciente --
-- --------------------------------------- --

CREATE PROCEDURE obtenerHistoriaClinica
@idPaciente INT
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM Paciente WHERE idPaciente = @idPaciente)
    BEGIN
        PRINT 'El paciente no existe.'
        RETURN
    END
    ELSE
    BEGIN
        SELECT * FROM Historia AS h INNER JOIN HistoriaPaciente AS hp ON hp.idHistoria = h.idHistoria WHERE hp.idPaciente = @idPaciente
        RETURN
    END
END
GO

-- ---------------------- --
-- Actualizar un turno --
-- ---------------------- --

CREATE PROCEDURE actualizarTurno
			@idTurno	    INT,
			@fechaTurno		DATETIME,
			@estado			INT,
            @observacion    VARCHAR(50)
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM turno WHERE idTurno = @idTurno)
    BEGIN
        PRINT 'El turno no existe.'
        RETURN
    END
	ELSE
	BEGIN
		UPDATE Turno SET fechaTurno = @fechaTurno, estado = @estado, observacion = @observacion WHERE idTurno = @idTurno
		PRINT 'El Turno se actualizó correctamente.'
		RETURN
	END
END
GO

-- ---------------------- --
-- Actualizar un paciente --
-- ---------------------- --

CREATE PROCEDURE actualizarPaciente
			@idPaciente		INT,
			@nombre			VARCHAR(50),
			@apellido		VARCHAR(50),
			@fnacimiento	DATE,
			@domicilio		VARCHAR(50),
			@idpais			CHAR(3),
			@tel			VARCHAR(20),
			@email			VARCHAR(30),
			@observacion	VARCHAR(1000)
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM Paciente WHERE idPaciente = @idPaciente)
    BEGIN
        PRINT 'El paciente no existe.'
        RETURN
    END
	ELSE
	BEGIN
		UPDATE Paciente SET nombre = @nombre, apellido = @apellido, fNacimiento = @fnacimiento, domicilio = @domicilio, idPais = @idpais, telefono = @tel, email = @email, observacion = @observacion WHERE idPaciente = @idPaciente
		PRINT 'El paciente se actualizó correctamente.'
		RETURN
	END
END
GO

-- ----------------- --
-- Eliminar un turno --
-- ----------------- --

CREATE PROCEDURE eliminarTurno
@idTurno INT
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM turno WHERE idTurno = @idTurno)
    BEGIN
        PRINT 'El turno no existe.'
        RETURN
    END
    ELSE
    BEGIN
        -- borrado lógico asumiendo que el estado 1 es 'eliminado'
        UPDATE turno SET estado = 1 WHERE idTurno = @idTurno
        PRINT 'El turno se eliminó correctamente.'
        RETURN
    END
END
GO