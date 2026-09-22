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
    ID_Nacionalidad int AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(100),
    Fecha DATE
);

CREATE TABLE Estado (
    ID_Estado int AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(100)
); 

CREATE TABLE Productora (
    ID_Productora int AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(100)
);

CREATE TABLE Cliente (
    ID_Cliente int AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(100),
    Direccion varchar(100),
    Telefono INT
); 

CREATE TABLE Director (
    ID_Director int AUTO_INCREMENT PRIMARY KEY,
    ID_Nacionalidad int,
    Nombre varchar(100),
    FOREIGN KEY (ID_Nacionalidad) REFERENCES Nacionalidad(ID_Nacionalidad)
);

CREATE TABLE Actor (
    ID_Actor int AUTO_INCREMENT PRIMARY KEY,
    ID_Nacionalidad int,
    Nombre varchar(100),
    Sexo varchar(100),
    FOREIGN KEY (ID_Nacionalidad) REFERENCES Nacionalidad(ID_Nacionalidad)
);

CREATE TABLE Pelicula (
    ID_Pelicula int AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(100),
    ID_Productora int,
    ID_Nacionalidad int,
    ID_Director int,
    FOREIGN KEY (ID_Productora) REFERENCES Productora(ID_Productora),
    FOREIGN KEY (ID_Nacionalidad) REFERENCES Nacionalidad(ID_Nacionalidad),
    FOREIGN KEY (ID_Director) REFERENCES Director(ID_Director)
); 

CREATE TABLE Ejemplar (
    ID_Ejemplar int AUTO_INCREMENT PRIMARY KEY,
    Estado_ID int,
    ID_Pelicula int,
    FOREIGN KEY (Estado_ID) REFERENCES Estado(ID_Estado),
    FOREIGN KEY (ID_Pelicula) REFERENCES Pelicula(ID_Pelicula)
);

CREATE TABLE Renta (
    ID_Renta int AUTO_INCREMENT PRIMARY KEY,
    Inicia DATE,
    Finaliza DATE,
    ID_Cliente int,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);