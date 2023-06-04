DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center


CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    specialty VARCHAR(15)
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    birthday DATE
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    CONSTRAINT fk_doctor
        FOREIGN KEY(doctor_id)
        REFERENCES doctors(id),
    CONSTRAINT fk_patient
        FOREIGN KEY(patient_id)
        REFERENCES patients(id)
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INT,
    disease_id INT,
    CONSTRAINT fk_visit
        FOREIGN KEY(visit_id)
        REFERENCES visits(id),
    CONSTRAINT fk_disease
        FOREIGN KEY(disease_id)
        REFERENCES diseases(id)
);

INSERT INTO patients (name, birthday)
VALUES 
    ('Samantha Smith', '5/14/1980'),
    ('Tommy Kane', '02/12/1965'),
    ('Paula Swanson', '09/02/1998');

INSERT INTO doctors (name, specialty)
VALUES
    ('Dr. House', 'Mystery cases'),
    ('Dr. Chase', 'Pulmonary');

INSERT INTO diseases (name, description)
VALUES
    ('Osteoarthritis', 'Also known as degenerative joint disease, is the most common type of arthritis, affecting an estimated 21 million adults in this country. Commonly referred to as a "wear and tear" arthritis, osteoarthritis involves destruction of the cartilage, the cushion or shock absorber on the ends of the bones.'),
    ('Conjunctivitis', 'Conjunctivitis is an inflammation of the thin, clear membrane (conjunctiva) that covers the white of the eye and the inside surface of the eyelids. Conjunctivitis, commonly known as “pink eye,” is most often caused by a virus but also can be caused by bacterial infection, allergies (e.g., cosmetics, pollen) and chemical irritation.');

