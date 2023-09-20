/* policlinic database */
/* it might be modified, for simply usage or something idk */
/* Also - FOREIGN KEY fields cannot import correcly for draw.io, it's bad */
/* TASKS: 
  1. Make draw.io diagrams
  2. Make presentation (better way it use google.sites)
  3. Deploy DB on server (i think we can use REG.RU or something)
*/

/* There we contain all data for doctors... You know.. */
CREATE TABLE doctors (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  specialty VARCHAR(50) NOT NULL
);

/* Also, but for patients */
CREATE TABLE patients (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  birthdate DATE NOT NULL,
  gender VARCHAR(20) NOT NULL, /*ENUM('M', 'F')*/
  address VARCHAR(100) NOT NULL,
  phone VARCHAR(20) NOT NULL
);

/* Meeting beetwen doctor and his patient */
CREATE TABLE appointments (
  id INT PRIMARY KEY,
  doctor_id INT NOT NULL,
  patient_id INT NOT NULL,
  date_time DATETIME NOT NULL,
  diagnosis VARCHAR(100),
  prescription VARCHAR(100),
  FOREIGN KEY (doctor_id) REFERENCES doctors(id),
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

/* Some medical info about patient */
CREATE TABLE medical_records (
  id INT PRIMARY KEY,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  date DATE NOT NULL,
  diagnosis VARCHAR(100),
  prescription VARCHAR(100),
  FOREIGN KEY (patient_id) REFERENCES patients(id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

/* We should split all our doctors for their departments */
CREATE TABLE departments (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

/* Some doctors group */
CREATE TABLE department_doctors (
  department_id INT NOT NULL,
  doctor_id INT NOT NULL,
  PRIMARY KEY (department_id, doctor_id),
  FOREIGN KEY (department_id) REFERENCES departments(id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

/* Some group... WEll, you know */
CREATE TABLE department_patients (
  department_id INT NOT NULL,
  patient_id INT NOT NULL,
  PRIMARY KEY (department_id, patient_id),
  FOREIGN KEY (department_id) REFERENCES departments(id),
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

/* What is procedure we want to do... You know, like IRL hospital */
CREATE TABLE services (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price DECIMAL(10, 2) NOT NULL
);

/* Also, but in processing */
CREATE TABLE service_appointments (
  service_id INT NOT NULL,
  appointment_id INT NOT NULL,
  PRIMARY KEY (service_id, appointment_id),
  FOREIGN KEY (service_id) REFERENCES services(id),
  FOREIGN KEY (appointment_id) REFERENCES appointments(id)
);

