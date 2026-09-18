-- Base de Datos Relacional Glob-Gusters Video-Club
-- Autor: Jonathan David Esquivel Bejarano
-- Fecha: 2026-09-15

-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS `glob_gusters` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `glob_gusters`;

-- Eliminación de la base de datos
-- DROP DATABASE IF EXISTS `glob_gusters`;


-- 1. Tablas independientes
CREATE TABLE Nacionalidad (
    ID_Nacionalidad int PRIMARY KEY,
    Nombre varchar(100),
    Fecha DATE
);  

CREATE TABLE Estado (
    ID_Estado int PRIMARY KEY,
    Nombre varchar(100)
); 

CREATE TABLE Productora (
    ID_Productora int PRIMARY KEY,
    Nombre varchar(100)
);

CREATE TABLE Cliente (
    ID_Cliente int PRIMARY KEY,
    Nombre varchar(100),
    Direccion varchar(100),
    Telefono INT
);  

-- 2. Tablas con dependencias de primer nivel
CREATE TABLE Director (
    ID_Director int PRIMARY KEY,
    ID_Nacionalidad int,
    Nombre varchar(100),
    FOREIGN KEY (ID_Nacionalidad) REFERENCES Nacionalidad(ID_Nacionalidad)
);

CREATE TABLE Actor (
    ID_Actor int PRIMARY KEY,
    ID_Nacionalidad int,
    Nombre varchar(100),
    Sexo varchar(100),
    FOREIGN KEY (ID_Nacionalidad) REFERENCES Nacionalidad(ID_Nacionalidad)
);

CREATE TABLE Pelicula (
    ID_Pelicula int PRIMARY KEY,
    Titulo VARCHAR(100),
    ID_Productora int,
    ID_Nacionalidad int,
    ID_Director int,
    FOREIGN KEY (ID_Productora) REFERENCES Productora(ID_Productora),
    FOREIGN KEY (ID_Nacionalidad) REFERENCES Nacionalidad(ID_Nacionalidad),
    FOREIGN KEY (ID_Director) REFERENCES Director(ID_Director)
);  

-- 3. Tablas relacionales y dependientes complejas
CREATE TABLE Ejemplar (
    ID_Ejemplar int PRIMARY KEY,
    Estado_ID int,
    ID_Pelicula int,
    FOREIGN KEY (Estado_ID) REFERENCES Estado(ID_Estado),
    FOREIGN KEY (ID_Pelicula) REFERENCES Pelicula(ID_Pelicula)
);

CREATE TABLE Renta (
    ID_Renta int PRIMARY KEY,
    Inicia DATE,
    Finaliza DATE,
    ID_Cliente int,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);  

CREATE TABLE Ejemplar_Renta (
    ID_Ejemplar int,
    ID_Renta int,
    Entrega DATE,
    FOREIGN KEY (ID_Ejemplar) REFERENCES Ejemplar(ID_Ejemplar),
    FOREIGN KEY (ID_Renta) REFERENCES Renta(ID_Renta),
    PRIMARY KEY (ID_Ejemplar, ID_Renta)
);

CREATE TABLE Reparto (
    ID_Actor int,
    ID_Pelicula int,
    Rol INTEGER,
    FOREIGN KEY (ID_Actor) REFERENCES Actor(ID_Actor),
    FOREIGN KEY (ID_Pelicula) REFERENCES Pelicula(ID_Pelicula),
    PRIMARY KEY (ID_Actor, ID_Pelicula)
);