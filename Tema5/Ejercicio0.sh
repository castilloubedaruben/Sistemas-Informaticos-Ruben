#!/bin/bash

validar_parametros() {
    if [ $# -ne $(( $1 + 1 )) ]; then
        echo "Hay que pasar $1 parametros"
        return 1
    fi
}

validar_parametros 2 "$@" || return 1

# la opcion del profesor
validar(){
if [ $1 -gt $2 ]; then
    echo "debe haber $1 argumentos"
    return 1
fi
}

validar 2 $# || return 1

#la opcion del chati
validar(){
    if [ $# -lt $1 ]; then
        echo "debe haber al menos $1 argumentos"
        return 1
    fi
}

validar 1 $@ || return 1