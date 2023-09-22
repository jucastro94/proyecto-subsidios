create table Personas (
    id uniqueidentifier primary key,
    nombre varchar(50),
    apellido varchar(50),
    telefono varchar(50),
    direccion varchar(50),
    fechanacimiento date,
    numeroidentificacion varchar(50) not null,
    tipoidentificacion varchar(50) not null,
    lugarresidencia varchar(150),
    rol varchar(50),
    clave varchar(50),
    correo varchar(50),
    estado varchar(50)
);


create table Proyectos (
    id uniqueidentifier primary key,
    direccion varchar(50),
    ubicacion geography,
    estrato int,
    ciudad varchar(50),
    departamento varchar(50),
    indicaciones varchar(50) -- otros datos como el piso, casa, torre, etc
);

create table Subsidios (
    id uniqueidentifier primary key,
    nombre varchar(50),
);



CREATE TABLE Aplicaciones (
    id UNIQUEIDENTIFIER PRIMARY KEY,
    aplicante UNIQUEIDENTIFIER,
    estado VARCHAR(50) NOT NULL DEFAULT 'Pendiente',
    subsidio UNIQUEIDENTIFIER,
    fechainicio DATE NOT NULL,
    fechafin DATE DEFAULT NULL,
    proyecto uniqueidentifier,
    FOREIGN KEY (subsidio) REFERENCES Subsidios(id),
    FOREIGN KEY (aplicante) REFERENCES Personas(id),
    foreign key (proyecto) references Proyectos(id)
);

create table Desembolsos (
    id uniqueidentifier primary key,
    aplicacion uniqueidentifier,
    fecha date,
    cifra float,
    foreign key (aplicacion) references Aplicaciones(id)
);


create table Requisitos (
    id uniqueidentifier primary key,
    aplicacion uniqueidentifier,
    proyecto uniqueidentifier,
    sisben int,
    propietario int,
    ingresosfamiliares float,
    cierrefinanciero varchar(50),
    cajacompensacion int,
    cabezafamilia varchar(50),
    otrossubsidios int,
    desempleo int,
    inhabilidaddes varchar(50),
    otros varchar(50),
    fecha date,
    foreign key (aplicacion) references Aplicaciones(id)
);