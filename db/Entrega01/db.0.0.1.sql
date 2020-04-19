
CREATE DATABASE Entrega1;
USE Entrega1;

CREATE TABLE Aeropuerto
(
    idAeropuerto INT NOT NULL,
    nombre VARCHAR(50),
    ciudad VARCHAR(50),
    provincia VARCHAR(50),
    PRIMARY KEY (idAeropuerto)
);

CREATE TABLE Avion
(
    idAvion INT NOT NULL, 
    numeroTotalLugares INT NOT NULL,
    tipoAvion INT NOT NULL,

    PRIMARY KEY (idAvion)
);

CREATE TABLE TipoAvion
(
    nombreTipoAvion VARCHAR(30) NOT NULL,
    maximoLugares INT NOT NULL,
    empresaAerea VARCHAR(30),

    PRIMARY KEY (nombreTipoAvion)
);

CREATE TABLE Vuelo
(
    numeroVuelo INT NOT NULL,
    aerolinea VARCHAR(20),
    diasSemana VARCHAR(20),

    PRIMARY KEY (numeroVuelo)
);

CREATE TABLE PlanVuelo
(
    numeroPlan INT NOT NULL,
    numeroVuelo INT NOT NULL,
    idAeropuertoSalida INT NOT NULL, 
    horaSalidaProgramada TIME NOT NULL,
    idAeropuertoLlegada INT NOT NULL, 
    horaLlegadaProgramada TIME NOT NULL,
    PRIMARY KEY (numeroPlan), 
    FOREIGN KEY (numeroVuelo) REFERENCES Vuelo(numeroVuelo), 
    FOREIGN KEY (idAeropuertoSalida) REFERENCES Aeropuerto(idAeropuerto),
    FOREIGN KEY (idAeropuertoLlegada) REFERENCES Aeropuerto(idAeropuerto)
);

CREATE TABLE ReservaLugar
(
    numeroLugar INT NOT NULL,
    numeroVuelo INT NOT NULL,
    numeroPlan INT NOT NULL,
    fecha DATE,
    nombreCliente VARCHAR(50),
    telefonoCliente VARCHAR(20),

    PRIMARY KEY (numeroLugar),
    FOREIGN KEY (numeroVuelo) REFERENCES Vuelo(numeroVuelo),
    FOREIGN KEY (numeroPlan) REFERENCES PlanVuelo(numeroPlan)
);

CREATE TABLE Aterrizaje
(
    nombreTipoAvion VARCHAR(30) NOT NULL,
    idAeropuerto INT NOT NULL, 

    PRIMARY KEY (nombreTipoAvion),
    FOREIGN KEY (nombreTipoAvion) REFERENCES TipoAvion(nombreTipoAvion), 
    FOREIGN KEY (idAeropuerto) REFERENCES Aeropuerto(idAeropuerto)
);

CREATE TABLE PrecioBoleto
(
    idTarifa FLOAT NOT NULL,
    numeroVuelo INT NOT NULL, 
    cantidad INT NOT NULL,
    restricciones VARCHAR(50),

    PRIMARY KEY (idTarifa),
    FOREIGN KEY (numeroVuelo) REFERENCES Vuelo(numeroVuelo)
);

CREATE TABLE PlanActivo
(
    numeroPlan INT NOT NULL,
    numeroVuelo INT NOT NULL,
    fecha DATE NOT NULL,
    idAvion INT NOT NULL, 
    idAeropuertoSalida INT NOT NULL,
    horaSalida TIME NOT NULL,
    idAeropuertoLlegada INT NOT NULL,
    horaLlegada TIME NOT NULL,

    PRIMARY KEY (numeroPlan),
    FOREIGN KEY (numeroVuelo) REFERENCES Vuelo(numeroVuelo),
    FOREIGN KEY (idAvion) REFERENCES Avion(idAvion),
    FOREIGN KEY (idAeropuertoSalida) REFERENCES Aeropuerto(idAeropuerto),
    FOREIGN KEY (idAeropuertoLlegada) REFERENCES Aeropuerto(idAeropuerto)
);