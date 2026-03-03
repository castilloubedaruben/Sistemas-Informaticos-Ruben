#!/bin/bash

#Ejercicio 2
#Devolver los nombres de los archivos que pesan lo mismo que el más grande
#(Solo los que cuelgan directamente de la carpeta)

#opcion 2 ruben

archivos_mas_grandes(){
    validar 1 $@ || return 1

    if [ -d $1 ]; then
        mayor=$( ls -l $1 | awk 'NR>1 {print $5}' | sort -n | tail -1 )
        ls -l $1 | awk -v max=$mayor 'NR>1 && $5==max {print $9}'
    else
        echo "la carpeta no existe"
        return 1
    fi
}

#opcion 3

archivos_mas_grandes(){
    validar 1 $# || return 1

    if [ -d $1 ]; then
        mayor=$( ls -l $1 | awk '{print $5}' | sort -n | tail -1 )
        for archivo in $1/*; do
            peso=$( ls -l $archivo | awk '{print $5}' )
            if [ "$peso" = "$mayor" ]; then
                echo $archivo
            fi
        done
    else
        echo "la carpeta debe existir"
        return 1
    fi
}