#!/bin/bash

division() {
    resultado=$(($1/$2))
    echo "El resultado de la division es $resultado"
}
division=$(division $1 $2)
echo $division