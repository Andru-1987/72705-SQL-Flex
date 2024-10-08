# Unidad 7 - Importación y Gestión de Datos

## Objetivos de la clase

- Implementar procesos de importación con el asistente de importación.
- Implementar procesos de importación por medio de comandos consola.
- Reconocer la integridad referencial.
- Identificar las restricciones de integridad referencial.
- Implementar los procesos de **delete cascade** y **update cascade**.

---

## Debate 1

**Duración:** 10 minutos  
**Consigna:** ¿Qué opciones de formato de archivos para importar o exportar datos conoces?

---

## Ejemplo en vivo 1

**Duración:** 20 minutos  
**Consigna:** Llevaremos el contenido de una planilla a **MySQL**.

---

## Actividad Práctica: Inserción de Datos

**Duración:** 15 minutos  
**Consigna:** Practicarás la inserción de datos con el proceso de importación de datos, con archivos **txt**, **csv** y/o **Excel**.

1. Debes generar tu propio archivo **.CSV** con, al menos 3 registros, a cargar en la tabla **productos**.
2. Si no generaste la tabla, copia su código **CREATE** desde la diapositiva 12.
3. Importa el archivo **CSV**, agregando los registros que has creado.
4. Investiga **MySQL Workbench** para ver cómo exportar el contenido de esta misma tabla hacia un archivo en formato **.JSON**.

---

## Actividad colaborativa: Integridad Referencial

**Duración:** 15 minutos  
**Consigna:** En grupos de 8-10 integrantes, se identificarán distintos ejemplos de **Integridad Referencial**, según los tipos descritos.

---

## Ejemplo en vivo 2

**Duración:** 15 minutos  
**Consigna:** Veamos un ejemplo de cómo se comportarían las acciones mencionadas ante la **eliminación de datos en cascada**. Pero antes, creemos las tablas **PAIS** y **PERSONAS** que necesitamos.

---

## Debate 2

**Duración:** 5 minutos  
**Consigna:** ¿Cómo debemos resolver la nacionalidad de personas cuyo país cambia de nombre? ¿Y cuando un país se divide, como sucedió con Serbia y Montenegro en 2006?

---

## Actividad práctica: On Delete - On Update

**Duración:** 20 minutos  
**Consigna:** Desarrolla un ejemplo similar, partiendo de dos tablas: **Países** y **Localidades**. Luego:

1. Crea registros para, al menos, 4 países.
2. Relaciona al menos 2 localidades por cada país.
3. Crea las tablas utilizando la **CONSTRAINT** (SET NULL y CASCADE).
4. Ejecuta una consulta de eliminación por cada **CONSTRAINT**.

---

## Cierre y Preguntas

**Duración:** 10 minutos  
**Consigna:** Resumen de la clase repasando los puntos clave vistos durante la unidad. Espacio para consultas finales.
