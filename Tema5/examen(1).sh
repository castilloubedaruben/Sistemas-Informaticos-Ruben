#!/bin/bash

validar(){
    if [ "$2" -lt "$1" ]; then
        echo "se necesitan al menos $1 parámetros"
        return 1
    fi
}

media(){
    validar 2 $# || return 1

    suma=0
    contador=0

    for num in "$@"; do
        suma=$((suma + num))
        contador=$((contador + 1))
    done

    resultado=$((suma / contador))
    echo $resultado
}


carpetas(){
    validar 1 $# || return 1

    suma=0
    contador=0

    for carpeta in "$@"; do
        if [ -d "$carpeta" ]; then
            for elemento in "$carpeta"/*; do
                peso=$(ls -l "$elemento" | awk '{print $5}')
                suma=$((suma + peso))
                contador=$((contador + 1))
            done
        else
            echo "La carpeta $carpeta no existe"
            return 1
        fi
    done
    if [ "$contador" -eq 0 ]; then
        echo "No hay archivos para calcular la media"
    else
        resultado=$((suma / contador))
        echo "El resultado es $resultado"
    fi
}


borrado(){
    validar 1 $# || return 1

    if [ -d "$1" ]; then
        suma=0
        for archivo in "$1"/*; do
            peso=$(ls -l "$archivo" | awk '{print $5}')
            suma=$((suma + peso))
        done

        media=$((suma / $(ls -1 "$1" | wc -l)))

        for archivo in "$1"/*; do
            peso=$(ls -l "$archivo" | awk '{print $5}')
            if [ "$peso" -gt "$media" ]; then
                rm -r "$archivo"
                echo "$archivo borrado"
            fi
        done

    else
        echo "La carpeta no existe"
        return 1
    fi
}


