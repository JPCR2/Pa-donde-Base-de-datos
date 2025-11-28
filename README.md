# Repositorio de Base de Datos: Pa-donde

Este repositorio contiene todos los archivos relacionados con la base de datos del proyecto "Pa' donde".

## Archivos

* **Pa_donde.sql:** El script principal de MySQL para crear la estructura y poner los datos.
* **Proyecto.sql:** El script principal de MySQL para crear la estructura y poner los datos.
* **Pa-donde.pdf:** El Diagrama Entidad-Relación (DER) que muestra el modelo lógico y físico de la base de datos.

## Versions (Historial de Cambios)

Aquí se documentarán los cambios importantes en la estructura de la base de datos.

* **v1.1 (20/11/2025):** Se integro la nueva base de datos corregida
* **v1.1 (06/11/2025):** Se agregó el Diagrama Entidad-Relación (`Pa-donde.pdf`).
* **v1.0 (06/11/2025):** Versión inicial de la base de datos. Incluye las tablas principales.

##  Base de Datos

El archivo proyecto.sql contiene la estructura completa de la base de datos del proyecto Pa' donde.
Se realizo una nueva version de la base de datos de pa_donde.sql corrigiendo todo lo que nos faltaba.
Incluye:

Creación de tablas principales ( 
| colonias                 |
| notificaciones           |
| paradas                  |
| reportes                 |
| roles                    |
| rutas                    |
| rutas_paradas            |
| usuarios                 |
| usuarios_rutas_favoritas ).

Relaciones mediante claves foráneas.

Inserciones iniciales para pruebas. 

En esta nueva sesion se modifico junto con la base de datos para que nos puedan dar el CRUD , lo cual nos falto el de eliminar y actualizar
y ahora ya nos deja modificar y eliminar en la base de datos.
