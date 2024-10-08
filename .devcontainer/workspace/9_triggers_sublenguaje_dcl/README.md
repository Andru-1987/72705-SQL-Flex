# Unidad 9: Triggers y Sublenguaje DCL

## Objetivos de la clase

- Conocer el concepto general de un **Trigger**.
- Familiarizarse con los tipos de **Triggers**.
- Conocer la sintaxis e implementación de un **Trigger**.
- Reconocer e implementar las sentencias del **sublenguaje DCL**.
- Identificar en qué situación usar cada sentencia de DCL.

---

## Ejemplo en vivo 1

**Duración:** 20 minutos  
**Consigna:**  
Veremos cómo implementar **Triggers** algo más complejos. Pueden seguir a la par, en sus computadoras, el ejemplo en vivo.

1. Crearemos una tabla simple y una tabla similar que sea un **espejo** de la primera.
2. Luego, le agregaremos un trigger que detecte la inserción de un registro en la tabla simple, y replique el mismo en la tabla espejo.
3. El trigger se disparará justo antes de que se inserte el registro en la tabla simple.

---

## Actividad práctica: Creación de Triggers

**Duración:** 15 minutos  
**Consigna:**  
Con la tabla **comment** del modelo **gamers**, deberás crear dos **triggers**:

1. Debe detectar la **modificación** de un registro de la tabla en cuestión, justo antes de que ocurra, almacenando en otra tabla **first_date** y **last_date**.
2. Debe detectar la **eliminación** de un registro, posterior a dicha operación, registrando también fecha y hora, más el usuario que lo eliminó.

*La tabla bitácora puede ser un espejo de la tabla elegida o una tabla del tipo **LOG**.*

---

## Ejemplo en vivo 2

**Duración:** 15 minutos  
**Consigna:**  
Implementaremos las sentencias **create**, **drop** y **rename user**.

1. Por cada usuario que creemos, solo definimos un nombre de usuario y sobre qué servidor trabajará el mismo.
2. Nos queda por delante comenzar a definir los permisos que cada usuario tendrá, sobre un **dominio**, **base de datos**, **tabla(s)** y/o **campo(s)** específicos.

---

## Actividad práctica: Script de creación de Triggers

**Duración:** 30 minutos  
**Consigna:**  
1. En la base de datos de tu **proyecto final**, debes incluir al menos dos tablas del tipo **LOG**, **Bitácora** o **Movimientos**.
2. Elegirás dos de las tablas más importantes donde se operan con registros de forma frecuente, y crearás dos **Triggers** en cada una de ellas.

- Los **Triggers** a crear deberán controlar la acción previo a la operación elegida (**BEFORE**), y una acción posterior a otra operación elegida (**AFTER**).
- Agrega una **explicación** por cada trigger a crear, explicando qué controlará el mismo.
- Recuerda agregar el **script** de creación de las tablas **LOG**.
- Debe registrar el **usuario** que realizó la operación, la **fecha**, y la **hora** (en campos separados).

---

## Cierre y Preguntas

**Duración:** 10 minutos  
**Consigna:**  
Resumen de la clase repasando los puntos clave vistos durante la unidad. Espacio para consultas finales.
