CREATE DATABASE hospital;

CREATE TABLE patients(
 Id INT GENERATED ALWAYS AS IDENTITY,
 name Varchar(100),
 date_of_birth DATE,
 PRIMARY KEY(Id)
);

CREATE TABLE treatments(
 Id INT GENERATED ALWAYS AS IDENTITY,
 type Varchar(50),
 name Varchr(100),
 PRIMARY KEY(Id)
);
