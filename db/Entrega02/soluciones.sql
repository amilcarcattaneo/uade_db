-- ------ --
--   C1 (Arreglarlo)   --
-- ------ --

SELECT
	*
FROM (
	(
		SELECT
			TOP 1 pa.numeroVuelo, pa.idAeropuertoSalida AS Salida
		FROM
			PlanActivo AS pa
			INNER JOIN PlanVuelo AS pv ON pv.numeroVuelo = pa.numeroVuelo
		ORDER BY
			pa.numeroPlan DESC)
	UNION (
		SELECT
			TOP 1 pa.numeroVuelo, pa.idAeropuertoLlegada AS Llegada
		FROM
			PlanActivo AS pa
			INNER JOIN PlanVuelo AS pv ON pv.numeroVuelo = pa.numeroVuelo
		ORDER BY
			pa.numeroPlan ASC)
	) AS alldata;

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
