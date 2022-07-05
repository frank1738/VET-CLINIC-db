/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
('Agumon', DATE '2020-02-03', 0, 'TRUE', 10.23),
('Gabumon', DATE '2018-11-15', 2, 'TRUE', 8),
('Pikachu', DATE '2021-01-07', 1, 'FALSE', 15.04),
('Devimon', DATE '2017-05-12', 5, 'TRUE', 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
('Charmander', DATE '2020-02-08', 0, 'FALSE', -11),
('Plantmon', DATE '2021-11-15', 2,'TRUE', -5.7),
('Squirtle', DATE '1993-04-02', 3, 'FALSE', -12.13),
('Angemon', DATE '2005-06-12', 1, 'TRUE', -45),
('Boarmon', DATE '2005-06-07', 7, 'TRUE', 20.4),
('Blossom', DATE '1998-10-13', 3, 'TRUE', 17),
('Ditto', DATE '2022-05-14', 4, 'TRUE', 22);