DROP DATABASE IF EXISTS clase_integridad;
CREATE  DATABASE clase_integridad;

USE clase_integridad;


CREATE TABLE clase_integridad.pais(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200),
    km2 DECIMAL(10,2)
);

CREATE TABLE clase_integridad.ciudad(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200),
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES clase_integridad.pais(id)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE clase_integridad.persona(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200),
    id_ciudad INT,
    FOREIGN KEY (id_ciudad) REFERENCES clase_integridad.ciudad(id)
		ON DELETE CASCADE
);


-- DELETE ARGENTINA 
-- DELETE FROM clase_integridad.pais
-- 	WHERE id= 5;

UPDATE clase_integridad.pais
SET id = 1000
WHERE id= 5;

