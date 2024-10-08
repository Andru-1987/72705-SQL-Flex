# Unidad 6: Sublenguaje DML

## Objetivos de la clase

- Reconocer e implementar las sentencias del sublenguaje DML.
- Identificar en qué situación usar cada sentencia.
- Implementar subconsultas para complementar las sentencias DML.

---

## Ejemplo en vivo 1

**Duración:** 10 minutos  
**Consigna:** Veremos en el siguiente ejemplo la **inserción de datos**.

---

## Ejemplo en vivo 2

**Duración:** 10 minutos  
**Consigna:** Observaremos en el siguiente ejemplo la **inserción de datos parciales**.

---

## Debate 1

**Duración:** 5 minutos  
**Formato:** Encuesta de Zoom  
**Consigna:** ¿Es más efectivo insertar múltiples registros en una tabla usando un **INSERT** por cada uno, o conviene usar una única sentencia **INSERT** para todos los registros?

---

## Ejemplo en vivo 3

**Duración:** 10 minutos  
**Consigna:** Observemos en el siguiente ejemplo la **actualización de datos masiva**.

---

## Debate 2

**Duración:** 5 minutos  
**Formato:** Contesta en el chat de Zoom  
**Consigna:** Si deseamos actualizar los niveles de las clases de juegos, pasar a nivel 8 todas las clases que están entre la 1 y la 20 inclusive y cuyos niveles actuales están por debajo del 13,  
**¿Cuántos registros se actualizarían y cuál sería la cláusula UPDATE?**

---

## Ejemplo en vivo 4

**Duración:** 5 minutos  
**Consigna:** Observemos en el siguiente ejemplo cómo eliminar registros de una tabla.

---

## Actividad: Inserción y actualización de tablas

**Duración:** 10 minutos  
**Formato:** Actividad individual  
**Consigna:** Basado en las tablas creadas con el Diagrama E-R de la clase anterior, insertar al menos 2 registros en cada tabla.  
Luego de realizar la inserción, elige una tabla y modifica al menos el dato de un registro insertado.

---

## Ejemplo en vivo 5

**Duración:** 10 minutos  
**Consigna:** Llevemos el anterior ejemplo a un **script de MySQL Workbench**.

---

## Ejemplo en vivo 6

**Duración:** 10 minutos  
**Consigna:** Actualizaremos de forma masiva los registros almacenados en la tabla **NEW_CLASS**.

---

## Ejemplo en vivo 7

**Duración:** 10 minutos  
**Consigna:** Eliminaremos aquellas nuevas clases que no puedan ser relacionadas con ningún registro de la tabla **NEW_LEVEL_GAME**.

---

## Debate 3

**Duración:** 5 minutos  
**Formato:** Encuesta de Zoom  
**Consigna:** Hasta ahora vimos diferentes operaciones DML con subconsultas de un solo nivel.  
**¿Crees que se pueden establecer en SQL más de una subconsulta anidada?**  
**¿Sí o No?**

---

## Actividad: Inserción y actualización de tablas II

**Duración:** 20 minutos  
**Formato:** Actividad individual  
**Consigna:** Trabajaremos sobre la BD **GAMERS**:

1. Crearemos una nueva tabla de juegos denominada **ADVERGAME** donde agregaremos juegos de propaganda de empresa.
2. Crearemos a continuación 5 juegos nuevos en la tabla **ADVERGAME**.
3. Finalmente, insertaremos los registros correspondientes en la tabla **ADVERCLASS**, obteniendo mediante una subconsulta los ID de las clases y niveles nuevos insertados.

---

## Cierre y Preguntas

**Duración:** 10 minutos  
**Consigna:** Resumen de la clase repasando los puntos clave vistos durante la unidad. Espacio para consultas finales.
