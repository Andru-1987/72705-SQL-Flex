-- Objetivos de la clase

-- Reconocer una subconsulta y sus diferentes tipos.
-- QUERY  --> (QUERY)
-- HARD CODING

USE coderhouse_gamers;


SELECT * 
FROM coderhouse_gamers.PLAY
WHERE id_game IN ( -- solo funciona cuando hay 1 solo valor de retorno
	SELECT id_game 
    FROM coderhouse_gamers.GAME
	WHERE name LIKE 'FIFA%'
);

-- funcion escalar
SELECT id_game , LOWER(name)
FROM coderhouse_gamers.GAME
WHERE name LIKE 'FIFA%';

-- funcion de transformacion
SELECT
	id_game ,
    id_system_user,
    comment_date,
    YEAR(comment_date) AS _year,
    MONTH(comment_date) AS _month
    
FROM coderhouse_gamers.COMMENTARY;


SELECT 
id_game ,
CONCAT(UPPER(LEFT(name,1)), LOWER(SUBSTR( name,2))) AS `nombre del campo`
FROM coderhouse_gamers.GAME
WHERE name LIKE 'FIFA%';

-- 



SELECT 
id_game ,
CONCAT(UPPER(LEFT(name,1)), LOWER(SUBSTR( name,2))) AS `nombre del campo`
FROM coderhouse_gamers.GAME
WHERE name LIKE 'F%'

UNION -- ALL
-- INTERSECT

SELECT 
CONCAT(UPPER(LEFT(name,1)), LOWER(SUBSTR( name,2))) AS `nombre del campo`,
id_game
FROM coderhouse_gamers.GAME
WHERE id_game BETWEEN 80 AND 90;





-- DDL --> es una forma de definir datos de tablas

CREATE TABLE coderhouse_gamers.diff_char_var_char(
	nombre_char CHAR(10),
    nombre_varchar VARCHAR(10)
);

INSERT INTO 
coderhouse_gamers.diff_char_var_char VALUES 
('12345678', '12345678999');

-- 


SELECT
	id_game ,
    id_system_user,
    comment_date,
    DATE_ADD(comment_date, INTERVAL 10 YEAR) AS futuro,
    YEAR(comment_date) AS _year,
    MONTH(comment_date) AS _month
    
FROM coderhouse_gamers.COMMENTARY;



-- Averiguar qué día de semana era cuando naciste
-- eso es deinir una variable de session
SET @bruno = '1988-08-21';

SELECT WEEK(@bruno) AS semana_nacimiento_bruno;

-- Averiguar qué día de semana era cuando naciste

SET @maria = '2000-03-08';
SELECT DATEDIFF(CURRENT_DATE(), @maria);


SET time_zone = '-03:00';

SELECT 
	CURRENT_DATE(),
    NOW(),
    SESSION_USER(),
    USER(),
    DAYNAME( CURRENT_TIMESTAMP()),
    STR_TO_DATE(  '08/03/2000','%d/%m/%Y' ) AS FECHA_DECENTE
    ;

-- DDL -> DATA DEFINITION LANGUAGE

DROP 
	DATABASE IF EXISTS ddl_data;
    
CREATE DATABASE ddl_data;
-- TRUNCATE - DROP

-- tienda * -> * cliente --> la FK siempre va en la relacion cardinal que tiene muchos (*)
CREATE TABLE ddl_data.cliente (
	id	INT NOT NULL AUTO_INCREMENT ,
  --   tienda_id INT NOT NULL,  -- FK
    mail VARCHAR(200) UNIQUE,
    is_active BOOL DEFAULT TRUE,
    PRIMARY KEY (id)
);


CREATE TABLE ddl_data.tienda (
	id INT NOT NULL AUTO_INCREMENT ,
	nombre_tienda VARCHAR(255),
	created_at DATETIME DEFAULT (CURRENT_TIMESTAMP),
	proveedores VARCHAR(255),
	is_active BOOL DEFAULT TRUE,
    PRIMARY KEY(id)
);


CREATE  TABLE ddl_data.link_tienda_cliente(
	id_link INT NOT NULL AUTO_INCREMENT, -- PK
    id_tienda INT, -- FK
    id_cliente INT, -- FK
    PRIMARY KEY(id_link)
);


ALTER TABLE ddl_data.link_tienda_cliente
	ADD CONSTRAINT fk_tienda_link
	FOREIGN KEY (id_tienda) REFERENCES tienda(id),
    ADD CONSTRAINT fk_client
	FOREIGN KEY (id_cliente) REFERENCES cliente(id);


ALTER TABLE ddl_data.cliente 
	ADD COLUMN fecha_creaccion DATETIME 
    DEFAULT (CURRENT_TIMESTAMP);

-- ALTER TABLE
-- 	ddl_data.cliente 
-- 	ADD CONSTRAINT fk_data_client_tienda
--     FOREIGN KEY (tienda_id) REFERENCES ddl_data.tienda(id);

