SELECT 
	CURRENT_DATE() ;
    
-- f(x) -> y y retorna algo!!!
-- sp(...x) no necesariamente -> no tiene un valor de retorno --> variables OUT


-- - -- 

-- Duración: 20 minutos
-- Consigna:
-- Veamos cómo implementar nuestras funciones personalizadas en MySQL. Te invitamos a seguir este ejemplo en vivo a la par del docente.



USE coderhouse_gamers ;

SELECT
	*
FROM coderhouse_gamers.SYSTEM_USER 
WHERE LENGTH(password) < 8
LIMIT 10;


-- function
DELIMITER //
DROP FUNCTION IF EXISTS coderhouse_gamers.fx_validacion_length_pass //
CREATE FUNCTION coderhouse_gamers.fx_validacion_length_pass(_pwd VARCHAR(200))
RETURNS VARCHAR(50) -- BOOLEAN
DETERMINISTIC
NO SQL
BEGIN

-- 	RETURN ( LENGTH(_pwd) > 7) ;

-- IF ( LENGTH(_pwd) > 7) THEN 
-- 	RETURN 'TRUE';
-- ELSE
--  RETURN 'FALSE';
-- END IF;
	IF ( _pwd = '') THEN 
		RETURN 'Password Vacio';
    END IF;

	IF ( LENGTH(_pwd) < 7) THEN 
		RETURN 'No es valido';
    END IF;
	
	RETURN 'Es Valido';

END //
DELIMITER ;


SELECT 
		su.*
    ,	fx_validacion_length_pass(su.password) AS es_valido
FROM coderhouse_gamers.SYSTEM_USER AS su;

SELECT 
	fx_validacion_length_pass('') AS es_valido;



-- Duración: 20 minutos
-- Consigna:

-- Crea una nueva función en la DB GAMERS, llamada get_game(), para obtener el nombre del videojuego, pasándole a dicha función el parámetro id_game.
-- Los nombres de los videojuegos se encuentran en la tabla game.
-- Luego, debes crear una consulta SELECT sobre la tabla game, obteniendo sólo el name del videojuego.



DELIMITER //
DROP FUNCTION IF EXISTS coderhouse_gamers.fx_get_name //
CREATE FUNCTION coderhouse_gamers.fx_get_name(_id_game INT)
RETURNS VARCHAR(200)
DETERMINISTIC
NO SQL
BEGIN
	DECLARE _nombre_video_game VARCHAR(200) DEFAULT 'VideoGame Not Found';

	SELECT 
		name INTO _nombre_video_game
	FROM coderhouse_gamers.GAME
	WHERE 
		id_game = _id_game ;

	RETURN _nombre_video_game;
END //
DELIMITER ;


SELECT fx_get_name(1000000);


SELECT fx_get_name(id_game) AS nombre_video_juego FROM coderhouse_gamers.GAME;

SELECT 
	fx_get_name(id_game) AS nombre_video_juego 
,	co.id_system_user
,	co.first_date
FROM coderhouse_gamers.COMMENT AS co;


-- PROCEDURE

-- Duración: 20 minutos
-- Consigna:
-- Veamos cómo implementar un Stored Procedure simple.



-- ETL extraccion  -> transformacion -> carga


SELECT 
	fx_get_name(id_game) AS nombre_video_juego 
,	co.id_system_user
,	co.first_date
FROM coderhouse_gamers.COMMENT AS co;

-- los juegos del anio 2000, 2001 , 2002
-- y ademas traeme el conteo y quien hizo el muestreo
-- y ademas cargamelo en una tabla -> una nueva base datos llamada `new_schema_data`.`agg_data`

CREATE DATABASE `new_schema_data`;

CREATE TABLE IF NOT EXISTS `new_schema_data`.`agg_data`(
	id_agg_table INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_videojuego VARCHAR(200),
    total_comentarios INT,
    periodo INT,
    responsable_conteo VARCHAR(200)
);

DELIMITER //
DROP PROCEDURE IF EXISTS sp_procedure_etl //
CREATE PROCEDURE sp_procedure_etl
(IN _periodo INT, IN _responsable VARCHAR(200) , IN _order_by VARCHAR(100), IN _asc BOOLEAN)
BEGIN

	SET @stmt_query = "INSERT INTO `new_schema_data`.`agg_data`
    (nombre_videojuego,total_comentarios,periodo,responsable_conteo)
    SELECT 
    * FROM  agg_data
    ";
	
    IF _responsable = '' THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Zapallo pone un responsable!!!', MYSQL_ERRNO = 1001;
	END IF;
      
      
	SELECT "Vamo' a ejecutar!" AS msg;
    CREATE TEMPORARY TABLE agg_data
    SELECT
			base_data.nombre_video_juego 
        , COUNT(1) AS total_comentarios
        , _periodo  AS periodo
        , _responsable AS responsable_conteo
    FROM  (
    SELECT 
		fx_get_name(id_game) AS nombre_video_juego 
	,	co.id_system_user
	,	co.first_date
	FROM coderhouse_gamers.COMMENT AS co
	WHERE YEAR(co.first_date) = _periodo) AS base_data
    GROUP BY base_data.nombre_video_juego 
    ;
    
    IF _order_by != '' THEN 
    
		SET @stmt_query = CONCAT(@stmt_query ,
		"ORDER BY " ,_order_by, IF(_asc = 1, " ASC"," DESC")
		);
	
	END IF;

    PREPARE query_ FROM @stmt_query ;
	EXECUTE query_;
	
	DEALLOCATE PREPARE query_;
    
    DROP TEMPORARY TABLE IF EXISTS agg_data;
    
END //

DELIMITER ;




CALL sp_procedure_etl(2011,'','total_comentarios', 0);
CALL sp_procedure_etl(2014, 'andru','total_comentarios', 0);
CALL sp_procedure_etl(2013,'jack el destripador','nombre_video_juego', 0);
CALL sp_procedure_etl(2015,USER(),'', 0);





