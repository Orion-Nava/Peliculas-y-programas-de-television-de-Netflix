CREATE DATABASE Netflix;
USE Netflix;

CREATE TABLE Netflix (
      show_id VARCHAR(10),
      type VARCHAR(50),
      title VARCHAR(225),
      director TEXT,
      cast TEXT,
      country VARCHAR(200),
      date_added DATE,
      release_year INT,
      rating VARCHAR(20),
      duration VARCHAR (50),
      listed_in TEXT,
      description TEXT
);

SELECT count(*) FROM netflix;

# Crear tabla auxiliar.
CREATE TABLE Numbers (n INT);

INSERT INTO Numbers (n) 
VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), 
       (11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
       (21), (22), (23), (24), (25), (26), (27), (28), (29), (30),
       (31), (32), (33), (34), (35), (36), (37), (38), (39), (40),
       (41), (42), (43), (44), (45), (46), (47), (48), (49), (50);

# Crear tabla para director y show_id.
CREATE TABLE directors_tab AS
SELECT 
    show_id,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(director, '|', n), '|', -1)) AS director
FROM 
    (SELECT show_id, director FROM Netflix WHERE director IS NOT NULL) AS Original
CROSS JOIN 
    Numbers
WHERE 
    n <= 1 + LENGTH(director) - LENGTH(REPLACE(director, '|', ''))
    AND TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(director, '|', n), '|', -1)) <> '';

# Crear tabla para cast y show_id.
CREATE TABLE cast_tab AS
SELECT 
    show_id,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, '|', n), '|', -1)) AS cast
FROM 
    (SELECT show_id, cast FROM Netflix WHERE cast IS NOT NULL) AS Original
CROSS JOIN 
    Numbers
WHERE 
    n <= 1 + LENGTH(cast) - LENGTH(REPLACE(cast, '|', ''))
    AND TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, '|', n), '|', -1)) <> '';

# Crear tabla para country.
CREATE TABLE country_tab AS
SELECT 
    show_id,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(country, '|', n), '|', -1)) AS country
FROM 
    (SELECT show_id, country FROM Netflix WHERE country IS NOT NULL) AS Original
CROSS JOIN 
    Numbers
WHERE 
    n <= 1 + LENGTH(country) - LENGTH(REPLACE(country, '|', ''))
    AND TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(country, '|', n), '|', -1)) <> '';

# Crear tabla para listed_in y show_id.
CREATE TABLE listed_in_tab AS
SELECT 
    show_id,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(listed_in, '|', n), '|', -1)) AS listed_in
FROM 
    (SELECT show_id, listed_in FROM Netflix WHERE listed_in IS NOT NULL) AS Original
CROSS JOIN 
    Numbers
WHERE 
    n <= 1 + LENGTH(listed_in) - LENGTH(REPLACE(listed_in, '|', ''))
    AND TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(listed_in, '|', n), '|', -1)) <> '';

# Crear la tabla para duración en minutos.
CREATE TABLE min_tab AS
SELECT 
    show_id,
    CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) AS minutos
FROM Netflix
WHERE duration LIKE '%min';

# Crear la tabla para duración en temporadas.
CREATE TABLE Temp_tab AS
SELECT 
    show_id,
    CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) AS temporadas
FROM Netflix
WHERE duration LIKE '%Season%';

Select * FROM Netflix;
Select * FROM country_tab;



## CREAR UNA BASE DE DATOS DE DE ESTADOS UNIDOS.

CREATE TABLE Netflix_US AS
SELECT n.*
FROM Netflix n
JOIN country_tab c ON n.show_id = c.show_id
WHERE c.country = 'United States';

# Crear tabla para director y show_id.
CREATE TABLE directors_tab_US AS
SELECT 
    show_id,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(director, '|', n), '|', -1)) AS director
FROM 
    (SELECT show_id, director FROM Netflix_US WHERE director IS NOT NULL) AS Original
CROSS JOIN 
    Numbers
WHERE 
    n <= 1 + LENGTH(director) - LENGTH(REPLACE(director, '|', ''))
    AND TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(director, '|', n), '|', -1)) <> '';

# Crear tabla para cast y show_id.
CREATE TABLE cast_tab_US AS
SELECT 
    show_id,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, '|', n), '|', -1)) AS cast
FROM 
    (SELECT show_id, cast FROM Netflix_US WHERE cast IS NOT NULL) AS Original
CROSS JOIN 
    Numbers
WHERE 
    n <= 1 + LENGTH(cast) - LENGTH(REPLACE(cast, '|', ''))
    AND TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(cast, '|', n), '|', -1)) <> '';

# Crear tabla para listed_in y show_id.
CREATE TABLE listed_in_tab_US AS
SELECT 
    show_id,
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(listed_in, '|', n), '|', -1)) AS listed_in
FROM 
    (SELECT show_id, listed_in FROM Netflix_US WHERE listed_in IS NOT NULL) AS Original
CROSS JOIN 
    Numbers
WHERE 
    n <= 1 + LENGTH(listed_in) - LENGTH(REPLACE(listed_in, '|', ''))
    AND TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(listed_in, '|', n), '|', -1)) <> '';

Select * FROM listed_in_tab;
SELECT COUNT(*) FROM country_tab;


# Crear la tabla para duración en minutos.
CREATE TABLE min_tab_US AS
SELECT 
    show_id,
    CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) AS minutos
FROM Netflix_US
WHERE duration LIKE '%min';

# Crear la tabla para duración en temporadas
CREATE TABLE Temp_tab_US AS
SELECT 
    show_id,
    CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) AS temporadas
FROM Netflix_US
WHERE duration LIKE '%Season%';

# Exportar datos. En este caso se hizo manualmente.


