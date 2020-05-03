-- ---------- --
-- Aeropuerto --
-- ---------- --

INSERT INTO Aeropuerto (idAeropuerto, nombre, ciudad, provincia)
		VALUES('AR-AIE', 'Aeropuerto Internacional Ministro Pistarini', 'Buenos Aires', 'Buenos Aires');
INSERT INTO Aeropuerto (idAeropuerto, nombre, ciudad, provincia)
		VALUES('ND-AIS', 'Amsterdam Airport Schiphol', 'Amsterdam', 'Amsterdam');
INSERT INTO Aeropuerto (idAeropuerto, nombre, ciudad, provincia)
		VALUES('AR-AIG', 'Aeropuerto Internacional Gobernador Francisco Gabrielli', 'Mendoza', 'Mendoza');
INSERT INTO Aeropuerto (idAeropuerto, nombre, ciudad, provincia)
		VALUES('AR-AIA', 'Aeropuerto Ingeniero Ambrosio Taravella', 'Córdoba', 'Córdoba');
INSERT INTO Aeropuerto (idAeropuerto, nombre, ciudad, provincia)
		VALUES('VZ-AIM', 'Aeropuerto Internacional Maiquetia', 'Caracas', 'Caracas');
INSERT INTO Aeropuerto (idAeropuerto, nombre, ciudad, provincia)
		VALUES('IT-MMA', 'Milan Malpensa Airport', 'Milan', 'Lombardy');
		

-- ---------- --
--    Avion   --
-- ---------- --

INSERT INTO Avion (idAvion, numeroTotalLugares, tipoAvion)
		VALUES(1, 467, 'Boeing 747');
INSERT INTO Avion (idAvion, numeroTotalLugares, tipoAvion)
		VALUES(2, 220, 'Airbus A320');
INSERT INTO Avion (idAvion, numeroTotalLugares, tipoAvion)
		VALUES(3, 37, 'Bombardier CRJ200');
INSERT INTO Avion (idAvion, numeroTotalLugares, tipoAvion)
		VALUES(4, 210, 'Túpolev Tu-204');
INSERT INTO Avion (idAvion, numeroTotalLugares, tipoAvion)
		VALUES(5, 262, 'Ilyushin Il-96');

-- -------------- --
--    TipoAvion   --
-- -------------- --

INSERT INTO TipoAvion (nombreTipoAvion, maximoLugares, empresaAerea)
		VALUES('Boeing 747', 467, 'Boeing');
INSERT INTO TipoAvion (nombreTipoAvion, maximoLugares, empresaAerea)
		VALUES('Airbus A320', 220, 'Airbus');
INSERT INTO TipoAvion (nombreTipoAvion, maximoLugares, empresaAerea)
		VALUES('Bombardier CRJ200', 37, 'Bombardier');
INSERT INTO TipoAvion (nombreTipoAvion, maximoLugares, empresaAerea)
		VALUES('Túpolev Tu-204', 210, 'Túpolev');
INSERT INTO TipoAvion (nombreTipoAvion, maximoLugares, empresaAerea)
		VALUES('Ilyushin Il-96', 262, 'Ilyushin');

-- ---------- --
--    Vuelo   --
-- ---------- --

INSERT INTO Vuelo (numeroVuelo, aerolinea, diasSemana)
		VALUES('LA134', 'Latam', 'Lunes');
INSERT INTO Vuelo (numeroVuelo, aerolinea, diasSemana)
		VALUES('AA065', 'American Airlines', 'Martes');
INSERT INTO Vuelo (numeroVuelo, aerolinea, diasSemana)
		VALUES('LU265', 'Lufthansa', 'Miercoles');
INSERT INTO Vuelo (numeroVuelo, aerolinea, diasSemana)
		VALUES('IB846', 'Iberia', 'Jueves');
INSERT INTO Vuelo (numeroVuelo, aerolinea, diasSemana)
		VALUES('QA157', 'Qatar Airways', 'Vienes');

-- --------------- --
--    PlanVuelo    --
-- --------------- --

INSERT INTO PlanVuelo (numeroPlan, numeroVuelo, idAeropuertoSalida, horaSalidaProgramada, idAeropuertoLlegada, horaLlegadaProgramada)
		VALUES(1, 'AA065', 'AR-AIE', 073000, 'VZ-AIM', 190000);
INSERT INTO PlanVuelo (numeroPlan, numeroVuelo, idAeropuertoSalida, horaSalidaProgramada, idAeropuertoLlegada, horaLlegadaProgramada)
		VALUES(2, 'LA134', 'AR-AIG', 080000, 'AR-AIA', 103000);
INSERT INTO PlanVuelo (numeroPlan, numeroVuelo, idAeropuertoSalida, horaSalidaProgramada, idAeropuertoLlegada, horaLlegadaProgramada)
		VALUES(3, 'LU265', 'AR-AIE', 101500, 'ND-AIS', 224500);
INSERT INTO PlanVuelo (numeroPlan, numeroVuelo, idAeropuertoSalida, horaSalidaProgramada, idAeropuertoLlegada, horaLlegadaProgramada)
		VALUES(4, 'IB846', 'AR-AIA', 164000, 'AR-AIG', 180000);
INSERT INTO PlanVuelo (numeroPlan, numeroVuelo, idAeropuertoSalida, horaSalidaProgramada, idAeropuertoLlegada, horaLlegadaProgramada)
		VALUES(5, 'QA157', 'AR-AIE', 205500, 'IT-MMA', 092500);

-- --------------- --
--    PlanActivo   --
-- --------------- --

INSERT INTO PlanActivo (numeroPlan, numeroVuelo, fecha, numeroLugaresLibres, idAvion, idAeropuertoSalida, horaSalida, idAeropuertoLlegada, horaLlegada)
		VALUES(1, 'AA065', '2020-01-01', 100, 2, 'AR-AIE', 073000, 'VZ-AIM', 190000);
INSERT INTO PlanActivo (numeroPlan, numeroVuelo, fecha, numeroLugaresLibres, idAvion, idAeropuertoSalida, horaSalida, idAeropuertoLlegada, horaLlegada)
		VALUES(1, 'AA065', '2019-12-24', 10, 2, 'AR-AIE', 073000, 'VZ-AIM', 190000);
INSERT INTO PlanActivo (numeroPlan, numeroVuelo, fecha, numeroLugaresLibres, idAvion, idAeropuertoSalida, horaSalida, idAeropuertoLlegada, horaLlegada)
		VALUES(3, 'LU265', '2020-01-15', 50, 1, 'AR-AIE', 101500, 'ND-AIS', 224500);
INSERT INTO PlanActivo (numeroPlan, numeroVuelo, fecha, numeroLugaresLibres, idAvion, idAeropuertoSalida, horaSalida, idAeropuertoLlegada, horaLlegada)
		VALUES(1, 'AA065', '2020-01-15', 10, 2, 'AR-AIE', 073000, 'VZ-AIM', 190000);
INSERT INTO PlanActivo (numeroPlan, numeroVuelo, fecha, numeroLugaresLibres, idAvion, idAeropuertoSalida, horaSalida, idAeropuertoLlegada, horaLlegada)
		VALUES(4, 'IB846', '2020-02-01', 33, 2, 'AR-AIE', 164000, 'AR-AIG', 180000);
INSERT INTO PlanActivo (numeroPlan, numeroVuelo, fecha, numeroLugaresLibres, idAvion, idAeropuertoSalida, horaSalida, idAeropuertoLlegada, horaLlegada)
		VALUES(4, 'QA157', '2020-02-03', 0, 1, 'AR-AIE', 205500, 'IT-MMA', 092500);

-- ---------------- --
--    PrecioBoleto   --
-- ---------------- --

INSERT INTO PrecioBoleto (idTarifa, numeroVuelo, cantidad) VALUES (12, 'AA065', 120);
INSERT INTO PrecioBoleto (idTarifa, numeroVuelo, cantidad) VALUES (13, 'LU265', 417);
INSERT INTO PrecioBoleto (idTarifa, numeroVuelo, cantidad) VALUES (14, 'IB846', 190);
INSERT INTO PrecioBoleto (idTarifa, numeroVuelo, cantidad) VALUES (15, 'QA157', 467);