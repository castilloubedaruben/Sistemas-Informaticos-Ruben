#!/bin/bash

perimetroCirculo() {
    pi=3,14
    area=$((2*pi*$1))
    echo $area
}

resultado=$(perimetroCirculo $1)
echo $resultado