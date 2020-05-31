-- --------- --
--  INSERTS  --
-- --------- --

INSERT INTO TurnoPaciente (idTurno, idPaciente, idMedico)
		VALUES(3, 50, 2);

INSERT INTO HistoriaPaciente (idHistoria, idPaciente, idMedico) VALUES (1, 50, 2);
INSERT INTO Historia (idHistoria, fechaHistoria, observacion, fechaAlta) VALUES (1, GETDATE(), 50, 2);


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
        RETURN
    END
END