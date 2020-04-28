-- ---------- --
-- Aeropuerto --
-- ---------- --

INSERT INTO Aeropuerto VALUES (1, 'Aeropuerto Internacional Ministro Pistarini', 'Buenos Aires', 'Buenos Aires');
INSERT INTO Aeropuerto VALUES (2, 'Aeropuerto Internacional El Palomar', 'Buenos Aires', 'Buenos Aires');
INSERT INTO Aeropuerto VALUES (3, 'Aeropuerto Internacional Gobernador Francisco Gabrielli', 'Mendoza', 'Mendoza');
INSERT INTO Aeropuerto VALUES (4, 'Aeropuerto Ingeniero Ambrosio Taravella', 'Córdoba', 'Córdoba');
INSERT INTO Aeropuerto VALUES (5, 'Aeropuerto Jalil Hamer', 'Perito Moreno', 'Santa Cruz');

-- ---------- --
--    Avion   --
-- ---------- --

INSERT INTO Avion VALUES (1, 467, 'Boeing 747');
INSERT INTO Avion VALUES (2, 220, 'Airbus A320');
INSERT INTO Avion VALUES (3, 37, 'Bombardier CRJ200');
INSERT INTO Avion VALUES (4, 210, 'Túpolev Tu-204');
INSERT INTO Avion VALUES (5, 262, 'Ilyushin Il-96');

-- -------------- --
--    TipoAvion   --
-- -------------- --

INSERT INTO TipoAvion VALUES ('Boeing 747', 467, 'Boeing');
INSERT INTO TipoAvion VALUES ('Airbus A320', 220, 'Airbus');
INSERT INTO TipoAvion VALUES ('Bombardier CRJ200', 37, 'Bombardier');
INSERT INTO TipoAvion VALUES ('Túpolev Tu-204', 210, 'Túpolev');
INSERT INTO TipoAvion VALUES ('Ilyushin Il-96', 262, 'Ilyushin');

-- ---------- --
--    Vuelo   --
-- ---------- --

INSERT INTO vuelo VALUES (1134, 'Latam Chile', 'Lunes');
INSERT INTO vuelo VALUES (9435, 'American Airlines', 'Martes');
INSERT INTO vuelo VALUES (8265, 'Lufthansa', 'Miercoles');
INSERT INTO vuelo VALUES (6846, 'Iberia' , 'Jueves');
INSERT INTO vuelo VALUES (8157, 'Qatar Airways', 'Vienes');

-- -------------- --
--    PlanVuelo   --
-- -------------- --

INSERT INTO PlanVuelo VALUES (1, 1134, 1, 073000, 6, 190000);
INSERT INTO PlanVuelo VALUES (2, 9435, 2, 080000, 7, 203000);
INSERT INTO PlanVuelo VALUES (3, 8265, 3, 101500, 8, 224500);
INSERT INTO PlanVuelo VALUES (4, 6846, 4, 164000, 9, 042000);
INSERT INTO PlanVuelo VALUES (5, 8157, 5, 205500, 10, 092500);