#!/bin/bash

# Ejercicio 1
# Función que calcule el máximo entre números pasados como parámetros

#opcion 1 reda
maximo() {
    if [ $# -eq 0 ]; then
        echo "Error: debes pasar numeros."
        return 1
    fi

    max=$1
    shift

    while [ $# -gt 0 ]; do
        if [ $1 -gt $max ]; then
            max=$1
        fi
        shift
    done

    echo "El numero mas grande es: " $max
    }
    
    maximo "$@"

#opcion 2 ruben
    maximo(){
    validar 1 $@ || return 1

    mayor=$1

    for num in $@; do
        if [ $num -gt $mayor ]; then
            mayor=$num
        fi
    done

    echo $mayor
}

# llamar a la funcion desde terminal
maximo 3 8 2 15 4