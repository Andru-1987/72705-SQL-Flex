-- FUNCIONES BUILT-IN MYSQL >> https://dev.mysql.com/doc/refman/8.4/en/functions.html

-- DQL --> DATA QUERY LANGUAGE

-- RETRIEVING DATA  -> READ DATA

-- FUNCIONES BUILT IN MYSQL
-- https://dev.mysql.com/doc/refman/8.4/en/functions.html


-- SELECT 
-- <...cols> | *
--    FROM <database>.<tabla> 
-- FILTROS
-- WHERE colocamos las condiciones que deban los datos
;

/*Unidad 2: Sentencias y Sublenguajes
Objetivos de la clase
Reconocer e implementar la sentencia SELECT de SQL
Identificar los operadores en SQL
Reconocer e implementar las sentencias complementarias de SQL
Identificar las funciones en SQL
Identificar los diferentes tipos de intersección en tablas SQL
Repaso
Duración: 5 minutos
Consigna: Aprendimos la definición de datos y conocimos cómo éstos se organizan en bases de datos relacionales, las cuales pueden ser representadas a partir de diagramas entidad-relación.
Pregunta: ¿Cómo gestionamos “operativamente hablando” la información que se encuentra en la base de datos?

Ejemplo en vivo 1
Duración: 15 minutos
Consigna: Por ahora pongamos el foco en la estructura; a continuación veremos cada palabra en detalle.

Para consultar determinados campos de una tabla:
QUERY
------ 

SELECT 
	id_class,
    description 
--> FROM class;

Para consultar todos los campos de una tabla:

SELECT 
	*  --> todas las columnas 
FROM class;

Ejemplo en vivo 2
Duración: 15 minutos
Consigna: SELECT id_class, description FROM class;
Pregunta: ¿Qué resultado obtendremos de esta consulta? Observaremos la selección de determinados campos.

Actividad: SELECT - FROM
Duración: 5 minutos
Formato: Actividad individual
Consigna: Pondremos en práctica el uso de SELECT - FROM, analizando previamente cuál será el resultado de cada consulta, de acuerdo a los registros que posee la tabla.

Trabajaremos con una tabla de la DB Gamer. Observa las siguientes consultas y determina qué registros traerá cada una.

Actividad: Prácticas con la sentencia WHERE
Duración: 10 minutos
Formato: Actividad individual
Consigna: Aplicaremos las consultas con la sentencia WHERE sobre la tabla SYSTEM_USER y discutiremos por chat el resultado de cada una de las siguientes consultas:

SELECT * FROM system_user WHERE first_name = 'Gillie';
SELECT first_name, last_name FROM system_user WHERE id_user_type = 334;
SELECT first_name, last_name FROM system_user WHERE id_system_user = 56;
SELECT * FROM system_user WHERE first_name = 'Reinaldos';
Actividad colaborativa: Prácticas con operadores
Duración: 15 minutos
Formato: Actividad grupal
Consigna: Veamos cómo combinar diferentes operadores sobre las tablas GAME y COMMENTARY para obtener diferentes resultados posibles. Resolver las siguientes consultas:

Todos los comentarios sobre juegos desde 2019 en adelante.
Todos los comentarios sobre juegos anteriores a 2011.
Los usuarios y texto de aquellos comentarios cuyo id_game sea 73.
Los usuarios y texto de aquellos comentarios cuyo id_game no sea 73.
Juegos de nivel 1.
Juegos de nivel 14 o superior.
Juegos llamados 'Riders Republic' o 'The Dark Pictures: House Of Ashes'.
Juegos cuyo nombre empiece con 'Gran'.
Juegos cuyo nombre contenga 'field'.
Debate
Duración: 5 minutos
Formato: Encuesta de Zoom
Consigna:

Si pensamos en un campo que debe almacenar el DNI o Cédula de identidad, ¿qué tipo de dato debería ser?
¿Numérico o string?

Si pensamos en un campo contable, que debe almacenar el año de ejercicio de los asientos registrados, ¿qué tipo de dato debería ser?
¿Numérico o string?

Ejemplo en vivo 3
Duración: 15 minutos
Consigna: Seleccionemos todos los registros de la tabla GAME, ordenados por name de forma ascendente (ASC).
Ahora seleccionemos todos los registros de la tabla GAME, ordenados por id_level de forma descendente (DESC) y filtremos donde el name contenga el texto “of”.

Ejemplo en vivo 4
Duración: 10 minutos
Consigna: Veamos las funciones de agrupación en acción.

Ejemplo en vivo 5
Duración: 10 minutos
Consigna: Como ya mencionamos, la cláusula GROUP BY es fundamental para usarse junto a las funciones de agregación como COUNT(), SUM(), y AVG(). La utilizamos cuando necesitamos obtener información basada en la agrupación de registros.

Actividad: Prácticas de agrupamiento
Duración: 10 minutos
Formato: Actividad individual
Consigna: Implementemos diferentes opciones de orden y agrupamiento de datos. A partir de la tabla COMMENTARY, debes determinar qué resultado obtendrás con las siguientes consultas:

SELECT * FROM commentary ORDER BY id_system_user DESC;
SELECT * FROM commentary ORDER BY id_system_user LIMIT 3;
SELECT COUNT(id_system_user) AS comments, id_system_user FROM commentary GROUP BY id_system_user;
SELECT COUNT(id_system_user) AS comments, id_system_user FROM commentary GROUP BY id_system_user HAVING comments > 2;
Comentaremos los resultados en la clase a través del sistema de chat.

Cierre y Preguntas
Duración: 10 minutos
Consigna: En esta unidad, revisaremos la actividad de Diagrama Entidad-Relación, que les permitirá aplicar los temas vistos hasta ahora.
Tarea: Diseñar el modelo entidad-relación para al menos dos de las temáticas seleccionadas para tu proyecto final.
Finalizaremos la clase repasando los puntos clave y dedicaremos tiempo para resolver consultas finales.
*/


SELECT 
	id_class,
    description 
FROM coderhouse_gamers.CLASS;


SELECT 
	*
FROM coderhouse_gamers.CLASS
ORDER BY description DESC
LIMIT 20 ;  -- TOP MSSERVER --> MYSQL LIMIT
 


-- Todos los comentarios sobre juegos desde 2019 en adelante.
SELECT * 
FROM coderhouse_gamers.COMMENTARY
WHERE
	comment_date > '2019-01-01'  -- ISO 8601
ORDER BY comment_date     
;


SELECT * 
FROM coderhouse_gamers.COMMENTARY
WHERE
	YEAR(comment_date) >= 2019  -- ISO 8601
ORDER BY comment_date     
;

-- Todos los comentarios sobre juegos anteriores a 2011.
SELECT 
	*,
    YEAR(comment_date) AS year
FROM coderhouse_gamers.COMMENTARY
WHERE
	YEAR(comment_date) < 2011  -- ISO 8601
ORDER BY comment_date     
;
-- Los usuarios y texto de aquellos comentarios cuyo id_game sea 73.
SELECT 
	*
FROM coderhouse_gamers.COMMENTARY
WHERE
	id_game = 73;

-- Los usuarios y texto de aquellos comentarios cuyo id_game no sea 73.
SELECT 
	*
FROM coderhouse_gamers.COMMENTARY
WHERE
	id_game <> 73;
    
SELECT 
	*
FROM coderhouse_gamers.COMMENTARY
WHERE
	id_game != 73;
    
-- ! TAREA
-- Juegos de nivel 1.
-- Juegos de nivel 14 o superior.

-- Juegos llamados 'Riders Republic' o 'The Dark Pictures: House Of Ashes'.
SELECT
	*
FROM coderhouse_gamers.GAME
WHERE 
name LIKE "Riders Republic" 
OR name LIKE "The Dark Pictures: House Of Ashes";

SELECT
	*
FROM coderhouse_gamers.GAME
WHERE 
name IN ("Riders Republic", "The Dark Pictures: House Of Ashes");

-- Juegos cuyo nombre empiece con 'Gran'.
SELECT
	*
FROM coderhouse_gamers.GAME
WHERE 
	name LIKE 'Gran%';


-- Juegos cuyo nombre contenga 'field'.
SELECT
	*
FROM coderhouse_gamers.GAME
WHERE 
	name NOT LIKE '%field%';


-- - DATA AGG

SELECT
	COUNT(*) AS total_juegos,
    AVG(id_level) AS promedio_level,
    MAX(id_level) AS level_max ,
    MIN(id_level) AS level_max ,
    SUM(id_level) AS total_level
FROM coderhouse_gamers.GAME
WHERE name LIKE 'Football%';

-- 
SELECT 
	id_game ,
	COUNT(id_game) AS total_comentarios
    FROM coderhouse_gamers.COMMENTARY
    GROUP BY id_game
    ORDER BY total_comentarios DESC
    LIMIT 10
    ;


SELECT 

id_system_user ,
COUNT(id_system_user) AS comments

FROM coderhouse_gamers.COMMENTARY
WHERE comment_date > '2010-01-01'

GROUP BY id_system_user 
HAVING comments > 2
ORDER BY comments
;












