/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT,
    name TEXT,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals
ADD COLUMN species TEXT;


CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name TEXT,
    age INT
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    species_name TEXT
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id BIGSERIAL PRIMARY KEY,
    name TEXT,
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vet_id INT REFERENCES vets (id),
    species_id INT REFERENCES species (id)
);

CREATE TABLE visits (
    animal_id INT REFERENCES animals (animal_id),
    vet_id INT REFERENCES vets (id),
    date_of_visit DATE
);