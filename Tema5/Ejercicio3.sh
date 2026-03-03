#!/bin/bash

#Ejercicio 3
#Borrar los archivos/carpetas que pesen lo mismo que el más grande

borrar_grandes(){
    validar 1 $# || return 1

    if [ -d $1 ]; then

        mayor=$( ls -l $1 | awk '{print $5}' | sort -n | tail -1 )

        for archivo in $1/*; do

            peso=$( ls -l $archivo | awk '{print $5}' )

            if [ "$peso" = "$mayor" ]; then
                rm -rf $archivo
                echo "borrado $archivo"
            fi

        done

    else
        echo "la carpeta debe existir"
        return 1
    fi
}

#opcion 3

borrar_grandes(){
    validar 1 $# || return 1

    if [ -d $1 ]; then

        mayor=$( ls -l $1 | awk '{print $5}' | sort -n | tail -1 )

        ls -l $1 | awk -v m=$mayor '{ if($5==m) print $9 }' | while read archivo
        do
            rm -rf $1/$archivo
            echo "borrado $archivo"
        done

    else
        echo "la carpeta debe existir"
        return 1
    fi
}