USE clase_integridad;

-- mysql -u root -p --host 127.0.0.1 --port 3306 --local-infile=1; ->> desde la terminal

SET GLOBAL LOCAL_INFILE=TRUE;

LOAD  DATA LOCAL INFILE 
	"ciudades.csv" INTO TABLE clase_integridad.ciudad
    FIELDS TERMINATED BY ',' -- ENCLOSED BY '"'
	LINES TERMINATED BY '\r\n'
	IGNORE 1 LINES
    (nombre,id_pais)
    ; 

LOAD DATA LOCAL INFILE
	"personas.csv" INTO TABLE clase_integridad.persona
	FIELDS TERMINATED BY ',' -- ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(nombre,id_ciudad);
