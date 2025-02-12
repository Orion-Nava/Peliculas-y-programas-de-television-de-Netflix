# Peliculas-y-programas-de-television-de-Netflix
Práctica de análisis de datos usando MySQL y Tableau, usando el conjunto de datos "Películas y programas de televisión de Netflix" de Kaggle.

## Objetivos
* Practicar el manejo de base de datos SQL mediante MySQL Workbench.
* Practicar la creación de dashboards en Tableau.
* Analizar las tendencias del contenido de Netflix, como:
  - Top más frecuentes (directores, actores, géneros y países productores de programas y películas).
  - Clasificación.
  - Duración.
  - Año de estreno.

## Herramientas
* MySQL Workbench 8.0.41 CE (64-bit).
* MySQL Server 9.1.
* Tableau Desktop Public Edition 2024.3.3
* Conjunto de datos: https://www.kaggle.com/datasets/rahulvyasm/netflix-movies-and-tv-shows

## Sobre el conjunto de datos
El conjunto de datos de títulos de Netflix es una recopilación completa de películas y programas de televisión disponibles en Netflix, que abarca diversos aspectos. ste conjunto de datos es fundamental para analizar las tendencias en el contenido de Netflix, comprender la popularidad de los géneros y examinar la distribución del contenido en diferentes regiones y períodos de tiempo. El conjunto de datos contiene 8809 entradas, cada una de las cuales representa una película o un programa de televisión único. Las variables del conjunto de datos son:
* show_id: Un identificador único para cada título.
* type: La categoría del título, que puede ser 'Película' o 'Programa de televisión'.
* title: El nombre de la película o programa de televisión.
* director: El o los directores de la película o programa de televisión. (Contiene valores nulos para algunas entradas, especialmente programas de televisión en los que esta información podría no ser aplicable).
* cast: La lista de actores/actrices principales que aparecen en el título. (Es posible que algunas entradas no tengan esta información).
* country: El país o países donde se produjo la película o programa de televisión.
* date_added: La fecha en que se agregó el título a Netflix.
* release_year: El año en que se estrenó originalmente la película o el programa de televisión.
* rating: La clasificación por edad del título.
* duration: La duración del título, en minutos para películas y temporadas para programas de televisión.
* listed_in: Los géneros a los que pertenece el título.
* description: Un breve resumen del título.

