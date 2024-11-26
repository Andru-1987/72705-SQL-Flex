-- ingesta de un record

-- CRUD: CREATE READ UPDATE DELETE 

SET @id_plus = (SELECT id_game + 1 FROM coderhouse_gamers.GAME ORDER BY id_game DESC LIMIT 1);

INSERT INTO coderhouse_gamers.GAME
(id_game, name, description,id_level,id_class)
VALUE (
	@id_plus,
    "COUNTER STRIKE",
    "JUEGAZO" ,
    2,
    143
);

SET @id_plus = (SELECT id_game + 1 FROM coderhouse_gamers.GAME ORDER BY id_game DESC LIMIT 1);

INSERT INTO coderhouse_gamers.GAME
(id_game, name, description,id_level,id_class)
VALUES 
(@id_plus,"KOF","JUEGAZO" ,2, 143),
(@id_plus + 2,"Street Fighters","JUEGAZO" ,2, 143),
(@id_plus + 3 ,"Mario Bros", NULL,2, 143);


SELECT * FROM coderhouse_gamers.GAME ORDER BY id_game DESC;

SET GLOBAL FOREIGN_KEY_CHECKS = 1;

ALTER TABLE coderhouse_gamers.GAME
MODIFY COLUMN description VARCHAR(245);

-- UPDATE
UPDATE coderhouse_gamers.GAME  -- > donde
	SET name = "The king of fighters 2000" -- > que
WHERE  -- cual
	id_game = 104;


SET SQL_SAFE_UPDATES = 0;

UPDATE coderhouse_gamers.GAME  
	SET name = UPPER(name)
WHERE
	name LIKE 'A%';
    
    
-- DELETE
DELETE FROM coderhouse_gamers.GAME
WHERE
	id_game > 100;

CREATE TABLE coderhouse_gamers.table_to_delete_gamer AS
	SELECT * FROM coderhouse_gamers.GAME;

DELETE FROM  coderhouse_gamers.table_to_delete_gamer;

DROP TABLE IF EXISTS coderhouse_gamers.table_to_delete_gamer;



-- --------------
-- Si deseamos actualizar los niveles de las clases de juegos, pasar a nivel 8 todas las clases que están entre la 1 y la 20 inclusive y cuyos niveles actuales están por debajo del 13,
UPDATE coderhouse_gamers.table_to_delete_gamer
SET id_level = 8
WHERE  1 = 1  -- TRUE
	AND id_level BETWEEN 1  AND 20
	OR id_class >= 13
    ;
    
UPDATE coderhouse_gamers.table_to_delete_gamer  AS alt_g
SET alt_g.id_level = 666 
WHERE EXISTS (
	SELECT
	 -- g.id_game
     1 -- super poderoso!
	 FROM coderhouse_gamers.GAME   AS g
	WHERE  1 = 1  -- TRUE
		AND (g.id_game = alt_g.id_game) -- !! esto es lo que hace funcionar
		AND id_level BETWEEN 1  AND 20
		AND id_class < 13
);




--

-- Consigna: Eliminaremos aquellas nuevas clases que no puedan ser relacionadas con ningún 
-- registro de la tabla NEW_LEVEL_GAME.

CREATE TABLE coderhouse_gamers.NEW_LEVEL_GAME 
	SELECT 
		id_level,
		description
	FROM coderhouse_gamers.LEVEL_GAME;
    
INSERT INTO coderhouse_gamers.NEW_LEVEL_GAME 
VALUES
	(100,"NEW GAME LEVEL"),
    (101,"NEW GAME LEVEL UPGRADE");


SELECT 
* FROM coderhouse_gamers.NEW_LEVEL_GAME ;

CREATE TABLE coderhouse_gamers.NEW_GAME 
	AS
SELECT
* FROM coderhouse_gamers.GAME;


CREATE TABLE coderhouse_gamers.NEW_CLASS
	AS
SELECT
* FROM coderhouse_gamers.CLASS;



UPDATE coderhouse_gamers.NEW_GAME  AS alt_g
SET alt_g.id_level = 666 
WHERE EXISTS (
	SELECT
	 -- g.id_game
     1 -- super poderoso!
	 FROM coderhouse_gamers.table_to_delete_gamer   AS g
	WHERE  1 = 1  -- TRUE
		AND (g.id_game = alt_g.id_game) -- !! esto es lo que hace funcionar
		AND id_level BETWEEN 8  AND 15
		OR id_class < 13
);



UPDATE coderhouse_gamers.NEW_GAME  
SET id_level = 12
WHERE id_game BETWEEN 20 AND 55;


SELECT
* FROM coderhouse_gamers.NEW_GAME;

DELETE FROM coderhouse_gamers.NEW_CLASS
 WHERE id_class IN (
	SELECT
		DISTINCT
		id_class
	 FROM coderhouse_gamers.NEW_GAME AS ng
	 WHERE NOT EXISTS
	 (
		SELECT id_level FROM coderhouse_gamers.NEW_LEVEL_GAME AS nlg
		WHERE ng.id_level = nlg.id_level 
	 )
);


DELETE FROM coderhouse_gamers.NEW_CLASS AS nc
 WHERE EXISTS (
		SELECT
			DISTINCT
			id_class
		 FROM coderhouse_gamers.NEW_GAME AS ng
		 WHERE NOT EXISTS
		 (
			SELECT id_level FROM coderhouse_gamers.NEW_LEVEL_GAME AS nlg
			WHERE ng.id_level = nlg.id_level 
		 ) 
		AND ng.id_class = nc.id_class
    ) ;


SELECT * FROM coderhouse_gamers.NEW_CLASS;


SHOW CREATE TABLE coderhouse_gamers.CLASS;
    

SELECT * FROM  coderhouse_gamers.table_to_delete_gamer;






