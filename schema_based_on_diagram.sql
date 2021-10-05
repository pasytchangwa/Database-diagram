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
 name Varchar(100),
 PRIMARY KEY(Id)
);

CREATE TABLE medical_histories(
  Id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at date,
  status varchar(100),
  patient_id int,
  FOREIGN KEY(patient_id) REFERENCES patients(Id),
  PRIMARY KEY(Id)
);

CREATE TABLE invoices (
  Id INT GENERATED ALWAYS AS IDENTITY,
  total_amount decimal,
  generated_at date,
  payed_at date,
  medical_history_id INT,
  FOREIGN KEY(medical_history_id) REFERENCES medical_histories(Id),
  PRIMARY KEY(Id)
)
