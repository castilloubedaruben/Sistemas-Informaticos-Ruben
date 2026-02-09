#!/bin/bash

areaCirculo() {
    pi=3,14
    area=$((pi*($1*$1)))
    echo $area
}

resultado=$(areaCirculo $1)
echo $resultado