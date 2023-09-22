CREATE TABLE Audit_Personas (
    id_Personas uniqueidentifier,
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
    estado varchar(50),
    actionDate datetime,
    action varchar(50),
    id uniqueidentifier primary key
);

CREATE TABLE Audit_Usuarios (
    id_Usuarios uniqueidentifier,
    rol varchar(50),
    usuario varchar(50),
    clave varchar(50),
    correo varchar(50),
    estado varchar(50),
    referencia uniqueidentifier,
    actionDate datetime,
    action varchar(50),
    id uniqueidentifier primary key
);

CREATE TABLE Audit_Proyectos (
    id_Proyectos uniqueidentifier,
    direccion varchar(50),
    ubicacion geography,
    estrato int,
    ciudad varchar(50),
    departamento varchar(50),
    indicaciones varchar(50),
    actionDate datetime,
    action varchar(50),
    id uniqueidentifier primary key
);

-- Audit for Subsidios
CREATE TABLE Audit_Subsidios (
    id_Subsidios uniqueidentifier,
    nombre varchar(50),
    actionDate datetime,
    action varchar(50),
    id uniqueidentifier primary key
);

CREATE TABLE Audit_Aplicaciones (
    id_Aplicaciones uniqueidentifier,
    aplicante uniqueidentifier,
    estado varchar(50) not null,
    subsidio uniqueidentifier,
    fechainicio date not null,
    fechafin date default null,
    proyecto uniqueidentifier,
    actionDate datetime,
    action varchar(50),
    id uniqueidentifier primary key
);

CREATE TABLE Audit_Desembolsos (
    id_Desembolsos uniqueidentifier,
    aplicacion uniqueidentifier,
    fecha date,
    cifra float,
    actionDate datetime,
    action varchar(50),
    id uniqueidentifier primary key
);

CREATE TABLE Audit_Requisitos (
    id_Requisitos uniqueidentifier,
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
    actionDate datetime,
    action varchar(50),
    id uniqueidentifier primary key
);