-- ----------- --
--   Parte A   --
--  Aeropuerto --
-- ----------- --

-- ------ --
--   C1   --
-- ------ --

SELECT
	salida.numeroVuelo,
	salida.idAeropuertoSalida,
	(
		SELECT
			MIN(pv.numeroVuelo)
		FROM
			PlanVuelo AS pv
		WHERE
			salida.numeroVuelo = pv.numeroVuelo)
	FROM
		PlanVuelo AS salida;


SELECT
	llegada.numeroVuelo,
	llegada.idAeropuertoLlegada,
	(
		SELECT
			MAX(pv.numeroVuelo)
		FROM
			PlanVuelo AS pv
		WHERE
			llegada.numeroVuelo = pv.numeroVuelo)
	FROM
		PlanVuelo AS llegada;

-- ------ --
--   C2   --
-- ------ --

SELECT
	v.numeroVuelo,
	v.diasSemana
FROM
	Vuelo AS v
	INNER JOIN PlanVuelo AS pv ON v.numeroVuelo = pv.numeroVuelo
WHERE
	pv.idAeropuertoSalida = 'AR-AIE'
	AND pv.idAeropuertoLlegada = 'VZ-AIM';


-- ------ --
--   C3   --
-- ------ --

SELECT
	pv.numeroVuelo,
	pv.idAeropuertoSalida,
	pv.horaSalidaProgramada,
	pv.idAeropuertoLlegada,
	pv.horaLlegadaProgramada,
	V.diasSemana
FROM
	PLANVUELO PV
	JOIN AEROPUERTO AE1 ON PV.idAeropuertoSalida = AE1.idAeropuerto
	JOIN AEROPUERTO AE2 ON PV.idAeropuertoLlegada = AE2.idAeropuerto
	JOIN VUELO V ON PV.numeroVuelo = V.numeroVuelo
WHERE
	AE1.CIUDAD = 'Buenos Aires'
	AND AE2.ciudad = 'Caracas'
	SELECT
		salida.numeroVuelo, salida.idAeropuertoSalida, (
			SELECT
				MIN(pv.numeroVuelo)
			FROM
				PlanVuelo AS pv
			WHERE
				salida.numeroVuelo = pv.numeroVuelo)
		FROM
			PlanVuelo AS salida;

-- ------ --
--   C4   --
-- ------ --

SELECT
	pb.idTarifa
FROM
	PrecioBoleto AS pb
WHERE
	pb.numeroVuelo = 'AA065';

-- ------ --
--   C5   --
-- ------ --

SELECT
	pa.numeroLugaresLibres
FROM
	PlanActivo AS pa
WHERE
	pa.numeroVuelo = 'AA065'
	AND pa.fecha = '2019-12-24';

-- --------------- --
--   Ejercicio 3   --
-- --------------- --

SELECT
	pv.numeroPlan,
	v.aerolinea,
	CASE WHEN pa.numeroPlan IS NULL THEN
		'No Realizado'
	ELSE
		'Realizado'
	END AS 'Realizado'
FROM
	planactivo pa
	RIGHT JOIN planvuelo pv ON pa.numeroPlan = pv.numeroPlan
	RIGHT JOIN vuelo v ON pv.numeroVuelo = v.numeroVuelo
GROUP BY
	pv.numeroPlan,
	v.aerolinea,
	CASE WHEN pa.numeroPlan IS NULL THEN
		'No Realizado'
	ELSE
		'Realizado'
	END;


-- ----------- --
--   Parte B   --
--    Vistas   --
-- ----------- --

CREATE VIEW VUELOS_BSAS AS
SELECT
	ae2.ciudad AS DESTINO,
	pv.numeroVuelo AS 'NRO VUELO',
	v.aerolinea AS AEROLINEA,
	pv.horaSalidaProgramada AS 'HORARIO SALIDA',
	v.diasSemana AS 'DIAS PROGRAMADOS',
	pb.cantidad AS PRECIO
FROM
	Aeropuerto AE
	JOIN planvuelo PV ON AE.idAeropuerto = pv.idAeropuertoSalida
	JOIN aeropuerto AE2 ON PV.idAeropuertoLlegada = AE2.idAeropuerto
	JOIN vuelo v ON pv.numeroVuelo = v.numeroVuelo
	JOIN precioboleto pb ON v.numeroVuelo = pb.numeroVuelo
WHERE
	ae.ciudad = 'Buenos Aires';