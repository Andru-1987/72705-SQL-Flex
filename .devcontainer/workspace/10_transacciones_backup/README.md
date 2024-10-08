# Unidad 10: Transacciones y Backup

## Objetivos de la clase

- Reconocer e implementar las sentencias del sublenguaje **TCL**.
- Identificar en qué situación usar cada sentencia.
- Definir los conceptos de **Backup** y **Restauración**.
- Identificar los componentes del **Backup** y **Restauración**.
- Implementar **Backup** y **Restauración**.

---

## Ejemplo en vivo 1

**Duración:** 20 minutos  
**Consigna:**  
Veremos cómo iniciar una **transacción** en MySQL.

---

## Ejemplo en vivo 2

**Duración:** 20 minutos  
**Consigna:**  
Veremos cómo implementar las sentencias:

- `START TRANSACTION`
- `SAVEPOINT`
- `COMMIT`
- `ROLLBACK`

---

## Actividad práctica: Modificaciones controladas mediante transacciones

**Duración:** 15 minutos  
**Consigna:**  
Implementaremos el sublenguaje **TCL** con la tabla **PAY** de la base de datos **GAMERS**:

1. Abrir una nueva pestaña de script y eliminar **tres pagos** de los que insertamos en la filmina 49, iniciando una transacción.
2. Validar en otra pestaña de script los registros eliminados.
3. A continuación, en la primera pestaña de script, revertir la eliminación de pagos.
4. En la tabla **pagos**, insertar un lote de **15 pagos**, iniciando previamente la transacción.
   - Establecer un **SAVEPOINT** luego del registro #5 y otro luego del registro #10.
5. Validar en otra pestaña los registros insertados.
6. Eliminar el segundo savepoint.
7. Confirmar la transacción y vuelve a validar en otra pestaña de script los registros insertados.

---

## Debate

**Duración:** 5 minutos  
**Consigna:**  
Más allá de que uses a diario una plataforma en la nube como **OneDrive**, **Dropbox**, o **Google Drive**, ¿tienes la constancia de realizar un **backup periódico** de la información almacenada en tu computadora?

---

## Ejemplo en vivo 3

**Duración:** 25 minutos  
**Consigna:**  
Veremos cómo exportar **objetos** en MySQL Workbench.

---

## Ejemplo en vivo 4

**Duración:** 25 minutos  
**Consigna:**  
Veremos cómo implementar uno de los procesos de **backup** en **Mysql Workbench**.

---

## Actividad práctica: Backup y restauración

**Duración:** 20 minutos  
**Consigna:**  
1. Puedes practicar con la base de datos **GAMERS** o con cualquier otra base de datos que tengas en **MySQL Workbench**.
2. Prepara el ambiente para realizar una copia de seguridad.
3. Elige la opción **Dump to Self-Contained File**.
4. Espera a que finalice el proceso.
5. Luego de finalizado, realiza la restauración con la herramienta **Data Import/Restore**.

---

## Cierre y Preguntas

**Duración:** 10 minutos  
**Consigna:**  
Resumen de la clase repasando los puntos clave vistos durante la unidad. Espacio para consultas finales.
