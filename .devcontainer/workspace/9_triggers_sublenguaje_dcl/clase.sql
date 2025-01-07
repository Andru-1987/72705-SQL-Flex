USE  coderhouse_gamers;

CREATE TABLE coderhouse_gamers.SYSTEM_USER_MIRROR 
	LIKE coderhouse_gamers.SYSTEM_USER;

-- creacion de trigger
DELIMITER //
DROP TRIGGER IF EXISTS coderhouse_gamers.before_insert_system_user //
CREATE TRIGGER
	coderhouse_gamers.before_insert_system_user
    BEFORE INSERT 
    ON coderhouse_gamers.SYSTEM_USER FOR EACH ROW
BEGIN
	INSERT INTO coderhouse_gamers.SYSTEM_USER_MIRROR
	(id_system_user,first_name,last_name,email,password,id_user_type)
	VALUE
	(NEW.id_system_user,NEW.first_name,NEw.last_name,NEW.email,NEW.password,NEW.id_user_type);
    
END //

DELIMITER ;

INSERT INTO coderhouse_gamers.SYSTEM_USER
(id_system_user,first_name,last_name,email,password,id_user_type)
VALUES
(3005,"test","test","prueba_data_3@mail.com","123",86);



-- creacion de trigger de validacion
DELIMITER //
DROP TRIGGER IF EXISTS coderhouse_gamers.before_insert_system_user_new_server //
CREATE TRIGGER
	coderhouse_gamers.before_insert_system_user_new_server
    BEFORE INSERT 
    ON coderhouse_gamers.SYSTEM_USER FOR EACH ROW
BEGIN
	
	DECLARE permite BOOL DEFAULT TRUE;
    
	SET permite = (SELECT (COUNT(1) < 1003) FROM coderhouse_gamers.SYSTEM_USER);

	IF permite THEN
		INSERT INTO coderhouse_gamers.SYSTEM_USER_MIRROR
		(id_system_user,first_name,last_name,email,password,id_user_type)
		VALUE
		(NEW.id_system_user,NEW.first_name,NEw.last_name,NEW.email,NEW.password,NEW.id_user_type);
	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Che, no podes mas de 1000 usuarios', MYSQL_ERRNO = 1001;
	END IF;
END //

DELIMITER ;

INSERT INTO coderhouse_gamers.SYSTEM_USER
(id_system_user,first_name,last_name,email,password,id_user_type)
VALUES
(7779,"Osvaldo","Laport","prueba_data_3@mail.com","123",86);

-- !!!! documenten los triggers
-- los triggers deben ser cuando las acciones se requieren si o si

CREATE TABLE `SYSTEM_USER_AUDITORIA` (
  `id_system_user` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `id_user_type` int NOT NULL,
  modificado VARCHAR(100),
  usuario_modificacion VARCHAR(50),
  timestamp_row TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  KEY `FK_USER_USER_TYPE` (`id_user_type`)
) ;


DELIMITER //

DROP TRIGGER IF EXISTS coderhouse_gamers.after_update_system_user//
CREATE TRIGGER
	coderhouse_gamers.after_update_system_user 
    AFTER UPDATE 
    ON coderhouse_gamers.SYSTEM_USER FOR EACH ROW
BEGIN
	INSERT INTO coderhouse_gamers.SYSTEM_USER_AUDITORIA
	(id_system_user,first_name,last_name,email,password,id_user_type,modificado,usuario_modificacion)
	VALUE
	(OLD.id_system_user,OLD.first_name,OLD.last_name,OLD.email,OLD.password,OLD.id_user_type,"UPDATE", USER());
    
END //
DELIMITER ;


DELIMITER //
DROP TRIGGER IF EXISTS coderhouse_gamers.after_delete_system_user//
CREATE TRIGGER
	coderhouse_gamers.after_delete_system_user 
    AFTER DELETE 
    ON coderhouse_gamers.SYSTEM_USER FOR EACH ROW
BEGIN
	INSERT INTO coderhouse_gamers.SYSTEM_USER_AUDITORIA
	(id_system_user,first_name,last_name,email,password,id_user_type,modificado,usuario_modificacion)
	VALUE
	(OLD.id_system_user,OLD.first_name,OLD.last_name,OLD.email,OLD.password,OLD.id_user_type,"DELETE", USER());
    
END//

DELIMITER ;


UPDATE coderhouse_gamers.SYSTEM_USER
	SET first_name = "por_fin"
WHERE id_system_user = 10000;

DELETE FROM coderhouse_gamers.SYSTEM_USER WHERE id_system_user = 10000;

-- DCL

-- CREACION DE USUARIOS


CREATE USER
	"nicolas"@"%"  IDENTIFIED BY "1234";


CREATE USER
	"veronica"@"%" IDENTIFIED BY RANDOM PASSWORD;


SELECT * 
	FROM mysql.user;


GRANT SELECT ON coderhouse_gamers.* TO 'veronica'@'%';

REVOKE SELECT ON coderhouse_gamers.* FROM 'veronica'@'%';

DROP USER 'veronica'@'%';

REVOKE SELECT ON coderhouse_gamers.vw_estadistica_ventas  FROM 'nicolas'@'%';

GRANT SELECT(name) ON coderhouse_gamers.vw_estadistica_ventas TO 'nicolas'@'%';

SHOW GRANTS FOR 'nicolas'@'%';

