# Unidad 8: Funciones y Stored Procedures

## Objetivos de la clase

- Definir las **funciones personalizadas**.
- Presentar la sintaxis para la creación de funciones personalizadas.
- Implementar nuestras propias funciones personalizadas.
- Reconocer un **stored procedure**.
- Identificar los tipos de **stored procedure**.
- Implementar **stored procedures**.

---

## Repaso

**Duración:** 5 minutos  
**Consigna:**  
Ya vimos cómo aprovechar las funciones escalares y de transformación, propias del lenguaje SQL. Hoy aprenderemos a crear nuestras funciones personalizadas para cubrir diferentes necesidades específicas que las funciones predeterminadas del lenguaje SQL no contemplan.

---

## Ejemplo en vivo 1

**Duración:** 20 minutos  
**Consigna:**  
Veamos cómo implementar nuestras funciones personalizadas en **MySQL**. Te invitamos a seguir este ejemplo en vivo a la par del docente.

---

## Actividad: Práctica de funciones SQL

**Duración:** 20 minutos  
**Consigna:**  
1. Crea una nueva función en la DB **GAMERS**, llamada **get_game()**, para obtener el nombre del videojuego, pasándole a dicha función el parámetro **id_game**.

2. Los nombres de los videojuegos se encuentran en la tabla **game**.

3. Luego, debes crear una consulta **SELECT** sobre la tabla **game**, obteniendo sólo el **name** del videojuego.

---

## Ejemplo en vivo 2

**Duración:** 20 minutos  
**Consigna:**  
Veamos cómo implementar un **Stored Procedure** simple.

---

## Ejemplo en vivo 3

**Duración:** 20 minutos  
**Consigna:**  
Veremos cómo implementar **PREPARE** y **EXECUTE** en un **Stored Procedure**.

---

## Actividad: S.P. de inserción de registros

**Duración:** 15 minutos  
**Consigna:**  
1. Crea un **Stored Procedure** que inserte datos en una tabla.
2. Debe recibir un parámetro del tipo **char(xx)**.
3. Inserta dicho parámetro como un nuevo registro en la tabla.
4. Ejecuta luego, un **SELECT** sobre la tabla ordenada de forma descendente, para ver el registro insertado en primer lugar.
5. Si el parámetro **char()** recibido es igual a **''**, devuelve un error que diga: **'ERROR: no se pudo crear el producto indicado'**.

---

## Cierre y Preguntas

**Duración:** 10 minutos  
**Consigna:**  
Resumen de la clase repasando los puntos clave vistos durante la unidad. Espacio para consultas finales.
