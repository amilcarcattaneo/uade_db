-- ----------- --
-- Ejercicio 2 --
-- ----------- --

INSERT INTO Cliente
		VALUES('1234', 'Gabriela Barrios', 'Santa Fe', 'CABA');
INSERT INTO Cliente
		VALUES('5678', 'Sebastian Garcia', '19', 'LA PLATA');
INSERT INTO Cliente
		VALUES('1357', 'Paula Benitez', 'Cordoba', 'CABA');
INSERT INTO Cliente
		VALUES('2468', 'Maria Moreno', 'Recoleta', 'CABA');
INSERT INTO Cliente
		VALUES('7531', 'Conrado Araujo', '13', 'LA PLATA');
INSERT INTO Cliente
		VALUES('8642', 'Florencia Marin', 'Belgrano', 'MAR DEL');
INSERT INTO Cliente
		VALUES('4321', 'Micaela Lopez', 'Brasil', 'CABA');
INSERT INTO Cliente
		VALUES('9876', 'Diego Iribarren', 'Corrientes', 'CABA');
INSERT INTO Sucursal
		VALUES('100', 'Rocca', 'LA PLATA', 1342578);
INSERT INTO Sucursal
		VALUES('110', 'Cordoba', 'MAR DEL', 17896372);
INSERT INTO Sucursal
		VALUES('120', 'Corriente', 'CABA', 7653920);
INSERT INTO Cuenta
		VALUES('C-001', 'Rocca', 125000);
INSERT INTO Cuenta
		VALUES('C-002', 'Cordoba', 100000);
INSERT INTO Cuenta
		VALUES('C-003', 'Corriente', 200000);
INSERT INTO Impositor
		VALUES('5678', 'C-001');
INSERT INTO Impositor
		VALUES('8642', 'C-002');
INSERT INTO Impositor
		VALUES('9876', 'C-003');


-- ----------- --
-- Ejercicio 3 --
-- ----------- --

-- Cuentas que tienen saldos mayores a 99000 y menores a 180000
SELECT
	*
FROM
	Cuenta
WHERE
	saldo BETWEEN 99000 AND 180000;

-- El nombre y dni de los clientes que tienen cuenta en el banco
SELECT
	c.nombreCliente, c.dniCliente
FROM
	Cliente AS c
	INNER JOIN Impositor AS i ON c.dniCliente = i.dniCliente;

-- El nombre de la sucursal de ‘CABA’ que tiene el mayor valor de activos
SELECT
	TOP 1 MAX(activos) AS MaxActivos,
	nombreSucursal
FROM
	Sucursal
WHERE
	ciudadSucursal = 'CABA'
GROUP BY
	nombreSucursal
ORDER BY
	MaxActivos DESC;

-- El número de cuenta y la proporción del 25% de los haberes de la cuenta. Este campo debe llamarse donación.
SELECT
	numeroCuenta,
	(saldo * 0.25) AS donacion
FROM
	Cuenta;

-- ----------- --
-- Ejercicio 4 --
-- ----------- --

ALTER TABLE Cuenta ADD fechaCreacion DATE;

-- 'C-001', fue creada el 25 de Julio de 2016
UPDATE
	Cuenta
SET
	fechaCreacion = '2016-07-25'
WHERE
	numeroCuenta = 'C-001';


-- 'C-002', fue creada el 08 de Enero de 2015
UPDATE
	Cuenta
SET
	fechaCreacion = '2015-01-08'
WHERE
	numeroCuenta = 'C-002';

-- 'C-003', fue creada el 17 de Octubre de 2019
UPDATE
	Cuenta
SET
	fechaCreacion = '2019-10-17'
WHERE
	numeroCuenta = 'C-003';