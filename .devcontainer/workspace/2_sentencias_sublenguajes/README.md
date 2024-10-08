# Unidad 2: Sentencias y Sublenguajes

## Objetivos de la clase

- Reconocer e implementar la sentencia **SELECT** de SQL
- Identificar los operadores en SQL
- Reconocer e implementar las sentencias complementarias de SQL
- Identificar las funciones en SQL
- Identificar los diferentes tipos de intersección en tablas SQL

---

## Repaso

**Duración:** 5 minutos  
**Consigna:** Aprendimos la definición de datos y conocimos cómo éstos se organizan en bases de datos relacionales, las cuales pueden ser representadas a partir de diagramas entidad-relación.  
**Pregunta:** ¿Cómo gestionamos “operativamente hablando” la información que se encuentra en la base de datos?

---

## Ejemplo en vivo 1

**Duración:** 15 minutos  
**Consigna:** Por ahora pongamos el foco en la estructura; a continuación veremos cada palabra en detalle.

1. Para consultar determinados campos de una tabla:  
   `SELECT id_class, description FROM class;`
2. Para consultar todos los campos de una tabla:  
   `SELECT * FROM class;`

---

## Ejemplo en vivo 2

**Duración:** 15 minutos  
**Consigna:** `SELECT id_class, description FROM class;`  
**Pregunta:** ¿Qué resultado obtendremos de esta consulta? Observaremos la selección de determinados campos.

---

## Actividad: SELECT - FROM

**Duración:** 5 minutos  
**Formato:** Actividad individual  
**Consigna:** Pondremos en práctica el uso de **SELECT - FROM**, analizando previamente cuál será el resultado de cada consulta, de acuerdo a los registros que posee la tabla.

Trabajaremos con una tabla de la DB **Gamer**. Observa las siguientes consultas y determina qué registros traerá cada una.

---

## Actividad: Prácticas con la sentencia WHERE

**Duración:** 10 minutos  
**Formato:** Actividad individual  
**Consigna:** Aplicaremos las consultas con la sentencia **WHERE** sobre la tabla **SYSTEM_USER** y discutiremos por chat el resultado de cada una de las siguientes consultas:

1. `SELECT * FROM system_user WHERE first_name = 'Gillie';`
2. `SELECT first_name, last_name FROM system_user WHERE id_user_type = 334;`
3. `SELECT first_name, last_name FROM system_user WHERE id_system_user = 56;`
4. `SELECT * FROM system_user WHERE first_name = 'Reinaldos';`

---

## Actividad colaborativa: Prácticas con operadores

**Duración:** 15 minutos  
**Formato:** Actividad grupal  
**Consigna:** Veamos cómo combinar diferentes operadores sobre las tablas **GAME** y **COMMENTARY** para obtener diferentes resultados posibles. Resolver las siguientes consultas:

1. Todos los comentarios sobre juegos desde 2019 en adelante.
2. Todos los comentarios sobre juegos anteriores a 2011.
3. Los usuarios y texto de aquellos comentarios cuyo **id_game** sea 73.
4. Los usuarios y texto de aquellos comentarios cuyo **id_game** no sea 73.
5. Juegos de nivel 1.
6. Juegos de nivel 14 o superior.
7. Juegos llamados 'Riders Republic' o 'The Dark Pictures: House Of Ashes'.
8. Juegos cuyo nombre empiece con 'Gran'.
9. Juegos cuyo nombre contenga 'field'.

---

## Debate

**Duración:** 5 minutos  
**Formato:** Encuesta de Zoom  
**Consigna:**

1. Si pensamos en un campo que debe almacenar el DNI o Cédula de identidad, ¿qué tipo de dato debería ser?  
   **¿Numérico o string?**

2. Si pensamos en un campo contable, que debe almacenar el año de ejercicio de los asientos registrados, ¿qué tipo de dato debería ser?  
   **¿Numérico o string?**

---

## Ejemplo en vivo 3

**Duración:** 15 minutos  
**Consigna:** Seleccionemos todos los registros de la tabla **GAME**, ordenados por **name** de forma ascendente (ASC).  
Ahora seleccionemos todos los registros de la tabla **GAME**, ordenados por **id_level** de forma descendente (DESC) y filtremos donde el **name** contenga el texto “of”.

---

## Ejemplo en vivo 4

**Duración:** 10 minutos  
**Consigna:** Veamos las funciones de agrupación en acción.

---

## Ejemplo en vivo 5

**Duración:** 10 minutos  
**Consigna:** Como ya mencionamos, la cláusula **GROUP BY** es fundamental para usarse junto a las funciones de agregación como **COUNT()**, **SUM()**, y **AVG()**. La utilizamos cuando necesitamos obtener información basada en la agrupación de registros.

---

## Actividad: Prácticas de agrupamiento

**Duración:** 10 minutos  
**Formato:** Actividad individual  
**Consigna:** Implementemos diferentes opciones de orden y agrupamiento de datos. A partir de la tabla **COMMENTARY**, debes determinar qué resultado obtendrás con las siguientes consultas:

1. `SELECT * FROM commentary ORDER BY id_system_user DESC;`
2. `SELECT * FROM commentary ORDER BY id_system_user LIMIT 3;`
3. `SELECT COUNT(id_system_user) AS comments, id_system_user FROM commentary GROUP BY id_system_user;`
4. `SELECT COUNT(id_system_user) AS comments, id_system_user FROM commentary GROUP BY id_system_user HAVING comments > 2;`

Comentaremos los resultados en la clase a través del sistema de chat.

---

## Cierre y Preguntas

**Duración:** 10 minutos  
**Consigna:** En esta unidad, revisaremos la actividad de Diagrama Entidad-Relación, que les permitirá aplicar los temas vistos hasta ahora.  
**Tarea:** Diseñar el modelo entidad-relación para al menos dos de las temáticas seleccionadas para tu proyecto final.  
Finalizaremos la clase repasando los puntos clave y dedicaremos tiempo para resolver consultas finales.
