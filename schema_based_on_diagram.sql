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

CREATE INDEX parent_id_asc ON medical_histories (
  parent_id ASC
);

CREATE TABLE invoices (
  Id INT GENERATED ALWAYS AS IDENTITY,
  total_amount decimal,
  generated_at date,
  payed_at date,
  medical_history_id INT,
  FOREIGN KEY(medical_history_id) REFERENCES medical_histories(Id),
  PRIMARY KEY(Id)
);


CREATE INDEX medical_history_id_asc ON invoices (
  medical_history_id ASC
)

CREATE TABLE invoice_items(
 Id INT GENERATED ALWAYS AS IDENTITY,
 unit_price decimal,
 quantity INT,
 total_price decimal,
 invoice_id INT,
 treatment_id INT,
 FOREIGN KEY(invoice_id) REFERENCES invoices(Id),
 FOREIGN KEY(treatment_id) REFERENCES treatments(Id),
 PRIMARY KEY(Id)
);

CREATE INDEX invoice_id_asc ON invoice_items (
  invoice_id ASC
);

CREATE INDEX treatment_id_asc ON invoice_items (
  treatment_id ASC
);

CREATE TABLE prescription(
 Id INT GENERATED ALWAYS AS IDENTITY,
 treatment_id INT,
 medical_history_id INT,
 FOREIGN KEY(treatment_id) REFERENCES treatments(Id),
 FOREIGN KEY(medical_history_id) REFERENCES medical_histories(Id),
 PRIMARY KEY(Id)
);

CREATE INDEX treatment_id_asc ON prescription (
  treatment_id ASC
);

CREATE INDEX medical_history_id_asc ON prescription (
  medical_history_id ASC
);
