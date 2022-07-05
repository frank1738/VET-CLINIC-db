/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name, date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name, neutered, escape_attempts FROM animals WHERE neutered = 'TRUE' AND escape_attempts < 3;
SELECT name, date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts, weight_kg FROM animals WHERE weight_kg > 10.5;
SELECT name, neutered FROM animals WHERE neutered = 'TRUE';
SELECT name FROM animals WHERE NOT name = 'Gabumon';
SELECT name, weight_kg FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
