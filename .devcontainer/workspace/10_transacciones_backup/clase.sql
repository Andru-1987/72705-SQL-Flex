USE coderhouse_gamers;

START TRANSACTION ; 

SET SQL_SAFE_UPDATES = 0;

DELETE FROM tabla_despacho;

SELECT * FROM tabla_despacho;

ROLLBACK;



-- 
SELECT * FROM  coderhouse_gamers.venta;
-- procedimiento -> 
-- 	transaccion de una venta

-- 	cargue venta cuando el usuario exista
--     
--     y cuando no exista quiero crear el usuario y hacer un rollback de la transaccion


CREATE TABLE IF NOT EXISTS coderhouse_gamers.usuarios(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) DEFAULT 'usuario_anonimo',
    email VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS coderhouse_gamers.venta(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    venta VARCHAR(100),
    id_cliente INT,
    precio DECIMAL(10,2)
);


DELIMITER //

DROP PROCEDURE IF EXISTS coderhouse_gamers.carga_de_venta //

CREATE PROCEDURE coderhouse_gamers.carga_de_venta(
    _email VARCHAR(100),
    venta_producto VARCHAR(100),
    precio_venta DECIMAL(10,2)
)
BEGIN
    DECLARE existencia BOOL DEFAULT FALSE;
    DECLARE new_venta_id INT;
	DECLARE existing_cliente_id INT;
    
    START TRANSACTION;

    
    INSERT INTO cliente (nombre)
    VALUES ('temp_user');

    INSERT INTO coderhouse_gamers.venta (venta, id_cliente, precio)
    VALUES (venta_producto, LAST_INSERT_ID(), precio_venta);
    SET new_venta_id = LAST_INSERT_ID();

    SET existencia = (SELECT COUNT(1) > 0 FROM coderhouse_gamers.usuarios WHERE email = _email);

    IF existencia THEN

        SET existing_cliente_id = (SELECT id FROM coderhouse_gamers.usuarios WHERE email = _email LIMIT 1);

        
        UPDATE coderhouse_gamers.venta
        SET id_cliente = existing_cliente_id
        WHERE id = new_venta_id;

        SELECT '[exito] SUCESS : SE HACE LA COMPRA' AS msg;
        COMMIT;

    ELSE
        
        SELECT '[falla] ALGO FALLO: EL CLIENTE NO EXISTE -> SE HACE UN ROLLBACK' AS msg;
        ROLLBACK;
    END IF;
END//

DELIMITER ;
    
    
    
CALL coderhouse_gamers.carga_de_venta(
	'test@test.com',
    'zapatillas',
    100.00
);


START TRANSACTION;

INSERT INTO coderhouse_gamers.usuarios (nombre,email) VALUES ('sergio','sergio@mail.com');
INSERT INTO coderhouse_gamers.usuarios (nombre,email) VALUES ('marcela','mar@mail.com');
INSERT INTO coderhouse_gamers.usuarios (nombre,email) VALUES ('donna','don@mail.com');

SAVEPOINT save_1;

INSERT INTO coderhouse_gamers.usuarios (nombre,email) VALUES ('mauri','maru@mail.com');
INSERT INTO coderhouse_gamers.usuarios (nombre,email) VALUES ('estefa','este@mail.com');


ROLLBACK TO save_1;
RELEASE SAVEPOINT save_1;



