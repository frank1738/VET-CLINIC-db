/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name, date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name, neutered, escape_attempts FROM animals WHERE neutered = 'TRUE' AND escape_attempts < 3;
SELECT name, date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts, weight_kg FROM animals WHERE weight_kg > 10.5;
SELECT name, neutered FROM animals WHERE neutered = 'TRUE';
SELECT name FROM animals WHERE NOT name = 'Gabumon';
SELECT name, weight_kg FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE specis = '';
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > DATE '2022-01-01';
SAVEPOINT SP01;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP01;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

SELECT COUNT(*) AS "NUMBER OF ANIMALS" FROM animals;
SELECT COUNT(*) AS "ANIMALS WHO HAVE NEVER TRIED TO ESCAPE" FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) AS "AVERAGE WEIGHT OF ANIMALS" FROM animals;
SELECT neutered, AVG(escape_attempts) AS "AVERAGE ESCAPE ATTEMPTS OF ANIMALS" FROM animals GROUP BY neutered ORDER BY AVG(escape_attempts) DESC LIMIT 1;
SELECT species, MIN(weight_kg) AS "MINIMUM WEIGHT", MAX(weight_kg) AS "MAXIMUM WEIGHT" FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) AS "AVERAGE ESCAPE ATTEMPTS OF ANIMALS" FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;


SELECT name as animal_name,full_name as owner  FROM animals
INNER JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

SELECT a.name AS "animal_name", s.name AS "type" FROM animals AS a
JOIN species AS s
ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name AS "Owner", a.name AS "animal_name" FROM owners AS o
LEFT JOIN animals AS a
ON o.id = a.owner_id;

SELECT s.name AS "species", COUNT(a.species_id) as number_of_species FROM animals AS a
JOIN species AS s
ON a.species_id = s.id
GROUP BY s.id;

SELECT o.full_name AS "owner", a.name AS type_digmon FROM owners AS o
JOIN animals AS a
ON o.id = a.owner_id
WHERE o.full_name = 'Jennifer Orwell' AND a.species_id = 2;

SELECT o.full_name AS "owner", a.name AS animal_name, a.escape_attempts AS escape_attempts FROM owners AS o
JOIN animals AS a
ON o.id = a.owner_id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name AS owner, COUNT(a.name) as number_of_animals FROM owners AS o
LEFT JOIN animals AS a
ON a.owner_id = o.id
GROUP BY o.full_name
ORDER BY COUNT(a.name) DESC
LIMIT 1;