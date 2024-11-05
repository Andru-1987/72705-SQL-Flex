USE coderhouse_gamers;

-- views 
SELECT * FROM coderhouse_gamers.COMMENT;
-- vista corregida de juegos terminados

-- CREATE VIEW vw_estadistica_ventas
-- AS
-- 	SELECT 
-- 		tabla_limpia.name ,
-- 		AVG(tabla_limpia.dias_jugando) AS promedio_dias_jugados
-- 		FROM 
-- 		(SELECT 
-- 			c.id_game,
-- 			g.name,
-- 			c.id_system_user,
-- 			c.first_date,
-- 			c.last_date ,
-- 			DATEDIFF(c.last_date,c.first_date) AS dias_jugando
-- 		FROM coderhouse_gamers.COMMENT AS c
-- 		LEFT JOIN coderhouse_gamers.GAME AS g
-- 			ON c.id_game = g.id_game
-- 		WHERE 
-- 			c.last_date >= c.first_date) AS tabla_limpia
-- 		GROUP BY tabla_limpia.name;


SELECT 
	* FROM coderhouse_gamers.vw_estadistica_ventas;


-- functions
DELIMITER //

CREATE FUNCTION categoria_juego (entrada_param DECIMAL(10,4))
	RETURNS VARCHAR(100)
    DETERMINISTIC
BEGIN
	DECLARE valor_retorno VARCHAR(100);
	
	CASE 
		WHEN entrada_param < 500 THEN 
			SET valor_retorno = "juego corto";
	
		WHEN entrada_param BETWEEN 501 AND 1500 THEN 
			SET valor_retorno = "juego mediano";
		ELSE
			SET valor_retorno = "juego largo";
	END CASE;
    
	RETURN valor_retorno;
END //

DELIMITER ;

SELECT 
	name,
    promedio_dias_jugados,
    categoria_juego(promedio_dias_jugados) AS categoria
    FROM coderhouse_gamers.vw_estadistica_ventas;

-- STORED PROCEDURE 
DELIMITER //
-- EXISTE? SI 1 NO 0
CREATE PROCEDURE validar_existencia_data(IN juego INT, IN usuario INT)
BEGIN
DECLARE juego_si INT ;
DECLARE usuario_si INT;

SELECT COUNT(1) INTO juego_si 
	FROM coderhouse_gamers.GAME
WHERE id_game = juego ;

SELECT COUNT(1) INTO usuario_si
	FROM coderhouse_gamers.SYSTEM_USER
WHERE id_system_user = usuario;

IF juego_si AND usuario_si THEN
	SELECT " CREAR USUARIO -> TU PODER" ;
ELSE 
	SELECT " NO EXISTE ALGUNA DE LAS VARIABLES ";
END IF ;

END //

DELIMITER ;


CALL validar_existencia_data(8000,1);



-- trigger

DELIMITER //

CREATE TRIGGER  bi_usuario 
BEFORE INSERT ON coderhouse_gamers.SYSTEM_USER
FOR EACH ROW
BEGIN

DECLARE pwd_lenght_correct INT;
DECLARE usuario_si INT ;

SELECT COUNT(1) INTO usuario_si
	FROM coderhouse_gamers.SYSTEM_USER
WHERE id_system_user = NEW.id_system_user;

SET pwd_lenght_correct = LENGTH(NEW.password) > 2;

IF usuario_si OR pwd_lenght_correct THEN
	SIGNAL SQLSTATE "45000"
	  SET MESSAGE_TEXT = "An error occurred";
END IF;

END //

DELIMITER ;

SELECT *
FROM coderhouse_gamers.SYSTEM_USER
WHERE id_system_user = 10000;

INSERT INTO coderhouse_gamers.SYSTEM_USER
VALUE
(10000,"usuario","x","x@mail.com","s", 1);



-- 
CREATE TABLE coderhouse_gamers.cliente (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20)
);

CREATE TABLE coderhouse_gamers.venta (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    venta VARCHAR(100),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES coderhouse_gamers.cliente(id)    
); 

-- trabajo escalamos y ahora no vamos a usar un autoincremental --> otra forma de PK

ALTER TABLE 
	coderhouse_gamers.venta
    DROP CONSTRAINT venta_ibfk_1;

ALTER TABLE 
	coderhouse_gamers.venta
    MODIFY COLUMN id_cliente VARCHAR(36);
    
ALTER TABLE 
	coderhouse_gamers.cliente 
	MODIFY COLUMN  id VARCHAR(36) DEFAULT(UUID());


ALTER TABLE 
	coderhouse_gamers.venta
    ADD CONSTRAINT fk_venta_cliente
    FOREIGN KEY (id_cliente) REFERENCES coderhouse_gamers.cliente(id)  ;
    