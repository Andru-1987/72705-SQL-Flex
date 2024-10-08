#!/bin/bash

# Array of directory names
directories=(
    "1_base_datos_relacionales"
    "2_sentencias_sublenguajes"
    "3_consultas_subconsultas_ddl"
    "4_objetos_tablas_sql"
    "5_manejo_vistas"
    "6_sublenguaje_dml"
    "7_importacion_gestion_datos"
    "8_funciones_stored_procedures"
    "9_triggers_sublenguaje_dcl"
    "10_transacciones_backup"
    "11_dw_bi"
)

# Loop through the array and create directories
for dir in "${directories[@]}"; do
    mkdir -p "$dir"
    echo "Created directory: $dir"
    touch "$dir/README.md"
    echo "Created file in -> : $dir"
done

echo "All directories have been created successfully!"
